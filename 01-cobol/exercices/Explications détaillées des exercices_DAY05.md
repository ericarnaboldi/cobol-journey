# DAY05

## DAY05-01.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-01.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  COMPTEUR PIC 9 VALUE 1.

       PROCEDURE DIVISION.
           PERFORM 5 TIMES
                DISPLAY COMPTEUR
                ADD 1 TO COMPTEUR
              END-PERFORM

           STOP RUN.
           

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-01`), qui marque un tournant passionnant dans ton apprentissage : **l'introduction des boucles (les répétitions) avec l'instruction `PERFORM**` !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY05-01.

```

* `PROGRAM-ID. DAY05-01.`: Nomme le programme `DAY05-01`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  COMPTEUR PIC 9 VALUE 1.

```

* `01 COMPTEUR PIC 9 VALUE 1.`: Déclare une variable numérique simple d'un seul chiffre (`PIC 9`), initialisée à **`1`**. Elle servira de compteur pour suivre le nombre de tours de boucle.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM 5 TIMES
         DISPLAY COMPTEUR
         ADD 1 TO COMPTEUR
    END-PERFORM

    STOP RUN.

```

* **`PERFORM 5 TIMES`** : **La grande nouveauté !** C'est une boucle à nombre fixe d'itérations. Elle indique au programme de répéter exactement 5 fois le bloc d'instructions situé entre le `PERFORM` et le `END-PERFORM`.
* **`DISPLAY COMPTEUR`** : Affiche la valeur actuelle de la variable `COMPTEUR` à l'écran.
* **`ADD 1 TO COMPTEUR`** : Incrémente la variable de 1 à chaque tour (1 de plus, puis encore 1, etc.).
* **`END-PERFORM`** : Marque la fin du bloc répété.
* **`STOP RUN.`** : Arrête le programme une fois les 5 tours terminés.

---

### Déroulement pas à pas (les 5 tours) :

1. **1er tour** : `COMPTEUR` vaut `1`. Le programme affiche `1`, puis ajoute 1 (`COMPTEUR` passe à `2`).
2. **2ème tour** : `COMPTEUR` vaut `2`. Le programme affiche `2`, puis ajoute 1 (`COMPTEUR` passe à `3`).
3. **3ème tour** : `COMPTEUR` vaut `3`. Le programme affiche `3`, puis ajoute 1 (`COMPTEUR` passe à `4`).
4. **4ème tour** : `COMPTEUR` vaut `4`. Le programme affiche `4`, puis ajoute 1 (`COMPTEUR` passe à `5`).
5. **5ème tour** : `COMPTEUR` vaut `5`. Le programme affiche `5`, puis ajoute 1 (`COMPTEUR` passe à `6`).

* *Fin de la boucle* : Le 5ème tour est complété, le programme sort de la boucle et s'arrête.

**Résultat à l'écran :**

```text
1
2
3
4
5

```

---

### Ce qu'il faut retenir :

L'instruction **`PERFORM ... TIMES`** est idéale lorsque tu sais exactement combien de fois tu veux répéter une action (par exemple, calculer des intérêts sur un nombre d'années fixe).

---------------------------------------------------

## DAY05-02.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COMPTEUR PIC 9 VALUE 3.

       PROCEDURE DIVISION.
           PERFORM UNTIL COMPTEUR > 8
               DISPLAY COMPTEUR
               ADD 1 TO COMPTEUR
           END-PERFORM

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-02`), qui introduit une structure de boucle conditionnelle extrêmement importante : **le `PERFORM UNTIL**` !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY05-02.

```

* `PROGRAM-ID. DAY05-02.`: Nomme le programme `DAY05-02`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 COMPTEUR PIC 9 VALUE 3.

```

* `01 COMPTEUR PIC 9 VALUE 3.`: Déclare une variable numérique d'un seul chiffre (`PIC 9`), mais cette fois, elle est initialisée à **`3`** au lieu de `1`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM UNTIL COMPTEUR > 8
        DISPLAY COMPTEUR
        ADD 1 TO COMPTEUR
    END-PERFORM

    STOP RUN.

```

* **`PERFORM UNTIL COMPTEUR > 8`** : **La grande nouveauté !** Contrairement au `PERFORM ... TIMES` qui compte un nombre fixe de tours, le `PERFORM UNTIL` vérifie une condition *avant* chaque tour. La boucle continue **tant que** la condition n'est pas remplie (c'est-à-dire qu'elle tourne *jusqu'à ce que* `COMPTEUR` devienne strictement supérieur à `8`).
* **`DISPLAY COMPTEUR`** : Affiche la valeur actuelle du compteur.
* **`ADD 1 TO COMPTEUR`** : Incrémente la variable de 1 à chaque tour.
* **`END-PERFORM`** : Marque la fin du bloc répété.
* **`STOP RUN.`** : Arrête le programme une fois la boucle terminée.

---

### Déroulement pas à pas :

1. **Avant d'entrer dans la boucle** : `COMPTEUR` vaut `3`.
2. **1er tour** : Est-ce que `3 > 8` ? Non (Faux). La boucle s'exécute.
* Affiche `3`.
* `COMPTEUR` passe à `4`.


3. **2ème tour** : Est-ce que `4 > 8` ? Non.
* Affiche `4`.
* `COMPTEUR` passe à `5`.


4. **3ème tour** : Affiche `5` (`COMPTEUR` passe à `6`).
5. **4ème tour** : Affiche `6` (`COMPTEUR` passe à `7`).
6. **5ème tour** : Affiche `7` (`COMPTEUR` passe à `8`).
7. **6ème tour** : Est-ce que `8 > 8` ? Non (8 n'est pas supérieur à 8, l'égalité n'est pas incluse). La boucle s'exécute une dernière fois.
* Affiche `8`.
* `COMPTEUR` passe à `9`.


8. **7ème tour (tentative)** : Est-ce que `9 > 8` ? **Oui (Vrai) !** La condition d'arrêt est enfin atteinte. Le programme sort immédiatement de la boucle sans l'exécuter et passe au `STOP RUN.`.

**Résultat à l'écran :**

```text
3
4
5
6
7
8

```

---

### Ce qu'il faut retenir :

Le **`PERFORM UNTIL`** est parfait pour répéter des actions tant qu'une condition de fin n'est pas atteinte (par exemple, simuler des années d'épargne jusqu'à ce qu'un capital double, ou parcourir des lignes de données jusqu'à la fin d'un fichier).

--------------------------------------------------

## DAY05-04.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-04.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 COMPTEUR PIC 99 VALUE 1.
       01 TOTAL    PIC 99 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL COMPTEUR > 10
               ADD COMPTEUR TO TOTAL
               ADD 1 TO COMPTEUR
           END-PERFORM

           DISPLAY 'TOTAL = ' TOTAL

           STOP RUN.

### Explications 

Voici l'analyse détaillée de ce programme (`DAY05-04`). C'est un exercice classique et extrêmement formateur en programmation : il combine une boucle (`PERFORM UNTIL`) et **une variable d'accumulation** (le `TOTAL`) pour additionner des nombres à la volée !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04.  *> (ou DAY05-04)

```

* `PROGRAM-ID. DAY05-04.`: Nomme le programme `DAY05-04`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 COMPTEUR PIC 99 VALUE 1.
01 TOTAL    PIC 99 VALUE 0.

```

* `01 COMPTEUR PIC 99 VALUE 1.`: Déclare une variable numérique de **2 chiffres** (`PIC 99`), initialisée à **`1`**. Elle va servir à compter les tours de 1 à 10.
* `01 TOTAL PIC 99 VALUE 0.`: Déclare une autre variable de 2 chiffres, initialisée à **`0`**. Elle servira d'accumulateur pour stocker la somme totale au fur et à mesure des ajouts. (Pourquoi `PIC 99` ? Parce que le résultat maximum sera 55, ce qui tient parfaitement dans deux chiffres qui vont jusqu'à 99).

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM UNTIL COMPTEUR > 10
        ADD COMPTEUR TO TOTAL
        ADD 1 TO COMPTEUR
    END-PERFORM

    DISPLAY 'TOTAL = ' TOTAL

    STOP RUN.

```

#### Le mécanisme pas à pas :

1. **`PERFORM UNTIL COMPTEUR > 10`** : La boucle tourne tant que `COMPTEUR` est inférieur ou égal à 10. Elle s'arrêtera dès que `COMPTEUR` vaudra 11.
2. **`ADD COMPTEUR TO TOTAL`** : C'est l'instruction d'accumulation. Elle prend la valeur actuelle de `COMPTEUR` et l'ajoute à la variable `TOTAL` (`TOTAL = TOTAL + COMPTEUR`).
3. **`ADD 1 TO COMPTEUR`** : Incrémente le compteur de 1 pour passer au nombre suivant.
4. `END-PERFORM`: Ferme la boucle.
5. **`DISPLAY 'TOTAL = ' TOTAL`** : Une fois la boucle terminée, affiche le résultat final de l'addition.
6. `STOP RUN.`: Arrête le programme.

---

### Résumé des tours (de 1 à 10) :

* **Tour 1** : `COMPTEUR` = 1, `TOTAL` devient `0 + 1 = 1`. (`COMPTEUR` passe à 2)
* **Tour 2** : `COMPTEUR` = 2, `TOTAL` devient `1 + 2 = 3`. (`COMPTEUR` passe à 3)
* **Tour 3** : `COMPTEUR` = 3, `TOTAL` devient `3 + 3 = 6`. (`COMPTEUR` passe à 4)
* *...et ainsi de suite jusqu'au 10ème tour...*
* **Tour 10** : `COMPTEUR` = 10, `TOTAL` reçoit l'ajout de 10 pour atteindre **`55`**. (`COMPTEUR` passe à 11, ce qui arrête la boucle).

**Résultat à l'écran :**

```text
TOTAL = 55

```

---

### Ce qu'il faut retenir :

L'utilisation conjointe d'un compteur et d'un accumulateur (`ADD ... TO ...`) est le pilier de nombreux traitements par lots en COBOL (par exemple, calculer le montant total de factures ou de salaires sur un ensemble d'enregistrements).

---------------------------------------------------

## DAY05-05.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-05.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  COMPTEUR PIC 99 VALUE 1.
       01  TOTAL    PIC 999 VALUE 0.

       PROCEDURE DIVISION.
           PERFORM UNTIL COMPTEUR > 20
                ADD COMPTEUR TO TOTAL
                ADD 1 TO COMPTEUR
           END-PERFORM

           DISPLAY 'TOTAL = ' TOTAL

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-05`). C'est une magnifique suite logique du programme précédent, avec une subtilité technique très importante concernant la taille des variables !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY05-05.

