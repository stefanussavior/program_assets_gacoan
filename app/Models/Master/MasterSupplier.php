<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterSupplier extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_supplier';

    protected $fillable = [
        'supplier_code',
        'supplier_name',
        'supplier_address',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];
}
