<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AssetModel;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;

class AdminController extends Controller
{
    public function Index()
    {
        return view("Admin.dashboard_admin");
    }

    public function HalamanAsset() {
        return view("Admin.Master.halaman_asset");
    }


    public function GetDataAsset(): JsonResponse
    {
        // Fetch all assets from the database
        $dataAsset = AssetModel::all();

        foreach ($dataAsset as $Asset) {
            // Define the file path for saving the QR code
            $qrCodeFileName = $Asset->asset_code . '.png';
            $qrCodeFilePath = 'assets/qrcodes/' . $qrCodeFileName;

            // Ensure the directory exists
            if (!file_exists(public_path('assets/qrcodes'))) {
                mkdir(public_path('assets/qrcodes'), 0755, true);
            }

            // Generate the QR code and save it to the defined path
            QrCode::format('png')->size(300)->generate($Asset->asset_code, public_path($qrCodeFilePath));

            // Assign the QR code path to the asset object
            $Asset->qr_code_path = url($qrCodeFilePath);
        }

        // Return the assets with QR code paths as a JSON response
        return response()->json($dataAsset);
    }

    public function GetDetailDataAsset($id) {
        $asset = AssetModel::find($id);

        if ($asset) {
            return response()->json($asset);
        }

        return response()->json(['Error' => 'Asset not found'], 404);
    }

    public function AddDataAsset(Request $request)
    {
        $assetCode = $request->input('asset_code');
        $assetModelData = $request->input('asset_model');
        $assetStatus = $request->input('asset_status');
        $assetQuantity = $request->input('asset_quantity');
        $assetImage = $request->file('asset_image');
        $assetImageName = null;

        // Handle asset image upload
        if ($assetImage && $assetImage->isValid()) {
            $assetImageName = $assetImage->hashName();
            $assetImage->storeAs('app/public/assets/asset_images', $assetImageName);
        } else {
            return response()->json([
                'status' => 'error',
                'message' => 'Asset image upload failed or no image uploaded.'
            ], 400);
        }

        // Generate and store QR code
        $qrCodePath = 'public/assets/qrcodes/' . $assetCode . '.png';
        if (!File::isDirectory(storage_path('app/public/assets/qrcodes'))) {
            File::makeDirectory(storage_path('app/public/assets/qrcodes'), 0777, true);
        }

        // Determine center box color based on asset status
        $centerBoxColor = match ($assetStatus) {
            'PRIORITY' => 'FF0000',
            'NOT PRIORITY' => 'FFFF00',
            'BASIC' => '0000FF',
            default => 'FFFFFF',
        };

        // Generate QR code content
        $qrCodeContent = url('assets/details/' . $assetCode);
        $qrCode = QrCode::format('png')
            ->size(300)
            ->margin(10)
            ->generate($qrCodeContent, storage_path('app/' . $qrCodePath));

        // Add custom center box to QR code
        $img = imagecreatefrompng(storage_path('app/' . $qrCodePath));
        $width = imagesx($img);
        $height = imagesy($img);
        $boxSize = min($width, $height) * 0.2;
        $centerColor = imagecolorallocate($img, hexdec(substr($centerBoxColor, 0, 2)), hexdec(substr($centerBoxColor, 2, 2)), hexdec(substr($centerBoxColor, 4, 2)));
        imagefilledrectangle($img, $width / 2 - $boxSize / 2, $height / 2 - $boxSize / 2, $width / 2 + $boxSize / 2, $height / 2 + $boxSize / 2, $centerColor);
        imagepng($img, storage_path('app/' . $qrCodePath));
        imagedestroy($img);

        // Store asset data in the database
        $asset = new AssetModel();
        $asset->asset_code = $assetCode;
        $asset->asset_model = $assetModelData;
        $asset->qr_code_path = asset('storage/assets/qrcodes/' . $assetCode . '.png');
        $asset->asset_status = $assetStatus;
        $asset->asset_quantity = $assetQuantity;
        $asset->asset_image = asset('storage/assets/asset_images/' . $assetImageName);

        if ($asset->save()) {
            $title = 'Asset Added';
            $body = 'A new asset with code ' . $assetCode . ' has been added.';

            // Push notification (simplified, assuming push token is stored in the database)
            $pushToken = "3UmEzACTLPY7kpS47es1rJ"; // Replace with actual token
            $this->sendPushNotification($pushToken, $title, $body);

            return response()->json([
                'status' => 'success',
                'message' => 'Tambah Data Asset Berhasil'
            ], 200);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Tambah Data Asset Gagal'], 500);
        }
    }

    // Example push notification function
    private function sendPushNotification($expoPushToken, $title, $body)
    {
        $url = 'https://exp.host/--/api/v2/push/send';
        $data = [
            'to' => $expoPushToken,
            'sound' => 'default',
            'title' => $title,
            'body' => $body,
            'data' => ['assetCode' => '12345']
        ];

        $options = [
            'http' => [
                'header' => "Content-type: application/json\r\n",
                'method' => 'POST',
                'content' => json_encode($data)
            ]
        ];

        $context = stream_context_create($options);
        $result = file_get_contents($url, false, $context);

        return $result;
    }



    public function updateDataAsset(Request $request){
    $data = $request->only(['asset_id', 'asset_code', 'asset_model', 'asset_status', 'asset_quantity']);

    $asset = AssetModel::find($data['asset_id']);

    if ($asset && $asset->update([
        'asset_code' => $data['asset_code'],
        'asset_model' => $data['asset_model'],
        'asset_status' => $data['asset_status'],
        'asset_quantity' => $data['asset_quantity']
    ])) {
        return response()->json(['status' => 'success', 'message' => 'Asset updated successfully.']);
    } else {
        return response()->json(['status' => 'error', 'message' => 'Failed to update asset.'], 500);
    }
}

public function deleteDataAsset($id)
{
    $asset = AssetModel::find($id);

    if ($asset) {
        $asset->delete();
        return response()->json(['status' => 'Success', 'message' => 'Data Asset Berhasil Terhapus']);
    } else {
        return response()->json(['status' => 'Error', 'message' => 'Data Asset Gagal Terhapus'], 404);
    }
}


public function details($assetCode)
{
    $asset = AssetModel::where('asset_code', $assetCode)->first();

    if (!$asset) {
        abort(404, 'Asset not found');
    }

    return view('asset.details', ['asset' => $asset]);
}


public function UserManagement() {
    
}




}