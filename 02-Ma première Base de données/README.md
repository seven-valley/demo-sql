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
```sql
CREATE DATABASE ma_base;
```

Il est préférable de rajouter l'encodage **UTF8**:
```sql
CREATE DATABASE ma_data_base CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```
Il est possible d'éffacer sa base
**Attention toutes les tables et donnée seront éffacer !**
```sql
DROP DATABASE ma_data_base
```
