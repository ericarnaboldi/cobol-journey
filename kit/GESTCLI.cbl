       IDENTIFICATION DIVISION.
       PROGRAM-ID. GESTCLI.
      *----------------------------------------------------------------
      * FICHIER INDEXE (EQUIVALENT LOCAL D'UN VSAM KSDS)
      * 1. CHARGEMENT  2. LECTURE DIRECTE PAR CLE  3. MISE A JOUR
      * 4. CLE ABSENTE (FILE STATUS 23)  5. PARCOURS START/READ NEXT
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT F-CLIENTS ASSIGN TO CLIENTS
               ORGANIZATION IS INDEXED
               ACCESS MODE  IS DYNAMIC
               RECORD KEY   IS CLI-COMPTE
               FILE STATUS  IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD  F-CLIENTS.
       01  CLI-ENREG.
           05  CLI-COMPTE          PIC X(10).
           05  CLI-NOM             PIC X(30).
           05  CLI-SOLDE           PIC S9(9)V99 COMP-3.

       WORKING-STORAGE SECTION.
       01  WS-FS                   PIC XX.
           88  FS-OK                          VALUE '00'.
           88  FS-CLE-ABSENTE                 VALUE '23'.
           88  FS-FIN                         VALUE '10'.
       01  WS-ED-SOLDE             PIC Z,ZZZ,ZZ9.99-.

       PROCEDURE DIVISION.
       0000-PRINCIPAL.
           PERFORM 1000-CHARGER
           PERFORM 2000-METTRE-A-JOUR
           PERFORM 3000-PARCOURIR
           GOBACK.

       1000-CHARGER.
           OPEN OUTPUT F-CLIENTS
           MOVE 'IT00000101' TO CLI-COMPTE
           MOVE 'ROSSI MARIA'     TO CLI-NOM
           MOVE 2334.10           TO CLI-SOLDE
           WRITE CLI-ENREG
           MOVE 'IT00000102' TO CLI-COMPTE
           MOVE 'ESPOSITO GENNARO' TO CLI-NOM
           MOVE 1126.50           TO CLI-SOLDE
           WRITE CLI-ENREG
           MOVE 'IT00000103' TO CLI-COMPTE
           MOVE 'DE LUCA ANNA'    TO CLI-NOM
           MOVE -700              TO CLI-SOLDE
           WRITE CLI-ENREG
           CLOSE F-CLIENTS.

       2000-METTRE-A-JOUR.
           OPEN I-O F-CLIENTS
      *    LECTURE DIRECTE PAR CLE PUIS REECRITURE
           MOVE 'IT00000103' TO CLI-COMPTE
           READ F-CLIENTS
               INVALID KEY
                   DISPLAY 'CLIENT ABSENT, FS=' WS-FS
               NOT INVALID KEY
                   ADD 1000 TO CLI-SOLDE
                   REWRITE CLI-ENREG
                   DISPLAY 'IT00000103 CREDITE, FS=' WS-FS
           END-READ
      *    CLE QUI N'EXISTE PAS
           MOVE 'IT99999999' TO CLI-COMPTE
           READ F-CLIENTS
               INVALID KEY
                   DISPLAY 'IT99999999 ABSENT, FS=' WS-FS
           END-READ
           CLOSE F-CLIENTS.

       3000-PARCOURIR.
           OPEN INPUT F-CLIENTS
           MOVE LOW-VALUES TO CLI-COMPTE
           START F-CLIENTS KEY IS NOT LESS THAN CLI-COMPTE
           PERFORM UNTIL NOT FS-OK
               READ F-CLIENTS NEXT RECORD
                   AT END
                       CONTINUE
                   NOT AT END
                       MOVE CLI-SOLDE TO WS-ED-SOLDE
                       DISPLAY CLI-COMPTE ' ' CLI-NOM ' ' WS-ED-SOLDE
               END-READ
           END-PERFORM
           CLOSE F-CLIENTS.
