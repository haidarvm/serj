<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Exceptions extends Exception {

    public function __construct($message, $code = 0, Exception $previous = null) {
        parent::__construct($message, $code, $previous);
    }

    // custom string representation of object
    public function __toString() {
        return __CLASS__ . ": [{$this->code}]: {$this->message}\n"; //edit this to your need
    }

}

/**
 * doest work!!
 * Enter description here ...
 * @author tuneeca
 *
 */
class AccessDeniedException extends MY_Exceptions {
	
	public function __construct($message, $code = 0, Exception $previous = null) {
        parent::__construct($message, $code, $previous);
    }
}