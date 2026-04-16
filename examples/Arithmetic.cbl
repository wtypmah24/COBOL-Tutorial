       IDENTIFICATION DIVISION.
       PROGRAM-ID. Arithmetic.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 AGE          PIC 9(02) VALUE 33.
       01 AGE50        PIC 9(02) VALUE 50.
       01 AGE99        PIC 9(02) VALUE 99.
       01 YEARSUNIL    PIC 9(02).
       01 AGEFROMNOW   PIC 9(02).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            SUBTRACT AGE FROM AGE50 GIVING YEARSUNIL
            DISPLAY "You turn 50 in " YEARSUNIL " years old"

            DISPLAY " "

            ADD YEARSUNIL TO AGE GIVING AGEFROMNOW
            DISPLAY "In " YEARSUNIL " years you will turn " AGEFROMNOW
            " years old."

            COMPUTE YEARSUNIL = AGE99 - AGE
            COMPUTE AGEFROMNOW = AGE + YEARSUNIL

            DISPLAY "You are 99 in " YEARSUNIL " years"
            DISPLAY " "

            DISPLAY "So in " YEARSUNIL " years you are " AGEFROMNOW
            " years old."
            STOP RUN.
       END PROGRAM Arithmetic.
