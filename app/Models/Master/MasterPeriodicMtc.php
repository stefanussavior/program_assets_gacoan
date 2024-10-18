<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth; // Untuk mendapatkan username dari user yang sedang login
use Carbon\Carbon; // Untuk tanggal dan waktu

class MasterPeriodicMtc extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $table = 'm_periodic_mtc';
    protected $primaryKey = 'periodic_mtc_id';

    protected $fillable = [
        'periodic_mtc_id',
        'periodic_mtc_name',
        'periodic_mtc_day',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];
    
    public $timestamps = false; // Nonaktifkan pengelolaan otomatis kolom created_at dan updated_at

    protected static function boot()
    {
        parent::boot();

        // Event ketika menambah data (creating)
        static::creating(function ($model) {
            $model->create_date = Carbon::now(); // Mengisi create_date dengan tanggal saat ini
            $model->create_by = Auth::user()->username ?? 'system'; // Mengisi create_by dengan username user yang login

            // Menghasilkan periodic_mtc_id secara otomatis
            $maxPeriodicId = MasterPeriodicMtc::max('periodic_mtc_id'); // Ambil nilai periodic_mtc_id maksimum
            $model->periodic_mtc_id = $maxPeriodicId ? $maxPeriodicId + 1 : 1; // Set periodic_mtc_id, mulai dari 1 jika tidak ada
        });

        // Event ketika mengupdate data (updating)
        static::updating(function ($model) {
            $model->modified_date = Carbon::now(); // Mengisi modified_date dengan tanggal saat ini
            $model->modified_by = Auth::user()->username ?? 'system'; // Mengisi modified_by dengan username user yang login
        });
    }
}
