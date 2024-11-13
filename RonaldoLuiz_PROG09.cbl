       **********************
       * Author: Ronaldo Luiz
       * Date: 13/11
       * Purpose: Mostra próximos 5 pares e 5 ímpares a partir de um número
       **********************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG09.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       * Armazenar o número de entrada do usuário
       01 NUMERO-INICIAL       PIC 9(4) VALUE 0.

       * Matrizes para armazenar números pares e ímpares
       01 NUMEROS-PARES.
           05 PAR OCCURS 5 TIMES PIC 9(4) VALUE 0.

       01 NUMEROS-IMPARES.
           05 IMPAR OCCURS 5 TIMES PIC 9(4) VALUE 0.

       * Variáveis de controle
       01 CONTADOR             PIC 9 VALUE 1.
       01 RESPOSTA             PIC X VALUE SPACE.

       PROCEDURE DIVISION.

       BEGIN-PROGRAM.
           DISPLAY "===================================".
           DISPLAY " PROGRAMA - PRÓXIMOS NÚMEROS PARES E ÍMPARES ".
           DISPLAY "===================================".

           PERFORM OBTER-NUMERO
           PERFORM MOSTRAR-NUMEROS

           * Pergunta ao usuário se deseja reiniciar ou encerrar
           PERFORM PERGUNTAR-REINICIAR
           IF RESPOSTA = 'S'
               GO TO BEGIN-PROGRAM
           ELSE
               STOP RUN.

       OBTER-NUMERO.
           DISPLAY "Digite um número inicial:"
           ACCEPT NUMERO-INICIAL

           * Calcula os próximos 5 pares
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 5
               IF NUMERO-INICIAL MOD 2 = 0
                   MOVE NUMERO-INICIAL TO PAR (CONTADOR)
                   ADD 2 TO NUMERO-INICIAL
               ELSE
                   ADD 1 TO NUMERO-INICIAL
                   MOVE NUMERO-INICIAL TO PAR (CONTADOR)
                   ADD 2 TO NUMERO-INICIAL
               END-IF
           END-PERFORM

           * Retorna ao número inicial para calcular os ímpares
           SUBTRACT 10 FROM NUMERO-INICIAL
           
           * Calcula os próximos 5 ímpares
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 5
               IF NUMERO-INICIAL MOD 2 = 1
                   MOVE NUMERO-INICIAL TO IMPAR (CONTADOR)
                   ADD 2 TO NUMERO-INICIAL
               ELSE
                   ADD 1 TO NUMERO-INICIAL
                   MOVE NUMERO-INICIAL TO IMPAR (CONTADOR)
                   ADD 2 TO NUMERO-INICIAL
               END-IF
           END-PERFORM

       MOSTRAR-NUMEROS.
           DISPLAY "===================================".
           DISPLAY "Próximos 5 números pares em ordem crescente:"
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 5
               DISPLAY "  Par " CONTADOR ": " PAR (CONTADOR)
           END-PERFORM

           DISPLAY "===================================".
           DISPLAY "Próximos 5 números ímpares em ordem decrescente:"
           PERFORM VARYING CONTADOR FROM 5 BY -1 UNTIL CONTADOR < 1
               DISPLAY "  Ímpar " CONTADOR ": " IMPAR (CONTADOR)
           END-PERFORM

       PERGUNTAR-REINICIAR.
           DISPLAY "Deseja inserir um novo número? (S/N)"
           ACCEPT RESPOSTA
           IF RESPOSTA = 's' OR RESPOSTA = 'S'
               MOVE 'S' TO RESPOSTA
           ELSE
               MOVE 'N' TO RESPOSTA.

       END PROGRAM PROG09.