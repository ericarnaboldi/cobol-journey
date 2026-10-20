
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
