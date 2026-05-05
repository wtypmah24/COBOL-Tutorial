       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       *> Input fields for STRING operation
       01 WS-FIRST-NAME     PIC X(10) VALUE 'John'.
       01 WS-LAST-NAME      PIC X(10) VALUE 'Wick'.

       *> Result of STRING (concatenation)
       01 WS-FULL-NAME      PIC X(25) VALUE SPACES.

       *> Field for UNSTRING result
       01 WS-FNAME          PIC X(10).
       01 WS-LNAME          PIC X(10).

       *> Working string for UNSTRING
       01 WS-BUFFER         PIC X(25).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            *> ============================
           *> STRING: combine fields
           *> ============================
           STRING
               WS-FIRST-NAME DELIMITED BY SPACE
               SPACE         DELIMITED BY SIZE
               WS-LAST-NAME  DELIMITED BY SPACE
           INTO WS-FULL-NAME
           END-STRING

           *> Show result of STRING
           DISPLAY "FULL NAME AFTER STRING: " WS-FULL-NAME

           *> Copy to buffer for UNSTRING demo
           MOVE WS-FULL-NAME TO WS-BUFFER

           *> ============================
           *> UNSTRING: split back into fields
           *> ============================
           UNSTRING WS-BUFFER
               DELIMITED BY SPACE
               INTO WS-FNAME
                    WS-LNAME
           END-UNSTRING

           *> Show result of UNSTRING
           DISPLAY "FIRST NAME AFTER UNSTRING: " WS-FNAME
           DISPLAY "LAST NAME  AFTER UNSTRING: " WS-LNAME
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
