       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 IS-IT-TRUE PIC X     VALUE SPACE.
           88 IS-IT-TRUE-YES   VALUE 'Y'.
           88 IS-IT-TRUE-NO    VALUE 'N'.

       *>  WORKS like a radio button, one can be true or none
       01 OK-FLAG PIC X(02)    VALUE SPACES.
           88 OK-FLAG-YES      VALUE 'OK'.
           88 OK-FLAG-NO       VALUE 'NO'.
           88 OK-FLAG-MAYBE    VALUE 'MA'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      *>   You can set 1st level value to set to true
       MOVE 'Y' TO IS-IT-TRUE
       IF IS-IT-TRUE-YES
           DISPLAY "It is true"
       END-IF

       *>  Or you can set one to true like this
       SET IS-IT-TRUE-NO TO TRUE
       IF IS-IT-TRUE-NO
           DISPLAY "It's not true"
       END-IF

       SET OK-FLAG-MAYBE TO TRUE
       EVALUATE TRUE
       WHEN OK-FLAG-YES
           DISPLAY "YES"
       WHEN OK-FLAG-NO
           DISPLAY "NO"
       WHEN OK-FLAG-MAYBE
           DISPLAY "MB"
       END-EVALUATE

            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
