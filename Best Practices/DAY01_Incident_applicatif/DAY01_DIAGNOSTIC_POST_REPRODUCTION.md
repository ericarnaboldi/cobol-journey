DAY01_DIAGNOSTIC_POST_REPRODUCTION.md

À partir du ticket :
INC-0001 : Le résultat calculé par le programme semble incorrect pour certains dossiers.

Imagine que l'utilisateur te fournit finalement :
- Dossier : CL-00427
- Capital : 10 000
- Type de livret : P
- Taux indiqué : 2,50 %
- Durée : 10 ans
- Résultat obtenu : différent de celui attendu par l'utilisateur.
Ta tâche :
Rédige 5 à 10 étapes de diagnostic supplémentaires, mais cette fois après que tu as réussi à reproduire l'anomalie.
La question devient :
« Je sais maintenant que le problème est réel. Comment vais-je trouver précisément où et pourquoi le résultat devient incorrect ? »

-----

Mes étapes de diagnostic supplémentaires post-reproduction d'anomalie :

Le programme tourne et me renvoie un résultat qui n'est pas celui attendu. Je peux donc exclure une erreur de syntaxe dans les DIVISONS, SECTIONS et PARAGRAPHES, sinon le programme ne tournerait simplement pas.

1) Est-ce le dossier CL-00427 qui est à l'origine de l'erreur ? Fait-il partie d'une exception ?
2) Est-ce que la variable CAPITAL subit un MOVE ou un autre changement non prévu ?
2) Est-ce que la variable P est bien celle à laquelle le programme applique le changement de taux ?
3) Est-ce que le changement de taux est correctement écrite ? Y a-t-il une condition mal écrite ou inutile ?
4) Est-ce que la formule du calcul des intérêts est correcte ?
5) Est-ce que la règle métier est claire, sans ambiguité ?

-----

Oui. Là, tu commences à raisonner comme quelqu’un qui **cherche la cause** plutôt que comme quelqu’un qui cherche immédiatement « la ligne qui déconne ». Mais il y a deux corrections importantes à apporter à ton raisonnement.

### 1. Ton exclusion initiale est trop large

Tu écris :

> « Je peux donc exclure une erreur de syntaxe dans les DIVISIONS, SECTIONS et PARAGRAPHES, sinon le programme ne tournerait simplement pas. »

**Oui pour une partie des erreurs de syntaxe**, mais pas pour toutes les erreurs structurelles ou sémantiques.

Un programme peut parfaitement :

- compiler ;
- s'exécuter ;
- produire un résultat ;
- et pourtant contenir une instruction mal conçue, une mauvaise condition, un mauvais `MOVE`, un mauvais type de donnée ou une mauvaise formule.

Donc formule plutôt ton raisonnement ainsi :

> **La reproduction confirme que le programme est exécutable dans l'environnement considéré. Elle permet d'écarter certaines erreurs empêchant la compilation ou l'exécution, mais pas les erreurs de logique, de données ou de règle métier.**

Ça, c'est une formulation professionnelle.

---

### 2. Tes vérifications sont bonnes, mais il faut les ordonner davantage

#### 1) Le dossier CL-00427 est-il une exception ?

Très bonne question.

Mais avant de conclure qu'il s'agit d'une exception, tu dois comparer :

> **CL-00427 avec un dossier similaire qui fonctionne correctement.**

C'est une technique fondamentale : **cas qui échoue vs cas qui fonctionne**.

---

#### 2) `CAPITAL` subit-il un `MOVE` ou une autre modification ?

Très bonne piste.

Mais élargis légèrement :

> **Quelle est la valeur de `WS-CAPITAL` à chaque étape importante du traitement ?**

Tu ne cherches pas seulement un `MOVE`. Tu cherches **où la valeur diverge de celle attendue**.

---

#### 3) « Est-ce que la variable P est bien celle à laquelle le programme applique le changement de taux ? »

Ici, petite correction de vocabulaire.

`P` n'est probablement pas une variable : c'est une **valeur représentant la catégorie Premium**, via la condition de niveau 88.

La question professionnelle serait :

> **Le type de livret du dossier est-il correctement identifié comme Premium et la règle associée au Premium est-elle effectivement appliquée ?**

---

#### 4) « Le changement de taux est-il correctement écrit ? »

Très bonne piste.

Et tu peux la décomposer :

- la condition est-elle correcte ?
- est-elle exécutée ?
- le bon taux est-il sélectionné ?
- le taux est-il exprimé dans la bonne unité ?
- y a-t-il une autre instruction qui modifie ensuite le taux ?

Cette dernière question est particulièrement importante.

---

#### 5) La formule des intérêts est-elle correcte ?

Oui.

Mais attention à ne pas supposer trop vite que :

> **formule mathématique correcte = règle métier correcte.**

La formule peut être mathématiquement impeccable tout en appliquant **le mauvais taux**, **au mauvais moment**, ou **au mauvais capital**.

---

#### 6) La règle métier est-elle claire ?

Oui, absolument.

Et tu arrives ici à quelque chose de très professionnel :

> **Le code peut être parfaitement conforme à ce qu'a écrit le développeur tout en étant contraire à la règle métier attendue.**

Il faut donc éventuellement comparer :

**règle métier attendue → spécification/documentation → code → résultat.**

---

## Il manque cependant une vérification majeure

Tu dois examiner **l'évolution du résultat année par année**.

Ton programme calcule apparemment dix années.

Donc si :

- année 1 est correcte ;
- année 2 est correcte ;
- année 3 devient incorrecte ;

tu viens de réduire énormément le champ de recherche.

Tu cherches alors ce qui se passe **entre l'année 2 et l'année 3**.

C'est exactement le genre de raisonnement qu'on attend d'un analyste/mainteneur :

> **Ne pas seulement constater que le résultat final est faux ; déterminer à quel moment le traitement cesse de produire le résultat attendu.**

---

### Verdict sur ton exercice D

Je considère maintenant **l'exercice D comme réussi**, avec deux points à retenir :

1. **« Le programme s'exécute » ≠ « le programme est logiquement correct ».**
2. **Le diagnostic consiste à localiser le moment précis où le comportement réel diverge du comportement attendu.**

Et surtout, tu as spontanément fait apparaître quatre niveaux différents :

**données → traitement → règle métier → résultat**

C'est exactement la direction que je voulais obtenir avec ce premier exercice.