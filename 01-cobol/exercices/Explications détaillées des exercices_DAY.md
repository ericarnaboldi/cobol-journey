# *DAY01*

## DAY01-01.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY01-01.
       AUTHOR. ERIC.
       DATE-WRITTEN. 2026-10-08.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MONTANT PIC 9(5)V99 VALUE 1000.00.
       01  WS-TAUX PIC 9(2)V99 VALUE 0.05.
       01  WS-INTERET PIC 9(5)V99.
       01  WS-TOTAL PIC 9(5)V99.
       PROCEDURE DIVISION.
           COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX
           COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET
           DISPLAY "Montant initial : " WS-MONTANT
           DISPLAY "Taux d'intérêt : " WS-TAUX
           DISPLAY "Intérêt calculé : " WS-INTERET
           DISPLAY "Montant total : " WS-TOTAL
           STOP RUN.

### Explications

Voici l'explication détaillée, ligne par ligne, de ton programme COBOL `DAY01-01` qui calcule des intérêts financiers.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY01-01.
AUTHOR. ERIC.
DATE-WRITTEN. 2026-10-08.

```

* `IDENTIFICATION DIVISION.`: Indique le début de la division d'identification. C'est obligatoire dans tout programme COBOL. Elle contient les métadonnées du programme.
* `PROGRAM-ID. DAY01-01.`: Donne un nom unique au programme (ici, `DAY01-01`). C'est la seule ligne strictement obligatoire dans cette division.
* `AUTHOR. ERIC.`: Spécifie le nom de l'auteur du programme (documentaire).
* `DATE-WRITTEN. 2026-10-08.`: Indique la date à laquelle le programme a été écrit.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-MONTANT PIC 9(5)V99 VALUE 1000.00.
01  WS-TAUX PIC 9(2)V99 VALUE 0.05.
01  WS-INTERET PIC 9(5)V99.
01  WS-TOTAL PIC 9(5)V99.

```

* `DATA DIVISION.`: Débute la division dédiée à la définition des données et des variables.

* `WORKING-STORAGE SECTION.`: Section où l'on déclare les variables de travail internes (variables en mémoire vive).

* `01 WS-MONTANT PIC 9(5)V99 VALUE 1000.00.`:

* `01` définit un niveau hiérarchique supérieur (variable principale).

* `WS-MONTANT` est le nom de la variable.

* `PIC 9(5)V99` est la "Picture clause" qui décrit le format : un nombre numérique (`9`) de 5 chiffres avant la virgule, avec une virgule implicite (`V`), et 2 chiffres après la virgule.

* `VALUE 1000.00` initialise la variable avec la valeur de départ `1000.00`.

* `01 WS-TAUX PIC 9(2)V99 VALUE 0.05.`: Déclare le taux d'intérêt. Un nombre de 2 chiffres avant la virgule, 2 après, initialisé à `0.05` (soit 5%).

* `01 WS-INTERET PIC 9(5)V99.`: Déclare la variable qui stockera le résultat du calcul des intérêts. Aucune valeur initiale n'est fournie (elle commencera à zéro).

* `01 WS-TOTAL PIC 9(5)V99.`: Déclare la variable qui stockera le montant total (montant initial + intérêts).

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX
    COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET
    DISPLAY "Montant initial : " WS-MONTANT
    DISPLAY "Taux d'intérêt : " WS-TAUX
    DISPLAY "Intérêt calculé : " WS-INTERET
    DISPLAY "Montant total : " WS-TOTAL
    STOP RUN.

```

* `PROCEDURE DIVISION.`: Marque le début des instructions exécutables (le code qui fait "agir" le programme).
* `COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX`: Multiplie la valeur de `WS-MONTANT` (1000.00) par `WS-TAUX` (0.05) et stocke le résultat (50.00) dans la variable `WS-INTERET`. L'instruction `COMPUTE` permet d'utiliser des opérateurs arithmétiques classiques (`*`, `/`, `+`, `-`).
* `COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET`: Additionne le montant initial et l'intérêt calculé (1000.00 + 50.00), puis stocke le résultat (1050.00) dans `WS-TOTAL`.
* `DISPLAY "Montant initial : " WS-MONTANT`: Affiche sur la console le texte littéral entre guillemets suivi de la valeur actuelle contenue dans la variable `WS-MONTANT`.
* `DISPLAY "Taux d'intérêt : " WS-TAUX`: Affiche le taux d'intérêt.
* `DISPLAY "Intérêt calculé : " WS-INTERET`: Affiche le montant des intérêts calculés.
* `DISPLAY "Montant total : " WS-TOTAL`: Affiche le montant total final.
* `STOP RUN.`: Termine l'exécution du programme et rend le contrôle au système d'exploitation. Le point final (`.`) est très important en COBOL pour clore une instruction ou un paragraphe.

---

> **Note de style :** En COBOL, la mise en forme (les espaces et l'indentation) était historiquement très réglementée (colonnes précises), mais les compilateurs modernes tolèrent une structure plus souple et lisible comme celle que tu as écrite ici.

------------------------------------------------

## DAY01-01-V2.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY01-01-V2.
       AUTHOR. ERIC.
       DATE-WRITTEN. 2026-10-08.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MONTANT PIC 9(5)V99.
       01  WS-TAUX PIC 9V99.
       01  WS-INTERET PIC 9(5)V99.
       01  WS-TOTAL PIC 9(5)V99.
       PROCEDURE DIVISION.
           DISPLAY "Saisir le montant :"
           ACCEPT WS-MONTANT
           DISPLAY "Saisir le taux d'intérêt :"
           ACCEPT WS-TAUX
           COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX
           COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET
           DISPLAY "Montant initial : " WS-MONTANT
           DISPLAY "Taux d'intérêt : " WS-TAUX
           DISPLAY "Intérêt calculé : " WS-INTERET
           DISPLAY "Montant total : " WS-TOTAL
           STOP RUN.

### Explications

Voici l'analyse détaillée de cette deuxième version (`DAY01-01-V2`), qui introduit une nouveauté majeure : **l'interaction avec l'utilisateur** (la saisie au clavier).

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY01-01-V2.
AUTHOR. ERIC.
DATE-WRITTEN. 2026-10-08.

```

* `PROGRAM-ID. DAY01-01-V2.`: Le nom du programme a été mis à jour pour indiquer qu'il s'agit d'une version 2 (`-V2`).

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-MONTANT PIC 9(5)V99.
01  WS-TAUX PIC 9V99.
01  WS-INTERET PIC 9(5)V99.
01  WS-TOTAL PIC 9(5)V99.

```

* **Absence de `VALUE**` : Contrairement au premier programme, les variables `WS-MONTANT` et `WS-TAUX` n'ont plus de clause `VALUE`.
* **Comportement par défaut** : En COBOL, si une variable numérique n'est pas initialisée avec `VALUE`, elle prend automatiquement la valeur zéro (`0`) par défaut en mémoire. Ici, ces variables vont surtout servir à recevoir des valeurs saisies par l'utilisateur.
* `01 WS-TAUX PIC 9V99.`: Note le format `9V99` (un seul `9` avant le `V`). Cela signifie qu'on attend un chiffre avant la virgule et deux après (par exemple, `0.05` ou `1.25`).

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    DISPLAY "Saisir le montant :"
    ACCEPT WS-MONTANT
    DISPLAY "Saisir le taux d'intérêt :"
    ACCEPT WS-TAUX
    COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX
    COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET
    DISPLAY "Montant initial : " WS-MONTANT
    DISPLAY "Taux d'intérêt : " WS-TAUX
    DISPLAY "Intérêt calculé : " WS-INTERET
    DISPLAY "Montant total : " WS-TOTAL
    STOP RUN.

```

