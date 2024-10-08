<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterWarranty extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_warranty';

    protected $fillable = [
        'warranty_name',
        'warranty_day',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];
}
