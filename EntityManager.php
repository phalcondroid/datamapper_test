<?php

namespace DatamapperTest;

include_once __DIR__ . "/Operation/Find.php";
use DatamapperTest\Operation\Find;

class EntityManager
{
    private $connection;

    public function find($model, $parameters = array())
    {
        $find = new Find($model);
        return $find->getOperation($parameters);
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
