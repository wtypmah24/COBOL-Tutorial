       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       *> Original numeric value (no formatting)
       01 WS-AMOUNT             PIC 9(7)V99 VALUE 23456.78.

       *> Edited field: commas + decimal point
       *> Example: 23,456.78
       01 WS-AMOUNT-COMMA       PIC ZZ,ZZZ,ZZ9.99.

       *> Edited field: currency symbol ($)
       *> Example: $23,456.78
       01 WS-AMOUNT-DOLLAR      PIC $Z,ZZZ,ZZ9.99.

       *> Edited field: zero suppression (Z removes leading zeros)
       *> Example:    23,456.78 (leading spaces instead of zeros)
       01 WS-AMOUNT-ZERO-SUP    PIC Z,ZZZ,ZZ9.99.

       *> Edited field: check protection (* replaces leading zeros)
       *> Example: $***23,456.78
       01 WS-AMOUNT-STAR        PIC $**,***,**9.99.

       *> Original alphanumeric value
       01 WS-TEXT            PIC X(12) VALUE 'HELLOWORLD12'.

       *> Insert "/" at position before last 2 characters
       *> Expected: HELLOWORLD/12
       01 WS-TEXT-SLASH      PIC X(10)/XX.

       *> Insert space (B = blank)
       *> Expected: HELLO WORLD12
       01 WS-TEXT-SPACE      PIC X(5)BX(7).

       *> Original numeric value
       01 WS-NUM             PIC 9(5) VALUE 12345.

       *> Insert comma
       *> Expected: 12,345
       01 WS-NUM-COMMA       PIC 99,999.

       *> Insert blanks and zeros explicitly
       *> Expected: 01 234 000
       01 WS-NUM-MIXED       PIC 99B999B000.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
          *> Move raw numeric value into edited fields
           MOVE WS-AMOUNT TO WS-AMOUNT-COMMA
           MOVE WS-AMOUNT TO WS-AMOUNT-DOLLAR
           MOVE WS-AMOUNT TO WS-AMOUNT-ZERO-SUP
           MOVE WS-AMOUNT TO WS-AMOUNT-STAR

          *> Display results
           DISPLAY "Original value        : " WS-AMOUNT
           DISPLAY "With commas           : " WS-AMOUNT-COMMA
           DISPLAY "With dollar sign      : " WS-AMOUNT-DOLLAR
           DISPLAY "Zero suppression      : " WS-AMOUNT-ZERO-SUP
           DISPLAY "Check protection (*)  : " WS-AMOUNT-STAR

           *> Move data into edited fields
           MOVE WS-TEXT TO WS-TEXT-SLASH
           MOVE WS-TEXT TO WS-TEXT-SPACE
           MOVE WS-NUM  TO WS-NUM-COMMA
           MOVE WS-NUM  TO WS-NUM-MIXED

           *> Display results
           DISPLAY "Original text       : " WS-TEXT
           DISPLAY "With slash          : " WS-TEXT-SLASH
           DISPLAY "With space          : " WS-TEXT-SPACE

           DISPLAY "Original number     : " WS-NUM
           DISPLAY "With comma          : " WS-NUM-COMMA
           DISPLAY "With blanks/zeros   : " WS-NUM-MIXED

           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
