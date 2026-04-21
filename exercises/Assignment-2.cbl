       IDENTIFICATION DIVISION.
       PROGRAM-ID. Assignment-2.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 FRUITS.
           05 FRUIT-DATA OCCURS 5 TIMES.
               10 FRUIT-NAME   PIC X(10).
               10 FRUIT-PRICE  PIC 9(03).
       01 TEMP-FRUIT-NAME      PIC X(10).
       01 TEMP-FRUIT-PRICE     PIC X(03).
       01 COUNTER              PIC 9(01).

      *> NB: Programm allows duplicates.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-INPUT-DATA.
      *> Use Intrinsic Function to sort table based on the prices
            SORT FRUIT-DATA ASCENDING KEY FRUIT-PRICE.
            PERFORM DISPLAY-RESULT.
            STOP RUN.

       GET-INPUT-DATA.
           DISPLAY "Enter 5 fruits and their price. One by one."
           MOVE 1 TO COUNTER

           PERFORM UNTIL COUNTER > 5
      *> Separate Paragraph to improve readablity and to avoid nested loops
      *> and if-statements
                PERFORM READ-VALIDATE-SAVE-INPUT-DATA
                ADD 1 TO COUNTER

           END-PERFORM
       .

      *> Ask user to provide fruit name and its prise until valid data is provided
       READ-VALIDATE-SAVE-INPUT-DATA.
      *> Reset fruit name holder
           MOVE SPACES TO TEMP-FRUIT-NAME
           PERFORM UNTIL FUNCTION TRIM(TEMP-FRUIT-NAME) NOT = SPACES

               DISPLAY "Enter " COUNTER " fruit: "
               ACCEPT TEMP-FRUIT-NAME
               IF TEMP-FRUIT-NAME = SPACES
                   DISPLAY "Name cannot be empty."
               END-IF

           END-PERFORM
      *> Reset fruit prise holder
           MOVE SPACES TO TEMP-FRUIT-PRICE
           PERFORM UNTIL
           FUNCTION TRIM(TEMP-FRUIT-PRICE) IS NUMERIC
           AND FUNCTION TRIM(TEMP-FRUIT-PRICE) NOT = SPACES

               DISPLAY "Enter price for "
                       FUNCTION TRIM(TEMP-FRUIT-NAME) ":"
               ACCEPT TEMP-FRUIT-PRICE
               IF NOT FUNCTION TRIM(TEMP-FRUIT-PRICE) IS NUMERIC
                   DISPLAY "Price must be numeric!"
               END-IF

           END-PERFORM
      *> Put accepted data to the table
           MOVE TEMP-FRUIT-NAME TO FRUIT-NAME(COUNTER)
           MOVE FUNCTION NUMVAL(TEMP-FRUIT-PRICE)
               TO FRUIT-PRICE(COUNTER)
       .
      *> After ASCENDING sorting most expensive and cheapest fruits locate
      *> in the end and on the top of the fruits table
       DISPLAY-RESULT.
           DISPLAY "Most expensive fruit: "
           FRUIT-NAME(5) " " FRUIT-PRICE(5)
           DISPLAY "Cheapest fruit: " FRUIT-NAME(1) " " FRUIT-PRICE(1)
       .

       END PROGRAM Assignment-2.
