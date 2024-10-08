<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterReason extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_reason';

    protected $fillable = [
        'reason_name',
        'create_date',
        'modified_date',
        'created_by',
        'modified_by',
        'is_active'
    ];
}
