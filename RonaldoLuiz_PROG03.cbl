******************************************************************

* Author:
* Date:
* Purpose:
* Tectonics: cobc

******************************************************************

       IDENTIFICATION DIVISION.

       PROGRAM-ID. PROG03.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       77 WRK-NOME PIC X(30).

       77 WRK-MATERIA PIC X(15).

       77 WRK-NOTA PIC 9(02).

       PROCEDURE DIVISION.

           DISPLAY 'POR FAVOR, DIGITE SEU NOME'

           ACCEPT WRK-NOME

           

           DISPLAY 'DIGITE A MATERIA QUE VOCE ESTA CURSANDO'

           ACCEPT WRK-MATERIA

           

           DISPLAY 'INFORME A NOTA QUE VOCE TIROU NA DISCIPLINA'

           ACCEPT WRK-NOTA

           

           DISPLAY 'OLA ' WRK-NOME

               'VOCE ESTA MATRICULADO NA MATERIA ' WRK-MATERIA

               'E SUA NOTA FOI: ' WRK-NOTA

               

           GOBACK.

            STOP RUN.

       END PROGRAM PROG03.

