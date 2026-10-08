      *----------------------------------------------------------------
      * MVTREC : ENREGISTREMENT MOUVEMENT - LONGUEUR FIXE 80 OCTETS
      *----------------------------------------------------------------
       01  MVT-ENREG.
           05  MVT-COMPTE          PIC X(10).
           05  MVT-DATE            PIC X(8).
           05  MVT-TYPE            PIC X.
               88  MVT-CREDIT                 VALUE 'C'.
               88  MVT-DEBIT                  VALUE 'D'.
           05  MVT-MONTANT         PIC 9(7)V99.
           05  MVT-LIBELLE         PIC X(30).
           05  FILLER              PIC X(22).
