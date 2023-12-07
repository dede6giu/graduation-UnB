# LIG4
LIG 4 é um jogo divertido jogado em um "tabuleiro" vertical. Podemos imaginar o tabuleiro como uma série de _m_ pilhas, com um tamanho máximo _n_ cada. Na sua jogada você pode colocar uma peça sua no topo de qualquer pilha que ainda tenha menos que _m_ peças. Vence quem conseguir deixar 4 de suas peças em posições adjacentes, seja na vertical, horizontal ou diagonal. Veja o exemplo abaixo.

```
.....
..VA. 
.VVAV
.AVAA
AVVVA
```

Nesse caso, **V** representa as peças vermelhas, e **A** as peças azuis. Os pontos representam posições vazias no tabuleiro. Note que o tamanho desse tabuleiro é _n_=5, _m_=5 e que o jogador vermelho ganhou a partida (tem 4 pedras empilhadas na coluna central). Dado um tabuleiro de LIG 4 resultante de uma partida, determine quem venceu.

## Entrada
A primeira linha fornece 2 inteiros _n_ e _m_ separados por espaço (4 < _n_, _m_ < 50), representando as dimensões do tabuleiro. As _n_ linhas seguintes fornecem, cada uma, uma string representando a _i_-ésima linha do tabuleiro, sendo composta exclusivamente dos símbolos 'V', 'A' ou '.'.

## Saída
Apresente 'Azul' se o jogador azul venceu, ou 'Vermelho' se o vermelho venceu, seguido de qual direção foi vitoriosa - conforme os exemplos. É garantido que alguém venceu o jogo e que em uma única dimensão.
