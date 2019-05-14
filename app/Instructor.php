<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Instructor extends Model
{
    public $additional_attributes = ['full_name'];

    public function getFullNameAttribute() {
      return "{$this->lastname}, {$this->firstname} {$this->middlename}";
    }
}
