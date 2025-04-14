<?php
require_once 'BaseModel.php';

class HospedajeModel extends BaseModel
{
    public function buscarPorPrefijo($prefijo)
    {
        $sql = "
            SELECT h.id, h.name, h.type, h.description,
                   c.name AS city, p.Provincia AS province,
                   ho.stars, rt.name AS room_type,
                   a.total_apartments, a.max_adults
            FROM hospedaje h
            INNER JOIN city c ON h.city_id = c.id
            INNER JOIN province p ON c.province_id = p.id
            LEFT JOIN hotel ho ON ho.hospedaje_id = h.id
            LEFT JOIN room_type rt ON ho.room_type_id = rt.id
            LEFT JOIN apartment a ON a.hospedaje_id = h.id
            WHERE h.name LIKE :prefijo
            ORDER BY h.name
        ";

        $stmt = $this->db->prepare($sql);
        $stmt->execute(['prefijo' => $prefijo . '%']);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
