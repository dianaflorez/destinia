<?php

require_once __DIR__ . '/BaseModel.php';

class Apartment extends BaseModel
{
    private $table_name = "apartment";

    public function getApartmentDetails($hospedaje_id)
    {
        $query = "SELECT total_apartments, max_adults FROM " . $this->table_name . " WHERE hospedaje_id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(1, $hospedaje_id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>