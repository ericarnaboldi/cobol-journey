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




