       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONVDATE.
      *----------------------------------------------------------------
      * SOUS-PROGRAMME : AAAAMMJJ -> JJ/MM/AAAA
      * APPEL : CALL 'CONVDATE' USING DATE-ENTREE DATE-SORTIE CODE-RET
      * CODE-RET = 0 SI DATE VALIDE, 8 SINON
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-MOIS                 PIC 99.
       LINKAGE SECTION.
       01  LK-DATE-ENTREE          PIC X(8).
       01  LK-DATE-SORTIE          PIC X(10).
       01  LK-CODE-RETOUR          PIC S9(4) COMP.

       PROCEDURE DIVISION USING LK-DATE-ENTREE
                                LK-DATE-SORTIE
                                LK-CODE-RETOUR.
           MOVE 0 TO LK-CODE-RETOUR
           IF LK-DATE-ENTREE IS NOT NUMERIC
               MOVE 8 TO LK-CODE-RETOUR
               GOBACK
           END-IF
           MOVE LK-DATE-ENTREE(5:2) TO WS-MOIS
           IF WS-MOIS < 1 OR WS-MOIS > 12
               MOVE 8 TO LK-CODE-RETOUR
               GOBACK
           END-IF
           STRING LK-DATE-ENTREE(7:2) '/'
                  LK-DATE-ENTREE(5:2) '/'
                  LK-DATE-ENTREE(1:4)
               DELIMITED BY SIZE INTO LK-DATE-SORTIE
           END-STRING
           GOBACK.
