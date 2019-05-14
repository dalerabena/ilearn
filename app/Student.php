<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Student extends Model
{
    public $additional_attributes = ['full_name', 'id_number_full_name'];

    public function getFullNameAttribute() {
        return "{$this->lastname}, {$this->firstname} {$this->middlename}";
    }

    public function getIdNumberFullNameAttribute() {
        return "{$this->idnumber} - {$this->lastname}, {$this->firstname} {$this->middlename}";
    }

    public function enrollments() {
        return $this->hasMany(Enrollment::class, 'studentid');
    }
}
