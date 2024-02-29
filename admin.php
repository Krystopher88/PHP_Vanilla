<?php
require_once 'lib/required.php';
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, inital-scale=1.0">
    <meta name="description" content="Description de la page">
    <meta name="keywords" content="keyword-1, keyword-2, ....">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="<?= CSS_PATH; ?>">
</head>

<body class="container">
    <?php include 'templates/admin/_partials/_header.php' ?>
    <main>
        <div class="mt-5">
            <form>
                <button class="btn btn-primary">Créer un produit</button>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nom du produit</th>
                            <th>Descriptif</th>
                            <th>Prix</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>test</td>
                            <td>blablablabla</td>
                            <td>1999€</td>
                            <td>
                                <button class="btn btn-warning">
                                    Modifier
                                </button>
                                <a href="" class="btn btn-danger">Supprimer</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </main>
</body>

</html>