       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIRST-TASK-INDEXED.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACC-FILE ASSIGN TO "../ACCOUNTS-IN.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
          *> To proceed with INDEXED ORGANIZATION, the file must be created and maintained
          *> by a compatible ISAM/Indexed File System (e.g. C-ISAM or a GnuCOBOL build
          *> configured with a working indexed backend).
           SELECT TRANSACTION-FILE ASSIGN TO "../TRANSACTIONS"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS TRN-PRIMARY-KEY
               ALTERNATE RECORD KEY IS TRN-ACC-ID WITH DUPLICATES.
           SELECT OUT-FILE ASSIGN TO "../ACCOUNTS-OUT.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD ACC-FILE.
       01 ACC-RECORD.
           05 ACC-ID               PIC X(10).
           05 ACC-NAME             PIC X(18).
           05 ACC-BALANCE          PIC 9(7)V99.

       FD TRANSACTION-FILE.
       01 TRN-RECORD.
           05 TRN-PRIMARY-KEY.
               10 TRN-ACC-ID       PIC X(10).
               10 TRN-ID           PIC X(10).
           05 TRN-TYPE             PIC X(10).
           05 TRN-AMOUNT           PIC 9(7)V99.

       FD OUT-FILE.
       01 OUT-RECORD.
           05 OUT-ID               PIC X(10).
           05 OUT-NAME             PIC X(18).
           05 OUT-AMOUNT           PIC 9(7)V99.
       WORKING-STORAGE SECTION.
       01 ACC-EOF-FLAG             PIC X VALUE 'N'.
       01 WS-ACC-BALANCE           PIC 9(7)V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM PROCESS-TRANSACTIONS
            STOP RUN.
       PROCESS-TRANSACTIONS.
           OPEN INPUT ACC-FILE
           OPEN INPUT TRANSACTION-FILE
           OPEN OUTPUT OUT-FILE.
           PERFORM UNTIL ACC-EOF-FLAG EQUALS 'Y'
               READ ACC-FILE
                   AT END MOVE 'Y' TO ACC-EOF-FLAG
                   NOT AT END
                       MOVE ACC-BALANCE TO WS-ACC-BALANCE
                       PERFORM SAVE-UPDATE
               END-READ
           END-PERFORM
           CLOSE ACC-FILE.
           CLOSE TRANSACTION-FILE.
           CLOSE OUT-FILE.

       PROCESS-ACC.
           MOVE ACC-ID TO TRN-ACC-ID

           START TRANSACTION-FILE KEY IS >= TRN-ACC-ID
               INVALID KEY
                   EXIT PROGRAM
           END-START.

           PERFORM UNTIL 1 = 2
               READ TRANSACTION-FILE NEXT RECORD
                   AT END
                       EXIT PERFORM
               END-READ

               IF TRN-ACC-ID NOT = ACC-ID
                   EXIT PERFORM
               END-IF

               PERFORM APPLY-TRANSACTION

           END-PERFORM.

       APPLY-TRANSACTION.
           EVALUATE TRN-TYPE
               WHEN 'WITHDRAW'
                   IF WS-ACC-BALANCE LESS THAN TRN-AMOUNT
                       DISPLAY "Not enough money for " ACC-ID
                   ELSE
                       SUBTRACT TRN-AMOUNT FROM WS-ACC-BALANCE
                   END-IF
               WHEN "DEPOSIT"
                   ADD TRN-AMOUNT TO WS-ACC-BALANCE
               WHEN OTHER
                   DISPLAY "Unknow transaction type" TRN-TYPE
           END-EVALUATE.

       SAVE-UPDATE.
           MOVE ACC-ID TO OUT-ID
           MOVE ACC-NAME TO OUT-NAME
           MOVE WS-ACC-BALANCE TO OUT-AMOUNT
           WRITE OUT-RECORD.

       END PROGRAM FIRST-TASK-INDEXED.
