<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterPriority extends Model
{
    use HasFactory;
    use SoftDeletes;

    public $table = 'm_prority';

    public $fillable = [
        'priority_code',
        'priority_name',
        'create_date',
        'modified_date',
        'created_by',
        'modified_by',
        'is_active'
    ];
}