* `DISPLAY "Saisir le montant :"`: Affiche le texte d'invite à l'écran pour indiquer à l'utilisateur ce qu'il doit faire.
* `ACCEPT WS-MONTANT`: **Nouvelle instruction clé !** L'instruction `ACCEPT` met le programme en pause et attend que l'utilisateur tape une valeur au clavier, puis valide (touche Entrée). Cette valeur est immédiatement stockée dans la variable `WS-MONTANT`.
* `DISPLAY "Saisir le taux d'intérêt :"`, puis `ACCEPT WS-TAUX`: Même principe, le programme demande le taux d'intérêt et l'enregistre dans `WS-TAUX`.
* `COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX`: Calcule l'intérêt en utilisant dynamiquement les valeurs qui viennent d'être saisies par l'utilisateur.
* `COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET`: Calcule le montant total.
* Les instructions `DISPLAY` affichent les résultats calculés à partir des données dynamiques.
* `STOP RUN.`: Termine l'exécution du programme.

---

### Ce qu'il faut retenir de cette version :

Cette version transforme un script statique en un **programme interactif**. L'association de `DISPLAY` (pour envoyer vers l'écran) et `ACCEPT` (pour recevoir depuis le clavier) est la base de tous les dialogues homme-machine en mode console sous COBOL.

--------------------------------------------------
--------------------------------------------------

# DAY02

## DAY02-01.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY02-01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 10000.00. 
       01  WS-INTERET PIC 9(5)V99 VALUE 0.
       01  WS-TAUX PIC 9V99 VALUE 0.05.
       01  WS-TOTAL PIC 9(5)V99 VALUE 0.
       PROCEDURE DIVISION.
           MOVE 12000.00 TO WS-CAPITAL 
           COMPUTE WS-INTERET = WS-CAPITAL * WS-TAUX
           COMPUTE WS-TOTAL = WS-CAPITAL + WS-INTERET
           DISPLAY "CAPITAL : " WS-CAPITAL
           DISPLAY "INTERET : " WS-INTERET
           DISPLAY "TOTAL : " WS-TOTAL
           STOP RUN.

### Explications

Voici l'analyse détaillée de ce troisième programme (`DAY02-01`), qui introduit une instruction fondamentale en COBOL : **l'instruction `MOVE**`.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY02-01.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY02-01.`: Nomme le programme `DAY02-01`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 10000.00. 
01  WS-INTERET PIC 9(5)V99 VALUE 0.
01  WS-TAUX PIC 9V99 VALUE 0.05.
01  WS-TOTAL PIC 9(5)V99 VALUE 0.

```

* `WORKING-STORAGE SECTION.`: Contient la déclaration de nos variables en mémoire de travail.
* `01 WS-CAPITAL PIC 9(5)V99 VALUE 10000.00.`: Déclare une variable numérique de 5 chiffres avant la virgule et 2 après, initialisée à **10000.00**.
* `01 WS-INTERET PIC 9(5)V99 VALUE 0.`: Déclare la variable pour l'intérêt, initialisée à **0**.
* `01 WS-TAUX PIC 9V99 VALUE 0.05.`: Déclare le taux, initialisé à **0.05** (5%).
* `01 WS-TOTAL PIC 9(5)V99 VALUE 0.`: Déclare la variable pour le total, initialisée à **0**.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 12000.00 TO WS-CAPITAL 
    COMPUTE WS-INTERET = WS-CAPITAL * WS-TAUX
    COMPUTE WS-TOTAL = WS-CAPITAL + WS-INTERET
    DISPLAY "CAPITAL : " WS-CAPITAL
    DISPLAY "INTERET : " WS-INTERET
    DISPLAY "TOTAL : " WS-TOTAL
    STOP RUN.

```

* `MOVE 12000.00 TO WS-CAPITAL`: **Nouvelle instruction clé !** L'instruction `MOVE` sert à affecter ou copier une valeur dans une variable. Ici, elle **écrase** la valeur initiale (`10000.00`) de `WS-CAPITAL` pour la remplacer par **`12000.00`**.
* `COMPUTE WS-INTERET = WS-CAPITAL * WS-TAUX`: Multiplie le nouveau capital (`12000.00`) par le taux (`0.05`). Le résultat (`600.00`) est stocké dans `WS-INTERET`.
* `COMPUTE WS-TOTAL = WS-CAPITAL + WS-INTERET`: Additionne le capital (`12000.00`) et l'intérêt (`600.00`). Le total (`12600.00`) est stocké dans `WS-TOTAL`.
* `DISPLAY "CAPITAL : " WS-CAPITAL`: Affiche le capital final (qui vaut bien 12000.00 et non 10000.00).
* `DISPLAY "INTERET : " WS-INTERET`: Affiche l'intérêt calculé (`600.00`).
* `DISPLAY "TOTAL : " WS-TOTAL`: Affiche le montant total (`12600.00`).
* `STOP RUN.`: Termine l'exécution du programme.

---

### Ce qu'il faut retenir de cette version :

L'instruction `MOVE` est l'équivalent du signe `=` (affectation) dans d'autres langages, mais écrite sous forme de phrase en anglais (*"Déplace cette valeur vers cette variable"*). Elle montre aussi qu'une valeur définie par `VALUE` au départ peut être modifiée à tout moment dans la `PROCEDURE DIVISION`.

--------------------------------------------------
--------------------------------------------------

# DAY03

## DAY03-01.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY03-01.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
       PROCEDURE DIVISION.
           MOVE 9999.99 TO WS-CAPITAL
           IF WS-CAPITAL >= 10000
               DISPLAY "CATEGORIE PREMIUM"
           ELSE
               DISPLAY "CATEGORIE STANDARD"
           END-IF
           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY03-01`), qui introduit une structure fondamentale pour prendre des décisions : **l'instruction conditionnelle `IF / ELSE**`.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY03-01.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY03-01.`: Nomme le programme `DAY03-01`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 0.

```

* `WORKING-STORAGE SECTION.`: Contient les variables de travail.
* `01 WS-CAPITAL PIC 9(5)V99 VALUE 0.`: Déclare une variable numérique de 5 chiffres avant la virgule et 2 après, initialisée à **`0`**.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 9999.99 TO WS-CAPITAL
    IF WS-CAPITAL >= 10000
        DISPLAY "CATEGORIE PREMIUM"
    ELSE
        DISPLAY "CATEGORIE STANDARD"
    END-IF
    STOP RUN.

```

* `MOVE 9999.99 TO WS-CAPITAL`: Remplace la valeur initiale (0) de `WS-CAPITAL` par **`9999.99`**.
* `IF WS-CAPITAL >= 10000`: **Nouvelle instruction clé !** C'est un test logique. Il vérifie si la valeur contenue dans `WS-CAPITAL` est supérieure ou égale à `10000`.
* Ici, `9999.99` n'est pas supérieur ou égal à `10000` (il manque un tout petit centime !). La condition est donc **fausse** (`FALSE`).


