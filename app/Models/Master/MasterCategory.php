<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterCategory extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_category';

    protected $fillable = [
        'cat_id',
        'cat_code',
        'create_date',
        'modified_date',
        'created_by',
        'modified_by',
        'is_active'
    ];
}
