<?php

require_once __DIR__ . '/BaseModel.php';

class Province extends BaseModel
{
    private $table_name = "province";

    public function getProvinceName($province_id)
    {
        $query = "SELECT name FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(1, $province_id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row['name'];
    }
}
?>