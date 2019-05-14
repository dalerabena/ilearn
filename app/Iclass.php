<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Iclass extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
        return "{$this->code} - {$this->subject->name} | {$this->period->name} {$this->period->schoolyear} | {$this->schedule->days} {$this->schedule->time} {$this->schedule->room}";
    }

    public function enrollclasses() {
        return $this->hasMany(EnrollClass::class, 'classid');
    }

    public function period() {
        return $this->belongsTo(Period::class, 'periodid');
    }

    public function subject() {
        return $this->belongsTo(Subject::class, 'subjectid');
    }

    public function schedule() {
        return $this->belongsTo(Schedule::class, 'scheduleid');
    }

}
