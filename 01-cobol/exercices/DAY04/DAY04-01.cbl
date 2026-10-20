       IDENTIFICATION DIVISION.
       PROGRAM-ID. DAY04-01.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-TYPE-LIVRET PIC X VALUE "S".

       PROCEDURE DIVISION.
           EVALUATE WS-TYPE-LIVRET
               WHEN "P"
                   DISPLAY "LIVRET PREMIUM"
               WHEN "S"
                   DISPLAY "LIVRET STANDARD"
               WHEN OTHER
                   DISPLAY "TYPE DE LIVRET INCONNU"
           END-EVALUATE

           STOP RUN.
