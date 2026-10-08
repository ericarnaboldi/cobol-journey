       IDENTIFICATION DIVISION.
       PROGRAM-ID. S0C7.
      *----------------------------------------------------------------
      * PROVOQUER VOLONTAIREMENT UNE ERREUR DE DONNEES
      * UNE ZONE COMP-3 QUI CONTIENT DU TEXTE ('ABC')
      * SUR Z/OS : ABEND S0C7 (DATA EXCEPTION)
      * AVEC GNUCOBOL : COMPILER AVEC -debug POUR LA DETECTER
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-ZONE-BRUTE           PIC X(3)  VALUE 'ABC'.
       01  WS-MONTANT REDEFINES WS-ZONE-BRUTE
                                   PIC S9(5) COMP-3.
       01  WS-TOTAL                PIC S9(7) COMP-3 VALUE 0.
       01  WS-ED-TOTAL             PIC -9(7).

       PROCEDURE DIVISION.
           DISPLAY 'AVANT L''ADDITION'
           ADD WS-MONTANT TO WS-TOTAL
           MOVE WS-TOTAL TO WS-ED-TOTAL
           DISPLAY 'TOTAL = ' WS-ED-TOTAL
           GOBACK.
