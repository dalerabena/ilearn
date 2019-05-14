<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use QrCode;

class QRCodeController extends Controller
{
    public function generate(Request $request) {
      return QrCode::size(700)->generate($request->date.'###'.$request->classid);
    }
}
