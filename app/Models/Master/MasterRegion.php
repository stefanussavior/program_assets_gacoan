<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterRegion extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_region';

    protected $fillable = [
        'region_code',
        'region_name',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by'.
        'is_active'
    ];
}