* `DISPLAY "CATEGORIE PREMIUM"`: Cette ligne ne sera **pas** exécutée car la condition du `IF` n'est pas remplie.
* `ELSE`: Indique l'alternative. Tout ce qui suit sera exécuté si la condition du `IF` est fausse.
* `DISPLAY "CATEGORIE STANDARD"`: C'est cette ligne qui va s'exécuter. Le programme affichera `CATEGORIE STANDARD` à l'écran.
* `END-IF`: **Très important en COBOL moderne**, cette balise marque la fin de la structure conditionnelle `IF`. (Dans les versions très anciennes de COBOL, on utilisait un point `.`, mais l'utilisation de `END-IF` évite les erreurs de portée de code).
* `STOP RUN.`: Termine l'exécution du programme.

---

### Ce qu'il faut retenir de cette version :

Le test logique `IF / ELSE / END-IF` permet au programme de s'adapter et de prendre des chemins différents selon les données qu'il manipule.

---------------------------------------------------

## DAY03-02.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY03-02.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
       01  WS-TYPE-LIVRET PIC X VALUE "S".
       01  WS-DEROGATION PIC X VALUE "N".
       PROCEDURE DIVISION.
           MOVE 12000.00 TO WS-CAPITAL
           MOVE "P" TO WS-TYPE-LIVRET
           MOVE "N" TO WS-DEROGATION
           IF (WS-CAPITAL >= 10000
               AND WS-TYPE-LIVRET = "P")
               OR WS-DEROGATION = "O"
               DISPLAY "TRAITEMENT PRIORITAIRE"
           ELSE
               DISPLAY "TRAITEMENT STANDARD"
           END-IF
           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY03-02`), qui introduit des notions très importantes : **les types alphanumériques (`PIC X`)** et **les conditions complexes combinant `AND`, `OR` et des parenthèses**.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY03-02.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY03-02.`: Nomme le programme `DAY03-02`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
01  WS-TYPE-LIVRET PIC X VALUE "S".
01  WS-DEROGATION PIC X VALUE "N".

```

* `01 WS-CAPITAL PIC 9(5)V99 VALUE 0.`: Déclare notre variable numérique habituelle pour le capital, initialisée à `0`.
* `01 WS-TYPE-LIVRET PIC X VALUE "S".`:
* `PIC X` est la clause pour déclarer une variable de type **alphanumérique** (qui peut contenir une lettre, un chiffre ou un caractère spécial). Ici, la taille est de 1 caractère par défaut.
* `VALUE "S"` initialise la variable avec la lettre `"S"` (pour "Standard" par exemple).


* `01 WS-DEROGATION PIC X VALUE "N".`: Déclare une autre variable alphanumérique d'un caractère, initialisée à `"N"` (pour "Non").

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 12000.00 TO WS-CAPITAL
    MOVE "P" TO WS-TYPE-LIVRET
    MOVE "N" TO WS-DEROGATION

```

* `MOVE 12000.00 TO WS-CAPITAL`: Remplace le capital par `12000.00`.
* `MOVE "P" TO WS-TYPE-LIVRET`: Remplace le type de livret par `"P"` (pour "Privilège" ou "Professionnel"). Note bien que les valeurs textuelles/alphanumériques s'écrivent **toujours entre guillemets** en COBOL.
* `MOVE "N" TO WS-DEROGATION`: Assure que la dérogation reste à `"N"`.

#### L'analyse de la condition complexe :

```cobol
    IF (WS-CAPITAL >= 10000
        AND WS-TYPE-LIVRET = "P")
        OR WS-DEROGATION = "O"
        DISPLAY "TRAITEMENT PRIORITAIRE"
    ELSE
        DISPLAY "TRAITEMENT STANDARD"
    END-IF
    STOP RUN.

```

* `IF (WS-CAPITAL >= 10000 AND WS-TYPE-LIVRET = "P") OR WS-DEROGATION = "O"`: **C'est le cœur du test logique.** Le COBOL évalue cette expression en respectant la logique booléenne et les parenthèses :
1. **À l'intérieur des parenthèses** :
* `WS-CAPITAL >= 10000` -> `12000.00 >= 10000` est **VRAI**.
* `WS-TYPE-LIVRET = "P"` -> `"P" = "P"` est **VRAI**.
* Le `AND` exige que les deux soient vrais : **VRAI AND VRAI donne VRAI**.


2. **À l'extérieur des parenthèses (avec le `OR`)** :
* Le bloc entre parenthèses est **VRAI**.
* `WS-DEROGATION = "O"` -> `"N" = "O"` est **FAUX**.
* Le `OR` exige qu'au moins l'un des côtés soit vrai : **VRAI OR FAUX donne globalement VRAI**.




* Puisque la condition globale est **VRAI**, le programme exécute la branche principale :
* `DISPLAY "TRAITEMENT PRIORITAIRE"` s'affiche à l'écran.


* Le bloc `ELSE` (`DISPLAY "TRAITEMENT STANDARD"`) est ignoré.
* `END-IF` clôture le test conditionnel.
* `STOP RUN.` arrête l'exécution du programme.

---

### Ce qu'il faut retenir de cette version :

1. **`PIC X`** permet de manipuler du texte ou des codes d'un ou plusieurs caractères (contrairement à `PIC 9` réservé aux nombres).
2. L'utilisation des **parenthèses** dans les conditions COBOL est indispensable pour contrôler l'ordre de priorité entre les opérateurs `AND` et `OR`, exactement comme en mathématiques.

---------------------------------------------------

## DAY03-02B.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY03-02B.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
       01  WS-TYPE-LIVRET PIC X VALUE "S".
       01  WS-DEROGATION PIC X VALUE "N".
       PROCEDURE DIVISION.
           MOVE 12000.00 TO WS-CAPITAL
           MOVE "S" TO WS-TYPE-LIVRET
           MOVE "N" TO WS-DEROGATION
           IF (WS-CAPITAL >= 10000
               AND WS-TYPE-LIVRET = "P")
               OR WS-DEROGATION = "O"
               DISPLAY "TRAITEMENT PRIORITAIRE"
           ELSE
               DISPLAY "TRAITEMENT STANDARD"
           END-IF
           STOP RUN.
             
### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY03-02B`). Ce programme est parfait pour voir l'impact d'une seule modification de variable sur le résultat logique !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY03-02B.

```

* `PROGRAM-ID. DAY03-02B.`: Nomme le programme avec la version `-02B` pour la différencier de la précédente.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
01  WS-TYPE-LIVRET PIC X VALUE "S".
01  WS-DEROGATION PIC X VALUE "N".

```

* Aucun changement ici : les trois variables (`WS-CAPITAL`, `WS-TYPE-LIVRET`, `WS-DEROGATION`) conservent les mêmes types et formats que dans les versions précédentes.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 12000.00 TO WS-CAPITAL
    MOVE "S" TO WS-TYPE-LIVRET
    MOVE "N" TO WS-DEROGATION

```

* `MOVE 12000.00 TO WS-CAPITAL`: Le capital est fixé à `12000.00` (ce qui remplit la première condition de montant).
* `MOVE "S" TO WS-TYPE-LIVRET`: **La différence est ici !** Le type de livret est maintenant `"S"` (Standard) au lieu de `"P"`.
* `MOVE "N" TO WS-DEROGATION`: La dérogation est à `"N"` (Non).

#### L'évaluation de la condition :

```cobol
    IF (WS-CAPITAL >= 10000
        AND WS-TYPE-LIVRET = "P")
        OR WS-DEROGATION = "O"
        DISPLAY "TRAITEMENT PRIORITAIRE"
    ELSE
        DISPLAY "TRAITEMENT STANDARD"
    END-IF
    STOP RUN.

```

* Analysons le test logique pas à pas :
1. **À l'intérieur des parenthèses** :
* `WS-CAPITAL >= 10000` -> `12000.00 >= 10000` est **VRAI**.
* `WS-TYPE-LIVRET = "P"` -> `"S" = "P"` est **FAUX** (puisque l'on a mis `"S"`).
* Le `AND` exige que les deux soient vrais : **VRAI AND FAUX donne globalement FAUX**.


2. **À l'extérieur des parenthèses (avec le `OR`)** :
* Le bloc entre parenthèses est devenu **FAUX**.
* `WS-DEROGATION = "O"` -> `"N" = "O"` est **FAUX**.
* Le `OR` exige qu'au moins un côté soit vrai : **FAUX OR FAUX donne globalement FAUX**.




* Puisque la condition globale est cette fois-ci **FAUX**, le programme saute le bloc principal et bascule directement dans la branche **`ELSE`**.
* **Résultat à l'exécution** : Le programme affiche `TRAITEMENT STANDARD` à l'écran, puis s'arrête via `STOP RUN.`.

---

### Ce qu'il faut retenir :

Avec ce test, on voit bien que pour obtenir un `TRAITEMENT PRIORITAIRE`, il fallait soit un capital élevé **ET** un livret de type `"P"`, soit une dérogation acceptée (`"O"`). Comme aucune de ces conditions n'est pleinement remplie ici, le programme applique par défaut le traitement standard.

---------------------------------------------------

## DAY03-02C.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY03-02C.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
       01  WS-TYPE-LIVRET PIC X VALUE "S".
       01  WS-DEROGATION PIC X VALUE "N".
       PROCEDURE DIVISION.
           MOVE 8000.00 TO WS-CAPITAL
           MOVE "S" TO WS-TYPE-LIVRET
           MOVE "O" TO WS-DEROGATION
           IF (WS-CAPITAL >= 10000
               AND WS-TYPE-LIVRET = "P")
               OR WS-DEROGATION = "O"
               DISPLAY "TRAITEMENT PRIORITAIRE"
           ELSE
               DISPLAY "TRAITEMENT STANDARD"
           END-IF
           STOP RUN.
             
### Explications 

Voici l'analyse détaillée de cette nouvelle variante (`DAY03-02C`). Ce programme est un excellent cas d'école pour comprendre la puissance de l'opérateur `OR` !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY03-02C.

```

* `PROGRAM-ID. DAY03-02C.`: Nomme le programme `DAY03-02C`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
01  WS-TYPE-LIVRET PIC X VALUE "S".
01  WS-DEROGATION PIC X VALUE "N".

```

* Les variables (`WS-CAPITAL`, `WS-TYPE-LIVRET`, `WS-DEROGATION`) et leurs types (`PIC 9(5)V99` et `PIC X`) restent identiques.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 8000.00 TO WS-CAPITAL
    MOVE "S" TO WS-TYPE-LIVRET
    MOVE "O" TO WS-DEROGATION

```

* `MOVE 8000.00 TO WS-CAPITAL`: Le capital est de `8000.00` (ce qui est inférieur à 10 000).
* `MOVE "S" TO WS-TYPE-LIVRET`: Le livret est de type Standard (`"S"`).
* `MOVE "O" TO WS-DEROGATION`: **La nouveauté est ici !** La dérogation est passée à `"O"` (pour "Oui").

#### L'évaluation de la condition :

```cobol
    IF (WS-CAPITAL >= 10000
        AND WS-TYPE-LIVRET = "P")
        OR WS-DEROGATION = "O"
        DISPLAY "TRAITEMENT PRIORITAIRE"
    ELSE
        DISPLAY "TRAITEMENT STANDARD"
    END-IF
    STOP RUN.

```

* Analysons le test logique pas à pas :
1. **À l'intérieur des parenthèses** :
* `WS-CAPITAL >= 10000` -> `8000.00 >= 10000` est **FAUX**.
* `WS-TYPE-LIVRET = "P"` -> `"S" = "P"` est **FAUX**.
* Le `AND` donne donc globalement **FAUX**.


2. **À l'extérieur des parenthèses (avec le `OR`)** :
* Le bloc entre parenthèses est **FAUX**.
* `WS-DEROGATION = "O"` -> `"O" = "O"` est cette fois **VRAI**.
* Le `OR` exige qu'au moins un côté soit vrai : **FAUX OR VRAI donne globalement VRAI**.




* Puisque la condition globale est évaluée à **VRAI**, le programme entre dans la première branche.
* **Résultat à l'exécution** : Le programme affiche `TRAITEMENT PRIORITAIRE` à l'écran, malgré un capital insuffisant et un livret standard, grâce à la dérogation validée !

---

### Ce qu'il faut retenir :

Grâce au `OR`, il suffit qu'une seule des conditions globales soit remplie pour que le test soit validé. Ici, la dérogation `"O"` a sauvé le traitement prioritaire.

---------------------------------------------------

## DAY03-02D.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY03-02D.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
       01  WS-TYPE-LIVRET PIC X VALUE "S".
       01  WS-DEROGATION PIC X VALUE "N".
       PROCEDURE DIVISION.
           MOVE 8000.00 TO WS-CAPITAL
           MOVE "P" TO WS-TYPE-LIVRET
           MOVE "N" TO WS-DEROGATION
           IF (WS-CAPITAL >= 10000
               AND WS-TYPE-LIVRET = "P")
               OR WS-DEROGATION = "O"
               DISPLAY "TRAITEMENT PRIORITAIRE"
           ELSE
               DISPLAY "TRAITEMENT STANDARD"
           END-IF
           STOP RUN.
             
### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY03-02D`). Ce programme explore une autre combinaison de valeurs pour tester la robustesse de notre condition logique !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY03-02D.

```

* `PROGRAM-ID. DAY03-02D.`: Nomme le programme `DAY03-02D`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5)V99 VALUE 0.
01  WS-TYPE-LIVRET PIC X VALUE "S".
01  WS-DEROGATION PIC X VALUE "N".

```

* Les variables et leurs types restent inchangés.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    MOVE 8000.00 TO WS-CAPITAL
    MOVE "P" TO WS-TYPE-LIVRET
    MOVE "N" TO WS-DEROGATION

```

* `MOVE 8000.00 TO WS-CAPITAL`: Le capital est de `8000.00` (inférieur au seuil de 10 000).
* `MOVE "P" TO WS-TYPE-LIVRET`: Le type de livret est `"P"` (Privilège / Professionnel).
* `MOVE "N" TO WS-DEROGATION`: La dérogation est à `"N"` (Non).

#### L'évaluation de la condition :

```cobol
    IF (WS-CAPITAL >= 10000
        AND WS-TYPE-LIVRET = "P")
        OR WS-DEROGATION = "O"
        DISPLAY "TRAITEMENT PRIORITAIRE"
    ELSE
        DISPLAY "TRAITEMENT STANDARD"
    END-IF
    STOP RUN.

```

* Analysons le test logique pas à pas :
1. **À l'intérieur des parenthèses** :
* `WS-CAPITAL >= 10000` -> `8000.00 >= 10000` est **FAUX**.
* `WS-TYPE-LIVRET = "P"` -> `"P" = "P"` est **VRAI**.
* Le `AND` exige que les deux soient vrais : **FAUX AND VRAI donne globalement FAUX**.


2. **À l'extérieur des parenthèses (avec le `OR`)** :
* Le bloc entre parenthèses est **FAUX**.
* `WS-DEROGATION = "O"` -> `"N" = "O"` est **FAUX**.
* Le `OR` exige qu'au moins un côté soit vrai : **FAUX OR FAUX donne globalement FAUX**.




* Puisque la condition globale est **FAUX**, le programme bascule dans la branche **`ELSE`**.
* **Résultat à l'exécution** : Le programme affiche `TRAITEMENT STANDARD` à l'écran, car malgré le bon type de livret (`"P"`), le capital était insuffisant et aucune dérogation n'a été accordée.

---

### Ce qu'il faut retenir :

C'est le cas typique où un seul des deux critères obligatoires du groupe `AND` était réuni (le type `"P"`), mais cela ne suffit pas sans le capital minimum requis (ni sans dérogation).

---------------------------------------------------
---------------------------------------------------

# DAY04

##        IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-01.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TYPE-LIVRET PIC X VALUE "S".

       PROCEDURE DIVISION.
           EVALUATE WS-TYPE-LIVRET
               WHEN "P"
                   DISPLAY "LIVRET PREMIUM"
               WHEN "S"
                   DISPLAY "LIVRET STANDARD"
               WHEN OTHER
                   DISPLAY "TYPE DE LIVRET INCONNU"
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY04-01`), qui introduit une instruction extrêmement puissante et propre pour remplacer les `IF / ELSE IF` en cascade : **l'instruction `EVALUATE**`.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-01.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-01.`: Nomme le programme `DAY04-01`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-TYPE-LIVRET PIC X VALUE "S".

