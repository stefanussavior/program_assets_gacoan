<?php

namespace App\Http\Controllers;

use App\Models\Master\MasterRestoModel;
use Illuminate\Http\Request;

class RestoController extends Controller
{
    public function GetDataResto() {
        $dataResto = MasterRestoModel::all();
        return  response()->json($dataResto);
    }
}
