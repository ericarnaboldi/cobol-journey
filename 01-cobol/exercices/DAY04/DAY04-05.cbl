
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-05.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL-TEXTE PIC X(12).
       01 CAPITAL      PIC S9(7)V99.
       01 TYPE-LIVRET  PIC X.

       PROCEDURE DIVISION.
           DISPLAY 'CAPITAL DU CLIENT (ex. 12000 ou -0.01) : '
               WITH NO ADVANCING
           ACCEPT CAPITAL-TEXTE

           IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
               DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
           ELSE
               COMPUTE CAPITAL =
                   FUNCTION NUMVAL(CAPITAL-TEXTE)

               DISPLAY 'TYPE DE LIVRET (P/S) : '
                   WITH NO ADVANCING
               ACCEPT TYPE-LIVRET

               EVALUATE TRUE
                   WHEN CAPITAL < 0
                       DISPLAY 'ERREUR : CAPITAL INVALIDE'

                   WHEN CAPITAL >= 10000
                    AND TYPE-LIVRET = 'P'
                       DISPLAY 'LIVRET PREMIUM'

                   WHEN OTHER
                       DISPLAY 'LIVRET STANDARD'
               END-EVALUATE
           END-IF

           STOP RUN.
