
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-14.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

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
                      MOVE SOLDE TO SOLDE-INITIAL

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
                       MOVE COMPTEUR
                           TO NUM-MOUVEMENT-ANOMALIE
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE
                       DISPLAY "NUMERO REJETE : "
                       NUM-MOUVEMENT-ANOMALIE
                       DISPLAY "TYPE REJETE : "
                       TYPE-ANOMALIE
                       DISPLAY "MONTANT REJETE : "
                       MONTANT-ANOMALIE

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
               COMPUTE SOLDE-CONTROLE = SOLDE-INITIAL - TOTAL-DEBITS 
               + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE
               
               STOP RUN.
