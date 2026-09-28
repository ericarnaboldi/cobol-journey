       IDENTIFICATION DIVISION.
       PROGRAM-ID. VOILIER.
      *-----------------------------------------------------------------
      * MODELE : UNE ZONE GROUPE ET SOUS-ZONES
      *-----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-VOILIER.
           05 WS-NOM              PIC X(12)  VALUE 'MISTRAL'.
           05 WS-LONGUEUR         PIC 99V9   VALUE 13.4.
           05 WS-MISE-A-LEAU.
              10 WS-ANNEE         PIC 9(4)   VALUE 2008.
              10 WS-MOIS          PIC 99     VALUE 5.
       PROCEDURE DIVISION.
           DISPLAY 'NOM : ' WS-NOM.
           DISPLAY 'LONGUEUR : ' WS-LONGUEUR ' m'.
           DISPLAY 'MISE A L''EAU : ' WS-MOIS '/' WS-ANNEE.
           DISPLAY 'LE GROUPE : [' WS-VOILIER ']'
           GOBACK.