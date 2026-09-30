       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULE3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PRIX          PIC 9(4)V99 VALUE 100.50.
       01 WS-TVA           PIC 9(3)V99.
       01 WS-TOTAL         PIC 9(4)V99.
       PROCEDURE DIVISION.
           MOVE 250 TO WS-PRIX
           ADD 10 TO WS-PRIX
           COMPUTE WS-TVA = WS-PRIX * 0.20
           SUBTRACT 5 FROM WS-PRIX GIVING WS-TOTAL
           DISPLAY "PRIX  : " WS-PRIX
           DISPLAY "TVA   : " WS-TVA
           DISPLAY "TOTAL : " WS-TOTAL
           STOP RUN.
           