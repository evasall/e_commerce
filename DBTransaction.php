<?php

class DBTransaction{

    public $database;

    public function __construct(){


        if ($this->database == null) {
            $urlDB = "mysql:host=localhost; dbname=ecommerce";
            $username = 'root';
            $password = '';
            $this->database = new PDO($urlDB,$username,$password);
            $this->database->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        }
    }

    public function getAllProduct(){

        $resultat = $this->database->query("SELECT * FROM Produit");
        return $resultat->fetchAll();

    }
    public function creatproduct($nom,$description,$prixU,$img,$id_boutiquier){
        
        $resultat = $this->database->query("INSERT INTO `Produit` VALUE(null,$nom,$description,$prixU,$img,$id_boutiquier)");
        return $resultat->fetchAll();
    }

}


?>
