<?php

require_once __DIR__ . '/BaseModel.php';

class City extends BaseModel
{
    private $table_name = "city";

    public function getCityName($city_id)
    {
        $query = "SELECT name, province_id FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(1, $city_id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row;
    }
}
?>