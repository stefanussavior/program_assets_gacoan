<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterGroupUser extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_groupuser';

    protected $fillable = [
        'group_name',
        'group_roles',
        'created_by',
        'modified_by',
        'create_date',
        'modified_date',
        'is_active'
    ];
}
