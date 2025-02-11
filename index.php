<?php

class MySingleton{
    private static $instance;

    private function __construct(){}

    public static function getInstance(){
        if (!isset(self::$instance)) {
            self::$instance = new MySingleton();
        }
        return self::$instance;
    }
}
?>
