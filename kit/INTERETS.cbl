       IDENTIFICATION DIVISION.
       PROGRAM-ID. INTERETS.
      *----------------------------------------------------------------
      * CASSA DEL BARONE - SIMULATION D'UN LIVRET D'EPARGNE
      * CAPITAL + TAUX ANNUEL + DUREE -> TABLEAU ANNEE PAR ANNEE
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *--- DONNEES DE CALCUL (DECIMAL CONDENSE = COMP-3) --------------
       01  WS-CAPITAL          PIC S9(9)V99   COMP-3 VALUE 10000.
       01  WS-TAUX             PIC S9V9(4)    COMP-3 VALUE 0.0250.
       01  WS-INTERETS         PIC S9(9)V99   COMP-3.
       01  WS-DUREE            PIC 99                VALUE 10.
       01  WS-ANNEE            PIC 99.
      *--- TYPE DE LIVRET : NIVEAUX 88 --------------------------------
       01  WS-TYPE-LIVRET      PIC X                 VALUE 'P'.
           88  LIVRET-STANDARD                       VALUE 'S'.
           88  LIVRET-PREMIUM                        VALUE 'P'.
      *--- LIGNE D'EDITION --------------------------------------------
       01  WS-LIGNE.
           05  FILLER          PIC X(6)   VALUE 'ANNEE '.
           05  WS-ED-ANNEE     PIC Z9.
           05  FILLER          PIC X(13)  VALUE '   INTERETS: '.
           05  WS-ED-INTERETS  PIC ZZZ,ZZ9.99.
           05  FILLER          PIC X(10)  VALUE '   SOLDE: '.
           05  WS-ED-SOLDE     PIC ZZZ,ZZZ,ZZ9.99.
       01  WS-ED-TAUX          PIC 9.99.
       01  WS-TAUX-POURCENT    PIC 9V99.

       PROCEDURE DIVISION.
       0000-PRINCIPAL.
           EVALUATE TRUE
               WHEN LIVRET-PREMIUM
                   ADD 0.0050 TO WS-TAUX
               WHEN LIVRET-STANDARD
                   CONTINUE
               WHEN OTHER
                   DISPLAY 'TYPE DE LIVRET INCONNU : ' WS-TYPE-LIVRET
                   GOBACK
           END-EVALUATE

           COMPUTE WS-TAUX-POURCENT = WS-TAUX * 100
           MOVE WS-TAUX-POURCENT TO WS-ED-TAUX
           DISPLAY 'TAUX ANNUEL APPLIQUE : ' WS-ED-TAUX ' %'

           PERFORM 1000-UNE-ANNEE
               VARYING WS-ANNEE FROM 1 BY 1
               UNTIL WS-ANNEE > WS-DUREE

           GOBACK.

       1000-UNE-ANNEE.
           COMPUTE WS-INTERETS ROUNDED = WS-CAPITAL * WS-TAUX
           ADD WS-INTERETS TO WS-CAPITAL
           MOVE WS-ANNEE    TO WS-ED-ANNEE
           MOVE WS-INTERETS TO WS-ED-INTERETS
           MOVE WS-CAPITAL  TO WS-ED-SOLDE
           DISPLAY WS-LIGNE.
