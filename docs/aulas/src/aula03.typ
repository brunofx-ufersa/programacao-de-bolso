#import "modelo-aula.typ": *

#show: aula.with(
  numero: 3,
  titulo: "Quiz",
  subtitulo: "Seu celular vira juiz de um quiz: sorteia contas, confere respostas e conta pontos.",
  recurso: "Sorteio e teclado",
  conceitos: ("laço for", "rnd()", "acumulador", "if dentro de laço"),
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "for i = 1 to 10",
    "  a = floor(",
    "    rnd()*9)+1",
    "  b = floor(",
    "    rnd()*9)+1",
    "  input ...",
    "next i",
    "",
    "> 7 x 8 = ?_",
  ),
)

#nesta-aula(
  [Repetir tarefas com o laço `for` e o seu *contador*.],
  [Sortear números inteiros em qualquer intervalo com `rnd()`.],
  [Acumular *pontos* numa variável e calcular uma porcentagem.],
  [Colocar um `if` *dentro* de um laço.],
  [Construir seu primeiro jogo completo, com começo, meio e fim.],
)

Até aqui o celular executou cada instrução uma vez. Se quiséssemos 10 perguntas
de multiplicação, teríamos de copiar o mesmo bloco 10 vezes, e qualquer
correção teria de ser feita 10 vezes. Hoje aprenderemos a pedir ao celular que
*repita*, e usaremos isso para criar uma competição de tabuada.

= O laço for

O `for` repete um bloco um número *conhecido* de vezes. Teste:

#figure(caption: [Laço `for` com cinco iterações])[
  #codly.new(
```basic
for i = 1 to 5
  print "Rodada: " + int$(i)
next i

end
```,
  file: "laco-for.bas",
  )
]<codigo-for>

 #tela[
  Rodada 1 \
  Rodada 2 \
  Rodada 3 \
  Rodada 4 \
  Rodada 5
] 

#etapa("rodar")[Execute e depois troque o `5` por `8`. Só um número mudou, mas o programa repetiu mais vezes.]

A variável `i` é o *contador*. Ela começa em `1`, vale `2` na rodada seguinte, e assim por diante, até `5`. O que estiver entre `for` e `next` é o *corpo* do
laço e é executado uma vez para cada valor do contador.

#conceito("Laço for")[
  `for contador = início to fim` repete o corpo para cada valor do contador,  de `início` até `fim`. O `next` fecha o laço. Com `step`, o contador pode
  pular de 2 em 2 (`step 2`) ou contar para trás (`step -1`).
]

#figure(caption: [Laço `for` com cinco iterações decrescentes])[
  #codly.new(
```basic
tts.init

for i = 5 to 1 step -1
  tts.speak int$(i)
  pause 500
next i

tts.speak "Asas batendo,"
tts.speak "Marcha de decolagem,"
tts.speak "Turbinas e"
tts.speak "Já"
tts.stop

end
```,  
  file: "laco-for-step.bas`",
  )
]

#etapa("rodar")[Execute a contagem. Depois troque o $5$ por $10$ e o `step -1` por `step -2`.]

O *contador* começa em $5$ e diminui de $1$ em $1$ (`step -1`) até chegar a $1$. O programa entra no laço e executa todo o código até `next`, dizemos então que ocorreu uma iteração ou uma volta/rodada. Quando todas as iterações acabarem, o programa sai do laço.


== Acumuladores

Repetição fica poderosa quando uma variável *acumula* resultados. Este laço soma os números de 1 a 10:

#figure(caption: [Laço `for` com acumulador])[
  #codly.new(
```basic
soma = 0

for i = 1 to 10
  soma = soma + i
next i

print "Soma: " + int$(soma)

end
```,  
  file: "acumulador.bas",
  )
]

Como saber o que acontece dentro do laço? Simulamos o programa no papel, linha a linha.

#table(
  columns: (2.5cm, 3cm, 1fr),
  [Volta], [Valor de `i`], [`soma` no fim da volta],
  [1], [1], [0 + 1 = 1],
  [2], [2], [1 + 2 = 3],
  [3], [3], [3 + 3 = 6],
  [4], [4], [6 + 4 = 10],
  [...], [...], [...],
  [10], [10], [45 + 10 = 55],
)

#conceito("Acumulador")[
  É uma variável que começa com um valor inicial (aqui, `soma = 0`) e é atualizada a cada volta. A linha `soma = soma + i` lê assim: "pegue o valor atual de `soma`, some `i` e guarde de volta em `soma`".
]


#etapa("rodar")[Confira o resultado.]


#atencao[
  O valor inicial do acumulador tem de ser definido *antes* do laço. Se `soma = 0` ficasse dentro do corpo, a soma voltaria a zero a cada volta.
]


= Sorteando números

Um quiz precisa de perguntas diferentes a cada rodada. Como vimos na aula passada, o comando `rnd()` sorteia um número *decimal* qualquer maior ou igual a 0 e menor que 1, como 0.2749 ou 0.9031. Para obter inteiros, vamos *transformar* esse número com expressões:

#table(
  columns: (1fr, 1fr),
  [Expressão], [Valores possíveis],
  [`rnd()`], [qualquer decimal de 0 até quase 1],
  [`rnd() * 9`], [qualquer decimal de 0 até quase 9],
  [`floor(rnd() * 9)`], [inteiros 0, 1, 2, ..., 8],
  [`floor(rnd() * 9) + 1`], [inteiros 1, 2, 3, ..., 9],
)

O `floor` arredonda para baixo, e o `+ 1` desloca o intervalo. Isso vale para
qualquer faixa. 


