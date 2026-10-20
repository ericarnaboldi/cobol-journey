# Journal de bord

## Semaine 0 — 27 septembre 2026

- Ce que j'ai installé :
- Le problème rencontré et comment je l'ai résolu :
- Ce que j'ai appris :

Dimanche 27 septembre 2026 - 23h47
Installation sur mon ordinateur de : GnuCOBOL pour Windows, Git, les comptes Z Xplore et GitHub (Note : VS Code est déjà installé sur mon ordinateur).
Les problèmes et leurs solutions, trois vraies enquêtes :

1) Ubuntu installé sous le mauvais compte Windows ;
2) la virtualisation qui coupait l'écran, d'où le passage à GnuCOBOL natif ;
3) Git qui utilisait un autre compte GitHub.

Note de commandes de terminal : cd = change directory. 
ls = list directory contents mkdir = make directory rm = remove file or directory cp = copy file or directory mv = move file or directory pwd = print working directory

## Semaine 1 — 8 octobre 2026

### Day 1 — Positioning, COBOL fundamentals & application analysis

**8 October 2026**

First day of the professional retraining path toward Mainframe application development and analysis.

**Work completed**

- Wrote and refined a first COBOL program using `ACCEPT`, `COMPUTE` and `DISPLAY`.
- Analysed an existing COBOL application (`INTERETS.cbl`) rather than only writing new code.
- Identified program inputs, outputs, business data and technical data.
- Reconstructed a business rule from existing COBOL code.
- Learned to distinguish internal data representation from its user-facing representation.
- Learned that variables in `WORKING-STORAGE` are not necessarily program inputs.
- Practised distinguishing observed facts, hypotheses and points requiring verification.
- Performed a first application-incident analysis, from ticket qualification through reproduction and post-reproduction diagnosis.
- Began building a personal `Best Practices` knowledge base.

**Professional insight**

COBOL development is not limited to writing COBOL statements. It requires understanding the relationship between **business rules, data, application logic and user-visible results**.

A key professional skill being developed is the ability to act as a bridge between business requirements and application behaviour: understanding business needs, identifying how they are implemented in code, and explaining the resulting behaviour clearly.

**Skills strengthened**

- COBOL fundamentals
- Existing-code analysis
- Business-rule identification
- Data-flow reasoning
- Incident qualification and diagnosis
- Fact / hypothesis distinction
- Technical documentation

**Main point to consolidate**

Continue developing the discipline of explicitly distinguishing **facts, hypotheses, interpretations and items requiring verification** when analysing an existing application.

## 2026-10-12 — Day 2: Data flow and program analysis

### Objectives

- Understand how COBOL instructions modify variable values.
- Trace data through a program instruction by instruction.
- Distinguish program execution from business correctness.

### Work completed

**1. Data-flow exercise — `DAY02-01.cbl`**

Created and executed a COBOL program using:

- `MOVE` to assign values;
- `COMPUTE` to calculate interest and totals;
- `ADD` to update an existing value;
- `DISPLAY` to inspect program output.

Initial test:

- Capital: `12000.00`
- Rate: `0.05`
- Interest: `00600.00`
- Total: `12600.00`

**2. Assignment and accumulation**

Analysed how successive instructions affect `WS-TOTAL`.

Key observations:

- `MOVE` replaces the destination variable's current value.
- `ADD` adds a quantity to the destination's current value.
- `COMPUTE` evaluates an expression and assigns the result to the destination variable.
- The final value of a variable depends on the instructions executed and their order.

**3. Error diagnosis and correction**

Investigated a program version that displayed a total of `10500.00` instead of the expected `12600.00`.

Identified the cause: an assignment to `WS-TOTAL` was overwritten by a subsequent `MOVE WS-CAPITAL TO WS-TOTAL`. The interest calculation used the original capital of `10000.00`, producing `500.00`.

Corrected the data flow by assigning `12000.00` to `WS-CAPITAL` and calculating the total directly:

`COMPUTE WS-TOTAL = WS-CAPITAL + WS-INTERET`