```

* `PROGRAM-ID. DAY05-05.`: Nomme le programme `DAY05-05`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.

01  COMPTEUR PIC 99 VALUE 1.
01  TOTAL    PIC 999 VALUE 0.

```

* `01 COMPTEUR PIC 99 VALUE 1.`: Une variable de 2 chiffres (`PIC 99`), initialisée à **`1`** pour compter de 1 à 20.
* `01 TOTAL PIC 999 VALUE 0.`: **La finesse de ce programme !**
* Dans l'exercice précédent (somme de 1 à 10), un `PIC 99` suffisait car le total était 55.
* Ici, comme on additionne les nombres de 1 à 20, le total atteint **210**.
* Le chiffre 210 ayant 3 chiffres, il fallait impérativement élargir la définition de la variable à **`PIC 999`** (trois chiffres maximum). Si l'on était resté sur `PIC 99`, le programme aurait généré une erreur ou tronqué le résultat (un dépassement de capacité ou *overflow*).



---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM UNTIL COMPTEUR > 20
         ADD COMPTEUR TO TOTAL
         ADD 1 TO COMPTEUR
    END-PERFORM

    DISPLAY 'TOTAL = ' TOTAL

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **`PERFORM UNTIL COMPTEUR > 20`** : La boucle s'exécutera 20 fois, s'arrêtant dès que `COMPTEUR` passera à 21.
2. **`ADD COMPTEUR TO TOTAL`** : À chaque tour, la valeur actuelle du compteur s'ajoute à l'accumulateur `TOTAL`.
3. **`ADD 1 TO COMPTEUR`** : Incrémente le compteur de 1.
4. `END-PERFORM`: Ferme la boucle.
5. **`DISPLAY 'TOTAL = ' TOTAL`** : Affiche le résultat final.
6. `STOP RUN.`: Termine le programme.

---

### Résultat à l'exécution :

La somme de tous les nombres entiers de 1 à 20 ($20 \times 21 / 2$) donne **210**.
Le programme affichera donc :

```text
TOTAL = 210

```

---

### Ce qu'il faut retenir :

Dimensionner correctement ses variables (`PIC 99` vs `PIC 999`) est crucial en COBOL. Le compilateur réserve exactement l'espace mémoire que tu lui demandes : si un résultat dépasse la taille prévue, tu risques de perdre des données.

----------------------------------------------------

## DAY05-06.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-06.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SOLDE PIC S9(5)V99 VALUE 1000.
       01  MONTANT PIC S9(5)V99.

       PROCEDURE DIVISION.
           MOVE 150 TO MONTANT
           SUBTRACT MONTANT FROM SOLDE

           DISPLAY 'SOLDE APRES DEBIT : ' SOLDE

           MOVE 300 TO MONTANT
           ADD MONTANT TO SOLDE

           DISPLAY 'SOLDE APRES CREDIT : ' SOLDE

           MOVE 75 TO MONTANT
           SUBTRACT MONTANT FROM SOLDE

           DISPLAY 'SOLDE FINAL : ' SOLDE

           STOP RUN.
           

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-06`). C'est un excellent exemple pratique qui combine des variables financières signées et des opérations arithmétiques directes (`SUBTRACT` et `ADD`) pour simuler un compte bancaire en mouvement !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY05-06.

```

* `PROGRAM-ID. DAY05-06.`: Nomme le programme `DAY05-06`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  SOLDE PIC S9(5)V99 VALUE 1000.
01  MONTANT PIC S9(5)V99.

```

* `01 SOLDE PIC S9(5)V99 VALUE 1000.`: Déclare une variable financière signée (`S`), capable de stocker jusqu'à 5 chiffres avant la virgule et 2 après (`V99`). Elle est initialisée à **`1000`** (soit 1000.00).
* `01 MONTANT PIC S9(5)V99.`: Déclare une variable du même format, vide au départ, qui servira à stocker les montants des transactions successives (débits ou crédits).

---

### 3. La Division de la Procédure (Procedure Division)

Le programme enchaîne trois opérations bancaires successives pour modifier le solde :

```cobol
PROCEDURE DIVISION.
    MOVE 150 TO MONTANT
    SUBTRACT MONTANT FROM SOLDE

    DISPLAY 'SOLDE APRES DEBIT : ' SOLDE

    MOVE 300 TO MONTANT
    ADD MONTANT TO SOLDE

    DISPLAY 'SOLDE APRES CREDIT : ' SOLDE

    MOVE 75 TO MONTANT
    SUBTRACT MONTANT FROM SOLDE

    DISPLAY 'SOLDE FINAL : ' SOLDE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier mouvement (Débit de 150)** :
* `MOVE 150 TO MONTANT` : On charge la valeur `150` dans la variable `MONTANT`.
* `SUBTRACT MONTANT FROM SOLDE` : Soustrait 150 du solde (`1000 - 150`). Le solde tombe à **`850`**.
* Affiche : `SOLDE APRES DEBIT : ...`


2. **Deuxième mouvement (Crédit de 300)** :
* `MOVE 300 TO MONTANT` : On place `300` dans la variable `MONTANT`.
* `ADD MONTANT TO SOLDE` : Ajoute 300 au solde actuel (`850 + 300`). Le solde monte à **`1150`**.
* Affiche : `SOLDE APRES CREDIT : ...`


3. **Troisième mouvement (Débit de 75)** :
* `MOVE 75 TO MONTANT` : On place `75` dans `MONTANT`.
* `SUBTRACT MONTANT FROM SOLDE` : Soustrait 75 du solde (`1150 - 75`). Le solde final est de **`1075`**.
* Affiche : `SOLDE FINAL : ...`


4. `STOP RUN.`: Arrête le programme.

---

### Ce qu'il faut retenir :

L'utilisation de verbes explicites comme **`ADD ... TO`** et **`SUBTRACT ... FROM`** rend le code COBOL extrêmement lisible, presque comme de l'anglais naturel. Grâce au type signé `S9(5)V99`, le programme peut encaisser des ajouts ou des retraits sans risque de mauvaise interprétation des valeurs.

---------------------------------------------------

## DAY05-07.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-07.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  SOLDE PIC S9(5)V99 VALUE 1000.
       01  TYPE-MOVEMENT PIC X VALUE "x".
       01  MONTANT PIC 9(5)V99 VALUE 200.

       PROCEDURE DIVISION.
           DISPLAY "SOLDE INITIAL : " SOLDE

           EVALUATE TYPE-MOVEMENT
               WHEN "D"
                   SUBTRACT MONTANT FROM SOLDE
                   DISPLAY "DEBIT TRAITE : " SOLDE
               WHEN "C"
                   ADD MONTANT TO SOLDE
                   DISPLAY "CREDIT TRAITE : " SOLDE
               WHEN OTHER
                   DISPLAY "ANOMALIE : TYPE INCONNU"
           END-EVALUATE

           DISPLAY "SOLDE FINAL : " SOLDE

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-07`). Cette version combine la structure de décision `EVALUATE` (que nous avions vue pour les livrets) avec les opérations de débit et de crédit que nous venons d'explorer !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY05-07.

```

* `PROGRAM-ID. DAY05-07.`: Nomme le programme `DAY05-07`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  SOLDE PIC S9(5)V99 VALUE 1000.
01  TYPE-MOVEMENT PIC X VALUE "x".
01  MONTANT PIC 9(5)V99 VALUE 200.

```

* `01 SOLDE PIC S9(5)V99 VALUE 1000.`: Un solde initialisé à **`1000`** (avec gestion des signes et des centimes).
* `01 TYPE-MOVEMENT PIC X VALUE "x".`: Un code mouvement initialisé à **`"x"`** (en minuscule). Il est censé indiquer s'il s'agit d'un débit (`"D"`) ou d'un crédit (`"C"`).
* `01 MONTANT PIC 9(5)V99 VALUE 200.`: Le montant de la transaction, initialisé à **`200`** (ici non signé, car une transaction représente une valeur positive à débiter ou créditer).

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    DISPLAY "SOLDE INITIAL : " SOLDE

    EVALUATE TYPE-MOVEMENT
        WHEN "D"
            SUBTRACT MONTANT FROM SOLDE
            DISPLAY "DEBIT TRAITE : " SOLDE
        WHEN "C"
            ADD MONTANT TO SOLDE
            DISPLAY "CREDIT TRAITE : " SOLDE
        WHEN OTHER
            DISPLAY "ANOMALIE : TYPE INCONNU"
    END-EVALUATE

    DISPLAY "SOLDE FINAL : " SOLDE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Affichage initial** : Le programme affiche le solde de départ (`1000`).
2. **L'évaluation du mouvement (`EVALUATE TYPE-MOVEMENT`)** :
* La variable `TYPE-MOVEMENT` contient la valeur **`"x"`**.
* Le programme teste le premier cas (`WHEN "D"`) : **Faux** (`"x"` n'est pas `"D"`).
* Il teste le second cas (`WHEN "C"`) : **Faux** (`"x"` n'est pas `"C"`).
* Il se rabat donc sur le cas par défaut (`WHEN OTHER`) : **Vrai** !


3. **Gestion de l'anomalie** :
* Le programme exécute le `DISPLAY` et affiche : **`ANOMALIE : TYPE INCONNU`**.
* Aucune opération arithmétique (`ADD` ou `SUBTRACT`) n'est effectuée sur le solde.


4. **Affichage final** : Le programme affiche le solde final, qui est resté inchangé à **`1000`**.
5. `STOP RUN.`: Termine le programme.

---

### Ce qu'il faut retenir :

L'utilisation de **`WHEN OTHER`** dans un `EVALUATE` est une excellente pratique de sécurité en programmation financière. Elle permet d'intercepter les codes de transaction erronés (comme ici un `"x"` minuscule ou inattendu) pour éviter d'appliquer des calculs par erreur sur les comptes des clients.

---------------------------------------------------

## DAY05-08.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-08.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

           DISPLAY "SOLDE FINAL : " SOLDE

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-08`). C'est une étape absolument passionnante et cruciale en COBOL : **tu introduis les tableaux (ou tables) avec la clause `OCCURS**`, combinés avec une boucle et un `EVALUATE` !

