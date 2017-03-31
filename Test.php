<?php

include_once "EntityManager.php";

use DatamapperTest\EntityManager;

class Estado
{
    private $idestado;
    private $estado;

    public function getIdEstado()
    {
        return $this->idestado;
    }

    public function setIdEstado($id)
    {
        $this->idestado = $id;
    }
}

$em = new EntityManager();
$results = $em->find(Estado::class);

echo "<h1>Estados</h1> <br>";
foreach ($results as $result) {
    echo "Identificacion ", $result["idestado"], " Tipo : " . $result["estado"] . "<br>";
}
