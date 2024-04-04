# Table de jointure

![salade](/img/08/salade.png)
  
![salade](/img/10/salade.png)
propmt db diagram :

## Une clef étrangère ?
- C'est la clef primaire d'une autre table
- mise en place d'un contrainte d'intégrité de clef étragère:
  je viens vérifier que l'id ajouter est un id de clef primaire
- La clef étragère couleur_id de la table fruit  
doit correspondre à la clef primaire de couleur

# relation clef étrangère :
**Many to One** et **One To many**
Un fruit à une seule couleur : **Many to One**  
Une couleur est posséder par plusieurs fruis **One to   Many** 

```
Table fruit {
  id INT [pk, not null]
  nom VARCHAR(30) [not null]
  couleur_id INT [not null]
}

Table couleur {
  id INT [pk, not null]
  nom VARCHAR(30) [not null]
}

Ref: "couleur"."id" < "fruit"."couleur_id"
```

code ecrit :
```mysql
CREATE TABLE couleur (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL
);


-- ajout de la contrainte de clef etrangere foreign key
CREATE TABLE fruit (
  id INT PRIMARY  KEY AUTO_INCREMENT NOT NULL,
  nom VARCHAR(30) NOT NULL,
  couleur_id INT  NULL,
    CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id)
);


```

code mySQL db diagram
```mysql
CREATE TABLE `fruit` (
  `id` INT PRIMARY KEY NOT NULL,
  `nom` VARCHAR(30) NOT NULL,
  `couleur_id` INT NOT NULL
);

CREATE TABLE `couleur` (
  `id` INT PRIMARY KEY NOT NULL,
  `nom` VARCHAR(30) NOT NULL
);

ALTER TABLE `fruit` ADD FOREIGN KEY (`couleur_id`) REFERENCES `couleur` (`id`);
```

# Ajouter les données
```mysql
INSERT INTO couleur (nom) VALUES ('rouge'),('vert'),('bleu');
INSERT INTO fruit (nom,couleur_id) VALUES ('pomme',1),('poire',2),('cerise',NULL);
```

# Mise en place d'une jointure
https://www.w3schools.com/mysql/mysql_join_inner.asp
![inner](/img/08/inner.png)  
```mysql
SELECT *
FROM fruit
INNER JOIN couleur on fruit.couleur_id = couleur.id;
```

```mysql
SELECT fruit.nom,couleur.nom
FROM fruit
INNER JOIN couleur on fruit.couleur_id = couleur.id;

SELECT f.nom,c.nom
FROM fruit AS f
INNER JOIN couleur AS c on f.couleur_id = c.id;
```

## le LEFT JOIN
![left](/img/08/left.png)  
https://www.w3schools.com/sql/sql_join_left.asp

```mysql
SELECT f.nom,c.nom
FROM fruit AS f
LEFT JOIN couleur AS c on f.couleur_id = c.id;
```

# le RIGHT JOIN 
![right](/img/08/right.png)  
https://www.w3schools.com/sql/sql_join_right.asp

```mysql
SELECT f.nom,c.nom
FROM fruit AS f
RIGHT JOIN couleur AS c on f.couleur_id = c.id;
```
