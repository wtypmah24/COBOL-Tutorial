       IDENTIFICATION DIVISION.      *> Program identification section
       PROGRAM-ID. COBOLTUT.         *> Name of the program

       DATA DIVISION.                *> Section where data is defined
       WORKING-STORAGE SECTION.      *> Variables stored in memory

       01 SampleData    PIC X(10) VALUE 'Stuff'.
       *> Alphanumeric string (X) with length 10
       *> VALUE defines the initial content

       01 JustLetters   PIC AAA VALUE 'ABC'.
       *> Alphabetic characters only (A = letters)

       01 JustNumbers   PIC 9(4) VALUE 1234.
       *> Numeric value with 4 digits

       01 SignedInt     PIC S9(4) VALUE -1234.
       *> Signed numeric value (S allows + or -)

       01 PayCheck      PIC 9(4)V99 VALUE 1234.56.
       *> Fixed-point number:
       *> 4 digits before decimal, 2 after
       *> V means "implied decimal point" (not stored physically)

       PROCEDURE DIVISION.           *> Program logic starts here

           DISPLAY 'Sample Data: ' SampleData.
           *> Print text and variable value

           DISPLAY 'Just Letters: ' JustLetters.
           DISPLAY 'Just Numbers: ' JustNumbers.
           DISPLAY 'Signed Integer: ' SignedInt.
           DISPLAY 'Pay Check Amount: ' PayCheck.

           STOP RUN.                *> End of program
