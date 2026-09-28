       IDENTIFICATION DIVISION.
       PROGRAM-ID. FICHE.
      *----------------------------------------------------------------
      *EXERCICE 1 - FICHE CLIENT: CLIENT FICTIF DE LA CASSA DEL BARONE
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-CLIENT.
           05 WS-NOM              PIC X(20) VALUE 'LOMBARDO'.
           05 WS-PRENOM           PIC X(15) VALUE 'FEDERICO'.
           05 WS-VILLE            PIC X(15) VALUE 'MATERA'.
           05 WS-DATE-NAISSANCE.
              10 WS-ANNEE          PIC 9(4)   VALUE 1980.
              10 WS-MOIS           PIC 99     VALUE 6.
              10 WS-JOUR           PIC 99     VALUE 15.
       PROCEDURE DIVISION.
           DISPLAY 'NOM               : ' WS-NOM.
           DISPLAY 'PRENOM            : ' WS-PRENOM.
           DISPLAY 'VILLE             : ' WS-VILLE.
           DISPLAY 'DATE DE NAISSANCE : ' WS-JOUR '/' WS-MOIS '/' 
                                          WS-ANNEE.
           DISPLAY 'LE GROUPE         : [' WS-CLIENT ']'.
           DISPLAY                    LENGTH OF WS-CLIENT.
           GOBACK.
           