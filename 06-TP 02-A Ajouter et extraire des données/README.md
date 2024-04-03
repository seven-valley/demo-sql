# TP 02 VIP Cocktail
## Ajouter et Afficher des personnes (sans les photos :grin:)


![brad](../img/03/brad.webp)
![george](../img/03/george.webp)
![jean](../img/03/jean.webp)


| prenom | nom | age | inscription | statut | type | description | salaire |
|----|---|---|---|---|---|---|---|
| Brad | PITT | 60 | 01/01/1970 | 1 | non membre | lorem ipsum | 2 000 000 |
| George | Cloney | 62 | 01/01/1999 | 1 | membre  | juste beau | 4 000 000 |
| Jean | DUJARDIN | 51 | 01/01/1994 | 0 | membre | brice de nice | 1 000 000 |

- afficher le plus gros chiffre d'affaire (avec MAX)
```mysql
SELECT MAX(salaire) as max_salaire from personne
``` 

- afficher le plus petit chiffre d'affaire (avec MIN)
```mysql
SELECT MIN(salaire) as max_salaire from personne;
``` 
- afficher le nom de la personne du plus petit CA
```mysql
SELECT 
salaire,prenom,nom
FROM personne
ORDER BY salaire ASC
LIMIT 1
``` 
- afficher le nom de la personne du plus gros CA
```mysql
SELECT 
salaire,prenom,nom
FROM personne
ORDER BY salaire DESC
LIMIT 1
``` 
- afficher le salaire moyen
```mysql
SELECT AVG(salaire) FROM personne
```

- afficher le nombre de personnes
```mysql
SELECT count(id) FROM personne
```

- proposer une requete avec BETWEEN
```mysql
SELECT prenom,nom,salaire 
FROM personne
WHERE salaire BETWEEN 1000000 AND 4000000
```
autre solutions :
```mysql
SELECT prenom,nom,salaire 
FROM personne
WHERE salaire >= 1000000 AND salaire <= 4000000
```
- proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
```mysql
Select UCASE(prenom) FROM personne
```

- proposer une requete avec LIKE '%..%'
```mysql
Select nom, prenom FROM personne
WHERE prenom LIKE 'b%'
```
- Trier par age les membres
```mysql
Select nom, prenom FROM personne
ORDER BY nom,prenom ASC
```

# Correction partie 1
```mysql
INSERT INTO personne
(prenom,nom,age,inscription,description,statut,type,salaire)
VALUES 
('Brad','PITT',59,'1970-01-01','lorem ipsum',1,'NON membre',2000000),
('George','Cloney',62,'1999-01-01','juste beau',1,'membre',4000000),
('Jean','DUJARDIN',51,'1994-01-01','brice de Nice',0,'membre',1000000);
```