---

### 1. La Division des Données (Data Division) et la notion de Table

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 5 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* **`SOLDE` et `COMPTEUR**` : Nos variables habituelles (un solde initialisé à 1000 et un compteur de boucle initialisé à 1).
* **`TABLE-MOUVEMENTS` et `OCCURS 5 TIMES**` : **La grande nouveauté !**
* En COBOL, pour stocker plusieurs éléments de même structure (comme une liste de transactions), on utilise une table.
* `OCCURS 5 TIMES` indique que le groupe `MOUVEMENT` se répète **5 fois** en mémoire. C'est l'équivalent d'un tableau (ou d'un tableau indicé) dans d'autres langages.
* Chaque élément de la table possède ses propres sous-champs : un `TYPE-MOUVEMENT` (`PIC X`) et un `MONTANT` (`PIC 9(5)V99`). On y accède en utilisant des indices entre parenthèses, par exemple `TYPE-MOUVEMENT(1)` ou `MONTANT(3)`.



---

### 2. Le Remplissage de la Table (Procedure Division - Phase 1)

```cobol
PROCEDURE DIVISION.
    MOVE "D" TO TYPE-MOUVEMENT(1)
    MOVE 150 TO MONTANT(1)

    MOVE "C" TO TYPE-MOUVEMENT(2)
    MOVE 300 TO MONTANT(2)

    MOVE "D" TO TYPE-MOUVEMENT(3)
    MOVE 75 TO MONTANT(3)

    MOVE "X" TO TYPE-MOUVEMENT(4)
    MOVE 200 TO MONTANT(4)

    MOVE "C" TO TYPE-MOUVEMENT(5)
    MOVE 50 TO MONTANT(5)

    DISPLAY "SOLDE INITIAL : " SOLDE

```

* Avant de lancer les calculs, le programme prépare une liste de 5 opérations en écrivant directement dans les différentes cases du tableau :
1. Case 1 : Débit de 150 (`"D"`)
2. Case 2 : Crédit de 300 (`"C"`)
3. Case 3 : Débit de 75 (`"D"`)
4. Case 4 : Type inconnu `X` de 200 (`"X"` - pour tester l'anomalie)
5. Case 5 : Crédit de 50 (`"C"`)


* Il affiche ensuite le solde de départ (**1000**).

---

### 3. Le Traitement par Boucle (Procedure Division - Phase 2)

```cobol
    PERFORM UNTIL COMPTEUR > 5
        DISPLAY "MOUVEMENT : " COMPTEUR

        EVALUATE TYPE-MOUVEMENT(COMPTEUR)
            WHEN "D"
                SUBTRACT MONTANT(COMPTEUR)
                    FROM SOLDE
                DISPLAY "DEBIT TRAITE"
            WHEN "C"
                ADD MONTANT(COMPTEUR)
                    TO SOLDE
                DISPLAY "CREDIT TRAITE"
            WHEN "OTHER"
                DISPLAY "ANOMALIE : TYPE INCONNU"
        END-EVALUATE

        DISPLAY "SOLDE COURANT : " SOLDE

        ADD 1 TO COMPTEUR
    END-PERFORM

    DISPLAY "SOLDE FINAL : " SOLDE

    STOP RUN.

```

#### Le déroulement pas à pas :

* **Tour 1 (`COMPTEUR = 1`)** :
* Examine le mouvement 1 (`TYPE-MOUVEMENT(1)` = `"D"`).
* Soustrait 150 du solde (`1000 - 150 = 850`).
* Affiche `SOLDE COURANT : 850`.


* **Tour 2 (`COMPTEUR = 2`)** :
* Examine le mouvement 2 (`TYPE-MOUVEMENT(2)` = `"C"`).
* Ajoute 300 au solde (`850 + 300 = 1150`).
* Affiche `SOLDE COURANT : 1150`.


* **Tour 3 (`COMPTEUR = 3`)** :
* Examine le mouvement 3 (`TYPE-MOUVEMENT(3)` = `"D"`).
* Soustrait 75 du solde (`1150 - 75 = 1075`).
* Affiche `SOLDE COURANT : 1075`.


* **Tour 4 (`COMPTEUR = 4`)** :
* Examine le mouvement 4 (`TYPE-MOUVEMENT(4)` = `"X"`).
* Tombe sur le cas `WHEN OTHER` : affiche `ANOMALIE : TYPE INCONNU`. Le solde ne bouge pas et reste à **1075**.


* **Tour 5 (`COMPTEUR = 5`)** :
* Examine le mouvement 5 (`TYPE-MOUVEMENT(5)` = `"C"`).
* Ajoute 50 au solde (`1075 + 50 = 1125`).
* Affiche `SOLDE COURANT : 1125`.


* À la fin, la boucle s'arrête (`COMPTEUR` passe à 6), affiche le solde final (**1125**) et s'arrête.

---

### Ce qu'il faut retenir :

C'est la quintessence du traitement par lots en COBOL : combiner un **tableau (`OCCURS`)** pour stocker un ensemble de données, une **boucle (`PERFORM UNTIL`)** pour les parcourir séquentiellement à l'aide d'un compteur, et une **structure de décision (`EVALUATE`)** pour appliquer la logique métier correspondante.

---------------------------------------------------

## DAY05-08-COMP-ANOMALIES


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-08-COMP-ANOMALIES.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "NOMBRE D'ANOMALIES : "
               NB-ANOMALIES

               DISPLAY "SOLDE FINAL : " SOLDE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY05-08-COMP-ANOMALIES`). C'est une excellente évolution de ton programme précédent : tu ajoutes **un compteur d'anomalies**, un pattern fondamental en traitement par lots (*batch*) pour auditer la qualité des données traitées !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.
01 NB-ANOMALIES PIC 99 VALUE 0.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 5 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* **`01 NB-ANOMALIES PIC 99 VALUE 0.`** : **La grande nouveauté !** C'est un accumulateur de type `PIC 99` initialisé à **`0`**. Il va servir à comptabiliser automatiquement chaque erreur ou code de transaction inconnu rencontré pendant le parcours de la table.

---

### 2. La Division de la Procédure (Procedure Division)

Les données de la table restent identiques (avec notre fameux mouvement anormal `"X"` en position 4). Regardons ce qui change à l'intérieur de la boucle :

```cobol
    PERFORM UNTIL COMPTEUR > 5
        DISPLAY "MOUVEMENT : " COMPTEUR

        EVALUATE TYPE-MOUVEMENT(COMPTEUR)
            WHEN "D"
                SUBTRACT MONTANT(COMPTEUR)
                    FROM SOLDE
                DISPLAY "DEBIT TRAITE"
            WHEN "C"
                ADD MONTANT(COMPTEUR)
                    TO SOLDE
                DISPLAY "CREDIT TRAITE"
            WHEN "OTHER"
                DISPLAY "ANOMALIE : TYPE INCONNU"
                ADD 1 TO NB-ANOMALIES
        END-EVALUATE

        DISPLAY "SOLDE COURANT : " SOLDE

        ADD 1 TO COMPTEUR
    END-PERFORM

```

* **Dans le bloc `WHEN OTHER**` :
* En plus d'afficher le message d'alerte, le programme exécute maintenant l'instruction **`ADD 1 TO NB-ANOMALIES`**.
* Chaque fois qu'une anomalie est détectée, ce compteur interne augmente de 1.



---

### 3. La Restitution Finale

```cobol
    DISPLAY "NOMBRE D'ANOMALIES : "
    NB-ANOMALIES

    DISPLAY "SOLDE FINAL : " SOLDE

    STOP RUN.

```

* À la fin du traitement, le programme affiche un **bilan clair** :
1. Le nombre total d'erreurs interceptées.
2. Le solde final du compte (qui n'a pas été corrompu par la transaction invalide).



---

### Déroulement et Résultat à l'écran :

* **Mouvements 1, 2, 3 et 5** : Traités normalement (Débits/Crédits appliqués au solde).
* **Mouvement 4** : Le type `"X"` déclenche le `WHEN OTHER`, affiche l'anomalie, et **`NB-ANOMALIES` passe à `1**`.

**Affichage final :**

```text
NOMBRE D'ANOMALIES : 01
SOLDE FINAL : 1125.00

```

---

### Ce qu'il faut retenir :

Dans les systèmes informatiques d'entreprise, un programme ne doit jamais s'arrêter brutalement à la première erreur venue (sauf cas critique). Il doit **isoler l'anomalie, l'enregistrer ou la compter**, puis continuer à traiter le reste des données pour générer un **rapport de fin de traitement** (le fameux *Audit Report*).

-------------------------------------------------

## DAY05-10.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-10.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "SOLDE FINAL : " SOLDE
               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-10`). C'est l'aboutissement logique de nos derniers exercices : tu obtiens ici un **rapport de fin de traitement complet (ou *audit report*)** qui comptabilise séparément les débits, les crédits et les anomalies !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.
