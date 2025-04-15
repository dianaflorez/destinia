<?php

require_once __DIR__ . '/BaseModel.php';

class Hospedaje extends BaseModel
{
    private $table_name = "hospedaje";

    public function findHospedajesByPrefix($prefix)
    {
        if (isset($_SESSION['lang'])) {
            $lan = $_SESSION['lang'];
        }else{
            $_SESSION['lang'] = 'es'; // idioma por defecto
            $lan = 'es';
        }
        
        if($lan != 'es'){
            $query = "
                SELECT 
                    ". $this->table_name .".id as id,
                    COALESCE(t.translated_text, " . $this->table_name . ".name) AS name,
                    ". $this->table_name .".image,
                    ". $this->table_name .".type,
                    ". $this->table_name .".city_id,
                    ". $this->table_name .".description,
                    t.language_code
                FROM " . $this->table_name . "
                    LEFT OUTER JOIN  translations t ON  
                    $this->table_name.id = t.row_id AND
                    t.column_name = 'name' AND
                    table_name = '$this->table_name' AND
                    language_code = '$lan'
                WHERE
                    name LIKE ? OR translated_text LIKE ?";
        }else{  
            $query = "SELECT * FROM " . $this->table_name . " WHERE name LIKE ?";
        }

        $stmt = $this->db->prepare($query);
        $prefix = $prefix . '%';
        if ($lan != 'es') {
            $stmt->bindParam(1, $prefix);
            $stmt->bindParam(2, $prefix); // Vincula el segundo parámetro
        } else {
            $stmt->bindParam(1, $prefix);
        }
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>