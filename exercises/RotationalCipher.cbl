       IDENTIFICATION DIVISION.
       PROGRAM-ID. ROTATIONAL-CIPHER.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 INPUT-TEXT       PIC X(50).
       01 SHIFT            PIC 9(2).
       01 OUTPUT-TEXT      PIC X(50).
       01 I                PIC 9(2).
       01 BASE-UPPER       PIC 9(2) VALUE 65.
       01 BASE-LOWER       PIC 9(2) VALUE 97.
       01 ALPHABET-LENGTH  PIC 9(2) VALUE 26.
       01 CHAR-IN          PIC X(1).
       01 CHAR-OUT         PIC X(1).
       01 CHAR-CODE        PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            PERFORM GET-DATA-PARAGRAPH.
            PERFORM COMPUTE-PARAGRAPH.
            PERFORM PRINT-SECTION.

            STOP RUN.

       GET-DATA-PARAGRAPH.

           DISPLAY "WRITE A TEXT TO BE ENCRYPTED: "
           ACCEPT INPUT-TEXT

           DISPLAY "WRITE A CIPHER SHIFT: "
           ACCEPT SHIFT
       .

       COMPUTE-PARAGRAPH.
           DISPLAY "COMPUTE-PARAGRAPH"

           PERFORM VARYING I FROM 1 BY 1 UNTIL I >
           FUNCTION LENGTH(INPUT-TEXT)

               MOVE INPUT-TEXT(I:1) TO CHAR-IN

               EVALUATE CHAR-IN

                   WHEN "A" THRU "Z"
                       DISPLAY "UPPER CASE"
                       COMPUTE CHAR-CODE =
      *>                      MOD is Intrinsic Function to get modulo.
      *>                      Another way is a mod b = a - b * a/b
                           FUNCTION MOD(
      *>                      ORD is Intrinsic Function to get ACII number for a char
                               FUNCTION ORD(CHAR-IN) -
                               BASE-UPPER + SHIFT,
                               26
                           ) + BASE-UPPER
      *>                      CHAR is Intrinsic Function to get char from a ACII number
                       MOVE FUNCTION CHAR(CHAR-CODE) TO CHAR-OUT

                   WHEN "a" THRU "z"
                       DISPLAY "LOWER-CASE"
                       COMPUTE CHAR-CODE =
                           FUNCTION MOD(
                               FUNCTION ORD(CHAR-IN) -
                               BASE-LOWER + SHIFT,
                               26
                           ) + BASE-LOWER
                       MOVE FUNCTION CHAR(CHAR-CODE) TO CHAR-OUT

                   WHEN OTHER
                       DISPLAY "OTHER SIGNS"
                       MOVE CHAR-IN TO CHAR-OUT

                   END-EVALUATE

               MOVE CHAR-OUT TO OUTPUT-TEXT(I:1)

           END-PERFORM
       .

       PRINT-SECTION.
           DISPLAY "TEXT: " INPUT-TEXT
           DISPLAY " "
           DISPLAY "CIPHERED TEXT: " OUTPUT-TEXT
           DISPLAY " "
           DISPLAY "SHIFT: " SHIFT
       .

       END PROGRAM ROTATIONAL-CIPHER.