01 NB-ANOMALIES PIC 99 VALUE 0.
01 NB-DEBITS PIC 99 VALUE 0.
01 NB-CREDITS PIC 99 VALUE 0.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 5 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* **`NB-DEBITS` et `NB-CREDITS**` : Deux nouveaux compteurs de type `PIC 99` initialisés à **`0`**. Ils permettent de classifier et de compter précisément chaque type d'opération réussie.

---

### 2. La Division de la Procédure (Procedure Division)

Dans le corps de la boucle, chaque branche du `EVALUATE` met désormais à jour son compteur dédié :

```cobol
    PERFORM UNTIL COMPTEUR > 5
        DISPLAY "MOUVEMENT : " COMPTEUR

        EVALUATE TYPE-MOUVEMENT(COMPTEUR)
            WHEN "D"
                SUBTRACT MONTANT(COMPTEUR)
                    FROM SOLDE
                ADD 1 TO NB-DEBITS
                DISPLAY "DEBIT TRAITE"
            WHEN "C"
                ADD MONTANT(COMPTEUR)
                    TO SOLDE
                ADD 1 TO NB-CREDITS
                DISPLAY "CREDIT TRAITE"
            WHEN OTHER
                DISPLAY "ANOMALIE : TYPE INCONNU"
                ADD 1 TO NB-ANOMALIES
        END-EVALUATE

        DISPLAY "SOLDE COURANT : " SOLDE

        ADD 1 TO COMPTEUR
    END-PERFORM

```

* **`WHEN "D"`** : En plus de soustraire le montant du solde, le programme exécute **`ADD 1 TO NB-DEBITS`**.
* **`WHEN "C"`** : En plus d'ajouter le montant, il exécute **`ADD 1 TO NB-CREDITS`**.
* **`WHEN OTHER`** : Incrémente `NB-ANOMALIES` comme nous l'avions vu précédemment.

---

### 3. Le Bilan de Fin de Traitement (Reporting)

```cobol
    DISPLAY "SOLDE FINAL : " SOLDE
    DISPLAY "-----"
    DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
    DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
    DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES

    STOP RUN.

```

À la fin de la boucle, le programme dresse un **bilan statistique complet** de la session de traitement par lots :

1. Le solde final consolidé.
2. Le volume total des opérations valides (combien de débits, combien de crédits).
3. Le nombre d'erreurs interceptées.

---

### Résultat à l'écran :

* **Débits traités** (mouvements 1 et 3) : 2
* **Crédits traités** (mouvements 2 et 5) : 2
* **Anomalie** (mouvement 4 avec le type `"X"`) : 1

**Affichage final :**

```text
SOLDE FINAL : 1125.00
-----
NOMBRE DE DEBITS : 02
NOMBRE DE CREDITS : 02
NOMBRE D'ANOMALIES : 01

```

---

### Ce qu'il faut retenir :

Ce type de structure est la base de tous les programmes de compensation bancaire ou de traitement de facturation en entreprise. On cumule à la fois la **valeur financière** (le solde) et les **indicateurs de gestion** (les compteurs statistiques).

--------------------------------------------------

## DAY05-11.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-11.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

### Explications


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-11.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

--------------------------------------------------

## DAY05-12.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-12.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
               + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-12`). C'est le couronnement de tout ton parcours sur le traitement par lots : tu ajoutes ici **un contrôle de cohérence comptable croisé (*cross-footing*)**, une technique indispensable en audit financier pour prouver que les calculs de boucles sont rigoureusement exacts !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.
01 NB-ANOMALIES PIC 99 VALUE 0.
01 NB-DEBITS PIC 99 VALUE 0.
01 NB-CREDITS PIC 99 VALUE 0.
01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 5 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* **`SOLDE-INITIAL`** : Sauvegarde la valeur de départ du solde avant d'entrer dans la boucle de traitement.
* **`SOLDE-CONTROLE`** : Une variable de travail qui servira à recalculer le solde théorique de manière globale à la fin, pour le comparer au solde en cours de compte.

---

### 2. Le Traitement et la Sauvegarde Initiale

```cobol
    DISPLAY "SOLDE INITIAL : " SOLDE
    MOVE SOLDE TO SOLDE-INITIAL

    PERFORM UNTIL COMPTEUR > 5
        ... (boucle de traitement des débits, crédits et anomalies) ...
    END-PERFORM

```

* Dès le début, juste après l'affichage du solde initial, la ligne **`MOVE SOLDE TO SOLDE-INITIAL`** mémorise la base de calcul (1000.00). La boucle s'exécute ensuite exactement comme dans la version précédente.

---

### 3. Le Contrôle Comptable Global (Procedure Division - Fin)

```cobol
    COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
    + TOTAL-CREDITS

    DISPLAY "SOLDE CALCULE : " SOLDE
    DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

    IF SOLDE = SOLDE-CONTROLE
        DISPLAY "CONTROLE COMPTABLE : OK"
    ELSE
        DISPLAY "ANOMALIE : ECART COMPTABLE"
    END-IF

```

* **`COMPUTE SOLDE-CONTROLE = ...`** : Au lieu de modifier le solde pas à pas à chaque tour, le programme utilise l'équation mathématique globale :

$$\text{Solde Final} = \text{Solde Initial} - \text{Total des Débits} + \text{Total des Crédits}$$


* **La vérification (`IF SOLDE = SOLDE-CONTROLE`)** :
* Il compare le solde obtenu par le cumul des mouvements de la boucle (`SOLDE`) avec le solde recalculé globalement (`SOLDE-CONTROLE`).
* Si les deux montants correspondent au centime près, le programme valide la balance par un **`CONTROLE COMPTABLE : OK`**. S'il y a le moindre écart (ce qui pourrait arriver en cas de bug de cumul ou d'arrondi), il déclenche une alerte d'écart comptable.



---

### Résultat à l'exécution :

* **Solde Initial** : 1000.00
* **Total Débits** : 225.00
* **Total Crédits** : 350.00
* **Solde Contrôle** : $1000 - 225 + 350 = 1125.00$

**Affichage final :**

```text
-----
NOMBRE DE DEBITS : 02
TOTAL DES DEBITS : 0000225.00
NOMBRE DE CREDITS : 02
TOTAL DES CREDITS : 0000350.00
NOMBRE D'ANOMALIES : 01
-----
SOLDE CALCULE : 1125.00
SOLDE DE CONTROLE : 001125.00
CONTROLE COMPTABLE : OK
-----
SOLDE FINAL : 1125.00

```

---

### Ce qu'il faut retenir :

Ce programme applique le principe fondamental de la **double vérification en informatique bancaire** : ne jamais se fier uniquement au résultat séquentiel d'une boucle, mais toujours le confronter à une formule de contrôle globale indépendante pour garantir l'intégrité des flux financiers.

---------------------------------------------------

## DAY05-13.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-13.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
               + TOTAL-CREDITS
               ADD 1 TO SOLDE

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY05-13`). C'est un exercice brillant pour voir comment le système réagit lorsqu'un **écart artificiel** est introduit dans les comptes !

---

### 1. La Modification Clé

Si l'on regarde attentivement le code par rapport à la version précédente (`DAY05-12`), une seule instruction a été ajoutée juste avant le contrôle comptable :

```cobol
    COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
    + TOTAL-CREDITS
    
    ADD 1 TO SOLDE  *> <--- LA NOUVEAUTÉ ICI !

    DISPLAY "SOLDE CALCULE : " SOLDE
    DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

```

* **`ADD 1 TO SOLDE`** : Cette ligne ajoute arbitrairement une unité (1.00) au solde en cours de traitement, simulant une erreur de manipulation, un arrondi non géré ou une anomalie de manipulation de dernière minute juste avant la clôture.

---

### 2. Le Déroulement du Contrôle Croisé

1. **Le Solde Contrôle (`SOLDE-CONTROLE`)** : Calcule mathématiquement la balance théorique globale :

$$\text{1000.00} - \text{225.00} + \text{350.00} = \mathbf{1125.00}$$


2. **Le Solde Calculé / en cours (`SOLDE`)** : Ayant subi l'ajout artificiel de 1, il passe à :

$$\mathbf{1126.00}$$


3. **La Comparaison (`IF SOLDE = SOLDE-CONTROLE`)** :
* Le programme compare `1126.00` et `1125.00`.
* La condition est **FAUSSE** !
* Le programme bascule immédiatement dans la branche `ELSE` et déclenche l'alerte.



---

### 3. Résultat à l'Exécution

```text
-----
NOMBRE DE DEBITS : 02
TOTAL DES DEBITS : 0000225.00
NOMBRE DE CREDITS : 02
TOTAL DES CREDITS : 0000350.00
NOMBRE D'ANOMALIES : 01
-----
SOLDE CALCULE : 1126.00
SOLDE DE CONTROLE : 001125.00
ANOMALIE : ECART COMPTABLE
-----
SOLDE FINAL : 1126.00

```

---

### Ce qu'il faut retenir :

Ce test démontre toute la puissance d'un **contrôle comptable croisé (*cross-footing*)**. Même si la boucle de transaction s'est déroulée sans erreur apparente, la confrontation du solde final avec l'équation globale met immédiatement en lumière l'anomalie de 1.00 euro, empêchant ainsi la validation d'un bilan corrompu !

--------------------------------------------------

