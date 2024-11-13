      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG06A.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77 WRK-NOME    PIC X(30).
       77 WRK-MATERIA PIC X(15).
       77 WRK-NOTA    PIC 9(02).
       77 WRK-SITUACAO PIC X(20).
       77 WRK-CONTINUA PIC X.

       PROCEDURE DIVISION.
           MOVE 'N' TO WRK-CONTINUA
           PERFORM SOLICITA-INFORMACOES UNTIL WRK-CONTINUA = 'S' OR
                   WRK-CONTINUA = 's'
           GOBACK.

           SOLICITA-INFORMACOES.

           MOVE SPACES TO WRK-NOME, WRK-MATERIA
           INITIALIZE WRK-NOTA

           DISPLAY 'POR FAVOR, DIGITE SEU NOME'
           ACCEPT WRK-NOME

           DISPLAY 'DIGITE A MATERIA QUE VOCE ESTA CURSANDO'
           ACCEPT WRK-MATERIA

           DISPLAY 'INFORME A NOTA QUE VOCE TIROU NESTA DISCIPLINA'
           ACCEPT WRK-NOTA

           IF WRK-NOTA >=0 AND WRK-NOTA <= 4
               MOVE 'REPROVADO' TO WRK-SITUACAO
           ELSE
               IF WRK-NOTA = 5 OR WRK-NOTA = 6
                   MOVE 'EM RECUPERACAO' TO WRK-SITUACAO
           ELSE
               IF WRK-NOTA >= 7 AND WRK-NOTA <=10
                   MOVE 'APROVADO' TO WRK-SITUACAO
               ELSE
                   MOVE 'NOTA INVALIDA' TO WRK-SITUACAO
               END-IF
             END-IF
           END-IF

           DISPLAY 'OLA' WRK-NOME
           DISPLAY 'VOCE ESTA MATRICULADO NA MATERIA ' WRK-MATERIA
           DISPLAY 'E SUA NOTA FOI: ' WRK-NOTA
           DISPLAY 'E SUA SITUACAO FOI: ' WRK-SITUACAO.

           DISPLAY 'DESEJA CONTINUAR O PROGRAMA? (S/N)'
           ACCEPT WRK-CONTINUA.
       END PROGRAM PROG06A.
