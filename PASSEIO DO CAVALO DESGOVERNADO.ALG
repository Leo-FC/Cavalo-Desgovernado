Algoritmo "PASSEIO DO CAVALO DESGOVERNADO"
Var
   mat : vetor[1..8,1..8] de caractere
   casa_atual : vetor[1..2] de inteiro
   i,j, x, l_inicial, c_inicial, random, c_visit, n_visit : inteiro
   visitada, nao_visitada, andou, continuar : caractere


Inicio

   escreval("  PASSEIO DO CAVALO DESGOVERNADO")

   escreval("                ,\\)")
   escreval("              ,;;' \")
   escreval("            ,;;' ( '\")
   escreval("                / '\_)")
   escreval("")
   // EXIBINDO A MATRIZ INICIAL E PREENCHENDO TODOS OS ESPAÇOS COM "O"

   visitada <- "X"
   nao_visitada <- "O"

   para i de 1 ate 8 faca
      para j de 1 ate 8 faca
         mat[i,j] <- nao_visitada
         escreva(" | ", mat[i,j])
      fimpara
      escreval(" ")
   fimpara
   //

   // SELECIONANDO ONDE O CAVALO IRÁ COMEÇAR

   escreval("")

   repita
      escreva("Selecione a LINHA (1-8) inicial: ")
      leia(l_inicial)
      escreval(" ")

      se (l_inicial < 1) ou (l_inicial > 8) entao
         escreval("Entrada inválida")
         escreval(" ")
      fimse
   ate((l_inicial >= 1) e (l_inicial <= 8))

   repita
      escreva("Selecione a COLUNA (1-8) inicial: ")
      leia(c_inicial)
      escreval(" ")

      se ((c_inicial < 1) ou (c_inicial > 8)) entao
         escreval("Entrada inválida")
         escreval(" ")
      fimse
   ate((c_inicial >= 1) e (c_inicial <= 8))

   // 1 linha
   // 2 coluna
   casa_atual[1] <- l_inicial
   casa_atual[2] <- c_inicial

   // MARCANDO ONDE O CAVALO COMEÇA COM UM "X"
   mat[casa_atual[1],casa_atual[2]] <- visitada
   escreval(" ")

   // MOVIMENTOS DO CAVALO
   // 0 CIMA E ESQUERDA
   // 1 CIMA E DIREITA
   // 2 BAIXO E ESQUERDA
   // 3 BAIXO E DIREITA
   // 4 ESQUERDA E CIMA
   // 5 ESQUERDA E BAIXO
   // 6 DIREITA E CIMA
   // 7 DIREITA E BAIXO

   para x de 1 ate 300 faca
      random <- randi(8)
      escolha (random)

      // CIMA E ESQUERDA
      caso 0
         // A condição abaixo irá verificar se a linha ou a coluna irá sair do
         // tamanho da matriz ( 8 linhas e 8 colunas )
         se (casa_atual[1] - 2 <= 0) ou (casa_atual[2]  - 1 <= 0) entao
            // NADA ACONTECE, POIS NÃO É POSSIVEL FAZER ESSA MOVIMENTAÇÃO
         senao
            // Salvando a linha e a coluna com a movimentação desejada do cavalo
            // No caso a baixo, a linha irá subir 2 casas ( subtraimos por 2 )
            // E a coluna para a esquerda ( subtraimos por 1 )
            // Para que a gente possa realizar o movimento para cima e esquerda
            casa_atual[1] <- casa_atual[1] - 2  //salvando nova linha
            casa_atual[2] <- casa_atual[2] - 1  //salvando nova coluna

            // A condição abaixo irá verificar se a casa que o cavalo quer ir
            // ainda não foi preenchida. caso não, iremos marcar ela com um "X"
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               // marcando a matriz com o "X" de visitada
               mat[casa_atual[1], casa_atual[2]] <- visitada
               //escreval("0")
               // Como a casa foi preenchida, iremos colocar a variavel
               // 'andou' como "sim", para que no final do loop seja exibido
               // a movimentação feita
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA CIMA E ESQUERDA")
               escreval("Saiu de Linha: ", casa_atual[1] + 2," Coluna: ", casa_atual[2] + 1)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               // Caso a matriz selecionada já tenha sido preenchida anteriormente
               // Iremos retornar
               casa_atual[1] <- casa_atual[1] + 2
               casa_atual[2] <- casa_atual[2] + 1
            fimse
         fimse

      // CIMA E DIREITA
      caso 1
         se (casa_atual[1] - 2 <= 0) ou (casa_atual[2] + 1 > 8) entao
         senao
            casa_atual[1] <- casa_atual[1] - 2
            casa_atual[2] <- casa_atual[2] + 1
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA CIMA E DIREITA")
               escreval("Saiu de Linha: ", casa_atual[1] + 2," Coluna: ", casa_atual[2] - 1)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] + 2
               casa_atual[2] <- casa_atual[2] - 1
            fimse
         fimse

      //BAIXO E ESQUERDA
      caso 2
         se (casa_atual[1] + 2 > 8) ou (casa_atual[2] - 1 <= 0) entao
         senao
            casa_atual[1] <- casa_atual[1] + 2
            casa_atual[2] <- casa_atual[2] - 1
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA BAIXO E ESQUERDA")
               escreval("Saiu de Linha: ", casa_atual[1] - 2," Coluna: ", casa_atual[2] + 1)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] - 2
               casa_atual[2] <- casa_atual[2] + 1
            fimse
         fimse

      //BAIXO E DIREITA
      caso 3
         se (casa_atual[1] + 2 > 8) ou (casa_atual[2] + 1 > 8) entao
         senao
            casa_atual[1] <- casa_atual[1] + 2
            casa_atual[2] <- casa_atual[2] + 1
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA BAIXO E DIREITA")
               escreval("Saiu de Linha: ", casa_atual[1] - 2," Coluna: ", casa_atual[2] - 1)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] - 2
               casa_atual[2] <- casa_atual[2] - 1
            fimse
         fimse

      //ESQUERDA E CIMA
      caso 4
         se (casa_atual[1] - 1 <= 0) ou (casa_atual[2] - 2 <= 0) entao
         senao
            casa_atual[1] <- casa_atual[1] - 1
            casa_atual[2] <- casa_atual[2] - 2
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA ESQUERDA E CIMA")
               escreval("Saiu de Linha: ", casa_atual[1] + 1," Coluna: ", casa_atual[2] + 2)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] + 1
               casa_atual[2] <- casa_atual[2] + 2
            fimse
         fimse

      //ESQUERDA E BAIXO
      caso 5
         se (casa_atual[1] + 1 > 8) ou (casa_atual[2] - 2 <= 0) entao
         senao
            casa_atual[1] <- casa_atual[1] + 1
            casa_atual[2] <- casa_atual[2] - 2
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA ESQUERDA E BAIXO")
               escreval("Saiu de Linha: ", casa_atual[1] - 1," Coluna: ", casa_atual[2] + 2)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] - 1
               casa_atual[2] <- casa_atual[2] + 2
            fimse
         fimse

      //DIREITA E CIMA
      caso 6
         se (casa_atual[1] - 1 <= 0) ou (casa_atual[2] + 2 > 8) entao
         senao
            casa_atual[1] <- casa_atual[1] - 1
            casa_atual[2] <- casa_atual[2] + 2
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA DIREITA E CIMA")
               escreval("Saiu de Linha: ", casa_atual[1] + 1," Coluna: ", casa_atual[2] - 2)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] + 1
               casa_atual[2] <- casa_atual[2] - 2
            fimse
         fimse

      //DIREITA E BAIXO
      caso 7
         se (casa_atual[1] + 1 > 8) ou (casa_atual[2] + 2 > 8) entao
         senao
            casa_atual[1] <- casa_atual[1] + 1
            casa_atual[2] <- casa_atual[2] + 2
            se mat[casa_atual[1], casa_atual[2]] = nao_visitada entao
               mat[casa_atual[1], casa_atual[2]] <- visitada
               andou <- "sim"
               escreval(" ")
               escreval("No tabuleiro a seguir, a movimentação feita pelo cavalo será:")
               escreval("PARA DIREITA E BAIXO")
               escreval("Saiu de Linha: ", casa_atual[1] - 1," Coluna: ", casa_atual[2] - 2)
               escreval("Para Linha: ", casa_atual[1]," Coluna: ", casa_atual[2])
            senao
               casa_atual[1] <- casa_atual[1] - 1
               casa_atual[2] <- casa_atual[2] - 2
            fimse
         fimse
      fimescolha

      se andou = "sim" entao
         escreval(" ")
         para i de 1 ate 8 faca
            para j de 1 ate 8 faca
               escreva(" | ", mat[i,j])
            fimpara
            escreval(" ")
         fimpara
         escreval("")
         escreval("Aperte ENTER para continuar")
         leia(continuar)
      fimse

      andou <- "nao"

   fimpara

   escreval(" ")
   escreval("CONFIGURAÇÃO FINAL")
   escreval(" ")

   c_visit <- 0
   n_visit <- 0

   para i de 1 ate 8 faca
      para j de 1 ate 8 faca
         se mat[i,j] = visitada entao
            c_visit <- c_visit + 1
         senao
            n_visit <- n_visit + 1
         fimse
         escreva(" | ", mat[i,j])
      fimpara
      escreval(" ")
   fimpara
   escreval("")
   escreval(" NUMERO DE CASAS VISITADAS : ", c_visit)
   escreval(" NUMERO DE CASAS NÃO VISITADAS : ", n_visit)

Fimalgoritmo