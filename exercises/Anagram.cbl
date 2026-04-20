       IDENTIFICATION DIVISION.
       PROGRAM-ID. ANAGRAM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 TARGET-WORD PIC X(10).
       01 CANDIDATES.
           05 CANDIDATES-WORDS PIC X(10) OCCURS 10 TIMES.
       01 RESULT.
           05 RESULT-WORDS PIC X(10) OCCURS 10 TIMES.

       01 STOP-FLAG PIC X VALUE 'N'.
          88 STOP-LOOP VALUE 'Y'.

       01 IS-ANAGRAM-FLAG PIC X VALUE 'Y'.
          88 IS-ANAGRAM VALUE 'Y'.
          88 NOT-ANAGRAM VALUE 'N'.

       01 COUNTER PIC 9(02).
       01 RES-INDEX PIC 9(02) VALUE 1.
       01 I PIC 9(02).
       01 TEMP PIC X(10).

       01 TARGET-CHAR-COUNT.
          05 TARGET-CNT OCCURS 26 PIC 9(03) VALUE 0.

       01 CANDIDATE-CHAR-COUNT.
          05 CANDIDATE-CNT OCCURS 26 PIC 9(03) VALUE 0.

       01 CHAR-INDEX PIC 9(02).
       01 WORD-LEN PIC 9(02).
       01 CURRENT-CHAR PIC X(01).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM GET-INPUT
           PERFORM FIND-ANAGRAM
           PERFORM DISPLAY-RESULT
           STOP RUN
       .

       GET-INPUT.
           DISPLAY "ENTER A TARGET: "
           ACCEPT TARGET-WORD

           MOVE 1 TO COUNTER
           PERFORM UNTIL COUNTER > 10 OR STOP-LOOP
            DISPLAY "ENTER CANDIDATE (ESC TO STOP): "
            ACCEPT TEMP

            IF TEMP = "ESC"
                SET STOP-LOOP TO TRUE
            ELSE
                MOVE TEMP TO CANDIDATES-WORDS(COUNTER)
                ADD 1 TO COUNTER
            END-IF
           END-PERFORM
       .

       *>  ---TODO: DECOMPOSE
       *>  PERFORM PREPARE-TARGET
       *>  PERFORM PROCESS-CANDIDATE
           *>  PERFORM NORMALIZE-CANDIDATE
           *>  PERFORM PERFORM BUILD-CANDIDATE-COUNT
           *>  PERFORM PERFORM CHECK-ANAGRAM
           *>  PERFORM PERFORM PERFORM SAVE-RESULT
       *>  ---OR SOMETHING LIKE THAT
       FIND-ANAGRAM.

           MOVE FUNCTION UPPER-CASE(TARGET-WORD) TO TARGET-WORD

           COMPUTE WORD-LEN =
            FUNCTION LENGTH(FUNCTION TRIM(TARGET-WORD))

           MOVE ZERO TO TARGET-CHAR-COUNT
           PERFORM GET-TARGET-WORD-CHAR-COUNT

           PERFORM VARYING COUNTER FROM 1 BY 1 UNTIL COUNTER > 10

            IF CANDIDATES-WORDS(COUNTER) NOT = SPACES

                MOVE FUNCTION UPPER-CASE(
                    CANDIDATES-WORDS(COUNTER))
                    TO CANDIDATES-WORDS(COUNTER)

                IF WORD-LEN =
                   FUNCTION LENGTH(
                   FUNCTION TRIM(CANDIDATES-WORDS(COUNTER)))

                   MOVE ZERO TO CANDIDATE-CHAR-COUNT

                    PERFORM VARYING I FROM 1 BY 1
                    UNTIL I > WORD-LEN

                        MOVE CANDIDATES-WORDS(COUNTER)(I:1)
                        TO CURRENT-CHAR

                        COMPUTE CHAR-INDEX =
                            FUNCTION ORD(CURRENT-CHAR)
                            - FUNCTION ORD('A') + 1

                        IF CHAR-INDEX >= 1 AND CHAR-INDEX <= 26
                            ADD 1 TO CANDIDATE-CNT(CHAR-INDEX)
                        END-IF

                    END-PERFORM

                    SET IS-ANAGRAM TO TRUE

                    PERFORM VARYING I FROM 1 BY 1 UNTIL I > 26
                        IF CANDIDATE-CNT(I) NOT =
                           TARGET-CNT(I)
                            SET NOT-ANAGRAM TO TRUE
                        END-IF
                    END-PERFORM

                    IF IS-ANAGRAM
                        MOVE CANDIDATES-WORDS(COUNTER)
                        TO RESULT-WORDS(RES-INDEX)
                        ADD 1 TO RES-INDEX
                    END-IF

                END-IF
            END-IF

           END-PERFORM
       .

       GET-TARGET-WORD-CHAR-COUNT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > WORD-LEN

            MOVE TARGET-WORD(I:1) TO CURRENT-CHAR

            COMPUTE CHAR-INDEX =
                FUNCTION ORD(CURRENT-CHAR)
                - FUNCTION ORD('A') + 1

            IF CHAR-INDEX >= 1 AND CHAR-INDEX <= 26
                ADD 1 TO TARGET-CNT(CHAR-INDEX)
            END-IF

           END-PERFORM
       .

       DISPLAY-RESULT.
           DISPLAY "ANAGRAMS ARE:"
           PERFORM VARYING COUNTER FROM 1 BY 1
           UNTIL COUNTER >= RES-INDEX
            DISPLAY RESULT-WORDS(COUNTER)
           END-PERFORM
       .

       END PROGRAM ANAGRAM.
