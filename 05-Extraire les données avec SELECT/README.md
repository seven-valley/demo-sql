# 5 Extraire les données :heart_eyes:

La commande **SELECT** permet d'extraire tous les films
```mysql
SELECT * FROM film
```

Il préférable de cibler les champs :

```mysql
SELECT id,titre FROM film
```

je peux aussi créer des alias avec **as**
```mysql
SELECT 
id as numero,
titre as nom
FROM film
```

je peux aussi mettre une condition avec **WHERE**
```mysql
SELECT 
    id,titre,sortie
    FROM film
    WHERE id=1
```

je peux aussi limiter le nombre de résultats avec **LIMIT** 
```mysql
SELECT 
    id,titre,sortie
    FROM film
    LIMIT 2
```
