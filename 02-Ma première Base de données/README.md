# Ma première Base de données

## Dans PhpMyAdmin ouvrez le terminal SQL
- 1 cliquer sur l'onglet SQL  
- 2 Saisir le code SQL 
- 3 Cliquez sur GO  
![terminal](/img/02/terminal.webp)

## documentation bien utile !
https://www.w3schools.com/mysql/default.asp

## Création d'une base de données
Commande pour créer une base
```mysql
CREATE DATABASE ma_base;
```

Il est préférable de rajouter l'encodage **UTF8**:
```mysql
CREATE DATABASE videotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Je precise la base que j'utilise
```mysql
USE videotheque;
```

Il est possible d'éffacer sa base
**Attention toutes les tables et donnée seront éffacées !**
```mysql
DROP DATABASE ma_data_base
```
## Création de notre première table

Voici la commande pour créer une table :
```mysql
CREATE TABLE film(...);
```

Effacer une table :
**Attention toutes les données seront éffacées !**
```mysql
DROP TABLE film;
```

Il recommander Je peux preciser le **moteur de stockage** de ma table
InnoDB est un moteur de stockage : **storage engine**
Sinon par défault j'aurais **MylSAM** au lien de innoDB
Celà sera problématique pour les contraintes de clefs étrangère

```mysql
CREATE TABLE film (..) ENGINE=InnoDB; 
```


## Mise en place d'une clé primaire sur notre table
la clef primaire : **primary key ou PK**
Afin d'identifier une ligne de facon précise on définit une clef primaire  
La clef peut être définit par MySQL **AI AUTO_INCREMENT**
La contrainte de clef primaire impose d'avoir qu'un seul ID  
c'est à dire si je rentre le même ID MySQL me bloque
Car je viole la contrainte de clef primaire
Nous rajoutons la contrainte de nullité
Car notre id ne peut être null

```mysql
CREATE TABLE film (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY
);
```

## Les type de champs : Data types
https://www.w3schools.com/mysql/mysql_datatypes.asp

Les principaux types de champs:
| INT | les entiers | de -2 147 483 648 à 2 147 483 648 |
| TINYINT(1) | les entiers | de -128 à 127 |
| VARCHAR(255) |les chaînes de caractères| de 0 à 255 |
| TEXT | les chaînes de caractères | de 0 à 65 535 caractères |

date
datetime
timestamp