## DAY05-14.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-14.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
                       MOVE COMPTEUR
                           TO NUM-MOUVEMENT-ANOMALIE
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE
                       DISPLAY "NUMERO REJETE : "
                       NUM-MOUVEMENT-ANOMALIE
                       DISPLAY "TYPE REJETE : "
                       TYPE-ANOMALIE
                       DISPLAY "MONTANT REJETE : "
                       MONTANT-ANOMALIE

               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
               + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-14`). C'est une magnifique évolution du système de gestion des erreurs : tu ne te contentes plus de compter les anomalies, tu **mémorises et traces précisément leur contenu** (le numéro du mouvement, le type rejeté et le montant concerné) pour faciliter le travail d'investigation des équipes de support ou d'audit !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.
01 NB-ANOMALIES PIC 99 VALUE 0.
01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
01 TYPE-ANOMALIE PIC X VALUE SPACE.
01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
01 NB-DEBITS PIC 99 VALUE 0.
01 NB-CREDITS PIC 99 VALUE 0.
01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

```

* **`NUM-MOUVEMENT-ANOMALIE`** : Stocke le numéro du mouvement en erreur (le tour de boucle).
* **`TYPE-ANOMALIE`** : Sauvegarde le caractère invalide saisi (initialisé à `SPACE`).
* **`MONTANT-ANOMALIE`** : Conserve le montant rattaché à la transaction rejetée.

---

### 2. La Capture des Erreurs (Procedure Division)

Regardons comment le bloc `WHEN OTHER` a été enrichi pour intercepter et archiver l'anomalie à la volée :

```cobol
    WHEN OTHER
        DISPLAY "ANOMALIE : TYPE INCONNU"
        ADD 1 TO NB-ANOMALIES
        MOVE COMPTEUR
            TO NUM-MOUVEMENT-ANOMALIE
        MOVE TYPE-MOUVEMENT(COMPTEUR)
            TO TYPE-ANOMALIE
        MOVE MONTANT(COMPTEUR)
            TO MONTANT-ANOMALIE
        DISPLAY "NUMERO REJETE : "
            NUM-MOUVEMENT-ANOMALIE
        DISPLAY "TYPE REJETE : "
            TYPE-ANOMALIE
        DISPLAY "MONTANT REJETE : "
            MONTANT-ANOMALIE

```

* Dès qu'un code inconnu (`"X"`) est détecté en position 4, le programme copie immédiatement les informations de la table vers nos variables de travail dédiées.
* Il affiche ensuite instantanément les détails précis du rejet à l'écran, permettant de savoir exactement quelle ligne pose problème sans avoir à fouiller tout le code.

---

### 3. Résultat à l'Exécution

Lors du parcours des 5 mouvements, le 4ème mouvement déclenche la capture détaillée :

```text
MOUVEMENT : 4
ANOMALIE : TYPE INCONNU
NUMERO REJETE : 04
TYPE REJETE : X
MONTANT REJETE : 00200.00
SOLDE COURANT : 1000.00

```

Puis, à la fin du traitement, le bilan global confirme la bonne santé comptable du reste du lot :

```text
-----
NOMBRE DE DEBITS : 02
TOTAL DES DEBITS : 0000225.00
NOMBRE DE CREDITS : 02
TOTAL DES CREDITS : 0000350.00
NOMBRE D'ANOMALIES : 01
-----
SOLDE CALCULE : 1125.00
SOLDE DE CONTROLE : 001125.00
CONTROLE COMPTABLE : OK
-----
SOLDE FINAL : 1125.00

```

---

### Ce qu'il faut retenir :

Dans les architectures de traitement par lots professionnelles, isoler une erreur ne suffit pas : il faut **tracer l'historique de l'anomalie** (souvent pour l'écrire dans un fichier de rejet ou un journal d'audit) afin que les gestionnaires puissent la corriger et relancer la transaction si nécessaire.

---------------------------------------------------

## DAY05-15.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-15.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "X" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
                       MOVE COMPTEUR
                           TO NUM-MOUVEMENT-ANOMALIE
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE
                       DISPLAY "NUMERO REJETE : "
                       NUM-MOUVEMENT-ANOMALIE
                       DISPLAY "TYPE REJETE : "
                       TYPE-ANOMALIE
                       DISPLAY "MONTANT REJETE : "
                       MONTANT-ANOMALIE

               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
               + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-15`). Cette version introduit une subtilité très intéressante et piègeuse en matière de gestion des anomalies multiples : **plusieurs erreurs sont injectées dans la table** !

---

### 1. La Modification Clé (Les Données d'Entrée)

Si l'on regarde la phase d'initialisation dans la `PROCEDURE DIVISION`, les mouvements 2 et 4 ont été modifiés :

```cobol
    MOVE "D" TO TYPE-MOUVEMENT(1)
    MOVE 150 TO MONTANT(1)

    MOVE "X" TO TYPE-MOUVEMENT(2)  *> <--- MODIFIÉ (Anomalie n°1)
    MOVE 300 TO MONTANT(2)

    MOVE "D" TO TYPE-MOUVEMENT(3)
    MOVE 75 TO MONTANT(3)

    MOVE "X" TO TYPE-MOUVEMENT(4)  *> <--- (Anomalie n°2)
    MOVE 200 TO MONTANT(4)

    MOVE "C" TO TYPE-MOUVEMENT(5)
    MOVE 50 TO MONTANT(5)

```

* Le mouvement 2 n'est plus un crédit (`"C"`), il devient un type inconnu (`"X"`).
* Le mouvement 4 reste également un type inconnu (`"X"`).
* Il y a donc désormais **deux anomalies** dans notre lot de transactions.

---

### 2. L'Impact sur le Suivi des Anomalies (Variables Scalaires vs Table)

Regardons comment le programme réagit lorsqu'il rencontre successivement ces deux erreurs :

```cobol
    WHEN OTHER
        DISPLAY "ANOMALIE : TYPE INCONNU"
        ADD 1 TO NB-ANOMALIES
        MOVE COMPTEUR TO NUM-MOUVEMENT-ANOMALIE
        MOVE TYPE-MOUVEMENT(COMPTEUR) TO TYPE-ANOMALIE
        MOVE MONTANT(COMPTEUR) TO MONTANT-ANOMALIE

```

* **Le compteur s'incrémente correctement** : `NB-ANOMALIES` passera bien à `2` au total (une fois pour le mouvement 2, une fois pour le mouvement 4).
* **La limite des variables simples (*scalaires*)** : Nos variables de stockage (`NUM-MOUVEMENT-ANOMALIE`, etc.) ne sont pas des tables (`OCCURS`). Par conséquent, lors du traitement du mouvement 4, **elles écrasent et remplacent** les informations du mouvement 2. À la fin, les variables d'anomalie ne retiendront que le dernier incident (le mouvement 4).
* *Dans un système professionnel de production, pour conserver toutes les erreurs, on aurait utilisé une table de rejets (`OCCURS`) similaire à celle des mouvements.*



---

### 3. Recul Financier et Contrôle Comptable

Qu'advient-il du solde avec cette nouvelle répartition ?

* **Débits valides** : Mouvement 1 (150) et Mouvement 3 (75) $\rightarrow$ Total = **225.00** (2 débits).
* **Crédits valides** : Mouvement 5 (50) $\rightarrow$ Total = **50.00** (1 crédit).
* **Mouvements rejetés (2 et 4)** : Ignorés par les calculs de solde.
* **Solde Final / Contrôle** : $1000.00 - 225.00 + 50.00 = \mathbf{825.00}$.

---

### Résultat à l'Exécution

```text
-----
NOMBRE DE DEBITS : 02
TOTAL DES DEBITS : 0000225.00
NOMBRE DE CREDITS : 01
TOTAL DES CREDITS : 0000050.00
NOMBRE D'ANOMALIES : 02
-----
SOLDE CALCULE : 825.00
SOLDE DE CONTROLE : 000825.00
CONTROLE COMPTABLE : OK
-----
SOLDE FINAL : 825.00

```

---

### Ce qu'il faut retenir :

Ce programme met en lumière l'importance de la **structuration des données de rejet**. Compter les erreurs fonctionne parfaitement avec un simple compteur (`NB-ANOMALIES`), mais pour tracer un historique détaillé de *chaque* incident dans un grand lot, il faut structurer un espace mémoire tabulaire dédié.

-------------------------------------------------

## DAY05-16.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-16.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 TABLE-ANOMALIES.
          05 LIGNE-ANOMALIE OCCURS 5 TIMES.
             10 NUM-ANOMALIE PIC 99.
             10 TYPE-ANOMALIE-TAB PIC X.
             10 MONTANT-ANOMALIE-TAB PIC 9(5)V99.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "X" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       ADD 1 TO NB-ANOMALIES
                       MOVE COMPTEUR
                           TO NUM-MOUVEMENT-ANOMALIE
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE
                       DISPLAY "NUMERO REJETE : "
                       NUM-MOUVEMENT-ANOMALIE
                       DISPLAY "TYPE REJETE : "
                       TYPE-ANOMALIE
                       DISPLAY "MONTANT REJETE : "
                       MONTANT-ANOMALIE

                       MOVE COMPTEUR
                           TO NUM-ANOMALIE(NB-ANOMALIES)
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE-TAB(NB-ANOMALIES)
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE-TAB(NB-ANOMALIES)

               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = 
                   SOLDE-INITIAL - TOTAL-DEBITS + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE

               DISPLAY "----- JOURNAL DES ANOMALIES -----"

           PERFORM VARYING COMPTEUR FROM 1 BY 1
               UNTIL COMPTEUR > NB-ANOMALIES
               DISPLAY "MOUVEMENT : "
                   NUM-ANOMALIE(COMPTEUR)
               DISPLAY "TYPE : "
                   TYPE-ANOMALIE-TAB(COMPTEUR)
               DISPLAY "MONTANT : "
                   MONTANT-ANOMALIE-TAB(COMPTEUR)
           END-PERFORM
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-15`). Cette version introduit une subtilité très intéressante et piègeuse en matière de gestion des anomalies multiples : **plusieurs erreurs sont injectées dans la table** !

