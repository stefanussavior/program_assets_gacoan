<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterPeriodicMtc extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_periodic_mtc';

    protected $fillable = [
        'periodic_mtc_name',
        'periodic_mtc_day',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];
}
