<?php
    require_once 'required.php';

    function createCategory(PDO $pdo, $name) {
        
        $sql = 'INSERT INTO categorys (name) 
        VALUES (:name)';

        $query = $pdo->prepare($sql);

        $query->bindParam(':name', $name, PDO::PARAM_STR);

        $query->execute();

        return $pdo->lastInsertId();
    }

    if($_SERVER["REQUEST_METHOD"] === "POST") {
        $name = $_POST["name"];

        try{
            $newCategory = createCategory($pdo, $name);
        } catch(Exception $exception) {
            echo "Une erreur est survenue lors de la creation de la catégorie : " . $exception->getMessage();
        }
    }