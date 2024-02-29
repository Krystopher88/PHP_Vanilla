<?php
require_once 'required.php';

// Create Category
function createCategory(PDO $pdo, $name)
{
    $sql = 'INSERT INTO categorys (name) VALUES (:name)';
    $query = $pdo->prepare($sql);
    $query->bindParam(':name', $name, PDO::PARAM_STR);

    try {
        $success = $query->execute();
        if ($success) {
            return "La catégorie a été créée.";
        } else {
            return "Erreur lors de la création de la catégorie.";
        }
    } catch (PDOException $pdoException) {
        return "Erreur PDO : " . $pdoException->getMessage();
    } catch (Exception $exception) {
        return "Erreur : " . $exception->getMessage();
    }
}

// form Create Category
// if ($_SERVER["REQUEST_METHOD"] === "POST") {
//     $name = $_POST["name"];

//     try {
//         $newCategory = createCategory($pdo, $name);
//     } catch (Exception $exception) {
//         echo "Une erreur est survenue lors de la creation de la catégorie : " . $exception->getMessage();
//     }
// }

// Update Category
function updateCategory(PDO $pdo, $id, $name)
{
    $sql = 'UPDATE categorys SET name = :name WHERE id = :id';
    $query = $pdo->prepare($sql);
    $query->bindParam(':name', $name, PDO::PARAM_STR);
    $query->bindParam(':id', $id, PDO::PARAM_INT);

        try {
            $success = $query->execute();
            if ($success) {
                return "La catégorie a été modifiée.";
            } else {
                return "Erreur lors de la modification de la catégorie.";
            }
        } catch (PDOException $pdoException) {
            return "Erreur PDO : " . $pdoException->getMessage();
        } catch (Exception $exception) {
            return "Erreur : " . $exception->getMessage();
        }
    }

// form Update Category
// if ($_SERVER["REQUEST_METHOD"] === "POST") {
//     $id = $_POST["id"];
//     $name = $_POST["name"];

//     try {
//         $updateCategory = updateCategory($pdo, $id, $name);
//     } catch (Exception $exception) {
//         echo "Une erreur est survenue lors de la modification de la catégorie : " . $exception->getMessage();
//     }
// }

// Delete Category
function deleteCategory(PDO $pdo, $id)
{
    $sql = 'DELETE FROM categorys WHERE id = :id';
    $query = $pdo->prepare($sql);
    $query->bindParam(':id', $id, PDO::PARAM_INT);

    try {
        $success = $query->execute();
        if ($success) {
            return "La catégorie a été supprimée.";
        } else {
            return "Erreur lors de la suppression de la catégorie.";
        }
    } catch (PDOException $pdoException) {
        return "Erreur PDO : " . $pdoException->getMessage();
    } catch (Exception $exception) {
        return "Erreur : " . $exception->getMessage();
    }
}


// informations Messages
$message = '';

if($_SERVER["REQUEST_METHOD"] ==="POST") {
    if(isset($_POST["createCategory"])) {
        $name = $_POST["createCategory"];
        $message = createCategory($pdo, $name);
    }elseif(isset($_POST["updateCategory"])) {
        $id = $_POST["id"];
        $name = $_POST["name"];
        $message = updateCategory($pdo, $id, $name);
    }elseif(isset($_POST["deleteCategory"])) {
        $id = $_POST["id"];
        $message = deleteCategory($pdo, $id);
    }
}