
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-17-TEST.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.
       01 NB-ANOMALIES PIC 99 VALUE 0.
       01 TABLE-ANOMALIES.
          05 LIGNE-ANOMALIE OCCURS 5 TIMES.
             10 NUM-ANOMALIE PIC 99.
             10 TYPE-ANOMALIE-TAB PIC X.
             10 MONTANT-ANOMALIE-TAB PIC 9(5)V99.
       01 NUM-MOUVEMENT-ANOMALIE PIC 9(2) VALUE 0.
       01 TYPE-ANOMALIE PIC X VALUE SPACE.
       01 MONTANT-ANOMALIE PIC 9(5)V99 VALUE 0.
       01 CAPACITE-ANOMALIES PIC 99 VALUE 5.
       01 NB-ANOMALIES-DETECTEES PIC 99 VALUE 0.
       01 NB-ANOMALIES-NON-STOCKEES PIC 99 VALUE 0.
       01 NB-DEBITS PIC 99 VALUE 0.
       01 NB-CREDITS PIC 99 VALUE 0.
       01 TOTAL-DEBITS PIC 9(7)V99 VALUE 0.
       01 TOTAL-CREDITS PIC 9(7)V99 VALUE 0.
       01 SOLDE-INITIAL PIC S9(6)V99 VALUE 0.
       01 SOLDE-CONTROLE PIC S9(6)V99 VALUE 0.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 6 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           MOVE "X" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)

           MOVE "X" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)

           MOVE "X" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3)

           MOVE "X" TO TYPE-MOUVEMENT(4)
           MOVE 200 TO MONTANT(4)

           MOVE "X" TO TYPE-MOUVEMENT(5)
           MOVE 50 TO MONTANT(5)

           MOVE "X" TO TYPE-MOUVEMENT(6)
           MOVE 50 TO MONTANT(6)

                      DISPLAY "SOLDE INITIAL : " SOLDE
                      MOVE SOLDE TO SOLDE-INITIAL

           PERFORM UNTIL COMPTEUR > 6
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

                       ADD 1 TO NB-ANOMALIES-DETECTEES

                   IF NB-ANOMALIES < CAPACITE-ANOMALIES
                       ADD 1 TO NB-ANOMALIES

                       MOVE COMPTEUR
                           TO NUM-ANOMALIE(NB-ANOMALIES)
                       MOVE TYPE-MOUVEMENT(COMPTEUR)
                           TO TYPE-ANOMALIE-TAB(NB-ANOMALIES)
                       MOVE MONTANT(COMPTEUR)
                           TO MONTANT-ANOMALIE-TAB(NB-ANOMALIES)
                   ELSE
                       ADD 1 TO NB-ANOMALIES-NON-STOCKEES
                       DISPLAY "JOURNAL PLEIN"
                   END-IF

               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

               DISPLAY "-----"
               DISPLAY "NOMBRE DE DEBITS : " NB-DEBITS
               DISPLAY "TOTAL DES DEBITS : " TOTAL-DEBITS
               DISPLAY "NOMBRE DE CREDITS : " NB-CREDITS
               DISPLAY "TOTAL DES CREDITS : " TOTAL-CREDITS
               DISPLAY "NOMBRE D'ANOMALIES DETECTEES : "
               NB-ANOMALIES-DETECTEES
               DISPLAY "-----"
               COMPUTE SOLDE-CONTROLE = 
                   SOLDE-INITIAL - TOTAL-DEBITS + TOTAL-CREDITS

               DISPLAY "SOLDE CALCULE : " SOLDE
               DISPLAY "SOLDE DE CONTROLE : " SOLDE-CONTROLE

           IF SOLDE = SOLDE-CONTROLE
               DISPLAY "CONTROLE COMPTABLE : OK"
           ELSE
               DISPLAY "ANOMALIE : ECART COMPTABLE"
           END-IF
               
               DISPLAY "-----"
               DISPLAY "SOLDE FINAL : " SOLDE

               DISPLAY "----- JOURNAL DES ANOMALIES -----"

           PERFORM VARYING COMPTEUR FROM 1 BY 1
               UNTIL COMPTEUR > NB-ANOMALIES
               DISPLAY "MOUVEMENT : "
                   NUM-ANOMALIE(COMPTEUR)
               DISPLAY "TYPE : "
                   TYPE-ANOMALIE-TAB(COMPTEUR)
               DISPLAY "MONTANT : "
                   MONTANT-ANOMALIE-TAB(COMPTEUR)
           END-PERFORM

               DISPLAY "ANOMALIES STOCKEES : "
                   NB-ANOMALIES
               DISPLAY "ANOMALIES NON STOCKEES : "
                   NB-ANOMALIES-NON-STOCKEES
              
               STOP RUN.
