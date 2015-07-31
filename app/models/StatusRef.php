<?php
class StatusRef {
    public $sid;
    public $pid;
    public $uid;
    public $lang;
    public $submittime;
    public $status;
    public $memlimit;
    public $timelimit;
    public $codelength;
    public $hidden;

    public $code;
    public $ret;


    public function __construct($status, $statuscode) {
        $this->sid = &$status->sid;
        $this->pid = &$status->pid;
        $this->uid = &$status->uid;
        $this->lang = &$status->lang;
        $this->submittime = &$status->submittime;
        $this->status = &$status->status;
        $this->memlimit = &$status->memlimit;
        $this->timelimit = &$status->timelimit;
        $this->codelength = &$status->codelength;
        $this->hidden = &$status->hidden;
        $this->code = &$statuscode->code;
        $this->ret = &$statuscode->ret;
    }
}
