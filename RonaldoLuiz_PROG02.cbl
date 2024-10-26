******************************************************************

* Author:
* Date:
* Purpose:
* Tectonics: cobc

******************************************************************

IDENTIFICATION DIVISION.
PROGRAM-ID. PROG02.
DATA DIVISION.
WORKING-STORAGE SECTION.

77 LARGURA PIC 9(003) VALUE ZEROS.
77 ALTURA PIC 9(003) VALUE ZEROS.
77 AREA-RESULT PIC 9(006) VALUE ZEROS.

PROCEDURE DIVISION.
INICIO.

           DISPLAY "Calculo de area (quadrados/retangulos)"

           DISPLAY "largura: "

           ACCEPT LARGURA

           DISPLAY "Altura: "

           ACCEPT ALTURA

           MULTIPLY LARGURA BY ALTURA GIVING AREA-RESULT

           DISPLAY "Area: " AREA-RESULT

            STOP RUN.

       END PROGRAM PROG02.