```

* `WORKING-STORAGE SECTION.`: Contient les variables de travail.
* `01 WS-TYPE-LIVRET PIC X VALUE "S".`: Déclare une variable alphanumérique d'un seul caractère (`PIC X`), initialisée avec la valeur `"S"`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE WS-TYPE-LIVRET
        WHEN "P"
            DISPLAY "LIVRET PREMIUM"
        WHEN "S"
            DISPLAY "LIVRET STANDARD"
        WHEN OTHER
            DISPLAY "TYPE DE LIVRET INCONNU"
    END-EVALUATE
    STOP RUN.

```

* `EVALUATE WS-TYPE-LIVRET`: **Nouvelle instruction clé !** C'est l'équivalent du `switch` ou `case` dans d'autres langages de programmation. Elle indique au programme de regarder la valeur contenue dans la variable `WS-TYPE-LIVRET` pour choisir quelle route emprunter.
* `WHEN "P"`: Premier cas. Si `WS-TYPE-LIVRET` vaut `"P"`...
* `DISPLAY "LIVRET PREMIUM"`: ...le programme affiche cette ligne. (Ici, c'est faux puisque notre variable vaut `"S"`).


* `WHEN "S"`: Deuxième cas. Si `WS-TYPE-LIVRET` vaut `"S"`...
* `DISPLAY "LIVRET STANDARD"`: ...le programme affiche cette ligne. C'est le cas qui correspond à notre valeur actuelle !


* `WHEN OTHER`: C'est le cas par défaut (le "sinon" général). Si la variable ne vaut ni `"P"` ni `"S"` (par exemple si elle contient `"X"` ou un espace), c'est cette branche qui s'exécute.
* `DISPLAY "TYPE DE LIVRET INCONNU"`: S'affiche si aucun autre `WHEN` n'a correspondu.


* `END-EVALUATE`: **Très important**, cette balise marque la fin de la structure `EVALUATE` (tout comme `END-IF` pour les `IF`).
* `STOP RUN.`: Termine l'exécution du programme.

---

### Résultat à l'exécution :

Puisque `WS-TYPE-LIVRET` a été initialisé à `"S"`, le programme va directement cibler le `WHEN "S"` et afficher :
`LIVRET STANDARD`

---

### Ce qu'il faut retenir :

L'instruction **`EVALUATE`** est idéale lorsque tu dois tester une même variable par rapport à de multiples valeurs possibles. Elle rend le code beaucoup plus lisible et facile à maintenir qu'une suite de `IF / ELSE`.

----------------------------------------------------

## DAY04-02.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CAPITAL PIC 9(5) VALUE 12000.
       01  WS-TYPE-LIVRET PIC X VALUE "P".
       01  WS-DEROGATION PIC X VALUE "N".

       PROCEDURE DIVISION.
           EVALUATE TRUE 
               WHEN WS-CAPITAL >= 10000
                    AND WS-TYPE-LIVRET = "P"
                    DISPLAY "LIVRET PRIORITAIRE"
               WHEN WS-DEROGATION = "O"
                    DISPLAY "TRAITEMENT PAR DEROGATION"
               WHEN OTHER
                    DISPLAY "TRAITEMENT STANDARD"
               END-EVALUATE

           STOP RUN.

### Explications
Voici l'analyse détaillée de ce programme (`DAY04-02`), qui présente une technique COBOL extrêmement puissante et astucieuse : **l'utilisation de `EVALUATE TRUE**`.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-02.

```

* `PROGRAM-ID. DAY04-02.`: Nomme le programme `DAY04-02`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01  WS-CAPITAL PIC 9(5) VALUE 12000.
01  WS-TYPE-LIVRET PIC X VALUE "P".
01  WS-DEROGATION PIC X VALUE "N".

```

* `01 WS-CAPITAL PIC 9(5) VALUE 12000.`: Déclare une variable numérique entière de 5 chiffres (sans décimales ici, contrairement aux `PIC 9(5)V99` précédents), initialisée à **`12000`**.
* `01 WS-TYPE-LIVRET PIC X VALUE "P".`: Variable alphanumérique d'un caractère, initialisée à **`"P"`**.
* `01 WS-DEROGATION PIC X VALUE "N".`: Variable alphanumérique d'un caractère, initialisée à **`"N"`**.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE 
        WHEN WS-CAPITAL >= 10000
             AND WS-TYPE-LIVRET = "P"
             DISPLAY "LIVRET PRIORITAIRE"
        WHEN WS-DEROGATION = "O"
             DISPLAY "TRAITEMENT PAR DEROGATION"
        WHEN OTHER
             DISPLAY "TRAITEMENT STANDARD"
    END-EVALUATE
    STOP RUN.

```

#### Le mécanisme magique de `EVALUATE TRUE` :

Habituellement, un `EVALUATE` teste une variable fixe (comme dans l'exemple précédent avec `EVALUATE WS-TYPE-LIVRET`). Mais en écrivant **`EVALUATE TRUE`**, tu demandes au programme : *"Examine les lignes `WHEN` une par une, et exécute le bloc de la première condition qui s'avère être **VRAIE** (`TRUE`)"*.

C'est l'équivalent parfait et ultra-propre d'une structure de type `IF / ELSE IF / ELSE`.

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN WS-CAPITAL >= 10000 AND WS-TYPE-LIVRET = "P"`)** :
* `WS-CAPITAL` (12000) `>= 10000` -> **VRAI**.
* `WS-TYPE-LIVRET` ("P") `= "P"` -> **VRAI**.
* `VRAI AND VRAI` donne globalement **VRAI**.
* *Résultat* : La condition est remplie dès le premier test ! Le programme exécute immédiatement `DISPLAY "LIVRET PRIORITAIRE"`.


