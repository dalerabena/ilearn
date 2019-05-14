<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Activity extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
        return "{$this->title} | {$this->class->code} - {$this->class->subject->name} | {$this->class->period->name} {$this->class->period->schoolyear} | {$this->class->schedule->days} {$this->class->schedule->time} {$this->class->schedule->room}";
    }

    public function activitysubmits() {
        return $this->hasMany(Activitysubmit::class, 'activityid');
    }

    public function class() {
        return $this->belongsTo(Iclass::class, 'classid');
    }
}
