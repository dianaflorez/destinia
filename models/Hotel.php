<?php

require_once __DIR__ . '/BaseModel.php';

class Hotel extends BaseModel
{
    private $table_name = "hotel";

    public function getHotelDetails($hospedaje_id)
    {
        $query = "SELECT stars, room_type_id FROM " . $this->table_name . " WHERE hospedaje_id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(1, $hospedaje_id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>