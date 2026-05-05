       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 WS-TEXT        PIC X(10).
      *   Alphanumeric field: can store any 10 characters (letters, digits, symbols)

       01 WS-NUM         PIC 9(5).
      *   Numeric field: stores 5 digits (0-9 only)

       01 WS-ID          PIC 999.
      *   Numeric field: same as 9(3), fixed 3 digits

       01 WS-NAME        PIC A(20).
      *   Alphabetic field: only letters and spaces allowed

       01 WS-SIGNED      PIC S9(5).
      *   Signed numeric field: can store positive or negative numbers

       01 WS-AMOUNT      PIC 9(3)V99.
      *   Implied decimal: 3 digits before and 2 after decimal (e.g. 12345 = 123.45)

       01 WS-BIG         PIC 99PPP.
      *   Scaling factor: value is multiplied by 1000 (P = assumed zeros to the right)

       01 WS-SMALL       PIC PP9.
      *   Scaling factor: value is divided (decimal scaling to the left)

       01 WS-NEG         PIC -999.
      *   Display numeric: shows minus sign only if value is negative

       01 WS-SIGN        PIC +999.
      *   Display numeric: shows + or - sign explicitly

       01 WS-DISPLAY     PIC 999.99.
      *   Numeric display with actual decimal point (for output, not calculations)

       01 WS-ZERO        PIC ZZZ9.
      *   Suppresses leading zeros (e.g. 0012 -> "  12")

       01 WS-COMMA       PIC 9,999.
      *   Displays number with thousands separator (e.g. 1000 -> "1,000")

       01 WS-MONEY       PIC $9,999.99.
      *   Currency format with dollar sign and decimal

       01 WS-STAR        PIC ****9.
      *   Replaces leading zeros with asterisks (used in financial printing)

       01 WS-CREDIT      PIC 999CR.
      *   Displays "CR" for credit (typically negative values in accounting)

       01 WS-DEBIT       PIC 999DB.
      *   Displays "DB" for debit

       01 WS-DATE        PIC 99/99/9999.
      *   Date format (DD/MM/YYYY or MM/DD/YYYY depending on usage)

       01 WS-ZERO-FILL   PIC 0009.
      *   Zero-filled numeric: always displays leading zeros

       01 WS-EMPLOYEE-ID PIC 9(5).
      *   Employee ID: numeric field with 5 digits

       01 WS-NAME        PIC X(30).
      *   Employee name: alphanumeric, up to 30 characters

       01 WS-SALARY      PIC S9(7)V99.
      *   Signed numeric with implied decimal (e.g. 123456789 = 1234567.89)

       01 WS-DISPLAY-SAL PIC $Z,ZZZ,ZZ9.99.
      *   Formatted salary for display: suppress zeros, add commas and currency symbol

      *------------------------------------------------------------------------
       01 A PIC 9(5).           *> DISPLAY
       01 B PIC 9(5) COMP.      *> binary
       01 WS-NUMBER PIC S9(03) COMP-3.
       01 WS-NUMBER1 PIC S9(03) SIGN LEADING SEPARATE.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
