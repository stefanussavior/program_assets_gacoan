<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterLocation extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_location';

    protected $fillable = [
        'loc_code',
        'loc_name',
        'loc_city',
        'loc_address',
        'loc_distric',
        'loc_village',
        'region_id',
        'loc_longtitude',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];
}
