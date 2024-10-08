<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterAsset extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_assets';

    protected $fillable = [
        'asset_code',
        'asset_model',
        'asset_quantity',
        'asset_status',
        'asset_image',
        'create_date',
        'modified_date',
        'created_by',
        'modified_by',
        'priority_id',
        'cat_id',
        'type_id',
        'uom_id',
        'is_active',
        'deleted_at',
        'qr_code_path'
    ];
}
