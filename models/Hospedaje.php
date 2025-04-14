<?php
require_once 'BaseModel.php';

class Hospedaje extends BaseModel {

    public function buscarPorPrefijoNombre($prefijo) {
        $sql = "
            SELECT 
                h.id,
                h.name,
                h.type,
                h.description,
                c.name AS city,
                p.Provincia AS province,
                ht.stars,
                rt.name AS room_type,
                a.total_apartments,
                a.max_adults
            FROM hospedaje h
            JOIN city c ON h.city_id = c.id
            JOIN province p ON c.province_id = p.id
            LEFT JOIN hotel ht ON h.id = ht.hospedaje_id
            LEFT JOIN room_type rt ON ht.room_type_id = rt.id
            LEFT JOIN apartment a ON h.id = a.hospedaje_id
            WHERE h.name LIKE :prefijo
            ORDER BY h.name ASC
        ";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute([':prefijo' => $prefijo . '%']);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
