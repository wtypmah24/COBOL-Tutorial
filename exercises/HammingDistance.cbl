       IDENTIFICATION DIVISION.
       PROGRAM-ID. HAMMING-DISTANCE.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 INPUT-DATA.
           05 FIRST-INPUT PIC X(10).
           05 SECOND-INPUT PIC X(10).
           05 INPUT-LENGTH PIC 9(02).
       01 INDEXES.
           05 I PIC 9(02).
           05 DIST PIC 9(02) VALUE 0.
       01 INPUT-STATUS PIC X(01) VALUE 'N'.
           88 INPUT-CORRECT  VALUE 'Y'.
           88 INPUT-INCORRECT VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-INPUT-DATA.
            PERFORM CALCULATE.
            PERFORM DISPLAY-RESULT.
            STOP RUN.

       GET-INPUT-DATA.
           PERFORM UNTIL INPUT-CORRECT
               DISPLAY "Enter a first text: "
               ACCEPT FIRST-INPUT
               DISPLAY "Enter a second text: "
               ACCEPT SECOND-INPUT
               IF FUNCTION LENGTH(FUNCTION TRIM(FIRST-INPUT)) =
               FUNCTION LENGTH(FUNCTION TRIM(SECOND-INPUT))
                  SET INPUT-CORRECT TO TRUE
               END-IF
           END-PERFORM
           COMPUTE INPUT-LENGTH =
           FUNCTION LENGTH(FUNCTION TRIM(FIRST-INPUT))
       .
       CALCULATE.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I >  INPUT-LENGTH
               IF FIRST-INPUT(I:1) NOT = SECOND-INPUT(I:1)
                   ADD 1 TO DIST
               END-IF
           END-PERFORM
       .

       DISPLAY-RESULT.
           DISPLAY "Hamming Distance is " DIST
       .
       END PROGRAM HAMMING-DISTANCE.
