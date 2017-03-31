<?php

namespace DatamapperTest\Operation;

include_once __DIR__ . "/MetaData/ReadClasses.php";

use DatamapperTest\MetaData\ReadClasses;

class Find
{
    private $reflector;
    private $properties;

    public function __construct($model)
    {
        $reflector = new ReadClasses($model);
        $this->properties = $reflector->getReflector()->getProperties();
    }

    public function getSql()
    {
        $i = 0;
        $sql = "SELECT ";
        foreach ($this->properties as $prop) {
            $comma = "";
            if ($i < count($this->properties)) {
                $comma = ", ";
            }
            $sql .= $prop["name"] . $comma;
            $i++;
        }
        $sql .= " FROM " . $this->reflector->getName();
        return $sql;
    }
}
