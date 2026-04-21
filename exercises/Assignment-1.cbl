       IDENTIFICATION DIVISION.
       PROGRAM-ID. Assignment-1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 PERSONAL-INFO.
           05 NAME             PIC X(10).
           05 AGE              PIC 9(03).
           05 FAVORITE-FOOD    PIC X(10).
       01 WORK-INFO.
           05 PROFESSION       PIC X(10).
           05 RETIRE-AGE       PIC 9(03).
           05 DREAM-JOB        PIC X(10).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM GET-PERSONAL-INFO.
            PERFORM GET-WORK-INFO.
            PERFORM PRINT-ALL-INFO.
            STOP RUN.

       GET-PERSONAL-INFO.
           DISPLAY "What's your name?"
           ACCEPT NAME
           DISPLAY "How old are you?"
           ACCEPT AGE
           DISPLAY "Favorite food?"
           ACCEPT FAVORITE-FOOD
       .
       GET-WORK-INFO.
           DISPLAY "What do you work with?"
           ACCEPT PROFESSION
           DISPLAY "At what age do you want to retire?"
           ACCEPT RETIRE-AGE
           DISPLAY "What is your dream job?"
           ACCEPT DREAM-JOB
       .
       PRINT-ALL-INFO.
           DISPLAY "*********************"
           DISPLAY "Name: " NAME
           DISPLAY "Age: " AGE
           DISPLAY "Favorite food: " FAVORITE-FOOD
           DISPLAY "*********************"
           DISPLAY "Work: " PROFESSION
           DISPLAY "Will retire at: " RETIRE-AGE
           DISPLAY "Dream job: " DREAM-JOB
       .

       END PROGRAM Assignment-1.
