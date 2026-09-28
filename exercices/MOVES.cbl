       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVES.
      *----------------------------------------------------------------
      *EXERCICE DE PROGRAMMATION EN COBOL : MOVES
      *----------------------------------------------------------------
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-Z4             PIC 9(4).
       01  WS-X4             PIC X(4) .
       01  WS-D52            PIC 9(3)V99.
       01  WS-S4             PIC S9(4).
       01  WS-X8             PIC X(8).
       01  WS-GRAND          PIC 9(6) VALUE 123456.
       01  WS-TEXTE          PIC X(8) VALUE 'ABCDEFGH'.
       PROCEDURE DIVISION.
           MOVE 12 TO WS-Z4
           DISPLAY 'A : [' WS-Z4 ']'
           MOVE 123456 TO WS-Z4
           DISPLAY 'B : [' WS-Z4 ']'
           MOVE 'AB' TO WS-X4
           DISPLAY 'C : [' WS-X4 ']'
           MOVE 'ABCDEFGH' TO WS-X4	
           DISPLAY 'D : [' WS-X4 ']'
           MOVE 12.345 TO WS-D52
           DISPLAY 'E : [' WS-D52 ']'
           MOVE -25 TO WS-Z4
           DISPLAY 'F : [' WS-Z4 ']'
           MOVE -25 TO WS-S4
           DISPLAY 'G : [' WS-S4 ']'
	       MOVE WS-Z4 TO WS-X8
           DISPLAY 'H : [' WS-X8 ']'
           MOVE WS-GRAND TO WS-Z4
           DISPLAY 'I : [' WS-Z4 ']'
           MOVE WS-TEXTE TO WS-X4
           DISPLAY 'J : [' WS-X4 ']'
           GOBACK.