= Quiz da tabuada

== Uma pergunta só

Antes de repetir, fazemos funcionar *uma* rodada. Esta é a versão mínima do jogo:

#figure(caption: [Quiz simples])[
  #codly.new(
```basic
a = floor(rnd() * 9) + 1
b = floor(rnd() * 9) + 1
input int$(a) + " x " + int$(b) + " = ", resp

if resp = a * b
  print "Acertou!"
else
  print "Errou!"
endif

end
```,  
  file: "quiz.bas",
  )
]

O que acontece aqui:

+ `a` e `b` recebem números sorteados de 1 a 9.
+ O `input` mostra a conta *montada com texto* e guarda a resposta do jogador em `resp`.
+ O `if` compara `resp` com o produto `a * b`. 

#etapa("rodar")[Execute algumas vezes. As contas mudam a cada execução? Acerte uma, erre outra.]

== Dez perguntas, um placar

Agora a ideia central: *envolver a rodada num laço*, acrescentar um acumulador
de acertos e um resultado final.

#table(
  columns: (4cm, 1fr),
  [Parte], [Decisão],
  [Repetição], [`for i = 1 to total`, em que `total = 10`.],
  [Estado], [`acertos`, que começa em 0 e sobe 1 a cada resposta certa.],
  [Corpo do laço], [Sortear, perguntar, conferir, atualizar o placar.],
  [Depois do laço], [Calcular a porcentagem e comentar o resultado.],
)

#figure(caption: [Quiz com 10 perguntas e placar])[
  #codly.new(
```basic
acertos = 0
total = 10

for i = 1 to total
  a = floor(rnd() * 9) + 1
  b = floor(rnd() * 9) + 1
  input int$(a) + " x " + int$(b) + " = ", resp

  if resp = a * b
    acertos = acertos + 1
    print "Acertou!"
  else
    print "Errou!"
  endif
next i

porcentagem = round(acertos / total * 100)
print "Você acertou " + int$(acertos) + " de " + int$(total);
print " (" + int$(porcentagem) + "%)"

end
```,  
  file: "for-quiz.bas")
]


#tela[
  Acertou! \
  Errou!  \
  Acertou! \
  ... \
  Você acertou 8 de 10 (80%)
]

Repare em como as ideias se combinam: o `for` controla *quantas vezes*; as variáveis `a` e `b` são *redefinidas* a cada volta, por isso cada pergunta é nova; e `acertos` *sobrevive* de uma volta para outra, porque nunca é zerada dentro do laço.


#etapa("rodar")[Execute o jogo completo. Anote suas respostas e verifique o placar final com um teste de mesa no papel.]

#dica[
  A porcentagem usa a expressão `round(acertos / total * 100)`. O `round`
  arredonda para o inteiro mais próximo. Sem ele, 7 de 9 apareceria como
  `77.77777...`.
]

= Quebre o código!

Mude *uma coisa de cada vez* e observe o que acontece:

#etapa("quebrar")[Mova a linha `acertos = 0` para dentro do laço, logo depois do `for`. Qual é o placar final? Por quê?]
#etapa("quebrar")[Mude `total = 10` para `total = 3`. Todas as partes do programa se ajustaram sozinhas? Por quê?]
#etapa("quebrar")[Troque o `9` por `99` nas duas linhas de sorteio. O jogo ficou mais difícil? E mais divertido?]

#dica[
  O quarto experimento mostra a vantagem de usar variáveis como `total` em vez de repetir o número `10` em vários lugares: mudar o programa exige alterar *um único ponto*. Você pode modificar o programa para que o usuário diga quantas rodadas ele deseja jogar, basta usa `input` para a variável `total`.
]

#desafio("Duelo de dois jogadores")[
  Transforme a competição em um *duelo* no mesmo celular:

  + pergunte o nome dos dois jogadores (`nome1$` e `nome2$`);
  + as perguntas se alternam: *Jogador 1* nas voltas ímpares, *Jogador 2* nas pares;
  + cada jogador tem seu próprio placar;
  + no final, o celular *fala* quem venceu, ou anuncia o empate.

  Pista: o resto da divisão descobre a vez de quem. A expressão `mod(i, 2)`
  vale 1 nas voltas ímpares e 0 nas pares:

  ```plain
  if mod(i, 2) = 1
    ! vez do jogador 1
  else
    ! vez do jogador 2
  endif
  ```

  *Bônus 1:* deixe o jogador escolher o *tamanho máximo* dos números (fácil
  até 9, difícil até 99) usando uma variável no lugar do `9`.

]

= Resumo

#table(
  columns: (6.2cm, 1fr),
  [Ideia ou comando], [Para que serve],
  [`for i = a to b ... next i`], [Repete o corpo para cada valor de `i`, de `a` até `b`.],
  [`step`], [Muda o passo do contador (`step 2`, `step -1`).],
  [Acumulador], [Variável inicializada fora do laço e atualizada dentro dele.],
  [Teste de mesa], [Simular o laço no papel, volta por volta.],
  [`if` dentro de `for`], [A cada volta, o programa decide um caminho.],
  [`mod(a, b)`], [Resto da divisão de `a` por `b`.],
  [`round(x)`], [Arredonda para o inteiro mais próximo.],
)

#proxima[
  *Aula 4: Super Quiz.* E se não soubermos *quantas* perguntas vão ser feitas? O jogo só termina quando o jogador *errar*. Para isso conheceremos o laço `while`, que repete *enquanto* uma condição for verdadeira, e usaremos uma sequência de acertos para aumentar a dificuldade.
]
