       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILIALI.
      *----------------------------------------------------------------
      * TABLEAU EN MEMOIRE : VALUE + REDEFINES + OCCURS
      * RECHERCHE SEQUENTIELLE (SEARCH) ET DICHOTOMIQUE (SEARCH ALL)
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-FILIALI-VALEURS.
           05  FILLER  PIC X(12) VALUE 'BARBARI     '.
           05  FILLER  PIC X(12) VALUE 'LECLECCE    '.
           05  FILLER  PIC X(12) VALUE 'MATMATERA   '.
           05  FILLER  PIC X(12) VALUE 'NAPNAPOLI   '.
           05  FILLER  PIC X(12) VALUE 'PALPALERMO  '.
       01  WS-TABLE-FILIALI REDEFINES WS-FILIALI-VALEURS.
           05  WS-FILIALE OCCURS 5 TIMES
                          ASCENDING KEY IS WS-FIL-CODE
                          INDEXED BY IX-FIL.
               10  WS-FIL-CODE     PIC X(3).
               10  WS-FIL-NOM      PIC X(9).
       01  WS-CODE-CHERCHE         PIC X(3).

       PROCEDURE DIVISION.
       0000-PRINCIPAL.
           MOVE 'MAT' TO WS-CODE-CHERCHE
           PERFORM 1000-CHERCHER
           MOVE 'ROM' TO WS-CODE-CHERCHE
           PERFORM 1000-CHERCHER
      *    PARCOURS COMPLET AVEC L'INDEX
           PERFORM VARYING IX-FIL FROM 1 BY 1 UNTIL IX-FIL > 5
               DISPLAY WS-FIL-CODE (IX-FIL) ' -> ' WS-FIL-NOM (IX-FIL)
           END-PERFORM
           GOBACK.

       1000-CHERCHER.
           SEARCH ALL WS-FILIALE
               AT END
                   DISPLAY 'FILIALE INCONNUE : ' WS-CODE-CHERCHE
               WHEN WS-FIL-CODE (IX-FIL) = WS-CODE-CHERCHE
                   DISPLAY 'FILIALE ' WS-CODE-CHERCHE ' = '
                           WS-FIL-NOM (IX-FIL)
           END-SEARCH.