2. **Les autres cas (`WHEN WS-DEROGATION = "O"` et `WHEN OTHER`)** :
* Comme un `EVALUATE` s'arrête dès qu'un `WHEN` est validé, ces cas suivants sont complètement ignorés.


3. `END-EVALUATE`: Ferme la structure de choix.
4. `STOP RUN.`: Arrête le programme.

---

### Ce qu'il faut retenir :

L'astuce **`EVALUATE TRUE`** est très prisée par les développeurs COBOL. Elle permet de remplacer des cascades de `IF / ELSE IF` complexes tout en gardant un code parfaitement aligné, lisible et facile à modifier.

------------------------------------------------

## DAY04-03.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-03.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 12000.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-03.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 12000.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

---------------------------------------------------

## DAY04-03B.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-03B.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE -100.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications 

Voici l'analyse détaillée de cette variante (`DAY04-03B`), qui met en scène l'impact direct d'une valeur négative sur notre structure `EVALUATE TRUE`.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-03B.

```

* `PROGRAM-ID. DAY04-03B.`: Nomme le programme `DAY04-03B`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE -100.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE -100.`: Grâce au `S` (signed), cette variable numérique peut stocker des nombres négatifs. Ici, elle est initialisée à **`-100`** (ou `-100.00`).
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique initialisée à `'P'`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (-100) est inférieur à 0.
* Le test est **VRAI** (puisque `-100` est bien inférieur à `0`).
* *Résultat* : Le programme s'arrête immédiatement sur ce premier test et exécute `DISPLAY 'ERREUR : CAPITAL INVALIDE'`.


