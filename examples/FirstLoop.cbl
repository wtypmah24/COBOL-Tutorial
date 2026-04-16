      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIRST-LOOP.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 COUNTER PIC 99.
       01 MAGIC-NUMBER PIC 99 VALUE 5.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE 1 TO COUNTER
            PERFORM UNTIL COUNTER = 10

               IF COUNTER = MAGIC-NUMBER
                   DISPLAY "Magic Number!"
               ELSE
                   DISPLAY COUNTER
               END-IF
               ADD 1 TO COUNTER
            END-PERFORM
            STOP RUN.
       END PROGRAM FIRST-LOOP.
