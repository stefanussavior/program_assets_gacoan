<?php
    
// namespace App\Http\Controllers;
    
// use Illuminate\Http\Request;
// use App\Http\Controllers\Controller;
// use App\Models\User;
// use Spatie\Permission\Models\Role;
// use DB;
// use Hash;
// use Illuminate\Support\Arr;
// use Illuminate\View\View;
// use Illuminate\Http\RedirectResponse;
    
// class UserController extends Controller
// {
//     /**
//      * Display a listing of the resource.
//      *
//      * @return \Illuminate\Http\Response
//      */
//     public function index(Request $request): View
//     {
//         $data = User::latest()->paginate(5);
  
//         return view('users.index',compact('data'))
//             ->with('i', ($request->input('page', 1) - 1) * 5);
//     }
    
//     /**
//      * Show the form for creating a new resource.
//      *
//      * @return \Illuminate\Http\Response
//      */
//     public function create(): View
//     {
//         $roles = Role::pluck('name','name')->all();

//         return view('users.create',compact('roles'));
//     }
    
//     /**
//      * Store a newly created resource in storage.
//      *
//      * @param  \Illuminate\Http\Request  $request
//      * @return \Illuminate\Http\Response
//      */
//     public function store(Request $request): RedirectResponse
//     {
//         $this->validate($request, [
//             'name' => 'required',
//             'email' => 'required|email|unique:users,email',
//             'password' => 'required|same:confirm-password',
//             'roles' => 'required'
//         ]);
    
//         $input = $request->all();
//         $input['password'] = Hash::make($input['password']);
    
//         $user = User::create($input);
//         $user->assignRole($request->input('roles'));
    
//         return redirect()->route('users.index')
//                         ->with('success','User created successfully');
//     }
    
//     /**
//      * Display the specified resource.
//      *
//      * @param  int  $id
//      * @return \Illuminate\Http\Response
//      */
//     public function show($id): View
//     {
//         $user = User::find($id);

//         return view('users.show',compact('user'));
//     }
    
//     /**
//      * Show the form for editing the specified resource.
//      *
//      * @param  int  $id
//      * @return \Illuminate\Http\Response
//      */
//     public function edit($id): View
//     {
//         $user = User::find($id);
//         $roles = Role::pluck('name','name')->all();
//         $userRole = $user->roles->pluck('name','name')->all();
    
//         return view('users.edit',compact('user','roles','userRole'));
//     }
    
//     /**
//      * Update the specified resource in storage.
//      *
//      * @param  \Illuminate\Http\Request  $request
//      * @param  int  $id
//      * @return \Illuminate\Http\Response
//      */
//     public function update(Request $request, $id): RedirectResponse
//     {
//         $this->validate($request, [
//             'name' => 'required',
//             'email' => 'required|email|unique:users,email,'.$id,
//             'password' => 'same:confirm-password',
//             'roles' => 'required'
//         ]);
    
//         $input = $request->all();
//         if(!empty($input['password'])){ 
//             $input['password'] = Hash::make($input['password']);
//         }else{
//             $input = Arr::except($input,array('password'));    
//         }
    
//         $user = User::find($id);
//         $user->update($input);
//         DB::table('model_has_roles')->where('model_id',$id)->delete();
    
//         $user->assignRole($request->input('roles'));
    
//         return redirect()->route('users.index')
//                         ->with('success','User updated successfully');
//     }
    
//     /**
//      * Remove the specified resource from storage.
//      *
//      * @param  int  $id
//      * @return \Illuminate\Http\Response
//      */
//     public function destroy($id): RedirectResponse
//     {
//         User::find($id)->delete();
//         return redirect()->route('users.index')
//                         ->with('success','User deleted successfully');
//     }
// }

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Master\MasterUser;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;

class UserController extends Controller
{
    public function Index()
    {
        return view("Admin.user");
    }

    public function HalamanUser() {
        return view("Admin.user");
    }

    public function getUser()
    {
        // Mengambil semua data dari tabel m_user
        $users = MasterUser::all();
        return response()->json($users); // Mengembalikan data dalam format JSON
    }

    public function AddDataUser(Request $request)
    {
        // Validasi data yang dikirimkan
        $request->validate([
            'email' => 'required|string|max:255',
            'password' => 'required|string|max:255',
        ]);

        try {
            // Buat instance dari model MasterUser
            $user = new MasterUser();
            $user->email = $request->input('email');
            $user->password = $request->input('password');
            $user->create_by = Auth::user()->email; // Mengambil email yang sedang login
            
            // Menghasilkan user_id secara otomatis
            $maxUserId = MasterUser::max('user_id'); // Ambil nilai user_id maksimum
            $user->user_id = $maxUserId ? $maxUserId + 1 : 1; // Set user_id, mulai dari 1 jika tidak ada
            
            $user->create_date = Carbon::now(); // Mengisi create_date dengan tanggal saat ini
            $user->save(); // Simpan data

            return response()->json([
                'status' => 'success',
                'message' => 'user berhasil ditambahkan',
                'redirect_url' => route('Admin.user')
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
            'data' => ['UserId' => '12345']
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

    public function updateDataUser(Request $request, $id)
    {
        // Validasi input
        $request->validate([
            'email' => 'required|string|max:255',
            'password' => 'required|string|max:255',
        ]);

        // Cek apakah user dengan id yang benar ada
        $user = MasterUser::find($id); // Langsung gunakan find jika ID adalah primary key

        if (!$user) {
            return response()->json(['status' => 'error', 'message' => 'user not found.'], 404);
        }

        // Update data user
        $user->email = $request->email;
        $user->password = $request->password;
        
        if ($user->save()) { // Menggunakan save() yang lebih aman daripada update()
            return response()->json([
                'status' => 'success',
                'message' => 'user updated successfully.',
                'redirect_url' => route('Admin.user'), // Sesuaikan dengan route index Anda
            ]);
        } else {
            return response()->json(['status' => 'error', 'message' => 'Failed to update user.'], 500);
        }
    }

    public function deleteDataUser($id)
    {
        $user = MasterUser::find($id);

        if ($user) {
            $user->delete();
            return response()->json([
                'status' => 'success', 
                'message' => 'user deleted successfully.',
                'redirect_url' => route('Admin.user')
            ]);
        } else {
            return response()->json(['status' => 'Error', 'message' => 'Data user Gagal Terhapus'], 404);
        }
    }


    public function details($UserId)
    {
        $user = MasterUser::where('user_id', $UserId)->first();

        if (!$user) {
            abort(404, 'user not found');
        }

        return view('user.details', ['asset' => $user]);
    }
}
