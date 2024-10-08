<?php

namespace App\Models\Master;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterChecklist extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $table = 'm_checklist';
    
    protected $fillable = [
        'checklist_id',
        'checklist_name',
        'create_date',
        'modified_date',
        'created_by',
        'is_active',
        'deleted_at'
    ];
}
