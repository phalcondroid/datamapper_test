<?php

namespace DatamapperTest\Operation;

include_once dirname(__DIR__) . "/Operation/Connection.php";
include_once dirname(__DIR__) . "/MetaData/ReadClasses.php";

use DatamapperTest\MetaData\ReadClasses;
use DatamapperTest\Operation\Connection;

class Find
{
    private $reflector;
    private $properties;

    public function __construct($model)
    {
        $this->connection = Connection::getInstance();
        $reflector  = new ReadClasses($model);
        $this->reflector  = $reflector->getReflector();
        $this->properties = $reflector->getReflector()->getProperties();
    }

    public function getOperation($parameters)
    {
        $sql  = $this->getSql();
        $prepare = $this->connection->prepare($sql);
        $prepare->execute($parameters);
        $resultados = $this->iterate($prepare);
        return $resultados;
    }

    public function iterate($prepare)
    {
        $resultados = array();
        while ($row = $prepare->fetch(\PDO::FETCH_ASSOC)) {
            $resultados[] = $row;
        }
        return $resultados;
    }

    public function getSql()
    {
        $i = 1;
        $sql = "SELECT ";
        foreach ($this->properties as $prop) {
            $comma = "";
            if ($i < count($this->properties)) {
                $comma = ", ";
            }
            $sql .= $prop->name . $comma;
            $i++;
        }
        $sql .= " FROM " . $this->reflector->getName();
        return strtolower($sql);
    }
}