---

### 1. La Modification Clé (Les Données d'Entrée)

Si l'on regarde la phase d'initialisation dans la `PROCEDURE DIVISION`, les mouvements 2 et 4 ont été modifiés :

```cobol
    MOVE "D" TO TYPE-MOUVEMENT(1)
    MOVE 150 TO MONTANT(1)

    MOVE "X" TO TYPE-MOUVEMENT(2)  *> <--- MODIFIÉ (Anomalie n°1)
    MOVE 300 TO MONTANT(2)

    MOVE "D" TO TYPE-MOUVEMENT(3)
    MOVE 75 TO MONTANT(3)

    MOVE "X" TO TYPE-MOUVEMENT(4)  *> <--- (Anomalie n°2)
    MOVE 200 TO MONTANT(4)

    MOVE "C" TO TYPE-MOUVEMENT(5)
    MOVE 50 TO MONTANT(5)

```

* Le mouvement 2 n'est plus un crédit (`"C"`), il devient un type inconnu (`"X"`).
* Le mouvement 4 reste également un type inconnu (`"X"`).
* Il y a donc désormais **deux anomalies** dans notre lot de transactions.

---

### 2. L'Impact sur le Suivi des Anomalies (Variables Scalaires vs Table)

Regardons comment le programme réagit lorsqu'il rencontre successivement ces deux erreurs :

```cobol
    WHEN OTHER
        DISPLAY "ANOMALIE : TYPE INCONNU"
        ADD 1 TO NB-ANOMALIES
        MOVE COMPTEUR TO NUM-MOUVEMENT-ANOMALIE
        MOVE TYPE-MOUVEMENT(COMPTEUR) TO TYPE-ANOMALIE
        MOVE MONTANT(COMPTEUR) TO MONTANT-ANOMALIE

```

* **Le compteur s'incrémente correctement** : `NB-ANOMALIES` passera bien à `2` au total (une fois pour le mouvement 2, une fois pour le mouvement 4).
* **La limite des variables simples (*scalaires*)** : Nos variables de stockage (`NUM-MOUVEMENT-ANOMALIE`, etc.) ne sont pas des tables (`OCCURS`). Par conséquent, lors du traitement du mouvement 4, **elles écrasent et remplacent** les informations du mouvement 2. À la fin, les variables d'anomalie ne retiendront que le dernier incident (le mouvement 4).
* *Dans un système professionnel de production, pour conserver toutes les erreurs, on aurait utilisé une table de rejets (`OCCURS`) similaire à celle des mouvements.*



---

### 3. Recul Financier et Contrôle Comptable

Qu'advient-il du solde avec cette nouvelle répartition ?

* **Débits valides** : Mouvement 1 (150) et Mouvement 3 (75) $\rightarrow$ Total = **225.00** (2 débits).
* **Crédits valides** : Mouvement 5 (50) $\rightarrow$ Total = **50.00** (1 crédit).
* **Mouvements rejetés (2 et 4)** : Ignorés par les calculs de solde.
* **Solde Final / Contrôle** : $1000.00 - 225.00 + 50.00 = \mathbf{825.00}$.

---

### Résultat à l'Exécution

```text
-----
NOMBRE DE DEBITS : 02
TOTAL DES DEBITS : 0000225.00
NOMBRE DE CREDITS : 01
TOTAL DES CREDITS : 0000050.00
NOMBRE D'ANOMALIES : 02
-----
SOLDE CALCULE : 825.00
SOLDE DE CONTROLE : 000825.00
CONTROLE COMPTABLE : OK
-----
SOLDE FINAL : 825.00

```

---

### Ce qu'il faut retenir :

Ce programme met en lumière l'importance de la **structuration des données de rejet**. Compter les erreurs fonctionne parfaitement avec un simple compteur (`NB-ANOMALIES`), mais pour tracer un historique détaillé de *chaque* incident dans un grand lot, il faut structurer un espace mémoire tabulaire dédié.

-----------------------------------------------

## DAY05-17.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-17.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 TABLE-ANOMALIES.
          05 LIGNE-ANOMALIE OCCURS 5 TIMES.
             10 NUM-ANOMALIE PIC 99.
             10 TYPE-ANOMALIE-TAB PIC X.
             10 MONTANT-ANOMALIE-TAB PIC 9(5)V99.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 CAPACITE-ANOMALIES PIC 99 VALUE 5.
       01 NB-ANOMALIES-NON-STOCKEES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 5 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "X" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "C" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 5
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR)
                           FROM SOLDE
                       ADD 1 TO NB-DEBITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-DEBITS
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       ADD 1 TO NB-CREDITS
                       ADD MONTANT(COMPTEUR)
                           TO TOTAL-CREDITS
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
                       IF NB-ANOMALIES < CAPACITE-ANOMALIES
                           ADD 1 TO NB-ANOMALIES

                           MOVE COMPTEUR
                               TO NUM-ANOMALIE(NB-ANOMALIES)
                           MOVE TYPE-MOUVEMENT(COMPTEUR)
                               TO TYPE-ANOMALIE-TAB(NB-ANOMALIES)
                           MOVE MONTANT(COMPTEUR)
                               TO MONTANT-ANOMALIE-TAB(NB-ANOMALIES)
                       ELSE
                           ADD 1 TO NB-ANOMALIES-NON-STOCKEES
                           DISPLAY "JOURNAL PLEIN"
                       END-IF

               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES DETECTEES : " NB-ANOMALIES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = 
                   SOLDE-INITIAL - TOTAL-DEBITS + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE

               DISPLAY "----- JOURNAL DES ANOMALIES -----"

           PERFORM VARYING COMPTEUR FROM 1 BY 1
               UNTIL COMPTEUR > NB-ANOMALIES
               DISPLAY "MOUVEMENT : "
                   NUM-ANOMALIE(COMPTEUR)
               DISPLAY "TYPE : "
                   TYPE-ANOMALIE-TAB(COMPTEUR)
               DISPLAY "MONTANT : "
                   MONTANT-ANOMALIE-TAB(COMPTEUR)
           END-PERFORM

               DISPLAY "ANOMALIES STOCKEES : "
                   NB-ANOMALIES
               DISPLAY "ANOMALIES NON STOCKEES : "
                   NB-ANOMALIES-NON-STOCKEES.
               
               STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-17`). C'est une excellente démonstration d'un réflexe de programmation de niveau entreprise : **la gestion des limites de tables (ou *array bounds checking*)** !

Dans les systèmes de production, les tableaux ont une taille fixe en mémoire. Si un lot de données contient plus d'erreurs que prévu, le tableau risque de déborder et de corrompre la mémoire adjacente. Ton code intègre une protection élégante contre ce risque.

---

### 1. Les Nouveautés de la Division des Données

```cobol
01 CAPACITE-ANOMALIES          PIC 99 VALUE 5.
01 NB-ANOMALIES-NON-STOCKEES   PIC 99 VALUE 0.

```

* **`CAPACITE-ANOMALIES`** : Définit la taille maximale autorisée de notre table de rejets (fixée à 5, correspondant à la taille de `TABLE-ANOMALIES`).
* **`NB-ANOMALIES-NON-STOCKEES`** : Un nouveau compteur pour dénombrer les anomalies qui n'ont pas pu être enregistrées dans le tableau faute de place, tout en continuant à les comptabiliser globalement.

---

### 2. Le Mécanisme de Protection anti-débordement

Regarde comment le bloc d'erreur (`WHEN OTHER`) a été sécurisé :

```cobol
    WHEN OTHER
        DISPLAY "ANOMALIE : TYPE INCONNU"
        IF NB-ANOMALIES < CAPACITE-ANOMALIES
            ADD 1 TO NB-ANOMALIES
            MOVE COMPTEUR
                TO NUM-ANOMALIE(NB-ANOMALIES)
            MOVE TYPE-MOUVEMENT(COMPTEUR)
                TO TYPE-ANOMALIE-TAB(NB-ANOMALIES)
            MOVE MONTANT(COMPTEUR)
                TO MONTANT-ANOMALIE-TAB(NB-ANOMALIES)
        ELSE
            ADD 1 TO NB-ANOMALIES-NON-STOCKEES
            DISPLAY "JOURNAL PLEIN"
        END-IF

```

* **Le test de capacité (`IF NB-ANOMALIES < CAPACITE-ANOMALIES`)** : Avant d'écrire dans la table, le programme vérifie s'il reste de la place. Si c'est le cas, il enregistre l'anomalie normalement.
* **La gestion du débordement (`ELSE`)** : Si le tableau est plein, le programme ne plante pas : il incrémente le compteur de rejets non stockés et affiche un message d'avertissement `JOURNAL PLEIN`. Cela garantit la robustesse absolue du traitement par lots (*batch*).

---

### 3. Ce qu'il faut retenir :

Ce programme introduit un principe cardinal du développement sécurisé : **ne jamais supposer qu'un tableau est infini**. En combinant un contrôle de capacité, un journal d'erreurs structuré et un bilan transparent, tu écris désormais du code prêt pour la production bancaire.

---------------------------------------------------

## DAY05-18.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-18.

       PROCEDURE DIVISION.
           PERFORM DEBUT-DU-TRAITEMENT
           PERFORM TRAITEMENT-EN-COURS
               DISPLAY "RETOUR AU PROGRAMME PRINCIPAL"
           PERFORM FIN-DU-TRAITEMENT
           STOP RUN.

       DEBUT-DU-TRAITEMENT.
           DISPLAY "DEBUT DU TRAITEMENT".

       TRAITEMENT-EN-COURS.
           DISPLAY "TRAITEMENT EN COURS".

       FIN-DU-TRAITEMENT.
           DISPLAY "FIN DU TRAITEMENT".

### Explications 

Voici l'analyse détaillée de ce programme (`DAY05-18`). C'est une transition absolument majeure dans ton apprentissage : tu passes d'un code "monolithique" (tout à la suite) à **la modularisation par paragraphes** grâce au verbe `PERFORM` !

---

### 1. La Grande Nouveauté : Les Paragraphes et le Flux d'Exécution

En COBOL, la `PROCEDURE DIVISION` peut être découpée en **paragraphes** (des blocs de code identifiés par un nom suivi d'un point).

* Contrairement à d'autres langages où les fonctions doivent être explicitement appelées avec des parenthèses, en COBOL, un paragraphe s'exécute de manière séquentielle... **sauf** si on utilise le verbe `PERFORM` pour y sauter, effectuer les instructions qu'il contient, et revenir automatiquement à la ligne suivante.
* C'est la base de la structure en "sommaire" : le programme principal devient un simple enchaînement d'appels de paragraphes lisibles comme du français.

---

### 2. Analyse de la Procedure Division

```cobol
PROCEDURE DIVISION.
    PERFORM DEBUT-DU-TRAITEMENT
    PERFORM TRAITEMENT-EN-COURS
        DISPLAY "RETOUR AU PROGRAMME PRINCIPAL"
    PERFORM FIN-DU-TRAITEMENT
    STOP RUN.

