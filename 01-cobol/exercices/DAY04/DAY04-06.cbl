
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-06.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL-TEXTE PIC X(12).
       01 CAPITAL      PIC S9(7)V99.
       01 TYPE-LIVRET  PIC X.

       PROCEDURE DIVISION.
           DISPLAY 'CAPITAL DU CLIENT : '
               WITH NO ADVANCING
           ACCEPT CAPITAL-TEXTE

           IF FUNCTION TEST-NUMVAL(CAPITAL-TEXTE) NOT = 0
               DISPLAY 'ERREUR : CAPITAL NON NUMERIQUE'
           ELSE
               COMPUTE CAPITAL =
                   FUNCTION NUMVAL(CAPITAL-TEXTE)

               IF CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'
               ELSE
                   DISPLAY 'TYPE DE LIVRET (P/S) : '
                       WITH NO ADVANCING
                   ACCEPT TYPE-LIVRET

                   EVALUATE TRUE
                       WHEN TYPE-LIVRET NOT = 'P'
                        AND TYPE-LIVRET NOT = 'S'
                           DISPLAY 'ERREUR : TYPE INCONNU'

                       WHEN CAPITAL >= 10000
                        AND TYPE-LIVRET = 'P'
                           DISPLAY 'LIVRET PREMIUM'

                       WHEN OTHER
                           DISPLAY 'LIVRET STANDARD'
                   END-EVALUATE
               END-IF
           END-IF

           STOP RUN.
