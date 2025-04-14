<?php

require_once __DIR__ . '/BaseModel.php';

class Hospedaje extends BaseModel
{
    private $table_name = "hospedaje";

    public function findHospedajesByPrefix($prefix)
    {
        $query = "SELECT * FROM " . $this->table_name . " WHERE name LIKE ?";
        $stmt = $this->db->prepare($query);
        $prefix = $prefix . '%';
        $stmt->bindParam(1, $prefix);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>