```

#### Le déroulement pas à pas :

1. **`PERFORM DEBUT-DU-TRAITEMENT`** :
* Le programme quitte un instant le fil principal, saute au paragraphe `DEBUT-DU-TRAITEMENT`, exécute son `DISPLAY`, puis revient juste en dessous.


2. **`PERFORM TRAITEMENT-EN-COURS`** :
* Saute au paragraphe `TRAITEMENT-EN-COURS`, affiche son message, puis revient.


3. **`DISPLAY "RETOUR AU PROGRAMME PRINCIPAL"`** :
* Cette ligne est exécutée **directement** dans le flux principal (hors paragraphe), prouvant que le contrôle est bien revenu au programme principal après le `PERFORM` précédent.


4. **`PERFORM FIN-DU-TRAITEMENT`** :
* Saute au dernier paragraphe, affiche son message, et revient.


5. `STOP RUN.`: Arrête définitivement le programme.

---

### 3. Les Paragraphes Cibles

```cobol
DEBUT-DU-TRAITEMENT.
    DISPLAY "DEBUT DU TRAITEMENT".

TRAITEMENT-EN-COURS.
    DISPLAY "TRAITEMENT EN COURS".

FIN-DU-TRAITEMENT.
    DISPLAY "FIN DU TRAITEMENT".

```

Chaque paragraphe se termine naturellement là où commence le suivant (ou à la fin du programme).

---

### Résultat à l'Exécution

```text
DEBUT DU TRAITEMENT
TRAITEMENT EN COURS
RETOUR AU PROGRAMME PRINCIPAL
FIN DU TRAITEMENT

```

---

### Ce qu'il faut retenir :

La modularisation par paragraphes permet de structurer proprement tes programmes complexes (comme nos gestionnaires de comptes bancaires). Au lieu d'avoir des centaines de lignes à la suite, tu peux découper ton code en blocs logiques clairs : initialisation, traitement des lignes, et bilans de fin de lot.

-------------------------------------------------

## DAY05-18-02.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-18-02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 2000.
       01 MONTANT-MOUVEMENT PIC 9(5)V99 VALUE 150.
       

       PROCEDURE DIVISION.
           PERFORM INITIALISER-SOLDE
           PERFORM TRAITER-MOUVEMENT
           PERFORM AFFICHER-SOLDE
           STOP RUN.

       INITIALISER-SOLDE.
           MOVE SOLDE-INITIAL TO SOLDE
           DISPLAY "SOLDE INITIAL : " SOLDE.

       TRAITER-MOUVEMENT.
           SUBTRACT MONTANT-MOUVEMENT FROM SOLDE.

       AFFICHER-SOLDE.
           DISPLAY "SOLDE FINAL : " SOLDE.
           
### Explications 

Voici l'analyse détaillée de ce programme (`DAY05-18-02`). C'est un superbe exemple d'application concrète de la **modularisation** à la logique financière que nous construisons pas à pas !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 SOLDE-INITIAL PIC S9(6)V99 VALUE 2000.
01 MONTANT-MOUVEMENT PIC 9(5)V99 VALUE 150.

```

* **`SOLDE`** : Le compte en cours, initialisé par défaut à 1000.
* **`SOLDE-INITIAL`** : Une variable de référence fixée à **`2000`** pour simuler un nouveau point de départ.
* **`MONTANT-MOUVEMENT`** : La valeur d'une transaction unique (ici un débit de `150`).

---

### 2. La Division de la Procédure (Procedure Division) et ses Paragraphes

Le flux principal est désormais un véritable **orchestrateur** : il se contente d'appeler les blocs de code dans l'ordre logique métier.

```cobol
PROCEDURE DIVISION.
    PERFORM INITIALISER-SOLDE
    PERFORM TRAITER-MOUVEMENT
    PERFORM AFFICHER-SOLDE
    STOP RUN.

```

#### Déroulement pas à pas :

1. **`INITIALISER-SOLDE`** :
* `MOVE SOLDE-INITIAL TO SOLDE` : Écrase la valeur de départ (`1000`) par `2000`.
* Affiche : `SOLDE INITIAL : 02000.00`


2. **`TRAITER-MOUVEMENT`** :
* `SUBTRACT MONTANT-MOUVEMENT FROM SOLDE` : Soustrait 150 du solde ($2000 - 150$). Le solde interne passe à **`1850.00`**. *(Note : ce paragraphe effectue le calcul de façon silencieuse, sans `DISPLAY`).*


3. **`AFFICHER-SOLDE`** :
* Affiche le résultat final.



---

### 3. Résultat à l'Exécution

```text
SOLDE INITIAL : 02000.00
SOLDE FINAL : 01850.00

```

---

### Ce qu'il faut retenir :

Découper son code en paragraphes spécialisés (**Initialisation**, **Traitement métier**, **Restitution/Affichage**) est la marque d'un code COBOL propre, maintenable et professionnel. C'est exactement de cette manière que l'on structure les grands programmes industriels de traitement par lots (*batch*).

------------------------------------------------

## DAY05-18-03.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-18-03.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 1000.
       01 MONTANT-MOUVEMENT1 PIC 9(5)V99 VALUE 150.
       01 MONTANT-MOUVEMENT2 PIC 9(5)V99 VALUE 300.
       01 MONTANT-MOUVEMENT3 PIC 9(5)V99 VALUE 75.
       

       PROCEDURE DIVISION.
           PERFORM INITIALISER-SOLDE
           PERFORM TRAITER-MOUVEMENT
           PERFORM AFFICHER-SOLDE
           STOP RUN.

       INITIALISER-SOLDE.
           MOVE SOLDE-INITIAL TO SOLDE
           DISPLAY "SOLDE INITIAL : " SOLDE.

       TRAITER-MOUVEMENT.
           SUBTRACT MONTANT-MOUVEMENT1 FROM SOLDE
           DISPLAY "APRES MOUVEMENT 1 : " SOLDE

           ADD MONTANT-MOUVEMENT2 TO SOLDE
           DISPLAY "APRES MOUVEMENT 2 : " SOLDE

           SUBTRACT MONTANT-MOUVEMENT3 FROM SOLDE
           DISPLAY "APRES MOUVEMENT 3 : " SOLDE.

       AFFICHER-SOLDE.
           DISPLAY "SOLDE FINAL : " SOLDE.
           
### Explications

Voici l'analyse détaillée de ce programme (`DAY05-18-03`). C'est une excellente transition vers l'utilisation de paragraphes modulaires qui enchaînent plusieurs opérations financières d'affilée !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 SOLDE-INITIAL PIC S9(6)V99 VALUE 1000.
01 MONTANT-MOUVEMENT1 PIC 9(5)V99 VALUE 150.
01 MONTANT-MOUVEMENT2 PIC 9(5)V99 VALUE 300.
01 MONTANT-MOUVEMENT3 PIC 9(5)V99 VALUE 75.

```

* **`SOLDE` et `SOLDE-INITIAL**` : Le compte de travail initialisé à **`1000`**.
* **Les variables de mouvements** : Trois montants distincts sont déclarés en amont pour simuler trois opérations successives (deux débits potentiels et un crédit, ou l'inverse selon les verbes utilisés dans la procédure).

---

### 2. L'Orchestration (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM INITIALISER-SOLDE
    PERFORM TRAITER-MOUVEMENT
    PERFORM AFFICHER-SOLDE
    STOP RUN.

```

Le programme principal reste d'une clarté exemplaire : il délue chaque étape métier à un paragraphe spécialisé.

---

### 3. Le Détail des Paragraphes

#### A. Initialisation

```cobol
INITIALISER-SOLDE.
    MOVE SOLDE-INITIAL TO SOLDE
    DISPLAY "SOLDE INITIAL : " SOLDE.

```

* Remet le solde à sa valeur de départ et l'affiche.

#### B. Traitement Séquentiel

```cobol
TRAITER-MOUVEMENT.
    SUBTRACT MONTANT-MOUVEMENT1 FROM SOLDE
    DISPLAY "APRES MOUVEMENT 1 : " SOLDE

    ADD MONTANT-MOUVEMENT2 TO SOLDE
    DISPLAY "APRES MOUVEMENT 2 : " SOLDE

    SUBTRACT MONTANT-MOUVEMENT3 FROM SOLDE
    DISPLAY "APRES MOUVEMENT 3 : " SOLDE.

```

Ce paragraphe enchaîne trois opérations arithmétiques avec des affichages intermédiaires :

