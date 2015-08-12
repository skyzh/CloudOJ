<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;
use Phalcon\Db\RawValue;

class Problemdata extends Model {
    public $pdid;
    public $pid;
    public $isSample;
    public $dat_in;
    public $dat_out;
    public $dat_name;
    public $isFile;
    public $isDeleted;

    public function initialize() {
        $this->belongsTo("pid", "Problemset", "pid", array(
            'reusable' => true
        ));
    }

    public static function findProblemDataByDID($pdid) {
        $probdata = Problemdata::findFirst(array(
            "pdid = :pdid:", 'bind' => array('pdid' => $pdid)));
        return $probdata;
    }
    public function beforeValidationOnCreate() {
        $this->isDeleted = false;
    }
    public function getIn() {
        if($this->isFile == 1) {
            $dat = "";
            $__dat_path = APP_PATH. "ojdata/" . $this->dat_in;
            if(!file_exists($__dat_path)) return "Not Found";
            $fp = fopen($__dat_path, "r");
            while(!feof($fp))
            {
                $dat .= str_replace(array("\r"), "", fgets($fp));
            }
            fclose($fp);
            return $dat;
        } else {
            return str_replace(array("\r"), "", $this->dat_in);
        }
    }

    public function getOut() {
        if($this->isFile == 1) {
            $dat = "";
            $__dat_path = APP_PATH. "ojdata/" . $this->dat_out;
            if(!file_exists($__dat_path)) return "Not Found";
            $fp = fopen($__dat_path, "r");
            while(!feof($fp))
            {
                $dat .= str_replace(array("\r"), "", fgets($fp));
            }
            fclose($fp);
            return $dat;
        } else {
            return str_replace(array("\r"), "", $this->dat_out);
        }
    }
}
