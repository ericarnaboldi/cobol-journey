       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-04D.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CAPITAL       PIC S9(7)V99 VALUE 10000.01.
       01 TYPE-LIVRET   PIC X VALUE 'S'.

       PROCEDURE DIVISION.
           EVALUATE TRUE
               WHEN CAPITAL < 0
                   DISPLAY 'ERREUR : CAPITAL INVALIDE'

               WHEN CAPITAL >= 10000
                AND TYPE-LIVRET = 'P'
                   DISPLAY 'LIVRET PREMIUM'

               WHEN OTHER
                   DISPLAY 'LIVRET STANDARD'
           END-EVALUATE

           STOP RUN.
