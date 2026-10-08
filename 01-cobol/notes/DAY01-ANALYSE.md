A. Fonction : A quoi sert le programme ?
   Réponse - Mon hypothèse : à simuler la rentabilité annuelle d'un livret d'épargne de LA CASSA DEL BARONE en fonction du capital initial, du taux d'intérêt, sur une période de dix ans. (Confiance élevée : elle s'appuie sur le commentaire en début de programme)

B. Entrées : Quelles sont les données qu'il reçoit ?
   Réponse : Le capital de départ (WS-CAPITAL), le taux d'intérêt (WS-TAUX), et la durée en années (WS-DUREE). (Confiance : élevée. Reportée depuis WORKING-STORAGE SECTION.)

C. Traitement : quelles sont les principales opérations qu'il effectue ?
   Réponse : Mes quatre hypothèses 1) il évalue si le livret est de type premium, standard ou inconnu 2) selon la nature du livret, il applique le taux standard ou le taux premium pour calculer les intérêts annuels 3) il cumule les intérêts sur la durée spécifiée et calcule le capital final. 4) il affiche l'année, les intérêts annuels et le solde (WS-LIGNE) (Confiance : élevée. Elle s'appuie sur la lecture de la PROCEDURE DIVISION et mon interprétation de WS-LIGNE).

D. Sorties : Qu'est-ce qu'il produit ?
   Réponse : Hypothèse : il produit un tableau annuel sur dix ans, année par années, du capital, des intérêts et du solde. (Confiance : moyenne).

E. Données : Quels sont les champs ou variables qui semblent représenter des données métiers ?
   Réponse : Selon moi, les champs :  01  WS-CAPITAL, 01  WS-TAUX, 01  WS-INTERETS semblent des données métiers, même s'ils ne sont pas uniques au monde bancaire. Le champ 01  WS-TYPE-LIVRET paraît plus spécifique à la banque et pourrait bien être même spécifique à LA CASSA DEL BARONE. (Confiance : moyenne, il est possible que je me trompe sur les significations des termes "champs" et "variables")

F. Règles métier : Identifier au moins une règle métier que tu crois pouvoir déduire du programme
    Réponse : Selon moi, la règle métier que l'on peut déduire est que le taux d'intérêt appliqué dépend du type de livret (premium ou standard). Si le livret est de type premium, un taux d'intérêt plus élevé est appliqué, tandis que pour un livret standard, un taux d'intérêt plus bas est utilisé. (Confiance : très élevée)

###CORRECTIONS###
Petite mission supplémentaire :
retourne dans INTERETS.cbl et identifie précisément les champs affichés dans chaque ligne du tableau.
Le tableau affiche trois champs : l'année (WS-ED-ANNEE), les intérêts annuels (WS-ED-INTERETS) et le solde (WS-ED-SOLDE).

1. Les vraies entrées du programme, en expliquant pourquoi tu les considères comme des entrées ;
01  WS-CAPITAL contient : VALUE 10000.
01  WS-TAUX contient : VALUE 0.0250.
01  WS-DUREE contient : VALUE 10.
    88  LIVRET-STANDARD contient : VALUE 'S'.
    88  LIVRET-PREMIUM  contient : VALUE 'P'.
2. Les vraies sorties, en indiquant ce que le programme affiche réellement ;
Le programme affiche 
a) 'TYPE DE LIVRET INCONNU : ' ou 'TAUX ANNUEL APPLIQUE : '
b) un tableau de dix lignes (10 ans) et trois champs par lignes 1) l'année (WS-ED-ANNEE), 2) les intérêts annuels (WS-ED-INTERETS) et 3) le solde (WS-ED-SOLDE).
3. Au moins une donnée technique, par opposition aux données métier ;
Donnée technique : 01  WS-DUREE PIC 99  VALUE 10.
4. Une règle métier formulée en langage fonctionnel, sans reprendre le vocabulaire COBOL.
"Le taux d'intérêt appliqué dépend du type de livret (premium (P) ou standard(S)). Si le livret est de type premium, un taux d'intérêt majoré de 0.5% est appliqué par rapport au taux du livret standard. Si le type de livret est inconnu, un message d'erreur est affiché et aucun calcul n'est effectué."