1. **Mouvement 1 (Débit de 150)** : $1000 - 150 = \mathbf{850.00}$
2. **Mouvement 2 (Crédit de 300)** : $850 + 300 = \mathbf{1150.00}$
3. **Mouvement 3 (Débit de 75)** : $1150 - 75 = \mathbf{1075.00}$

#### C. Restitution Finale

```cobol
AFFICHER-SOLDE.
    DISPLAY "SOLDE FINAL : " SOLDE.

```

* Affiche le solde définitif après l'ensemble des opérations.

---

### Résultat à l'Exécution

```text
SOLDE INITIAL : 001000.00
APRES MOUVEMENT 1 : 000850.00
APRES MOUVEMENT 2 : 001150.00
APRES MOUVEMENT 3 : 001075.00
SOLDE FINAL : 001075.00

```

---

### Ce qu'il faut retenir :

En regroupant le calcul de plusieurs mouvements à l'intérieur d'un même paragraphe de traitement, tu commences à structurer un véritable flux métier.

-------------------------------------------------

## DAY05-19.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-19.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 3 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           PERFORM INITIALISER-MOUVEMENTS
           PERFORM TRAITER-MOUVEMENTS
           DISPLAY "SOLDE FINAL : " SOLDE
           STOP RUN.

       INITIALISER-MOUVEMENTS.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)
           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)
           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3).

       TRAITER-MOUVEMENTS.
           PERFORM UNTIL COMPTEUR > 3
               DISPLAY "MOUVEMENT : " COMPTEUR
               ADD 1 TO COMPTEUR
           END-PERFORM.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-18-03` / `DAY05-19`). C'est une étape fantastique : tu combines enfin **la modularité par paragraphes**, **les tables (`OCCURS`)** et **les boucles (`PERFORM UNTIL`)** !

Cependant, ce programme met en lumière une subtilité piègeuse très importante lorsqu'on modularise du code en COBOL. Regardons cela de plus près.

---

### 1. La Division des Données et l'Initialisation

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 3 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* `SOLDE` part de **`1000`**.
* `TABLE-MOUVEMENTS` est initialisé correctement dans le premier paragraphe (`INITIALISER-MOUVEMENTS`) avec :
* Mouvement 1 : Débit de 150 (`"D"`)
* Mouvement 2 : Crédit de 300 (`"C"`)
* Mouvement 3 : Débit de 75 (`"D"`)



---

### 2. L'Anomalie Logique dans le Paragraphe de Traitement

Regardons la `PROCEDURE DIVISION` et le paragraphe `TRAITER-MOUVEMENTS` :

```cobol
PROCEDURE DIVISION.
    PERFORM INITIALISER-MOUVEMENTS
    PERFORM TRAITER-MOUVEMENTS
    DISPLAY "SOLDE FINAL : " SOLDE
    STOP RUN.

TRAITER-MOUVEMENTS.
    PERFORM UNTIL COMPTEUR > 3
        DISPLAY "MOUVEMENT : " COMPTEUR
        ADD 1 TO COMPTEUR
    END-PERFORM.

```

* **Que fait ce paragraphe ?** Il boucle bien 3 fois grâce au compteur (`COMPTEUR > 3`), en affichant le numéro de chaque mouvement.
* **Que manque-t-il ?** Regarde bien le contenu de la boucle : **le bloc `EVALUATE` et les calculs arithmétiques (`ADD` / `SUBTRACT` sur le `SOLDE`) ont disparu !**
* Par conséquent, même si le programme parcourt les 3 tours de boucle, **aucun calcul n'est appliqué au solde**.

---

### 3. Résultat à l'Exécution

À l'écran, le programme affichera :

```text
MOUVEMENT : 1
MOUVEMENT : 2
MOUVEMENT : 3
SOLDE FINAL : 001000.00

```

Le solde n'a pas bougé et est resté bloqué à 1000.00, car la logique métier n'était pas présente dans le paragraphe de traitement.

---

### Comment corriger et perfectionner ce programme ?

Pour que ce code modulaire fonctionne parfaitement et réalise les calculs attendus, il faut réintégrer l'évaluation du type de mouvement à l'intérieur de la boucle du paragraphe `TRAITER-MOUVEMENTS` :

```cobol
       TRAITER-MOUVEMENTS.
           PERFORM UNTIL COMPTEUR > 3
               DISPLAY "MOUVEMENT : " COMPTEUR

               EVALUATE TYPE-MOUVEMENT(COMPTEUR)
                   WHEN "D"
                       SUBTRACT MONTANT(COMPTEUR) FROM SOLDE
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR) TO SOLDE
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE
               ADD 1 TO COMPTEUR
           END-PERFORM.

```

---

### Ce qu'il faut retenir :

La modularisation est un outil puissant pour nettoyer le code principal, mais il faut veiller à ce que chaque paragraphe contienne bien l'intégralité de la logique métier nécessaire à sa mission.

--------------------------------------------------

## DAY05-19-02.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-19-02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 3 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           PERFORM INITIALISER-MOUVEMENTS
           PERFORM TRAITER-MOUVEMENTS
           DISPLAY "SOLDE FINAL : " SOLDE
           STOP RUN.

       INITIALISER-MOUVEMENTS.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)
           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)
           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3).

       TRAITER-MOUVEMENTS.
           PERFORM UNTIL COMPTEUR > 3
               DISPLAY "MOUVEMENT : " COMPTEUR
               DISPLAY "TYPE : "
                   TYPE-MOUVEMENT(COMPTEUR)
               IF TYPE-MOUVEMENT(COMPTEUR) = "D"
                   SUBTRACT MONTANT(COMPTEUR)
                       FROM SOLDE
               ELSE
                   IF TYPE-MOUVEMENT(COMPTEUR) = "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                   END-IF
               END-IF
               DISPLAY "SOLDE : " SOLDE
               ADD 1 TO COMPTEUR
           END-PERFORM.

### Explications

Voici l'analyse détaillée de ce programme (`DAY05-19-02`). C'est une excellente variante ! Tu combines ici la **modularité par paragraphes**, le parcours d'une table avec `OCCURS`, et l'utilisation de structures conditionnelles imbriquées (`IF / ELSE`) à la place de l'instruction `EVALUATE`.

---

### 1. La Division des Données et l'Initialisation

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 SOLDE PIC S9(6)V99 VALUE 1000.
01 COMPTEUR PIC 9 VALUE 1.

01 TABLE-MOUVEMENTS.
   05 MOUVEMENT OCCURS 3 TIMES.
      10 TYPE-MOUVEMENT PIC X.
      10 MONTANT PIC 9(5)V99.

```

* **`SOLDE`** : Initialisé à **`1000.00`**.
* **`TABLE-MOUVEMENTS`** : Dimensionnée pour 3 mouvements, remplis proprement dans le paragraphe `INITIALISER-MOUVEMENTS` :
1. Débit de 150 (`"D"`)
2. Crédit de 300 (`"C"`)
3. Débit de 75 (`"D"`)



---

### 2. L'Orchestration Modulaire (Procedure Division)

```cobol
PROCEDURE DIVISION.
    PERFORM INITIALISER-MOUVEMENTS
    PERFORM TRAITER-MOUVEMENTS
    DISPLAY "SOLDE FINAL : " SOLDE
    STOP RUN.

```

Le programme principal est devenu un véritable chef d'orchestre : il délégue l'initialisation, puis le traitement, avant d'afficher le solde définitif et de s'arrêter. C'est extrêmement lisible.

---

### 3. Le Traitement et la Logique Conditionnelle (`IF / ELSE`)

Regardons de plus près le paragraphe `TRAITER-MOUVEMENTS` :

```cobol
TRAITER-MOUVEMENTS.
    PERFORM UNTIL COMPTEUR > 3
        DISPLAY "MOUVEMENT : " COMPTEUR
        DISPLAY "TYPE : " TYPE-MOUVEMENT(COMPTEUR)

        IF TYPE-MOUVEMENT(COMPTEUR) = "D"
            SUBTRACT MONTANT(COMPTEUR) FROM SOLDE
        ELSE
            IF TYPE-MOUVEMENT(COMPTEUR) = "C"
                ADD MONTANT(COMPTEUR) TO SOLDE
            END-IF
        END-IF

        DISPLAY "SOLDE : " SOLDE
        ADD 1 TO COMPTEUR
    END-PERFORM.

```

* **La boucle `PERFORM UNTIL**` parcourt les 3 indices du tableau.
* **Le test `IF / ELSE**` gère l'aiguillage métier :
* Si le type est `"D"`, on soustrait du solde.
* Sinon (`ELSE`), on vérifie s'il s'agit d'un `"C"` pour l'ajouter. (Attention toutefois : si le type était erroné comme un `"X"`, cette structure l'ignorerait silencieusement sans lever d'alerte, contrairement à un `EVALUATE` avec un bloc `WHEN OTHER`).



---

### Résultat pas à pas et à l'Exécution

1. **Départ** : `SOLDE = 1000.00`
2. **Mouvement 1** (`"D"`, 150) : $1000 - 150 = \mathbf{850.00}$
3. **Mouvement 2** (`"C"`, 300) : $850 + 300 = \mathbf{1150.00}$
4. **Mouvement 3** (`"D"`, 75) : $1150 - 75 = \mathbf{1075.00}$

**Affichage final :**

```text
MOUVEMENT : 1
TYPE : D
SOLDE : 000850.00
MOUVEMENT : 2
TYPE : C
SOLDE : 001150.00
MOUVEMENT : 3
TYPE : D
SOLDE : 001075.00
SOLDE FINAL : 001075.00

```

---

### Ce qu'il faut retenir :

Tu maîtrises désormais la structure modulaire de base en COBOL. Le code est propre, séparé en tâches logiques distinctes, et exécute des calculs précis sur des tableaux indexés.

