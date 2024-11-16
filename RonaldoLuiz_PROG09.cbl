**********************
* Author: Ronaldo Luiz
* Date: 16/11
* Purpose: Mostra próximos 5 pares e 5 ímpares a partir de um número
**********************

IDENTIFICATION DIVISION.
PROGRAM-ID. PROG09.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.

DATA DIVISION.
WORKING-STORAGE SECTION.

   01 NUMERO-INICIAL       PIC 9(4) VALUE 0.

   01 NUMEROS-PARES.
       05 PAR OCCURS 5 TIMES PIC 9(4) VALUE 0.

   01 NUMEROS-IMPARES.
       05 IMPAR OCCURS 5 TIMES PIC 9(4) VALUE 0.

   01 CONTADOR-PAR         PIC 9 VALUE 1.
   01 CONTADOR-IMPAR       PIC 9 VALUE 1.
   01 RESPOSTA             PIC X VALUE SPACE.

   01 RESTO                PIC 9 VALUE 0.

PROCEDURE DIVISION.

BEGIN-PROGRAM.
   DISPLAY "===================================".
   DISPLAY " PROGRAMA - PROXIMOS NUMEROS PARES E IMPARES ".
   DISPLAY "===================================".

   PERFORM OBTER-NUMERO
   PERFORM MOSTRAR-NUMEROS

   PERFORM PERGUNTAR-REINICIAR
   IF RESPOSTA = 'S' OR RESPOSTA = 's'
       GO TO BEGIN-PROGRAM
   ELSE
       STOP RUN.

OBTER-NUMERO.
   DISPLAY "Digite um numero inicial:"
   ACCEPT NUMERO-INICIAL

   PERFORM VARYING CONTADOR-PAR FROM 1 BY 1 UNTIL CONTADOR-PAR > 5
       COMPUTE RESTO = NUMERO-INICIAL - (NUMERO-INICIAL / 2)
       IF RESTO = 0
           MOVE NUMERO-INICIAL TO PAR (CONTADOR-PAR)
           ADD 2 TO NUMERO-INICIAL
       ELSE
           MOVE NUMERO-INICIAL TO IMPAR (CONTADOR-IMPAR)
           ADD 2 TO NUMERO-INICIAL
           ADD 1 TO CONTADOR-IMPAR
       END-IF
   END-PERFORM.

MOSTRAR-NUMEROS.
   DISPLAY "===================================".
   DISPLAY "Proximos 5 numeros pares em ordem crescente:"
   PERFORM VARYING CONTADOR-PAR FROM 1 BY 1 UNTIL CONTADOR-PAR > 5
       DISPLAY "  Par " CONTADOR-PAR ": " PAR (CONTADOR-PAR)
   END-PERFORM

   DISPLAY "===================================".
   DISPLAY "Proximos 5 numeros impares em ordem crescente:"
   PERFORM VARYING CONTADOR-IMPAR FROM 1 BY 1 UNTIL CONTADOR-IMPAR > 5
       DISPLAY "  Impar " CONTADOR-IMPAR ": " IMPAR (CONTADOR-IMPAR)
   END-PERFORM.

PERGUNTAR-REINICIAR.
   DISPLAY "Deseja inserir um novo número? (S/N)"
   ACCEPT RESPOSTA
   IF RESPOSTA = 's' OR RESPOSTA = 'S'
       MOVE 'S' TO RESPOSTA
   ELSE
       MOVE 'N' TO RESPOSTA.

END PROGRAM PROG09.
