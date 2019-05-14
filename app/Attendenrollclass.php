<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Attendenrollclass extends Model
{

    public function attendance() {
        return $this->belongsTo(Attendance::class, 'attendanceid');
    }

    public function enrollclass() {
        return $this->belongsTo(Enrollclass::class, 'enrollclassid');
    }

}
