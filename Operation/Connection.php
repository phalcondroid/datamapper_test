<?php

namespace DatamapperTest\Operation;

// /Users/julianmolina/Documents/htdocs/datamapper_test/Config/local.php
include_once dirname(__DIR__) . "/Config/local.php";

final class Connection
{
    private static $instance = null;

    private function __construct()
    {}

    public static function getInstance()
    {
        if (self::$instance == null) {
            try {
                self::$instance = new \PDO(
                    "mysql:host=" . host . ";dbname=" . dbname,
                    user,
                    pass
                );
            } catch (\PDOException $e) {
                echo $e->getMessage() . "<br>";
            }
        }
        return self::$instance;
    }

    public function __clone()
    {
        return false;
    }
}
