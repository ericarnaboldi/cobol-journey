
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-08.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.

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
                       DISPLAY "DEBIT TRAITE"
                   WHEN "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                       DISPLAY "CREDIT TRAITE"
                   WHEN OTHER
                       DISPLAY "ANOMALIE : TYPE INCONNU"
               END-EVALUATE

               DISPLAY "SOLDE COURANT : " SOLDE

               ADD 1 TO COMPTEUR
           END-PERFORM

           DISPLAY "SOLDE FINAL : " SOLDE

           STOP RUN.
