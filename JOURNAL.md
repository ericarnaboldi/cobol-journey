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

| Capital | Expected result | Actual result |
|---:|---|---|
| 12000 | CATEGORIE PREMIUM | CATEGORIE PREMIUM |
| 10000 | CATEGORIE PREMIUM | CATEGORIE PREMIUM |
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
|---|---:|---|---|---|---|
| A | 12000 | P | N | Priority | Priority |
| B | 12000 | S | N | Standard | Standard |
| C | 8000 | S | O | Priority | Priority |
| D | 8000 | P | N | Standard | Standard |

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