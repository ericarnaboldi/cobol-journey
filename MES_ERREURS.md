# MES ERREURS

### Dimanche 27 Sept 2026

Depuis que tu as créé le dépôt GitHub, ton terminal est à la racine `C:\Users\Eric\cobol-journey`, alors que `HELLO.cbl` est rangé dans le sous-dossier `kit`.

Ton dossier est organisé ainsi :
    cobol-journey\          ← ton dépôt GitHub (README, JOURNAL, .gitignore)
    └── kit\                ← le kit de référence (HELLO.cbl, RELEVE.cbl…)

Tu as deux possibilités.

**Pour voir le fichier dans l'éditeur**, et vérifier tes lignes verticales, pas besoin du terminal. Dans le panneau de gauche de VS Code, clique sur le dossier `kit` pour le déplier, puis sur `HELLO.cbl`. Tu peux aussi taper :
    code kit\HELLO.cbl

**Pour le compiler**, entre d'abord dans le dossier :
    cd kit
    cobc -x HELLO.cbl
    ./HELLO

Ouvrir un fichier (le lire et le modifier dans l'éditeur) et le compiler (le transformer en programme avec `cobc`) sont deux gestes différents. Pour le compiler, le terminal doit se trouver dans le même dossier que le fichier. Pense à regarder le chemin affiché devant `>` avant de taper une commande : c'est ta position.



#### Donc "cd" consiste à descendre dans un dossier. Et pour remonter ?

Presque : `cd` signifie « change directory », changer de dossier. Il sert à aller n'importe où, vers le bas comme vers le haut. Tout dépend de ce que tu écris après.

| Commande                         | Effet                                                              |
| -------------------------------- | ------------------------------------------------------------------ |
| `cd kit`                         | Descendre dans le sous-dossier `kit`                               |
| `cd ..`                          | Remonter d'un niveau (les deux points désignent le dossier parent) |
| `cd ..\..`                       | Remonter de deux niveaux                                           |
| `cd C:\Users\Eric\cobol-journey` | Aller directement à ce dossier, où que tu sois                     |
| `cd ~`                           | Revenir à ton dossier personnel, `C:\Users\Eric`                   |
| `pwd`                            | Afficher où tu te trouves (« print working directory »)            |

Exemple depuis ta racine :
    PS C:\Users\Eric\cobol-journey> cd kit
    PS C:\Users\Eric\cobol-journey\kit> cd ..
    PS C:\Users\Eric\cobol-journey>

Deux astuces qui te feront gagner du temps :

* **La touche Tab complète les noms.** Tape `cd k` puis Tab, et PowerShell écrit `.\kit` tout seul. Ça évite aussi les fautes de frappe.
* **Les flèches haut et bas** rappellent les commandes déjà tapées, pratique pour relancer `cobc -x …` après une correction.

Ces commandes te serviront aussi sur le mainframe. En phase 2, la partie Unix de z/OS (USS) utilise exactement les mêmes : `cd ..`, `pwd`, `ls`.



Au passage, tu connais maintenant le trio de base pour te déplacer : `pwd` (où suis-je ?), `ls` (qu'y a-t-il ici ?), `cd` (aller ailleurs).



#### Réglages VS Code

on peut le rendre beaucoup plus confortable pour le COBOL. Ouvre ton fichier de réglages (Ctrl+Maj+P, puis « Préférences : Ouvrir les paramètres utilisateur (JSON) ») et remplace son contenu par ceci. Si tu y avais déjà d'autres lignes, garde-les en respectant les virgules.

{
    "editor.rulers": [6, 7, 11, 72],
    "editor.fontFamily": "Cascadia Mono, Consolas",
    "editor.fontSize": 16,
    "editor.renderWhitespace": "all",
    "editor.minimap.enabled": false,
    "editor.wordWrap": "off",
    "files.autoSave": "afterDelay"
}

| Réglage            | Ce qu'il t'apporte                                                                             |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| `rulers`           | Les lignes verticales des zones COBOL                                                          |
| `fontFamily`       | Une police à chasse fixe, où le zéro et la lettre O se distinguent                             |
| `fontSize`         | Des caractères plus grands (ajuste à ton goût)                                                 |
| `renderWhitespace` | Chaque espace s'affiche comme un petit point : tu vois exactement dans quelle colonne tu tapes |
| `minimap`          | Supprime la miniature du code à droite, inutile ici                                            |
| `wordWrap`         | Pas de retour à la ligne automatique, qui fausserait les colonnes                              |
| `autoSave`         | Enregistre tout seul : plus de compilation d'une version pas enregistrée                       |

Trois gestes utiles en plus :

* **Ctrl+plus et Ctrl+moins** zooment toute la fenêtre.
* **Ctrl+K puis Z** active le mode Zen : l'écran ne montre que ton code. Échap deux fois pour en sortir.
* **Thème clair ou sombre** : Fichier › Préférences › Thème › Thème de couleur. Choisis ce qui fatigue le moins tes yeux.

----------

### Lundi 28 Sept 2026

Bonne nouvelle : tes dix erreurs n'ont que deux causes, et ce sont justement deux des trois pièges que je t'avais annoncés. Ta structure de données est juste ; il manque un point et une ligne est trop longue.

**Règle d'or : corrige toujours la première erreur, puis recompile.** Une seule faute en début de programme peut provoquer une cascade d'erreurs qui n'en sont pas.

### Cause 1 : le point oublié ligne 8

cobol
           01 WS-CLIENT

Il manque le point final. Le compilateur croit alors que la déclaration de `WS-CLIENT` continue sur la ligne 9. Il ne comprend plus rien à `05 WS-NOM`, ni à toutes les zones suivantes : d'où les sept erreurs « level number must begin with 01 or 77 ». Puis, comme aucune zone n'a été créée, il ne connaît plus `WS-NOM`, `WS-CLIENT`… Un seul point manquant, huit erreurs. Corrige ainsi :

obol
           01 WS-CLIENT.

### Cause 2 : la ligne 20 dépasse la colonne 72

Ton `DISPLAY` commence en colonne 15 et se termine en colonne 77. Tout ce qui dépasse la colonne 72 est ignoré : le compilateur ne voit que `WS-` au lieu de `WS-ANNEE`, d'où « 'WS' is not defined ». Ta 4e ligne verticale sert exactement à ça. Coupe l'instruction en deux lignes :

cobol
                  DISPLAY 'DATE DE NAISSANCE : ' WS-JOUR '/' WS-MOIS '/'
                          WS-ANNEE

Une instruction COBOL peut continuer sur la ligne suivante sans rien de spécial, tant qu'elle reste en zone B.

### L'avertissement, ligne 23

« line not terminated by a newline » : il manque un retour à la ligne après `GOBACK.`. Place-toi à la fin de la ligne et appuie sur Entrée. Pour ne plus y penser, ajoute ce réglage dans ton `settings.json` (n'oublie pas la virgule sur la ligne précédente) :

json
        "files.insertFinalNewline": true

### Pourquoi `./FICHE` ne marche pas

La compilation a échoué, donc aucun `FICHE.exe` n'a été créé. Relance `cobc -x FICHE.cbl`. Quand elle ne répond rien, c'est que tout va bien, et `./FICHE` fonctionnera.

### Deux conseils de style, sans erreur de ta part

1. **Un seul point à la fin du paragraphe.** Tu mets un point après presque chaque `DISPLAY` : c'est légal, mais les équipes l'évitent. Plus tard, un point oublié au milieu d'un `IF` le termine sans prévenir, un bug classique. Garde seulement celui après `GOBACK`.
2. **Les dates en AAAAMMJJ.** Tu as déclaré jour, mois, année : ça fonctionne. Mais en banque, on stocke les dates dans l'ordre année, mois, jour, parce qu'un tri sur ce champ range alors les dates dans l'ordre chronologique. On ne les remet en JJ/MM/AAAA qu'à l'affichage. Tu peux inverser l'ordre de tes trois zones `10`.



Une autre erreur se cache : PS C:\Users\Eric\cobol-journey\exercices> cobc -x FICHE.cbl  
FICHE.cbl:24: warning: line not terminated by a newline [-Wmissing-newline]  
22 | DISPLAY 'LE GROUPE : [' WS-CLIENT ']'.  
23 | DISPLAY LENGTH OF WS-CLIENT.  
24 > GOBACK.<EOF>



Ce n'est plus une erreur, seulement un avertissement (`warning`), et c'est une vraie progression : tes deux corrections ont fonctionné. La nuance est importante :

* une **erreur** (`error`) empêche la création du programme : pas de `.exe` ;
* un **avertissement** (`warning`) signale un détail, mais le programme est bien créé.

Tu peux donc déjà lancer `./FICHE`.

Pour faire disparaître l'avertissement : dans VS Code, clique à la fin de la ligne `GOBACK.`, appuie sur Entrée pour créer une ligne vide après, enregistre avec Ctrl+S et recompile. `cobc` ne doit plus rien afficher du tout, c'est le critère de réussite de l'exercice.

Si l'avertissement revient malgré tout, c'est que le fichier n'a pas été enregistré avant la compilation : vérifie qu'il n'y a pas de point blanc sur l'onglet de `FICHE.cbl` en haut de l'éditeur. Le réglage `files.insertFinalNewline` évitera le problème pour tes prochains fichiers.

Ensuite, lance `./FICHE` et compare la longueur affichée avec ta prédiction.



#### Trois détails pour que ce soit parfait :

1. **La ligne de suite.** `WS-ANNEE.` commence dans la même colonne que les `DISPLAY` : c'est légal, mais on croirait lire une nouvelle instruction. Décale-la sous la première valeur, pour montrer qu'elle continue la ligne du dessus.
2. **La colonne des instructions.** Les tiennes commencent en colonne 15. C'est légal aussi, mais la convention est la colonne 12, juste après ta 3e ligne verticale. Tu retrouveras cette mise en page dans tous les programmes que tu liras en entreprise.
3. **`PROCEDURE DIVISION.`** apparaît collé à gauche dans ton message, sûrement à cause du copier-coller. Dans ton fichier, il doit rester en colonne 8, sinon le compilateur ignore le début du mot.



Il reste trois retouches mineures, si tu veux un fichier irréprochable :

1. **Lignes 22 et 23** : aligne-les comme les autres, par exemple `'LE GROUPE : ['` et `'LONGUEUR : '` devant `LENGTH OF WS-CLIENT`. Pour l'instant, la longueur s'affiche seule, sans étiquette : `58`.
2. **Lignes 3 et 5** : tes lignes de tirets vont jusqu'à la colonne 73. Sans conséquence, puisque c'est un commentaire et que tout ce qui suit la colonne 72 est ignoré. Mais enlève un tiret pour qu'elles s'arrêtent sur ta 4e ligne verticale.
3. **Ligne 4** : remplace `MODELE` par `EXERCICE 1 - FICHE CLIENT`. C'est ton programme, pas un modèle.

Les points après chaque `DISPLAY` restent légaux ; tu les retireras quand tu écriras des `IF`, en semaine 2.



#### Journal non-mis à jour dans GitHub

Le point de `git add .` explique tout : il désigne le dossier courant, comme dans `cd ..`. Tu étais dans `exercices`, donc Git n'a regardé que ce dossier. Ton journal est un étage plus haut, et Git te le signale : `modified: ../JOURNAL.md`, le `../` voulant dire « dans le dossier parent ». Comme rien n'avait été sélectionné, le commit n'a rien enregistré, et le push n'avait rien à envoyer.

Remonte à la racine et recommence :
    cd ..
    git add .
    git commit -m "Journal : semaine 1, FICHE.cbl"
    git push

Cette fois, le commit doit afficher `1 file changed`, et le push se terminer par `main -> main`.

Pour ne plus te faire piéger, deux habitudes au choix :

* **Toujours faire tes commits depuis la racine**, `C:\Users\Eric\cobol-journey`. Regarde ton invite avant de taper.
* **Utiliser `git add -A`** à la place de `git add .` : il sélectionne tous les changements du dépôt, quel que soit le dossier où tu te trouves.

Ton réflexe était le bon, d'ailleurs : tu as vérifié sur GitHub au lieu de supposer que c'était fait.

### Lundi 28 Sept 2026 - 23h59
Une seule cause, encore une fois : l'emplacement du point. Tu l'as mis juste après le nom de la zone, au lieu de le mettre à la fin de la déclaration.

cobol
       01  WS-Z4.            PIC 9(4)

Pour le compilateur, le point veut dire « fin de la déclaration ». Il lit donc « une zone WS-Z4, sans PICTURE », d'où la première erreur (PICTURE clause required). Ensuite, il trouve un PIC 9(4) qui n'appartient à rien, et toute la suite déraille.

La confusion est compréhensible, et elle vient sans doute de FICHE. Là-bas, 01 WS-CLIENT. avait bien son point juste après le nom, parce que c'était un groupe : une zone sans PIC, qui ne fait que contenir des sous-zones. Ici, chaque zone est élémentaire, avec sa propre PIC. La règle unique :

Le point se place à la fin de la déclaration complète : nom, puis PIC, puis VALUE, puis le point.

Ton bloc corrigé :

cobol
       01  WS-Z4                   PIC 9(4).
       01  WS-X4                   PIC X(4).
       01  WS-D52                  PIC 9(3)V99.
       01  WS-S4                   PIC S9(4).
       01  WS-X8                   PIC X(8).
       01  WS-GRAND                PIC 9(6)   VALUE 123456.
       01  WS-TEXTE                PIC X(8)   VALUE 'ABCDEFGH'.

Pour WS-GRAND et WS-TEXTE, tu avais deux points : garde seulement celui de la fin.

Deux détails en passant :

L'avertissement de fin de fichier est revenu : appuie sur Entrée après GOBACK., puis Ctrl+S.
La ligne 30 (MOVE WS-Z4 TO WS-X8) est décalée de quatre espaces de plus que les autres. Ce n'est pas une erreur, mais aligne-la sur ses voisines.

#### Les zones à déclarer
Nom	PICTURE	VALUE
WS-Z4	9(4)	aucune
WS-X4	X(4)	aucune
WS-D52	9(3)V99	aucune
WS-S4	S9(4)	aucune
WS-X8	X(8)	aucune
WS-GRAND	9(6)	123456
WS-TEXTE	X(8)	'ABCDEFGH'

#### Les dix cas, dans cet ordre
Cas	Instruction	Ta prédiction
A	MOVE 12 TO WS-Z4	
B	MOVE 123456 TO WS-Z4	
C	MOVE 'AB' TO WS-X4	
D	MOVE 'ABCDEFGH' TO WS-X4	
E	MOVE 12.345 TO WS-D52	
F	MOVE -25 TO WS-Z4	
G	MOVE -25 TO WS-S4	
H	MOVE WS-Z4 TO WS-X8	
I	MOVE WS-GRAND TO WS-Z4	
J	MOVE WS-TEXTE TO WS-X4

#### Les dix cas expliqués
Cas	Résultat	Explication
A	[0012]	Un nombre se cale à droite, sur la virgule. Les positions vides à gauche sont remplies de zéros.
B	[3456]	Même calage à droite. Les chiffres qui dépassent sont coupés à gauche : les milliers disparaissent.
C	[AB ]	Un texte se cale à gauche. Les positions vides à droite sont remplies d'espaces.
D	[ABCD]	Même calage à gauche. Ce qui dépasse est coupé à droite.
E	[012.34]	Le nombre se cale sur la virgule : 12 devient 012 à gauche, et les décimales ,345 deviennent ,34 à droite. Le 5 est coupé, sans arrondi. Sur mainframe, tu verrais 01234.
F	[0025]	9(4) n'a pas de S : la zone ne peut pas mémoriser de signe. Il ne reste que la valeur absolue.
G	[-0025]	S9(4) garde le signe. Sa façon de s'afficher varie selon le système : c'est pourquoi on passe par des zones d'édition pour afficher (semaine 3).
H	[0025 ]	Un nombre copié dans une zone X devient du texte : ses chiffres, zéros compris, sont traités comme des caractères, donc calés à gauche et complétés d'espaces.
I	[3456]	Exactement la règle de B. Que la valeur vienne d'une constante ou d'une variable ne change rien.
J	[ABCD]	Exactement la règle de D.
### Mercredi 30 Sept 2026 - 13h26
Pourquoi doit-on écrire PROGRAM-ID. HELLO. dans une IDENTIFICATION DIVISION, plutôt que de coder directement les instructions ? À quoi sert ce découpage en divisions ?

REPONSE :
Pour imposer une structure identique à tous les programmes COBOL du monde. Toute personne qui ouvre un programme COBOL sait à l'avance où trouver chaque chose.
| Division | Question à laquelle elle répond | Qui la lit ? |
| --- | --- | --- |
| `IDENTIFICATION` | « Comment s'appelle ce programme ? » (PROGRAM-ID = son nom d'appel, utilisé par un `CALL`) | Le compilateur, et tout programme qui l'appelle |
| `ENVIRONMENT` | « Quels fichiers/machine utilise-t-il ? » | L'exploitation, la reprise après incident |
| `DATA` | « Quelles données manipule-t-il et sous quel format ? » | Le développeur — c'est là qu'on passe la moitié de son temps |
| `PROCEDURE` | « Que fait-il, concrètement ? » | Le développeur |

Concrètement, sur un programme batch de 10 000 lignes en banque : grâce à ce découpage, tu trouves en 30 secondes les fichiers qu'il lit, les zones qu'il manipule, et le squelette de traitement — sans lire le code en entier. C'est ça, la vraie valeur.
Deux précisions bonus :
Le compilateur exige cet ordre — c'est une règle du langage, pas une convention.
PROGRAM-ID. HELLO. a un rôle technique : c'est sous ce nom que le programme est compilé et qu'un autre programme pourra l'appeler avec CALL "HELLO" (on le verra en semaine 6).
Retiens la phrase d'entretien : « Les divisions séparent l'identification, le lien machine, les données et le traitement — c'est ce qui rend un programme COBOL lisible et maintenable par n'importe qui, même 40 ans après. »

-------
Excellent rapport d'erreur — on vient de tomber sur notre première vraie leçon de diagnostic ! 🔍
Diagnostic : les deux erreurs ont la même cause
Regarde bien :
Ligne 5 : le compilateur bute sur VALUE 100,50.
Ligne 9 : il bute sur 0,20
Coupable : la virgule décimale. J'ai écrit les nombres à la française (100,50), mais GnuCOBOL, par défaut, attend un point (100.50) comme séparateur décimal. Pour lui, 100,50 = deux éléments séparés par une virgule → il ne comprend pas, d'où le « unexpected . » et le « unexpected Literal ».
(Third message est juste une conséquence : la compilation ayant échoué, l'exécutable CALCULE2 n'a jamais été créé — donc PowerShell ne le trouve pas. La cascade classique : corriger la compilation d'abord, toujours.)

Correction — deux options
Option A (la plus simple) : utiliser le point partout

Option B (la façon mainframe française) : déclarer la virgule comme séparateur
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       ...

       Avec cette clause, 100,50 et 0,20 deviennent valides. C'est d'ailleurs ainsi que codent beaucoup d'applications COBOL françaises sur z/OS — tu la rencontreras en lisant du code de banques françaises.
À retenir de cet incident
Un échec de compilation → pas d'exécutable : toujours lire la première erreur, la corriger, recompiler. Les erreurs suivantes sont souvent en cascade.
Le format des nombres décimaux dépend du compilateur/contexte : point par défaut, virgule si DECIMAL-POINT IS COMMA est déclaré. Réflexe de mission : quand tu ouvres un programme existant, regarde d'abord s'il y a un SPECIAL-NAMES dans la CONFIGURATION SECTION — ça t'évite de mal lire tous ses littéraux.
Recompile avec une des deux corrections 
-----
Lecture du résultat (Ex. 2.1 validé)
text
Copier

PRIX   : 0100.50
TVA    : 020.10
TOTAL  : 0120.60


Ce que tu observes : les zéros non significatifs s'affichent. Pourquoi ?
Une zone PIC 9(4)V99 réserve exactement 6 chiffres en mémoire, ni plus ni moins. Quand COBOL l'affiche, il sort les 6 positions telles quelles : 0100.50. La zone est une longueur fixe rembourrée de zéros — il n'y a aucune notion de « joli affichage » par défaut.
À l'inverse, PIC X(10) remplit à droite avec des espaces. C'est toute la philosophie COBOL : les données ont une taille fixe définie une fois pour toutes, ce qui rend leur manipulation en batch parfaitement prévisible (et c'est pour ça que les fichiers mainframe ont un LRECL fixe, comme tu le verras en JCL).
La solution d'affichage élégant (aperçu de la semaine 3) : les zones d'édition. Une variable PIC ZZ,ZZ9.99 contient des symboles d'édition qui suppriment les zéros superflus à l'affichage :

       01 WS-PRIX-EDIT    PIC ZZ,ZZ9.99.
       ...
           MOVE WS-PRIX TO WS-PRIX-EDIT
           DISPLAY "PRIX : " WS-PRIX-EDIT

→ affiche   100.50. Tu maîtriseras ça bientôt, c'est un classique d'entretien.

Option B validée aussi — et c'est encore mieux : tu as maintenant vu les deux facettes !
Ce que tu viens de constater

PRIX  : 0100,50


La clause DECIMAL-POINT IS COMMA fait plus que simplement accepter 100,50 dans le source : elle agit aussi sur l'édition des données à l'exécution. Le PIC 9(4)V99 s'affiche désormais avec une virgule — et une PIC ZZ,ZZ9.99 afficherait 1.234,56 au lieu de 1,234.56. Le point décimal est un paramètre global du programme, pas juste une convention d'écriture.

Pourquoi c'est important pour ta future mission
En France, la majorité des applications COBOL bancaires historiques contiennent cette clause. Concrètement, en mission :
Tu ouvres un programme existant → réflexe : chercher DECIMAL-POINT IS COMMA dans SPECIAL-NAMES avant de lire tout le reste. Sinon tu interprètes mal tous les littéraux et toutes les PICTURE du programme.
Si tu développes un nouveau module dans une application qui l'a, il faut la mettre aussi — sinon ton 0.20 sera lu différemment par le compilateur selon le contexte.
Tu as donc en main une connaissance que beaucoup de débutants découvrent en production (avec un incident en prime

------

JE suis coincé avec le code :        IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULE3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRIX          PIC 9(4)V99 VALUE 100.50.
       01 WS-TVA           PIC 9(3)V99 VALUE WS-PRIX * 0.20.
       01 WS-TOTAL         PIC 9(4)V99 VALUE WS-PRIX + WS-TVA.
       PROCEDURE DIVISION.
           MOVE 250 TO WS-PRIX.
           ADD 10 TO WS-PRIX.
           SUBTRACT 5 FROM WS-PRIX GIVING WS-TOTAL.
           DISPLAY "PRIX  : " WS-PRIX
           DISPLAY "TVA   : " WS-TVA
           DISPLAY "TOTAL : " WS-TOTAL.
       STOP RUN.

Bien vu que le problème venait de la déclaration — je t'explique pourquoi tu es coincé, c'est une règle fondamentale.

### La clause `VALUE` n'accepte pas d'expressions

```cobol
       01 WS-TVA  PIC 9(3)V99 VALUE WS-PRIX * 0.20.   *> ❌ interdit
```

La clause `VALUE` ne peut contenir qu'une **littéral fixe** (un nombre ou une chaîne écrit en dur) ou certaines clauses figuratives (`ZERO`, `SPACE`, `HIGH-VALUE`…). Elle est évaluée **une seule fois, au chargement du programme** — or à ce moment-là, `WS-PRIX` est juste en train d'être initialisé : le compilateur ne peut pas exécuter un calcul à cet endroit. C'est le compilateur qui pose la valeur, pas le programme qui la calcule.

Autrement dit :
- **DATA DIVISION** = je *décris* des zones et je peux les pré-remplir avec des constantes.
- **PROCEDURE DIVISION** = je *calcule* — tout calcul, aussi trivial soit-il, vit ici.

Donc ta TVA doit être calculée en `PROCEDURE DIVISION`, après les opérations qui fixent le prix :

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULE3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRIX          PIC 9(4)V99 VALUE 100.50.
       01 WS-TVA           PIC 9(3)V99.
       01 WS-TOTAL         PIC 9(4)V99.
       PROCEDURE DIVISION.
           MOVE 250 TO WS-PRIX
           ADD 10 TO WS-PRIX
           COMPUTE WS-TVA = WS-PRIX * 0.20
           SUBTRACT 5 FROM WS-PRIX GIVING WS-TOTAL
           DISPLAY "PRIX  : " WS-PRIX
           DISPLAY "TVA   : " WS-TVA
           DISPLAY "TOTAL : " WS-TOTAL
           STOP RUN.
```

Note deux choses dans ma version :
1. Le `COMPUTE` est placé **après** `ADD 10 TO WS-PRIX` — l'ordre des instructions compte, la TVA se calcule sur le prix du moment.
2. J'ai enlevé les points intermédiaires et gardé **un seul point par phrase logique** : `MOVE ... ADD ... COMPUTE ...` forment une phrase jusqu'au point après `WS-TOTAL`. C'est le style classique COBOL. Ton point après chaque ligne marchait aussi (ce sont alors des phrases d'une instruction), mais autant prendre le style que tu verras en entreprise.

⚠️ Détail de logique dans ton énoncé d'origine : tu voulais `TOTAL = PRIX + TVA`, mais ton `SUBTRACT 5 FROM WS-PRIX GIVING WS-TOTAL` met `TOTAL = PRIX - 5`. Deux calculs différents — à toi de choisir ce que le programme doit faire et de l'écrire explicitement. En mission, ce genre d'ambiguïté entre l'intention et le code est exactement ce qu'on attend que tu détectes.

Exécute, vérifie le résultat (à la main : 250 + 10 = 260 → TVA 52 → puis ton choix pour TOTAL), et enchaîne sur **FACTURE (Ex. 2.2)**. 👇
