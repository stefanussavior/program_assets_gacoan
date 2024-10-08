<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterDept extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_dept';

    protected $fillable = [
        'dept_name',
        'created_date',
        'modified_date',
        'created_by',
        'modified_by',
        'is_active'
    ];
}