Recompiled and executed the corrected program. The output matched the expected values:

- Capital: `12000.00`
- Interest: `00600.00`
- Total: `12600.00`

**4. Business-rule analysis**

Discussed the distinction between a mathematically correct calculation and a business-correct result.

For example, calculating interest as capital multiplied by rate does not, by itself, establish whether the amount is gross or net, whether the rate is appropriate, or whether the calculation complies with the applicable business rules.

### Lessons learned

- Trace variable values rather than relying on an initial reading of the code.
- Identify assignments that overwrite previous values.
- Compare actual output with an explicitly defined expected result.
- Separate observed facts, hypotheses and business rules that still require verification.
- A program can compile and execute successfully without necessarily meeting the business requirement.

### Points to reinforce

- Interpret COBOL calculations in their business context.
- Verify business assumptions against reliable specifications or expected test cases.
- Continue practising structured diagnosis on programs with more variables and conditional logic.

### Deliverables

- `01-cobol/exercices/DAY02-01.cbl` — corrected and tested exercise.

### Daily assessment

The main challenge was interpreting business meaning from the code. Further practice is needed to connect technical operations with business requirements and to identify what cannot be concluded from a code excerpt alone.

## 2026-10-12 — Day 3: Conditional logic and business rules

### Objectives

- Understand and use `IF`, `ELSE` and `END-IF`.
- Combine conditions using `AND` and `OR`.
- Use parentheses to make complex conditions explicit.
- Test whether program behaviour matches an expected business rule.

### Work completed

**1. Basic conditional logic — `DAY03-01.cbl`**

Implemented a classification rule based on capital:

- If capital is greater than or equal to `10000`, display `CATEGORIE PREMIUM`.
- Otherwise, display `CATEGORIE STANDARD`.

Executed three test cases:

| Capital | Expected result    | Actual result      |
| -------:| ------------------ | ------------------ |
| 12000   | CATEGORIE PREMIUM  | CATEGORIE PREMIUM  |
| 10000   | CATEGORIE PREMIUM  | CATEGORIE PREMIUM  |
| 9999.99 | CATEGORIE STANDARD | CATEGORIE STANDARD |

All three tests passed. The boundary test confirmed that `>=` includes equality.

**2. Combining conditions with `AND`**

Studied a rule requiring both conditions to be true:

- Capital greater than or equal to `10000`.
- Savings-account type equal to `P`.

Confirmed that `AND` requires every condition in the expression to be true.

**3. Combining conditions with `OR`**

Studied a priority rule where either of the following is sufficient:

- Capital greater than or equal to `10000`.
- Savings-account type equal to `P`.

Confirmed that `OR` allows the condition to be satisfied when at least one of the alternatives is true.

**4. Mixed conditions and parentheses — `DAY03-02A.cbl` to `DAY03-02D.cbl`**

Implemented and tested the following rule:

`(capital >= 10000 AND account type = "P") OR exception = "O"`

The program displays `TRAITEMENT PRIORITAIRE` when the first grouped condition is satisfied or an exception is granted. Otherwise, it displays `TRAITEMENT STANDARD`.

Compiled and executed four program versions:

| Test | Capital | Account type | Exception | Expected result | Actual result |
| ---- | -------:| ------------ | --------- | --------------- | ------------- |
| A    | 12000   | P            | N         | Priority        | Priority      |
| B    | 12000   | S            | N         | Standard        | Standard      |
| C    | 8000    | S            | O         | Priority        | Priority      |
| D    | 8000    | P            | N         | Standard        | Standard      |

All four tests passed.

### Lessons learned

- `AND` requires all combined conditions to be true; `OR` requires at least one.
- Parentheses make the intended grouping of mixed conditions explicit.
- Boundary cases help verify the exact meaning of comparison operators.
- A test must compare actual output against an expected result, not merely confirm that the program runs.
- Correct implementation of a rule does not prove that the rule itself is correct from a business perspective.

### Application-analysis reflexes

When a classification appears incorrect:

