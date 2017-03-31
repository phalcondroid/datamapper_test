<?php

namespace DatamapperTest\MetaData;

class ReadClasses
{
    private $instance;

    public function __construct($instance)
    {
        $this->instance = new \ReflectionClass($instance);
    }

    public function getReflector()
    {
        return$this->instance;
    }
}
