<?php

include_once __DIR__ . "/Operation/Connection.php";


use DatamapperTest\Operation\Connection;

$connection  = Connection::getInstance();
$prepare = $connection->prepare("select * from estado");
$prepare->execute();

class Estado
{
    private $id_estado;
    private $estado;

    public function getIdEstado()
    {
        return $this->id_estado;
    }

    public function setIdEstado($id)
    {
        $this->id_estado = $id;
    }
}

//$em = new EntityManager();
//$em->find(Estado);
