<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Period extends Model
{

    public $additional_attributes = ['period_name'];

    public function getPeriodNameAttribute() {
        return "{$this->schoolyear} | {$this->name}";
    }

}
