<?php

require_once __DIR__ . '/BaseModel.php';

class RoomType extends BaseModel
{
    private $table_name = "room_type";

    public function getRoomTypeName($room_type_id)
    {
        $query = "SELECT name FROM " . $this->table_name . " WHERE id = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bindParam(1, $room_type_id);
        $stmt->execute();
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row['name'];
    }
}
?>