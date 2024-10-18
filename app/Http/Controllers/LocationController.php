<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Master\MasterLocation;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;

class LocationController extends Controller
{
    public function Index()
    {
        return view("Admin.location");
    }

    public function HalamanLocation() {
        return view("Admin.location");
    }

    public function getLocation()
    {
        // Mengambil semua data dari tabel m_location
        $locations = MasterLocation::all();
        return response()->json($locations); // Mengembalikan data dalam format JSON
    }

    public function AddDataLocation(Request $request)
    {
        // Validasi data yang dikirimkan
        $request->validate([
            'loc_name' => 'required|string|max:255',
            'loc_city' => 'required|string|max:255',
            'loc_address' => 'required|string|max:255',
            'loc_distric' => 'required|string|max:255',
            'loc_village' => 'required|string|max:255',
            'region_id' => 'required|string|max:255',
            'loc_longtitude' => 'required|string|max:255',
        ]);

        try {
            // Buat instance dari model MasterLocation
            $location = new MasterLocation();
            $location->loc_name = $request->input('loc_name');
            $location->loc_city = $request->input('loc_city');
            $location->loc_address = $request->input('loc_address');
            $location->loc_distric = $request->input('loc_distric');
            $location->loc_village = $request->input('loc_village');
            $location->region_id = $request->input('region_id');
            $location->loc_longtitude = $request->input('loc_longtitude');
            $location->create_by = Auth::user()->username; // Mengambil username yang sedang login
            
            // Menghasilkan location_id secara otomatis
            $maxLocationId = MasterLocation::max('location_id'); // Ambil nilai location_id maksimum
            $location->location_id = $maxLocationId ? $maxLocationId + 1 : 1; // Set location_id, mulai dari 1 jika tidak ada
            
            $location->create_date = Carbon::now(); // Mengisi create_date dengan tanggal saat ini
            $location->save(); // Simpan data

            return response()->json([
                'status' => 'success',
                'message' => 'location berhasil ditambahkan',
                'redirect_url' => route('Admin.location')
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Terjadi kesalahan: ' . $e->getMessage()
            ]);
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
            'data' => ['LocationId' => '12345']
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

    public function updateDataLocation(Request $request, $id)
    {
        // Validasi input
        $request->validate([
            'loc_name' => 'required|string|max:255',
            'loc_city' => 'required|string|max:255',
            'loc_address' => 'required|string|max:255',
            'loc_distric' => 'required|string|max:255',
            'loc_village' => 'required|string|max:255',
            'region_id' => 'required|string|max:255',
            'loc_longtitude' => 'required|string|max:255',
        ]);

        // Cek apakah location dengan id yang benar ada
        $location = MasterLocation::find($id); // Langsung gunakan find jika ID adalah primary key

        if (!$location) {
            return response()->json(['status' => 'error', 'message' => 'location not found.'], 404);
        }

        // Update data location
        $location->loc_name = $request->loc_name;
        $location->loc_city = $request->loc_city;
        $location->loc_address = $request->loc_address;
        $location->loc_distric = $request->loc_distric;
        $location->loc_village = $request->loc_village;
        $location->region_id = $request->region_id;
        $location->loc_longtitude = $request->loc_longtitude;
        
        if ($location->save()) { // Menggunakan save() yang lebih aman daripada update()
            return response()->json([
                'status' => 'success',
                'message' => 'location updated successfully.',
                'redirect_url' => route('Admin.location'), // Sesuaikan dengan route index Anda
            ]);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Failed to update location.'], 500);
        }
    }

    public function deleteDataLocation($id)
    {
        $location = MasterLocation::find($id);

        if ($location) {
            $location->delete();
            return response()->json([
                'status' => 'success', 
                'message' => 'location deleted successfully.',
                'redirect_url' => route('Admin.location')
            ]);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Data location Gagal Terhapus'], 404);
        }
    }


    public function details($LocationId)
    {
        $location = MasterLocation::where('location_id', $LocationId)->first();

        if (!$location) {
            abort(404, 'location not found');
        }

        return view('location.details', ['asset' => $location]);
    }
}