1. Verify that the expected business rule is correctly understood and documented.
2. If the rule is confirmed, trace the relevant variable values through the instructions.
3. Identify where the observed execution diverges from the expected behaviour.
4. Reproduce the issue with a specific test case and verify the correction.

### Points to reinforce

- Continue practising mixed conditions and boundary cases.
- Pay particular attention to the grouping of `AND` and `OR` expressions.
- Make complex business rules readable and test each logical path.
- Distinguish the correctness of the code from the correctness of the business requirement.

### Deliverables

- `01-cobol/exercices/DAY03-01.cbl` — basic conditional classification.
- `01-cobol/exercices/DAY03-02A.cbl` to `DAY03-02D.cbl` — mixed-condition test scenarios.

### Daily assessment

Basic conditional logic and the distinction between `AND` and `OR` are understood. All seven reported test cases passed.

The main point of vigilance identified is the risk of misreading or incorrectly grouping mixed conditions, particularly when parentheses are omitted or overlooked.

A useful diagnostic approach is emerging: confirm the business rule first, then trace the values used by the program to determine where its behaviour diverges from expectations.

-----

## 2026-10-19 — Day 4: Multiple-choice logic and rule precedence

### Objectives

- Understand and use `EVALUATE` as an alternative to chains of `IF / ELSE`.
- Understand `EVALUATE TRUE` for expressing complex business rules.
- Understand the priority order of `WHEN` branches (first match wins).
- Test every logical path, including values that match no explicit case.
  
  ### Work completed
  
  **1. Simple EVALUATE — `DAY04-01.cbl`**
  Implemented a three-way classification based on savings-account type:
- `P` → `LIVRET PREMIUM`
- `S` → `LIVRET STANDARD`
- any other value → `TYPE DE LIVRET INCONNU`
  Compiled and executed the program with three successive initial values for `WS-TYPE-LIVRET`:
  
  | WS-TYPE-LIVRET                                                                                | Expected result        | Actual result          |
  | --------------------------------------------------------------------------------------------- | ---------------------- | ---------------------- |
  | P                                                                                             | LIVRET PREMIUM         | LIVRET PREMIUM         |
  | S                                                                                             | LIVRET STANDARD        | LIVRET STANDARD        |
  | X                                                                                             | TYPE DE LIVRET INCONNU | TYPE DE LIVRET INCONNU |
  | All three branches passed. The `WHEN OTHER` branch correctly caught the unexpected value `X`. |                        |                        |
  | **2. EVALUATE TRUE with complex conditions — `DAY04-02A.cbl` to `DAY04-02D.cbl`**             |                        |                        |
  | Implemented a priority rule combining capital, account type and exception status:             |                        |                        |
1. If capital ≥ 10000 **AND** type = `P` → `LIVRET PRIORITAIRE`
2. Otherwise, if exception = `O` → `TRAITEMENT PAR DEROGATION`
3. Otherwise → `TRAITEMENT STANDARD`
   Implemented as `EVALUATE TRUE` with three `WHEN` branches. Compiled and executed four variants, each with its own initial values:
   
   | Test                                                                                                                                                                                                                                                                                                        | Capital | Type | Exception | Expected result           | Actual result             |
   | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------:| ---- | --------- | ------------------------- | ------------------------- |
   | A                                                                                                                                                                                                                                                                                                           | 12000   | P    | N         | LIVRET PRIORITAIRE        | LIVRET PRIORITAIRE        |
   | B                                                                                                                                                                                                                                                                                                           | 12000   | S    | N         | TRAITEMENT STANDARD       | TRAITEMENT STANDARD       |
   | C                                                                                                                                                                                                                                                                                                           | 8000    | S    | O         | TRAITEMENT PAR DEROGATION | TRAITEMENT PAR DEROGATION |
   | D                                                                                                                                                                                                                                                                                                           | 12000   | P    | O         | LIVRET PRIORITAIRE        | LIVRET PRIORITAIRE        |
   | All four tests passed. Case D confirmed that `EVALUATE TRUE` executes the **first** matching `WHEN` branch and ignores the rest: although the exception condition (`WS-DEROGATION = "O"`) is also true, the first condition (capital ≥ 10000 AND type = `P`) wins and the second branch is never evaluated. |         |      |           |                           |                           |
   
   ### Lessons learned
