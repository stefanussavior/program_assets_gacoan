<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterPeople extends Model
{
    use HasFactory;
    use SoftDeletes;

    public $table = 'm_people';

    public $fillable = [
        'people_nickname',
        'people_fullname',
        'people_email',
        'people_whatsapp',
        'division_id',
        'dept_id',
        'joblevel_id',
        'region_id',
        'loc_id',
        'create_date',
        'modified_date',
        'create_by',
        'is_active'
    ];
}
