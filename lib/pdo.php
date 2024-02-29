<?php

try {
    // Tentative d'établir une connexion à la base de données
    // Utilisation de PDOException pour capturer les erreurs spécifiques à PDO
    $pdo = new PDO('mysql:dbname=' . DB_NAME . ';host=' . DB_HOST . ';charset=UTF8', DB_USER, DB_PASSWORD);
} catch (PDOException $e) {
    // Capture et gestion des erreurs de base de données PDO
    // Affiche un message explicite en cas d'erreur
    die('Erreur : ' . $e->getMessage());
} catch (Exception $e) {
    // Capture et gestion des exceptions génériques
    // Si une exception est lancée qui n'est pas spécifique à PDO, elle sera capturée ici
    // Cela permet de gérer différents types d'erreurs de manière appropriée
    die('Erreur : ' . $e->getMessage());
}