- `EVALUATE` expresses a multi-way choice more readably than a chain of `IF / ELSE IF`, especially when the branches are mutually exclusive.
- `EVALUATE TRUE` evaluates each `WHEN` condition in order and stops at the first true one. The order of the branches is therefore significant.
- The order of `WHEN` branches is a **business decision**, not a technical detail. It determines which rule takes precedence when several rules apply simultaneously.
- `WHEN OTHER` acts as a default case. It is essential to catch values that match no explicit branch and to prevent them from being silently ignored.
- A rule can be technically correctly implemented and still be wrong from a business perspective. Testing proves that the code matches the programmer's understanding of the rule, not that the rule itself is correct.
  
  ### Application-analysis reflexes
  
  When a decision looks incorrect:
1. Verify the expected priority order of the business rules (which rule should win when several apply?).
2. Trace the value of the fields examined by the `EVALUATE`.
3. Check whether an earlier `WHEN` branch matches the case and masks the branch that should have applied.
4. Reproduce the case with a specific test and compare with the expected rule.
   
   ### Points to reinforce
- Explicitly document the priority order of business rules before coding them.
- Systematically test overlapping cases, where several conditions are true at once (such as case D).
- Remember that `EVALUATE TRUE` short-circuits on the first match: the result depends on the order of the branches.
  
  ### Deliverables
- `01-cobol/exercices/DAY04-01.cbl` — three-way classification with `WHEN OTHER`.
- `01-cobol/exercices/DAY04-02A.cbl` to `DAY04-02D.cbl` — priority rule test scenarios.
  
  ### Daily assessment
  
  `EVALUATE` and `EVALUATE TRUE` are understood. All seven reported test cases (three for `DAY04-01`, four for `DAY04-02`) passed.
  The main insight of the day concerns the **priority order** of conditions. In a multi-rule business process, several conditions may be true simultaneously, and the program's behaviour is determined by the order of the `WHEN` branches. This order must be treated as a business requirement: documented, justified, and tested explicitly, especially for overlapping cases such as case D.
  The main risk to watch is therefore not technical but analytical: reading a rule correctly, but failing to ask **which rule should take precedence** when several apply. This reflex will be essential for analysing existing systems, where rule precedence is often implicit in the code and must be reconstructed and verified.

## DAY05 — Tables, mouvements et contrôle des données

**Date : 20 octobre 2026**

### Travail réalisé

- Utilisation d'une table COBOL déclarée avec `OCCURS 3 TIMES`.
- Initialisation de trois mouvements dans une procédure dédiée.
- Parcours de la table à l'aide d'un compteur et de `PERFORM UNTIL`.
- Traitement des débits et crédits selon le type de mouvement.
- Affichage du type, du solde après chaque mouvement et du solde final.
- Ajout d'un contrôle explicite pour les types de mouvements invalides.

### Tests effectués

**Scénario nominal :**
- Solde initial : 1 000,00.
- Débit de 150,00 : solde de 850,00.
- Crédit de 300,00 : solde de 1 150,00.
- Débit de 75,00 : solde de 1 075,00.
- Résultat : réussi.

**Scénario invalide :**
- Débit de 150,00 : solde de 850,00.
- Mouvement de type `X` : erreur signalée, solde inchangé.
- Débit de 75,00 : solde de 775,00.
- Résultat : réussi.

### Enseignements

Un programme doit contrôler les valeurs reçues avant de leur appliquer une opération métier. Une donnée invalide doit être signalée et ne doit pas modifier le solde. Le traitement doit également conserver un comportement cohérent après le rejet de cette donnée.

### Statut

**DAY05 officiellement validé.**

Programme de référence : `DAY05-19-02.cbl`.


