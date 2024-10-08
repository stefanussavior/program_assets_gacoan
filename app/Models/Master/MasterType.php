<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterType extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_type';

    protected $fillable = [
        'type_code',
        'type_name',
        'create_date',
        'modified_date',
        'create_by',
        'modified_by',
        'is_active'
    ];

    
}
