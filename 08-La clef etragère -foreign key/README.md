# Table de jointure

![salade](/img/09/salade.png)

propmt db diagram :

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
  id INT PRIMARY KEY NOT NULL,
  nom VARCHAR(30) NOT NULL
);


-- ajout de la contrainte de clef etrangere foreign key
CREATE TABLE fruit (
  id INT PRIMARY KEY NOT NULL,
  nom VARCHAR(30) NOT NULL,
  couleur_id INT NOT NULL,
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



