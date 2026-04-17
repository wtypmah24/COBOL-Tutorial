       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEAP-YEAR.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 GIVING-YEAR.
           05 YYYY        PIC 9(4).
           05 LEAP-STATUS PIC X VALUE 'N'.
            88 IS-LEAP-YEAR     VALUE 'Y'.
            88 IS-NOT-LEAP-YEAR VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-YEAR.
            PERFORM CHECK-LEAP.
            PERFORM DISPLAY-RESULT.
            STOP RUN.

       GET-YEAR.
           DISPLAY "Enter a year: "
           ACCEPT YYYY.

       CHECK-LEAP.
           SET IS-NOT-LEAP-YEAR TO TRUE

           IF (FUNCTION MOD(YYYY, 4) = 0 AND FUNCTION MOD(YYYY, 100)
               NOT = 0)
           OR (FUNCTION MOD(YYYY, 400) = 0)
               SET IS-LEAP-YEAR TO TRUE
           END-IF
       .
       DISPLAY-RESULT.
           DISPLAY "The Year: " YYYY
           IF IS-LEAP-YEAR
               DISPLAY "Leap year"
           ELSE
               DISPLAY "Not a leap year"
           END-IF
       .

       END PROGRAM LEAP-YEAR.
