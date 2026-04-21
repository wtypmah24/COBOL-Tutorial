       IDENTIFICATION DIVISION.
       PROGRAM-ID. Assignment-3.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-MENU-NUMBER       PIC 9(2).
       01 WS-NUMBER-COMPARISON.
           05 FIRST-NUMBER     PIC 9(3).
           05 SECOND-NUMBER    PIC 9(3).
       01 WS-COUNTDOWN-NUMBER  PIC 9(2).
       01 WS-COUNTER           PIC 9(2).
       01 WS-PYRAMID-DATA.
           05 HEIGHT           PIC 9(3).
           05 ROW              PIC 9(3).
           05 SPACES-QTY       PIC 9(3).
           05 STARS-QTY        PIC 9(3).
           05 I                PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-START-CHOOSE.
            PERFORM EVALUATE-CHOOSE.
            PERFORM DISPLAY-FINAL-MSG.
            STOP RUN.

       GET-START-CHOOSE.
           DISPLAY "**************************"
           DISPLAY "Choose 1-3 and press enter"
           DISPLAY "1. Print a secret"
           DISPLAY "2. Let me tell you which number is the bigger"
           DISPLAY "3. Count down"
           DISPLAY "4. Build a pyramid"
           DISPLAY "**************************"
           DISPLAY "  "
           ACCEPT WS-MENU-NUMBER
       .

       EVALUATE-CHOOSE.
           EVALUATE TRUE
               WHEN WS-MENU-NUMBER EQUALS 1
                   PERFORM HANDLE-ONE
               WHEN WS-MENU-NUMBER EQUALS 2
                   PERFORM HANDLE-TWO
               WHEN WS-MENU-NUMBER EQUALS 3
                   PERFORM HANDLE-THREE
               WHEN WS-MENU-NUMBER EQUALS 4
                   PERFORM HANDLE-FOUR
               WHEN OTHER
                   DISPLAY "  "
                   DISPLAY "**************************"
                   DISPLAY "None of the numbers. Quit the program."
                   DISPLAY "**************************"
           END-EVALUATE
       .

       HANDLE-ONE.
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "There are no secrets"
           DISPLAY "**************************"
       .

       HANDLE-TWO.
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "Give me the first number: "
           DISPLAY "**************************"
           ACCEPT FIRST-NUMBER
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "Give me the second number: "
           DISPLAY "**************************"
           ACCEPT SECOND-NUMBER
           PERFORM COMPARE-NUMBERS
       .

       COMPARE-NUMBERS.
           EVALUATE TRUE
               WHEN FIRST-NUMBER GREATER THAN SECOND-NUMBER
                   DISPLAY "  "
                   DISPLAY "**************************"
                   DISPLAY "First number " FIRST-NUMBER " is greater"
                   DISPLAY "**************************"
               WHEN SECOND-NUMBER GREATER THAN FIRST-NUMBER
                   DISPLAY "  "
                   DISPLAY "**************************"
                   DISPLAY "Second number " SECOND-NUMBER " is greater"
                   DISPLAY "**************************"
               WHEN OTHER
                   DISPLAY "  "
                   DISPLAY "**************************"
                   DISPLAY "They are the same size."
                   DISPLAY "**************************"
           END-EVALUATE
       .

       HANDLE-THREE.
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "Give me a countdown start number"
           DISPLAY "**************************"
           ACCEPT WS-COUNTDOWN-NUMBER
           PERFORM COUNT-DOWN
       .

       COUNT-DOWN.
           MOVE WS-COUNTDOWN-NUMBER TO WS-COUNTER
           PERFORM UNTIL WS-COUNTER LESS THAN 1
               DISPLAY WS-COUNTER
               SUBTRACT 1 FROM WS-COUNTER GIVING WS-COUNTER
           END-PERFORM
       .

       HANDLE-FOUR.
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "Give me pyramid height"
           DISPLAY "**************************"
           ACCEPT HEIGHT
           PERFORM BUILD-PYRAMID
       .

       BUILD-PYRAMID.
           PERFORM VARYING ROW FROM 1 BY 1 UNTIL ROW > HEIGHT
      *> Get spaces and stars quantity for each row
               SUBTRACT ROW FROM HEIGHT GIVING SPACES-QTY
               COMPUTE STARS-QTY = ROW * 2 - 1

               PERFORM VARYING I FROM 1 BY 1 UNTIL I > SPACES-QTY
      *> Add WITH NO ADVANCING to avoid line break
                   DISPLAY " " WITH NO ADVANCING
               END-PERFORM

               PERFORM VARYING I FROM 1 BY 1 UNTIl I > STARS-QTY
                   DISPLAY "*" WITH NO ADVANCING
               END-PERFORM
               DISPLAY " "
           END-PERFORM
       .

       DISPLAY-FINAL-MSG.
           DISPLAY "  "
           DISPLAY "**************************"
           DISPLAY "* Thank you and bye bye! *"
           DISPLAY "**************************"
       .
       END PROGRAM Assignment-3.
