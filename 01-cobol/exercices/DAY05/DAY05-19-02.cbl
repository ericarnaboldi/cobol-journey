       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY05-19-02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 SOLDE PIC S9(6)V99 VALUE 1000.
       01 COMPTEUR PIC 9 VALUE 1.

       01 TABLE-MOUVEMENTS.
          05 MOUVEMENT OCCURS 3 TIMES.
             10 TYPE-MOUVEMENT PIC X.
             10 MONTANT PIC 9(5)V99.

       PROCEDURE DIVISION.
           PERFORM INITIALISER-MOUVEMENTS
           PERFORM TRAITER-MOUVEMENTS
           DISPLAY "SOLDE FINAL : " SOLDE
           STOP RUN.

       INITIALISER-MOUVEMENTS.
           MOVE "D" TO TYPE-MOUVEMENT(1)
           MOVE 150 TO MONTANT(1)
           MOVE "C" TO TYPE-MOUVEMENT(2)
           MOVE 300 TO MONTANT(2)
           MOVE "D" TO TYPE-MOUVEMENT(3)
           MOVE 75 TO MONTANT(3).

       TRAITER-MOUVEMENTS.
           PERFORM UNTIL COMPTEUR > 3
               DISPLAY "MOUVEMENT : " COMPTEUR
               DISPLAY "TYPE : "
                   TYPE-MOUVEMENT(COMPTEUR)
               
               IF TYPE-MOUVEMENT(COMPTEUR) = "D"
                   SUBTRACT MONTANT(COMPTEUR)
                       FROM SOLDE
               ELSE
                   IF TYPE-MOUVEMENT(COMPTEUR) = "C"
                       ADD MONTANT(COMPTEUR)
                           TO SOLDE
                   ELSE
                       DISPLAY
                           "ERREUR : TYPE INVALIDE"
                   END-IF
               END-IF

               DISPLAY "SOLDE : " SOLDE
               ADD 1 TO COMPTEUR
           END-PERFORM.
