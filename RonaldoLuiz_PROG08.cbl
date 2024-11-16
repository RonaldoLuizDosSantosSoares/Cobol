**********************
* Author: Ronaldo Luiz
* Date: 15/11
* Purpose: Armazena as notas de P1, P2 e Atividade em 6 disciplinas
**********************

IDENTIFICATION DIVISION.
PROGRAM-ID. PROG08.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.

DATA DIVISION.
FILE SECTION.

WORKING-STORAGE SECTION.
       
   01 DISCIPLINAS.
      05 DISCIPLINA OCCURS 6 TIMES INDEXED BY IDX.
         10 NOTA-P1       PIC 9V99 VALUE 0.
         10 NOTA-P2       PIC 9V99 VALUE 0.
         10 NOTA-ATIV     PIC 9V99 VALUE 0.

   01 CONTADOR           PIC 9 VALUE 1.

PROCEDURE DIVISION.

BEGIN-PROGRAM.
       DISPLAY "===================================".
       DISPLAY "PROGRAMA - ARMAZENAMENTO DE NOTAS".
       DISPLAY "===================================".

       PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 6
           DISPLAY "Digite a nota P1 da disciplina " CONTADOR ":"
           ACCEPT NOTA-P1 OF DISCIPLINA (CONTADOR)
           
           DISPLAY "Digite a nota P2 da disciplina " CONTADOR ":"
           ACCEPT NOTA-P2 OF DISCIPLINA (CONTADOR)
           
           DISPLAY "Digite a nota da Atividade da disciplina " CONTADOR ":"
           ACCEPT NOTA-ATIV OF DISCIPLINA (CONTADOR)
       END-PERFORM.

       DISPLAY "===================================".
       DISPLAY "Notas registradas nas disciplinas:".

       PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 6
           DISPLAY "Disciplina " CONTADOR ":"
           DISPLAY "  Nota P1: " NOTA-P1 OF DISCIPLINA (CONTADOR)
           DISPLAY "  Nota P2: " NOTA-P2 OF DISCIPLINA (CONTADOR)
           DISPLAY "  Nota Atividade: " NOTA-ATIV OF DISCIPLINA (CONTADOR)
       END-PERFORM.

       STOP RUN.

       END PROGRAM PROG08.