2. **Les cas suivants (`WHEN CAPITAL >= 10000...` et `WHEN OTHER`)** :
* Sont totalement ignorés, car le programme a déjà trouvé une correspondance valide et sort de l'évaluation.


3. `END-EVALUATE`: Clôt la structure.
4. `STOP RUN.`: Arrête le programme.

---

### Ce qu'il faut retenir :

L'ordre des `WHEN` dans un `EVALUATE TRUE` (ou des `IF / ELSE IF`) est crucial. En plaçant la vérification d'erreur (`CAPITAL < 0`) en tout premier, le programme intercepte les anomalies avant de faire des calculs ou d'appliquer des règles de gestion normales.

-------------------------------------------------

## DAY04-03C.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-03C.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 5000.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-03C`). C'est un cas très intéressant pour voir comment le programme réagit lorsqu'une caractéristique est bonne (le type de livret) mais que l'autre est insuffisante (le capital).

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-03C.

```

* `PROGRAM-ID. DAY04-03C.`: Nomme le programme `DAY04-03C`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE 5000.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE 5000.`: Variable numérique signée, initialisée à **`5000`** (ou `5000.00`).
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique initialisée à `'P'` (pour "Premium").

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (5000) est inférieur à 0.
* Le test est **FAUX** (5000 est positif).


2. **Deuxième cas (`WHEN CAPITAL >= 10000 AND TYPE-LIVRET = 'P'`)** :
* `CAPITAL >= 10000` -> `5000 >= 10000` est **FAUX**.
* `TYPE-LIVRET = 'P'` -> `'P' = 'P'` est **VRAI**.
* Le `AND` exige que les deux conditions soient vraies : **FAUX AND VRAI donne globalement FAUX**.


3. **Troisième cas (`WHEN OTHER`)** :
* Puisque les deux premiers tests ont échoué, le programme se rabat sur le cas par défaut.
* *Résultat* : Le programme exécute cette branche et affiche **`LIVRET STANDARD`**.


4. `END-EVALUATE`: Clôt la structure.
5. `STOP RUN.`: Arrête le programme.

---

### Ce qu'il faut retenir :

Même si le client avait le bon type de livret (`'P'`), son capital de **5 000** était inférieur au seuil requis de **10 000**. Le programme a donc logiquement basculé vers le statut **`LIVRET STANDARD`**.

---------------------------------------------------

