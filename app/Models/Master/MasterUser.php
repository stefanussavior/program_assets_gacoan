<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth; // Untuk mendapatkan username dari user yang sedang login
use Carbon\Carbon; // Untuk tanggal dan waktu
use Spatie\Permission\Traits\HasRoles;

class MasterUser extends Model
{
    use HasFactory, HasRoles;
    // use SoftDeletes;

    protected $table = 'm_user';
    protected $primaryKey = 'user_id';

    protected $fillable = [
        'user_id',
        'username',
        'password',
        'email',
        'role'
    ];
    
    public $timestamps = false; // Nonaktifkan pengelolaan otomatis kolom created_at dan updated_at

    protected static function boot()
    {
        parent::boot();

        // Event ketika menambah data (creating)
        static::creating(function ($model) {
            $model->create_date = Carbon::now(); // Mengisi create_date dengan tanggal saat ini
            $model->create_by = Auth::user()->username ?? 'system'; // Mengisi create_by dengan username user yang login

            // Menghasilkan user_id secara otomatis
            $maxUserId = MasterUser::max('user_id'); // Ambil nilai user_id maksimum
            $model->user_id = $maxUserId ? $maxUserId + 1 : 1; // Set user_id, mulai dari 1 jika tidak ada
        });

        // Event ketika mengupdate data (updating)
        static::updating(function ($model) {
            $model->modified_date = Carbon::now(); // Mengisi modified_date dengan tanggal saat ini
            $model->modified_by = Auth::user()->username ?? 'system'; // Mengisi modified_by dengan username user yang login
        });
    }
}
