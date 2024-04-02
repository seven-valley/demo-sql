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

- afficher le plus petit chiffre d'affaire (avec MIN)

- afficher le nom de la personne du plus petit CA

- afficher le nom de la personne du plus gros CA

- afficher le CA moyen

- afficher le nombre de client

- proposer une requete avec BETWEEN

- proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()

- proposer une requete avec LIKE '%..%'

- Trier par age les membres


# Correction parti 1
```mysql
INSERT INTO 
(prenom,nom,age,inscription,description,salaire)
VALUES 
('Brad','PITT',59,'1970-01-01','lorem ipsum',2000000);
```