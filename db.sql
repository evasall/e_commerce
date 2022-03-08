DROP DATABASE IF EXISTS `ecommerce`;-- supprimer une base
CREATE DATABASE IF NOT EXISTS `ecommerce`;-- cree une base 
USE  `ecommerce`;-- charger une base
-- creation de table (USER)
CREATE TABLE `User`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(100),
   `prenom` VARCHAR(100),
    `tel` VARCHAR(20) UNIQUE,
    `pwd` VARCHAR(100),
    `profile` ENUM("ADMIN","BOUTIQUIER","CLIENT")
);
INSERT INTO `User` VALUE(
    null,
    "Diouf",
    "Seynabou",
    "784451085",  
    "passer123",
    "ADMIN"
);
INSERT INTO `User` VALUE(
    null,
    "faye",
    "sokhna",
    "778512546",  
    "passer",
    "BOUTIQUIER"
);
INSERT INTO `User` VALUE(
    null,
    "gueye",
    "Ablaye",
    "780102148",  
    "passer1",
    "CLIENT"
);


-- (`Produit`)
CREATE TABLE `Produit`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(100),
   `description` TEXT,
    `prixU` float,
    `image` VARCHAR(100),
    `id_boutiquier`int,
   CONSTRAINT FOREIGN KEY (`id_boutiquier`) REFERENCES `User`(`id`) );
INSERT INTO `Produit`VALUE(
    null,
    "chips",
    "sama dome",
    " 100",
    "",
    "2"
);
INSERT INTO `Produit`VALUE(
    null,
   "Lait",
    "Vitalait",
    " 1600",
    "",
    "2"
);
INSERT INTO `Produit`VALUE(null,"Nescafet","Donne du gaut a ton cafe"," 1500","","2");
INSERT INTO `Produit` VALUE(null,"riz","Parfumé"," 27000","","2");
-- TABLE PANIER
CREATE TABLE `Panier`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `montant_total` float,
   `id_client` int,
   CONSTRAINT FOREIGN KEY (`id_client`) REFERENCES `User`(`id`) );

   INSERT INTO `Panier` VALUE(
       null,
       0,
       3
   );
   SELECT * FROM `Produit` WHERE `nom`="riz" AND `nom`= "Lait";

-- TABLE `Produit_Panier`
     CREATE TABLE `Produit_Panier`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `id_panier` int,
    `id_produit` int,
    `nbr` int,
    `montant_total` float,
    CONSTRAINT FOREIGN KEY (`id_panier`) REFERENCES `Panier`(`id`),
    CONSTRAINT FOREIGN KEY (`id_produit`) REFERENCES `Produit`(`id`) 
     );
     --CRUD FOR`Produit_Panier`
     INSERT INTO `Produit_Panier` VALUE( null, 1,3,2,(2*700));
     INSERT INTO `Produit_Panier` VALUE( null, 1,2,3,(3*1600));
    UPDATE `Panier` SET `montant_total`=(2*7000)+(3*1600) WHERE `id`=1;

-- TABLE `Commande`
     CREATE TABLE `Commande`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `date` date,
   `montant_total` float,
    `etat` ENUM("EN COURS", "VALIDER", "REJETER"),
    `id_client` int,
   CONSTRAINT FOREIGN KEY (`id_client`) REFERENCES `User`(`id`) 
    );
-- CRUD FOR`Commande`
    INSERT INTO `Commande` VALUE( null, '2022-05-29',7000,"EN COURS",3);
-- TABLE `Produit_Commande`
CREATE TABLE `Produit_Commande`(
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `id_commande` int,
    `id_produit` int,
    `nbr` int,
    `montant_total` float,
    CONSTRAINT FOREIGN KEY (`id_commande`) REFERENCES `Commande`(`id`),
    CONSTRAINT FOREIGN KEY (`id_produit`) REFERENCES `Produit`(`id`) );
     -- CRUD FOR`Produit_Commande`
     -- AJOUTER 2 PRODUIT DANS COMMANDE ID=2 (DETAIL COMMANDE)
     INSERT INTO `Produit_Commande` VALUE( null, 1,3,2,(2*700));
     INSERT INTO `Produit_Commande` VALUE( null, 1,2,3,(3*1600));
-- SELECT AVOIR LE BOUTIQUER ET LE PRODUITS
SELECT * FROM `User` JOIN `Produit` ON User.id=Produit.id_boutiquier;

































