<?php

require ('./DBTransaction.php');
$transaction = new DBTransaction();
$allProduct = $transaction->getAllProduct();


$nom = 'gaz';
$description = 'derc';
$prixU = 1500;
$img = '';
$id_boutiquier=2;// ON DEVAIT METTRE A LA PLACE DU 2 LES INFOS DE LA SESSION ($_SESSION['user', id]) DU BOUTIKIER CONNECTÉ

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
   
    <table>

    <thead>
    <tr>
    <th>Nom produit</th>
    <th>Description</th>
    <th>Prix U</th>
    </tr>
    </thead>

    <tbody>

    <?php foreach ($allProduct as $key => $product) {?>

    <tr>
    <td><?=$product['nom']?></td>
    <td><?=$product['description']?></td>
    <td><?=$product['prixU']?></td>
    </tr>
    <?php } ?>
    
    </tbody>

    </table>

</body>
</html>