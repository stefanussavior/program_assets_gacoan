<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterUser extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'm_user';

    protected $fillable = [
        'username',
        'password',
        'role'
    ];
}
