       IDENTIFICATION DIVISION.
       PROGRAM-ID. APPELANT.
      *----------------------------------------------------------------
      * PROGRAMME APPELANT : TESTE LE SOUS-PROGRAMME CONVDATE
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-DATE-ENTREE          PIC X(8).
       01  WS-DATE-SORTIE          PIC X(10).
       01  WS-CODE-RETOUR          PIC S9(4) COMP.
       01  WS-ED-CODE              PIC Z9.

       PROCEDURE DIVISION.
           MOVE '20261225' TO WS-DATE-ENTREE
           PERFORM 1000-APPELER
           MOVE '20261325' TO WS-DATE-ENTREE
           PERFORM 1000-APPELER
           MOVE 'NATALE!!' TO WS-DATE-ENTREE
           PERFORM 1000-APPELER
           GOBACK.

       1000-APPELER.
           MOVE SPACES TO WS-DATE-SORTIE
           CALL 'CONVDATE' USING WS-DATE-ENTREE
                                 WS-DATE-SORTIE
                                 WS-CODE-RETOUR
           MOVE WS-CODE-RETOUR TO WS-ED-CODE
           DISPLAY WS-DATE-ENTREE ' -> [' WS-DATE-SORTIE '] RC='
                   WS-ED-CODE.
