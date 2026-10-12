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