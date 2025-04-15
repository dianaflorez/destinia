<?php

require_once __DIR__ . '/../config/database.php';

function __($key) {
    $lang = $_SESSION['lang'] ?? 'es'; // idioma por defecto
    $translations = include __DIR__ . "/../lang/{$lang}.php";
    return $translations[$key] ?? $key;
}

function translate($table, $column, $rowId, $defaultText) {
    $lang = $_SESSION['lang'] ?? 'es';
    $db = Database::connect();

    $stmt = $db->prepare("SELECT translated_text FROM translations WHERE table_name = ? AND column_name = ? AND row_id = ? AND language_code = ?");
    $stmt->execute([$table, $column, $rowId, $lang]);

    $translation = $stmt->fetchColumn();
    return $translation ?: $defaultText;
}


