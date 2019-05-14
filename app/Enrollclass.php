<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Enrollclass extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
        return "{$this->enrollment->student->idnumber} | {$this->iclass->code} - {$this->iclass->subject->name} | {$this->iclass->period->name} {$this->iclass->period->schoolyear} | {$this->iclass->schedule->days} {$this->iclass->schedule->time} {$this->iclass->schedule->room}";
    }

    public function enrollment() {
        return $this->belongsTo(Enrollment::class, 'enrollid');
    }

    public function iclass() {
        return $this->belongsTo(Iclass::class, 'classid');
    }

}