## DAY04-04A.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04A.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 0.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-04A`). C'est un cas très intéressant où le capital de départ est à zéro, ce qui permet de tester le comportement du programme face à une valeur neutre ou nulle.

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04A.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-04A.`: Nomme le programme `DAY04-04A`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE 0.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE 0.`: Variable numérique signée, initialisée à **`0`** (ou `0.00`).
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique d'un caractère, initialisée à `'P'`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (0) est inférieur à 0.
* Le test est **FAUX** (0 n'est pas strictement inférieur à 0).


2. **Deuxième cas (`WHEN CAPITAL >= 10000 AND TYPE-LIVRET = 'P'`)** :
* `CAPITAL >= 10000` -> `0 >= 10000` est **FAUX**.
* `TYPE-LIVRET = 'P'` -> `'P' = 'P'` est **VRAI**.
* Le `AND` exige que les deux conditions soient vraies : **FAUX AND VRAI donne globalement FAUX**.


3. **Troisième cas (`WHEN OTHER`)** :
* Puisque les deux premiers tests ont échoué, le programme se rabat sur le cas par défaut.
* *Résultat* : Le programme exécute cette branche et affiche **`LIVRET STANDARD`**.


4. `END-EVALUATE`: Clôt la structure conditionnelle.
5. `STOP RUN.`: Arrête l'exécution du programme.

---

### Ce qu'il faut retenir :

Même si le livret était indiqué comme étant de type `'P'`, le capital de départ fixé à **0** n'a pas atteint le seuil requis de **10 000**. Le programme a donc logiquement basculé vers le statut **`LIVRET STANDARD`**.

--------------------------------------------------

## DAY04-04B.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04B.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 9999.99.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-04B`). C'est un cas d'école absolument parfait pour illustrer la précision chirurgicale des ordinateurs en programmation financière !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04B.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-04B.`: Nomme le programme `DAY04-04B`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE 9999.99.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE 9999.99.`: Variable numérique signée, initialisée à **`9999.99`** (il manque littéralement un tout petit centime pour atteindre la barre fatidique des 10 000).
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique d'un caractère, initialisée à `'P'` (pour "Premium").

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (9999.99) est inférieur à 0.
* Le test est **FAUX** (le montant est positif).


2. **Deuxième cas (`WHEN CAPITAL >= 10000 AND TYPE-LIVRET = 'P'`)** :
* `CAPITAL >= 10000` -> `9999.99 >= 10000` est **FAUX** (en COBOL, comme en mathématiques, 9999.99 est strictement inférieur à 10000).
* `TYPE-LIVRET = 'P'` -> `'P' = 'P'` est **VRAI**.
* Le `AND` exige que les deux conditions soient réunies : **FAUX AND VRAI donne globalement FAUX**.


3. **Troisième cas (`WHEN OTHER`)** :
* Puisque les conditions précédentes n'ont pas été remplies, le programme bascule sur le cas par défaut.
* *Résultat* : Le programme exécute cette branche et affiche **`LIVRET STANDARD`**.


4. `END-EVALUATE`: Clôt la structure conditionnelle.
5. `STOP RUN.`: Arrête l'exécution du programme.

---

### Ce qu'il faut retenir :

C'est un exemple classique de **rigueur informatique**. Malgré un type de livret parfaitement éligible (`'P'`) et un capital extrêmement proche de la limite, la règle stricte du `>= 10000` fait que le compte bascule en `LIVRET STANDARD` pour un seul petit centime manquant !

-------------------------------------------------

## DAY04-04C.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04C.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 10000.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-04C`). C'est le pendant exact du cas précédent : cette fois, le capital atteint **exactement** la limite requise !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04C.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-04C.`: Nomme le programme `DAY04-04C`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE 10000.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE 10000.`: Variable numérique signée, initialisée exactement à **`10000`** (ou `10000.00`).
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique d'un caractère, initialisée à `'P'`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (10000) est inférieur à 0.
* Le test est **FAUX**.


2. **Deuxième cas (`WHEN CAPITAL >= 10000 AND TYPE-LIVRET = 'P'`)** :
* `CAPITAL >= 10000` -> `10000 >= 10000` est cette fois **VRAI** (grâce au signe `>=` qui inclut l'égalité).
* `TYPE-LIVRET = 'P'` -> `'P' = 'P'` est **VRAI**.
* Le `AND` exige que les deux conditions soient réunies : **VRAI AND VRAI donne globalement VRAI**.
* *Résultat* : La condition est validée ! Le programme exécute immédiatement cette branche et affiche **`LIVRET PREMIUM`**.


3. **Les cas suivants** :
* Sont totalement ignorés puisque le programme a trouvé une correspondance et sort de l'évaluation.


4. `END-EVALUATE`: Clôt la structure conditionnelle.
5. `STOP RUN.`: Arrête l'exécution du programme.

---

### Ce qu'il faut retenir :

Contrairement au cas précédent où il manquait un centime, atteindre **exactement** le seuil de **10 000** (associé au bon type de livret) permet de débloquer le statut **`LIVRET PREMIUM`**. L'opérateur `>=` prend bien en compte la valeur seuil elle-même.

-------------------------------------------------

## DAY04-04D.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04D.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 10000.01.
       01 TYPE-LIVRET   PIC X VALUE 'S'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-04D`). Ce cas est particulièrement intéressant car il montre une situation où le capital est largement suffisant, mais où le type de livret bloque l'accès au statut supérieur !

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04D.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-04D.`: Nomme le programme `DAY04-04D`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE 10000.01.
01 TYPE-LIVRET   PIC X VALUE 'S'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE 10000.01.`: Variable numérique signée, initialisée à **`10000.01`** (juste un centime au-dessus du seuil requis).
* `01 TYPE-LIVRET PIC X VALUE 'S'.`: Variable alphanumérique d'un caractère, initialisée à **`'S'`** (pour "Standard").

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (10000.01) est inférieur à 0.
* Le test est **FAUX** (le montant est positif).


2. **Deuxième cas (`WHEN CAPITAL >= 10000 AND TYPE-LIVRET = 'P'`)** :
* `CAPITAL >= 10000` -> `10000.01 >= 10000` est **VRAI**.
* `TYPE-LIVRET = 'P'` -> `'S' = 'P'` est **FAUX**.
* Le `AND` exige que **toutes** les conditions soient vraies pour valider le bloc : **VRAI AND FAUX donne globalement FAUX**. Le test échoue donc.


3. **Troisième cas (`WHEN OTHER`)** :
* Puisque les conditions précédentes n'ont pas été remplies, le programme bascule automatiquement sur le cas par défaut.
* *Résultat* : Le programme exécute cette branche et affiche **`LIVRET STANDARD`**.


4. `END-EVALUATE`: Clôt la structure conditionnelle.
5. `STOP RUN.`: Arrête l'exécution du programme.

---

### Ce qu'il faut retenir :

C'est un excellent exemple de la rigueur des conditions combinées avec un `AND` : même avec un capital supérieur à 10 000, le fait d'avoir un type de livret `'S'` (Standard) au lieu de `'P'` empêche d'obtenir le statut Premium. Les deux critères devaient impérativement être réunis.

-------------------------------------------------

## DAY04-04E.cbl

       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04E.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE -0.01.
       01 TYPE-LIVRET   PIC X VALUE 'P'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.

### Explications

Voici l'analyse détaillée de cette nouvelle variante (`DAY04-04E`). C'est un cas très parlant pour voir comment le programme réagit face à un tout petit découvert négatif (un seul centime de moins que zéro).

---

### 1. La Division d'Identification

```cobol
IDENTIFICATION DIVISION.
PROGRAM-ID. DAY04-04E.

```

* `IDENTIFICATION DIVISION.`: Démarre la division d'identification.
* `PROGRAM-ID. DAY04-04E.`: Nomme le programme `DAY04-04E`.

---

### 2. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL       PIC S9(7)V99 VALUE -0.01.
01 TYPE-LIVRET   PIC X VALUE 'P'.

```

* `01 CAPITAL PIC S9(7)V99 VALUE -0.01.`: Variable numérique signée, initialisée à **`-0.01`** (un compte légèrement débiteur d'un centime). Grâce au `S`, le programme gère parfaitement ce signe moins.
* `01 TYPE-LIVRET PIC X VALUE 'P'.`: Variable alphanumérique d'un caractère, initialisée à `'P'`.

---

### 3. La Division de la Procédure (Procedure Division)

```cobol
PROCEDURE DIVISION.
    EVALUATE TRUE
        WHEN CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'

        WHEN CAPITAL >= 10000
         AND TYPE-LIVRET = 'P'
            DISPLAY 'LIVRET PREMIUM'

        WHEN OTHER
            DISPLAY 'LIVRET STANDARD'
    END-EVALUATE

    STOP RUN.

```

#### Le déroulement pas à pas :

1. **Premier cas (`WHEN CAPITAL < 0`)** :
* Vérifie si `CAPITAL` (-0.01) est inférieur à 0.
* Le test est **VRAI** (puisque `-0.01` est bien en dessous de zéro).
* *Résultat* : Le programme valide immédiatement cette première condition, affiche **`ERREUR : CAPITAL INVALIDE`**, et s'arrête net dans son évaluation.


2. **Les cas suivants** :
* Sont totalement ignorés puisque le programme a trouvé sa correspondance dès le premier `WHEN`.


3. `END-EVALUATE`: Clôt la structure conditionnelle.
4. `STOP RUN.`: Arrête l'exécution du programme.

---

### Ce qu'il faut retenir :

Même si le type de livret était configuré sur `'P'`, la règle de sécurité placée en tout premier (`WHEN CAPITAL < 0`) intercepte immédiatement toute valeur négative, empêchant ainsi le compte de basculer en mode premium ou standard alors qu'il est à découvert.

---------------------------------------------------

## DAY04-05.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-05.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL-TEXTE PIC X(12).
       01 CAPITAL      PIC S9(7)V99.
       01 TYPE-LIVRET  PIC X.

       PROCEDURE DIVISION.
           DISPLAY 'CAPITAL DU CLIENT (ex. 12000 ou -0.01) : '
               WITH NO ADVANCING
           ACCEPT CAPITAL-TEXTE

           IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
               DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
           ELSE
               COMPUTE CAPITAL =
                   FUNCTION NUMVAL(CAPITAL-TEXTE)

               DISPLAY 'TYPE DE LIVRET (P/S) : '
                   WITH NO ADVANCING
               ACCEPT TYPE-LIVRET

               EVALUATE TRUE
                   WHEN CAPITAL < 0
                       DISPLAY 'ERREUR : CAPITAL INVALIDE'

                   WHEN CAPITAL >= 10000
                    AND TYPE-LIVRET = 'P'
                       DISPLAY 'LIVRET PREMIUM'

                   WHEN OTHER
                       DISPLAY 'LIVRET STANDARD'
               END-EVALUATE
           END-IF

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY04-05`), qui franchit une étape majeure : **le programme devient enfin interactif** et gère la saisie de l'utilisateur en temps réel tout en se protégeant contre les erreurs de frappe !

---

## 1. La Division des Données (Data Division)

```data
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL-TEXTE PIC X(12).
01 CAPITAL       PIC S9(7)V99.
01 TYPE-LIVRET   PIC X.

```

* **`CAPITAL-TEXTE PIC X(12).`** : Une variable alphanumérique de 12 caractères. **Pourquoi du texte ?** Lorsqu'un utilisateur tape quelque chose au clavier, on le récupère d'abord sous forme de texte brut pour éviter que le programme ne plante si l'utilisateur saisit des lettres au lieu de chiffres.
* **`CAPITAL` et `TYPE-LIVRET**` : Nos variables de travail habituelles pour stocker le montant converti et le type de livret.

---

## 2. La Saisie Interactive et la Validation

```cobol
PROCEDURE DIVISION.
    DISPLAY 'CAPITAL DU CLIENT (ex. 12000 ou -0.01) : '
        WITH NO ADVANCING
    ACCEPT CAPITAL-TEXTE

```

* **`WITH NO ADVANCING`** : Cette option très utile évite que le curseur ne saute à la ligne suivante après l'affichage du texte. L'utilisateur peut ainsi taper sa réponse juste à côté de la question.
* **`ACCEPT CAPITAL-TEXTE`** : Met le programme en pause et attend que l'utilisateur tape une valeur au clavier et appuie sur Entrée.

### Le test de validité du texte :

```cobol
    IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
        DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
    ELSE
        COMPUTE CAPITAL =
            FUNCTION NUMVAL(CAPITAL-TEXTE)

```

* **`FUNCTION TEST-NUMVAL(...)`** : Une fonction intrinsèque COBOL ultra-pratique. Elle analyse le texte saisi. Si elle renvoie `0`, le texte est un nombre valide. S'il renvoie autre chose (comme `1`), cela signifie que le texte contient des caractères invalides (des lettres, des symboles bizarres, etc.).
* **`FUNCTION NUMVAL(...)`** : Si le texte est valide, cette fonction convertit le texte brut en une véritable valeur numérique exploitable par les calculs, que l'on stocke dans notre variable `CAPITAL` via l'instruction **`COMPUTE`**.

---

## 3. La Suite du Traitement et l'Évaluation

```cobol
        DISPLAY 'TYPE DE LIVRET (P/S) : '
            WITH NO ADVANCING
        ACCEPT TYPE-LIVRET

        EVALUATE TRUE
            WHEN CAPITAL < 0
                DISPLAY 'ERREUR : CAPITAL INVALIDE'

            WHEN CAPITAL >= 10000
             AND TYPE-LIVRET = 'P'
                DISPLAY 'LIVRET PREMIUM'

            WHEN OTHER
                DISPLAY 'LIVRET STANDARD'
        END-EVALUATE
    END-IF

    STOP RUN.

```

* Une fois le capital validé et converti, le programme demande le type de livret (`P` ou `S`) via un nouvel `ACCEPT`.
* Il applique ensuite exactement la même structure **`EVALUATE TRUE`** que nous avons vue dans les programmes précédents pour afficher le résultat (`LIVRET PREMIUM`, `LIVRET STANDARD` ou une erreur si le capital est négatif).
* L'ensemble de ce bloc est protégé par un grand `IF ... ELSE ... END-IF` lié au contrôle de saisie initial.

---

### Ce qu'il faut retenir :

Ce programme introduit la robustesse indispensable aux applications professionnelles : **ne jamais faire confiance à l'utilisateur**. Grâce à `TEST-NUMVAL` et `NUMVAL`, le programme sait transformer une saisie clavier libre en données financières sécurisées.

-------------------------------------------------

### DAY04-06.cbl


       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-06.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL-TEXTE PIC X(12).
       01 CAPITAL      PIC S9(7)V99.
       01 TYPE-LIVRET  PIC X.

       PROCEDURE DIVISION.
           DISPLAY 'CAPITAL DU CLIENT : '
               WITH NO ADVANCING
           ACCEPT CAPITAL-TEXTE

           IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
               DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
           ELSE
               COMPUTE CAPITAL =
                   FUNCTION NUMVAL(CAPITAL-TEXTE)

               IF CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'
               ELSE
                   DISPLAY 'TYPE DE LIVRET (P/S) : '
                       WITH NO ADVANCING
                   ACCEPT TYPE-LIVRET

                   EVALUATE TRUE
                       WHEN TYPE-LIVRET NOT = 'P'
                        AND TYPE-LIVRET NOT = 'S'
                           DISPLAY 'ERREUR : TYPE INCONNU'

                       WHEN CAPITAL >= 10000
                        AND TYPE-LIVRET = 'P'
                           DISPLAY 'LIVRET PREMIUM'

                       WHEN OTHER
                           DISPLAY 'LIVRET STANDARD'
                   END-EVALUATE
               END-IF
           END-IF

           STOP RUN.

### Explications

Voici l'analyse détaillée de ce programme (`DAY04-06`). Cette version franchit une nouvelle étape en matière de robustesse en ajoutant un contrôle de saisie **sur le type de livret**, évitant ainsi qu'une lettre incorrecte ne fausse le traitement !

---

### 1. La Division des Données (Data Division)

```cobol
DATA DIVISION.
WORKING-STORAGE SECTION.
01 CAPITAL-TEXTE PIC X(12).
01 CAPITAL       PIC S9(7)V99.
01 TYPE-LIVRET   PIC X.

```

* Les variables restent les mêmes : une variable textuelle pour la saisie sécurisée du capital, le capital numérique converti, et un caractère pour le type de livret.

---

### 2. La Division de la Procédure (Procedure Division)

Le programme enchaîne les vérifications de manière imbriquée pour s'assurer que chaque donnée est valide avant de prendre une décision :

```cobol
PROCEDURE DIVISION.
    DISPLAY 'CAPITAL DU CLIENT : '
        WITH NO ADVANCING
    ACCEPT CAPITAL-TEXTE

    IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
        DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
    ELSE
        COMPUTE CAPITAL =
            FUNCTION NUMVAL(CAPITAL-TEXTE)

        IF CAPITAL < 0
            DISPLAY 'ERREUR : CAPITAL INVALIDE'
        ELSE
            DISPLAY 'TYPE DE LIVRET (P/S) : '
                WITH NO ADVANCING
            ACCEPT TYPE-LIVRET

```

* **Premier niveau de sécurité** : On vérifie que le capital est bien numérique (`TEST-NUMVAL`), puis on le convertit.
* **Deuxième niveau de sécurité** : On vérifie qu'il n'est pas négatif (`CAPITAL < 0`).
* Si tout est correct, le programme demande enfin de saisir le type de livret (`ACCEPT TYPE-LIVRET`).

---

### 3. L'Évaluation Élargie avec `EVALUATE TRUE`

```cobol
            EVALUATE TRUE
                WHEN TYPE-LIVRET NOT = 'P'
                 AND TYPE-LIVRET NOT = 'S'
                    DISPLAY 'ERREUR : TYPE INCONNU'

                WHEN CAPITAL >= 10000
                 AND TYPE-LIVRET = 'P'
                    DISPLAY 'LIVRET PREMIUM'

                WHEN OTHER
                    DISPLAY 'LIVRET STANDARD'
            END-EVALUATE
        END-IF
    END-IF

    STOP RUN.

```

* **La nouveauté clé se trouve dans le premier `WHEN**` :
* Le programme vérifie si le type saisi n'est ni `'P'` ni `'S'` (grâce au `AND`).
* Si l'utilisateur tape par exemple `"X"` ou `"A"`, le programme intercepte immédiatement l'erreur et affiche `ERREUR : TYPE INCONNU`.


* **Le reste de l'évaluation** : Si le type est valide, il applique ensuite la règle du `LIVRET PREMIUM` ou se rabat sur `LIVRET STANDARD` (`WHEN OTHER`).
* Les blocs `END-IF` successifs ferment proprement les différentes structures conditionnelles imbriquées avant le `STOP RUN.`.

---

### Ce qu'il faut retenir :

Ce programme est un modèle complet de **validation des données utilisateur** (contrôle de type numérique, contrôle de cohérence des valeurs, et gestion des erreurs de saisie). C'est exactement de cette façon que l'on sécurise les interfaces dans les systèmes professionnels.

--------------------------------------------------
