<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Attendance extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
        return "{$this->iclass->code} - {$this->iclass->subject->name} | {$this->iclass->period->name} {$this->iclass->period->schoolyear} | {$this->iclass->schedule->days} {$this->iclass->schedule->time} {$this->iclass->schedule->room} | Attendance for {$this->date}";
    }

    public function iclass() {
        return $this->belongsTo(Iclass::class, 'classid');
    }
}
