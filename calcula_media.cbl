* Programa para adicionar nota de p1 e p2 e depois gerar a média

       IDENTIFICATION DIVISION.
          PROGRAM-ID. MEDIA.
          DATA DIVISION.
          WORKING-STORAGE SECTION.
           01  P1           PIC 9(3)V99.
           01  P2           PIC 9(3)V99.
           01  P3           PIC 9(3)V99.
           01  MEDIA        PIC 9(3)V99.
           01  MENSAGEM     PIC X(20).
           
          PROCEDURE DIVISION.

       MAIN-PROCESS.
           DISPLAY "Digite a nota P1: ".
           ACCEPT P1
           DISPLAY "Digite a nota P2: ".
           ACCEPT P2
           DISPLAY "Digite a nota P3: ".
           ACCEPT P3

           COMPUTE MEDIA = (P1 + P2) / 2

           IF MEDIA < 6
               COMPUTE MEDIA = (MEDIA + P3) / 2

               IF P3 > P1
                   MOVE P3 TO P1
               END-IF

               IF P3 > P2
                   MOVE P3 TO P2
               END-IF

               COMPUTE MEDIA = (P1 + P2) / 2
           END-IF

           IF MEDIA >= 6
               MOVE "APROVADO" TO MENSAGEM
           ELSE
               MOVE "REPROVADO" TO MENSAGEM
           END-IF

           DISPLAY "Média Final: " MEDIA
           DISPLAY "Status: " MENSAGEM

              STOP RUN.
    END PROGRAM MEDIA.
  
