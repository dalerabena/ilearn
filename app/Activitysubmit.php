<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Activitysubmit extends Model
{
    public $additional_attributes = ['student_name'];

    public function getStudentNameAttribute() {
        return "{$this->student->idnumber} - {$this->student->lastname}, {$this->student->firstname} {$this->student->middlename}";
    }

    public function student() {
        return $this->belongsTo(Student::class, 'studentid');
    }
}
