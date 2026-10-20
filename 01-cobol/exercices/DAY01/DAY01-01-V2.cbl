       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY01-01-V2.
       AUTHOR. ERIC.
       DATE-WRITTEN. 2026-10-08.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MONTANT PIC 9(5)V99.
       01  WS-TAUX PIC 9V99.
       01  WS-INTERET PIC 9(5)V99.
       01  WS-TOTAL PIC 9(5)V99.
       PROCEDURE DIVISION.
           DISPLAY "Saisir le montant :"
           ACCEPT WS-MONTANT
           DISPLAY "Saisir le taux d'intérêt :"
           ACCEPT WS-TAUX
           COMPUTE WS-INTERET = WS-MONTANT * WS-TAUX
           COMPUTE WS-TOTAL = WS-MONTANT + WS-INTERET
           DISPLAY "Montant initial : " WS-MONTANT
           DISPLAY "Taux d'intérêt : " WS-TAUX
           DISPLAY "Intérêt calculé : " WS-INTERET
           DISPLAY "Montant total : " WS-TOTAL
           STOP RUN.
