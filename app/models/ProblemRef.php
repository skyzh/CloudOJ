<?php

class ProblemRef {
    public $pid;
    public $description;
    public $input;
    public $output;
    public $sampleinput;
    public $sampleoutput;
    public $hint;

    public $title;
    public $type;
    public $submit;
    public $accepted;
    public $changetime;
    public $memlimit;
    public $timelimit;

    public function __construct($problemset, $problemdetail) {
        $this->pid = &$problemset->pid;
        $this->description = &$problemdetail->description;
        $this->input = &$problemdetail->input;
        $this->output = &$problemdetail->output;
        $this->sampleinput = &$problemdetail->sampleinput;
        $this->sampleoutput = &$problemdetail->sampleoutput;
        $this->hint = &$problemdetail->hint;
        $this->title = &$problemset->title;
        $this->type = &$problemset->type;
        $this->submit = &$problemset->submit;
        $this->accepted = &$problemset->accepted;
        $this->changetime = &$problemset->changetime;
        $this->memlimit = &$problemset->memlimit;
        $this->timelimit = &$problemset->timelimit;
    }
}
