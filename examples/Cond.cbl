       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITIONAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 USER-NAME PIC X(10).
       01 AGE       PIC 99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "WRITE YOUR NAME: "
           ACCEPT USER-NAME

           DISPLAY "WRITE YOUR AGE: "
           ACCEPT AGE

           IF AGE >= 18 THEN
               DISPLAY "YOU CAN VOTE!"
           ELSE
               DISPLAY "YOU ARE TOO YOUNG"
           END-IF

           DISPLAY " "

           EVALUATE AGE
               WHEN 0 THRU 17
                   DISPLAY "YOU ARE TOO YOUNG"
               WHEN 18
                   DISPLAY "YOUR FIRST YEAR YOU CAN VOTE"
               WHEN OTHER
                   DISPLAY "YOU HAVE VOTED BEFORE"
           END-EVALUATE

           DISPLAY " "

           EVALUATE TRUE
               WHEN AGE >= 18
                   DISPLAY "YOU CAN VOTE"
               WHEN USER-NAME = "DAVID"
                   DISPLAY "YOUR NAME IS " USER-NAME
               WHEN OTHER
                   DISPLAY "NONE OF THE OTHER CONDITIONS ARE TRUE"
           END-EVALUATE

           STOP RUN.
       END PROGRAM CONDITIONAL.
