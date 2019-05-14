<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Schedule extends Model
{
    public $additional_attributes = ['full_schedule'];

    public function getFullScheduleAttribute() {
        return "{$this->time} | {$this->days} | {$this->room}";
    }

}
