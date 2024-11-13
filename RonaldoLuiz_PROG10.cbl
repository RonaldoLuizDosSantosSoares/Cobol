       **********************
       * Author: Ronaldo Luiz
       * Date: 13/11
       * Purpose:
       **********************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG10.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       * Armazenar o número de entrada do usuário
       01 NUMERO-INICIAL       PIC 9(4) VALUE 0.

       * Matriz para armazenar os próximos 5 números primos
       01 NUMEROS-PRIMOS.
           05 PRIMO OCCURS 5 TIMES PIC 9(4) VALUE 0.

       * Variáveis de controle
       01 CONTADOR             PIC 9 VALUE 1.
       01 RESPOSTA             PIC X VALUE SPACE.
       01 INDICE               PIC 9 VALUE 1.

       * Variáveis para o cálculo de números primos
       01 DIVISOR              PIC 9 VALUE 2.
       01 E-PRIMO              PIC X VALUE 'S'.
       01 RAIZ-QUADRADA        PIC 9(4).

       PROCEDURE DIVISION.

       BEGIN-PROGRAM.
           DISPLAY "===================================".
           DISPLAY " PROGRAMA - PRÓXIMOS NÚMEROS PRIMOS ".
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

           * Ajusta o número para o próximo primo, se necessário
           IF NUMERO-INICIAL < 2
               MOVE 2 TO NUMERO-INICIAL
           END-IF

           MOVE 1 TO INDICE

           * Procura os próximos 5 números primos
           PERFORM UNTIL INDICE > 5
               PERFORM CHECAR-PRIMO
               IF E-PRIMO = 'S'
                   MOVE NUMERO-INICIAL TO PRIMO (INDICE)
                   ADD 1 TO INDICE
               END-IF
               ADD 1 TO NUMERO-INICIAL
           END-PERFORM

       CHECAR-PRIMO.
           MOVE 'S' TO E-PRIMO
           MOVE 2 TO DIVISOR

           COMPUTE RAIZ-QUADRADA = FUNCTION SQRT(NUMERO-INICIAL)
           
           PERFORM UNTIL DIVISOR > RAIZ-QUADRADA OR E-PRIMO = 'N'
               IF NUMERO-INICIAL MOD DIVISOR = 0
                   MOVE 'N' TO E-PRIMO
               ELSE
                   ADD 1 TO DIVISOR
               END-IF
           END-PERFORM

       MOSTRAR-NUMEROS.
           DISPLAY "===================================".
           DISPLAY "Próximos 5 números primos em ordem crescente:"
           PERFORM VARYING CONTADOR FROM 1 BY 1 UNTIL CONTADOR > 5
               DISPLAY "  Primo " CONTADOR ": " PRIMO (CONTADOR)
           END-PERFORM

           DISPLAY "===================================".
           DISPLAY "Próximos 5 números primos em ordem decrescente:"
           PERFORM VARYING CONTADOR FROM 5 BY -1 UNTIL CONTADOR < 1
               DISPLAY "  Primo " CONTADOR ": " PRIMO (CONTADOR)
           END-PERFORM

       PERGUNTAR-REINICIAR.
           DISPLAY "Deseja inserir um novo número? (S/N)"
           ACCEPT RESPOSTA
           IF RESPOSTA = 's' OR RESPOSTA = 'S'
               MOVE 'S' TO RESPOSTA
           ELSE
               MOVE 'N' TO RESPOSTA.

       END PROGRAM PROG10.