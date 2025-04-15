# 🏨 Destinia - Buscador de Hospedajes

Aplicación web desarrollada en PHP (sin frameworks) utilizando el patrón MVC. Permite buscar hospedajes (hoteles y apartamentos) por prefijo del nombre, mostrando detalles específicos según el tipo de hospedaje y su ubicación (ciudad y provincia).

---

## ⚙️ Requisitos

- PHP 7.4 o superior
- MySQL 5.7 o superior
- Servidor local (XAMPP, MAMP, LAMP o servidor embebido de PHP)
- Navegador web moderno

---

## 📦 Instalación

### 1. Crear la Base de Datos

Crea una base de datos en MySQL llamada **`destinia`** con el siguiente cotejamiento:

- **Nombre**: `destinia`
- **Cotejamiento**: `utf8mb4_unicode_ci`

> ⚠️ **IMPORTANTE**: El cotejamiento de la base de datos debe ser `utf8mb4_unicode_ci` para asegurar compatibilidad con caracteres especiales.

---

### 2. Importar el archivo SQL

Importa el archivo `destinia.sql` que se encuentra en la raíz del proyecto. Puedes hacerlo mediante:

### 3. Editar archivo config/db.php

return [
'host' => 'localhost',
'dbname' => 'destinia',
'user' => 'tu_usuario',
'password' => 'tu_contraseña',
];

### 4. Ejecución

En el navegador http://[HOST]/desinia/public/index.php

🧪 Rutas de Prueba
Ver buscador:
http://localhost:8888/destinia/public/index.php

### 5. Estructura

destinia/
├── config/
│ ├── db.php
│ └── database.php
├── controllers/
├── models/
├── views/
│ ├── hospedajes/
│ └── layout/
├── public/
│ └── index.php
└── destinia.sql
