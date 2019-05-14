<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Enrollment extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
        return "{$this->student->idnumber} - {$this->student->lastname}, {$this->student->firstname} {$this->student->middlename} | {$this->period->name} {$this->period->schoolyear}";
    }

    public function student() {
        return $this->belongsTo(Student::class, 'studentid');
    }

    public function enrollmentclasses() {
        return $this->hasMany(Enrollclass::class, 'enrollid');
    }

    public function period() {
        return $this->belongsTo(Period::class, 'periodid');
    }

}
