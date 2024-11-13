      **********************
      * Author: Ronaldo Luiz
      * Date: 13/11
      * Purpose:
      * Tectonics: cobc
      **********************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG07.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
        01 DISCIPLINAS-ADS.
       05 WRK-DISCIPLINA OCCURS 6 TIMES PIC X(30).

       01 CONTADOR PIC 9 VALUE 1.
       
       PROCEDURE DIVISION.
       
       PERFORM VARYING CONTADOR FROM 1 BY 1 ULTIL CONTADOR > 6
           DISPLAY 'DIGITE O NOME DA DISCIPLINA ' CONTADOR ":"
           ACCEPT WRK-DISCIPLINA (CONTADOR)
           
        END-PERFORM.

       DISPLAY "DISCIPLINAS CADASTRADAS: ".
       
       PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 6
           DISPLAY 'DISCIPLINA ' CONTADOR ":" WRK-DISCIPLINA (CONTADOR)
       END-PERFORM.

            STOP RUN.
       END PROGRAM PROG07.
