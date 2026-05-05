      *> NOTE:
      *> This implementation processes TRANSACTION-FILE sequentially for each account,
      *> reading the file line-by-line from disk instead of loading it into memory.
      *> No sorting or indexing is applied, so matching is done via full scan for each ACC-ID.
      *> As a result, the algorithm has O(n^2) time complexity in the worst case,
      *> since every account triggers a full pass over the transaction file.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIRST-TASK-SEQUENTIAL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ACC-FILE ASSIGN TO "../ACCOUNTS-IN.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT TRN-FILE ASSIGN TO "../TRANSACTIONS.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUT-FILE ASSIGN TO "../ACCOUNTS-OUT.DAT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD ACC-FILE.
       01 ACC-RECORD.
           05 ACC-ID               PIC X(10).
           05 ACC-NAME             PIC X(18).
           05 ACC-BALANCE          PIC 9(7)V99.

       FD TRN-FILE.
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
       01 TRN-EOF-FLAG             PIC X VALUE 'N'.
       01 WS-ACC-BALANCE           PIC 9(7)V99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM PROCESS-TRANSACTIONS
            STOP RUN.
       PROCESS-TRANSACTIONS.
           OPEN INPUT ACC-FILE
           OPEN INPUT TRN-FILE
           OPEN OUTPUT OUT-FILE.
           PERFORM UNTIL ACC-EOF-FLAG EQUALS 'Y'
               READ ACC-FILE
                   AT END MOVE 'Y' TO ACC-EOF-FLAG
                   NOT AT END
                       MOVE ACC-BALANCE TO WS-ACC-BALANCE
                       PERFORM PROCESS-ACC
                       PERFORM SAVE-UPDATE
               END-READ
           END-PERFORM
           CLOSE ACC-FILE.
           CLOSE TRN-FILE.
           CLOSE OUT-FILE.

       PROCESS-ACC.
           MOVE 'N' TO TRN-EOF-FLAG
           CLOSE TRN-FILE
           OPEN INPUT TRN-FILE

           PERFORM UNTIL TRN-EOF-FLAG EQUALS 'Y'
               READ TRN-FILE
                   AT END MOVE 'Y' TO TRN-EOF-FLAG
                   NOT AT END
                       IF ACC-ID EQUALS TRN-ACC-ID
                           PERFORM APPLY-TRANSACTION
                       END-IF
               END-READ
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

       END PROGRAM FIRST-TASK-SEQUENTIAL.
