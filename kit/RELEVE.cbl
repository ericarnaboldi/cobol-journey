       IDENTIFICATION DIVISION.
       PROGRAM-ID. RELEVE.
      *----------------------------------------------------------------
      * CASSA DEL BARONE - RELEVE DES MOUVEMENTS PAR COMPTE
      * ENTREE : MOUVTS  (MOUVEMENTS TRIES PAR COMPTE PUIS DATE)
      * SORTIE : RAPPORT (RELEVE IMPRIMABLE, 80 COLONNES)
      * TECHNIQUE : LECTURE ANTICIPEE + RUPTURE DE CONTROLE
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    SUR Z/OS : SUPPRIMER LES DEUX LIGNES "LINE SEQUENTIAL"
           SELECT F-MOUVEMENTS ASSIGN TO MOUVTS
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS  IS WS-FS-MVT.
           SELECT F-RAPPORT    ASSIGN TO RAPPORT
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS  IS WS-FS-RAP.

       DATA DIVISION.
       FILE SECTION.
       FD  F-MOUVEMENTS
           RECORD CONTAINS 80 CHARACTERS.
           COPY MVTREC.

       FD  F-RAPPORT
           RECORD CONTAINS 80 CHARACTERS.
       01  RAP-LIGNE               PIC X(80).

       WORKING-STORAGE SECTION.
      *--- CODES RETOUR FICHIERS --------------------------------------
       01  WS-FS-MVT               PIC XX.
           88  FS-MVT-OK                      VALUE '00'.
           88  FS-MVT-FIN                     VALUE '10'.
       01  WS-FS-RAP               PIC XX.
      *--- INDICATEUR DE FIN ------------------------------------------
       01  WS-FIN                  PIC X      VALUE 'N'.
           88  FIN-FICHIER                    VALUE 'O'.
      *--- CLE DE RUPTURE ET CUMULS -----------------------------------
       01  WS-COMPTE-PRECEDENT     PIC X(10).
       01  WS-CUMULS.
           05  WS-SOLDE-COMPTE     PIC S9(9)V99 COMP-3 VALUE 0.
           05  WS-TOTAL-GENERAL    PIC S9(11)V99 COMP-3 VALUE 0.
           05  WS-NB-COMPTES       PIC 9(5)     COMP   VALUE 0.
           05  WS-NB-MVT           PIC 9(7)     COMP   VALUE 0.
      *--- LIGNES D'EDITION -------------------------------------------
       01  WS-L-ENTETE.
           05  FILLER              PIC X(22) VALUE
               'CASSA DEL BARONE    - '.
           05  FILLER              PIC X(8)  VALUE 'COMPTE: '.
           05  WS-E-COMPTE         PIC X(10).
       01  WS-L-DETAIL.
           05  WS-D-DATE           PIC X(10).
           05  FILLER              PIC X(2)  VALUE SPACES.
           05  WS-D-LIBELLE        PIC X(30).
           05  FILLER              PIC X(2)  VALUE SPACES.
           05  WS-D-MONTANT        PIC Z,ZZZ,ZZ9.99-.
       01  WS-L-TOTAL.
           05  FILLER              PIC X(44) VALUE
               '                        SOLDE DU COMPTE   :'.
           05  WS-T-SOLDE          PIC Z,ZZZ,ZZ9.99-.
       01  WS-L-GENERAL.
           05  FILLER              PIC X(14) VALUE 'COMPTES LUS : '.
           05  WS-G-NB-COMPTES     PIC ZZZZ9.
           05  FILLER              PIC X(25) VALUE
               '    TOTAL GENERAL      :'.
           05  WS-G-TOTAL          PIC ZZ,ZZZ,ZZ9.99-.

       PROCEDURE DIVISION.
       0000-PRINCIPAL.
           PERFORM 1000-INITIALISER
           PERFORM 2000-TRAITER-MOUVEMENT
               UNTIL FIN-FICHIER
           PERFORM 3000-TERMINER
           GOBACK.

       1000-INITIALISER.
           OPEN INPUT  F-MOUVEMENTS
                OUTPUT F-RAPPORT
           IF NOT FS-MVT-OK
               DISPLAY 'ERREUR OUVERTURE MOUVTS, FILE STATUS = '
                       WS-FS-MVT
               MOVE 16 TO RETURN-CODE
               GOBACK
           END-IF
      *    LECTURE ANTICIPEE : ON LIT AVANT D'ENTRER DANS LA BOUCLE
           PERFORM 8000-LIRE-MOUVEMENT
           IF NOT FIN-FICHIER
               MOVE MVT-COMPTE TO WS-COMPTE-PRECEDENT
               PERFORM 7100-ENTETE-COMPTE
           END-IF.

       2000-TRAITER-MOUVEMENT.
      *    RUPTURE : LE NUMERO DE COMPTE A CHANGE
           IF MVT-COMPTE NOT = WS-COMPTE-PRECEDENT
               PERFORM 7200-TOTAL-COMPTE
               MOVE MVT-COMPTE TO WS-COMPTE-PRECEDENT
               PERFORM 7100-ENTETE-COMPTE
           END-IF

           STRING MVT-DATE(7:2) '/' MVT-DATE(5:2) '/' MVT-DATE(1:4)
               DELIMITED BY SIZE INTO WS-D-DATE
           END-STRING
           MOVE MVT-LIBELLE TO WS-D-LIBELLE
           EVALUATE TRUE
               WHEN MVT-CREDIT
                   ADD MVT-MONTANT      TO WS-SOLDE-COMPTE
                   MOVE MVT-MONTANT     TO WS-D-MONTANT
               WHEN MVT-DEBIT
                   SUBTRACT MVT-MONTANT FROM WS-SOLDE-COMPTE
                   COMPUTE WS-D-MONTANT = 0 - MVT-MONTANT
               WHEN OTHER
                   DISPLAY 'TYPE INVALIDE, COMPTE ' MVT-COMPTE
                   MOVE 4 TO RETURN-CODE
           END-EVALUATE
           WRITE RAP-LIGNE FROM WS-L-DETAIL
           ADD 1 TO WS-NB-MVT

           PERFORM 8000-LIRE-MOUVEMENT.

       3000-TERMINER.
           IF WS-NB-MVT > 0
               PERFORM 7200-TOTAL-COMPTE
           END-IF
           MOVE WS-NB-COMPTES    TO WS-G-NB-COMPTES
           MOVE WS-TOTAL-GENERAL TO WS-G-TOTAL
           WRITE RAP-LIGNE FROM WS-L-GENERAL
           CLOSE F-MOUVEMENTS F-RAPPORT
           DISPLAY 'RELEVE TERMINE : ' WS-NB-MVT ' MOUVEMENTS'.

       7100-ENTETE-COMPTE.
           MOVE MVT-COMPTE TO WS-E-COMPTE
           MOVE SPACES     TO RAP-LIGNE
           WRITE RAP-LIGNE
           WRITE RAP-LIGNE FROM WS-L-ENTETE
           MOVE ALL '-'    TO RAP-LIGNE
           WRITE RAP-LIGNE
           MOVE 0          TO WS-SOLDE-COMPTE.

       7200-TOTAL-COMPTE.
           MOVE WS-SOLDE-COMPTE TO WS-T-SOLDE
           WRITE RAP-LIGNE FROM WS-L-TOTAL
           ADD WS-SOLDE-COMPTE  TO WS-TOTAL-GENERAL
           ADD 1                TO WS-NB-COMPTES.

       8000-LIRE-MOUVEMENT.
           READ F-MOUVEMENTS
               AT END
                   SET FIN-FICHIER TO TRUE
           END-READ.
