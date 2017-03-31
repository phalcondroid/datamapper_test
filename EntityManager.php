<?php

namespace DatamapperTest;

include_once __DIR__ . "/Operation/Connection.php";

use DatamapperTest\Operation\Connection;

class EntityManager
{
    private $connection;

    public function __construct()
    {
        $this->connection = Connection::getInstance();
    }

    public function find($model, $parameters)
    {
        $find = new Find($model);
        $sql  = $find->getSql();
        $prepare = $this->connection->prepare($sql);
        $prepare->execute($parameters);
        return $prepare->fetch(PDO::FETCH_ASSOC);
    }

    public function delete()
    {

    }

    public function save()
    {

    }

    public function update()
    {

    }
}
