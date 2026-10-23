#import "modelo-aula.typ": *

#show: aula.with(
  numero: 4,
  titulo: "Super Quiz",
  subtitulo: "Um jogo que só termina quando você errar, e que fica mais difícil a cada acerto.",
  recurso: "Teclado e diálogos",
  conceitos: ("laço while", "condição de parada", "variável sentinela", "laços aninhados"),
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "jogando = 1",
    "while jogando = 1",
    "  ... pergunta ...",
    "  if errou",
    "    jogando = 0",
    "  endif",
    "repeat",
    "",
    "> 5 x 7 = ?_",
  ),
)

#nesta-aula(
  [Repetir *enquanto* uma condição for verdadeira, com o laço `while`.],
  [Saber quando usar `for` e quando usar `while`.],
  [Controlar um laço com uma *variável sentinela*.],
  [Aumentar a dificuldade do jogo a cada acerto.],
  [Colocar um laço *dentro* de outro e criar um jogo com recorde.],
)

Na Aula 3 o jogo tinha exatamente 10 perguntas, e o `for` era perfeito, porque sabíamos o número de voltas de antemão. Agora o desafio é outro: o jogo só acaba quando o jogador *errar*. Pode ser na primeira pergunta ou na quinquagésima. Ninguém sabe, nem o programa, e é por isso que precisamos de um laço novo.

= O laço while

#figure(caption: [Laço `while` com cinco iterações])[
#codly.new(```basic
n = 1

while n <= 5
  print "n vale " + int$(n)
  n = n + 1
repeat

print "Saí do laço com n = " + int$(n)
end
```, file: "laco-while.bas",)
]

#tela[
  n vale 1 \
  n vale 2 \
  n vale 3 \
  n vale 4 \
  n vale 5 \
  Saí do laço com n = 6
]

#etapa("rodar")[Execute. Por que o último valor impresso dentro do laço é 5, mas o `n` final é 6?]

O `while` lê-se literalmente: "*enquanto* `n` for menor ou igual a 5, repita o que está até o `repeat`". A condição é testada *antes de cada volta*. Quando ela se torna falsa, o laço termina e o programa segue para a linha seguinte ao `repeat`.

#conceito("Laço while")[
  `while condição ... repeat` repete o corpo enquanto a condição for
  verdadeira. Como a condição é testada no *início*, se ela já começar falsa o corpo *nunca é executado*. E, para o laço terminar, alguma coisa *dentro dele* precisa mudar o resultado da condição.
]

#table(
  columns: (2cm, 8cm, 1fr),
  [Laço], [Use quando...], [Exemplo],
  [`for`], [você sabe quantas voltas serão], [10 perguntas],
  [`while`], [a parada depende de *algo que acontece*], [até o jogador errar],
)

#atencao[
  Se nada dentro do laço altera a condição, ele *nunca termina*. Isso é um *laço infinito*. No exemplo acima, sem a linha `n = n + 1`, a condição `n <= 5` seria verdadeira para sempre. Para interromper o programa travado, use o botão voltar do aparelho.
]

= Problemas que pedem while

== Quantos dobros?

Quando usamos o `for` sabemos de antemão quantas voltas devem ocorrer no laço. Quando não temos essa informação, o `while` é a ferramenta certa. Por exemplo, quantas vezes é preciso dobrar o número 1 para ultrapassar 100? 

#figure(caption: [Laço `while` para calcular $n$ tal que $2^n > 100$])[
  #codly.new(
```basic
n = 1
vezes = 0

while n <= 100
  n = n * 2
  vezes = vezes + 1
repeat

print int$(vezes) + " dobros, chegando a " + int$(n)
```,
  file: "dobros.bas") 
]


O código entre `while` e `repeat` será executado se a condição `n <= 100` for verdadeira. Quando a condição for falsa, o laço acabará. 

#table(
  columns: (2.5cm, 4cm, 3cm, 1fr),
  [Volta], [Condição], [Valor de `n`], [Valor de `vezes`],
  [1], [`1 <= 100?`: sim], [1 x 2 = 2], [0 + 1 = 1],
  [2], [`2 <= 100?`: sim],[2 x 2 = 4], [1 + 1 = 2],
  [3], [`4 <= 100?`: sim],[4 x 2 = 8], [2 + 1 = 3],
  [4], [`8 <= 100?`: sim],[8 x 2 = 16], [3 + 1 = 4],
  [5], [`16 <= 100?`: sim],[16 x 2 = 32], [4 + 1 = 5],
  [6], [`32 <= 100?`: sim],[32 x 2 = 64], [5 + 1 = 6],
  [7], [`64 <= 100?`: sim],[64 x 2 = 128], [6 + 1 = 7],
  [8], [`128 <= 100?`: *não*],[ ], [ ],  
)

Quando chegar na sétima rodada, `n = 64` e `vezes = 6`. Como a condição é verdadeira, `n` vai dobrar e `vezes` recebe mais 1. Na próxima rodada a condição será falsa e o código do laço não será executado. Não dava para usar `for` aqui, pois não sabíamos o número de voltas.

#etapa("rodar")[Confira o resultado.]

Note que a verificação da condição é no início do laço.

== Soma dos dígitos

Como somar os dígitos de 4729 (4 + 7 + 2 + 9 = 22) *sem* tratar o número como texto? Com duas operações matemáticas:

- `mod(n, 10)` (resto da divisão de `n` por `10`) dá o *último dígito*;
- `floor(n / 10)` (seleciona a parte inteira de `n`) *remove* o último dígito.


#figure(caption: [Laço `while` para calcular a soma de digitos])[
#codly.new(```basic
n = 4729
soma = 0

while n > 0
  soma = soma + mod(n, 10)
  n = floor(n / 10)
repeat

print "Soma dos dígitos: " + int$(soma)
```, file: "digitos.bas", )
]

#table(
  columns: (2cm, 3cm, 3cm, 1fr),
  [Volta], [`n` no início], [`mod(n, 10)`], [`soma` no fim],
  [1], [4729], [9], [0 + 9 = 9],
  [2], [472], [2], [9 + 2 = 11],
  [3], [47], [7], [11+ 7 = 18],
  [4], [4], [4], [18 + 4 = 22],
)

Depois da volta 4, `n` vira `floor(4 / 10) = 0`, a condição `n > 0` falha e o laço termina.

#etapa("rodar")[Troque o 4729 por outro número e antecipe a resposta com um teste de mesa antes de executar.]


= Super Quiz

Planejando como na aula passada:

#table(
  columns: (3.4cm, 1fr),
  [Parte], [Decisão],
  [Repetição], [`while jogando = 1`: continua enquanto o jogador não errar.],
  [Estado], [`acertos` (sequência atual) e `jogando` (1 = continua, 0 = acabou).],
  [Se acertar], [Soma 1 em `acertos` e continua.],
  [Se errar], [Muda `jogando` para 0, e o laço termina na próxima checagem.],
)

#conceito("Variável sentinela")[
  A variável `jogando` *guarda a decisão* de continuar ou parar. O  laço olha para ela a cada volta. Dentro dele, qualquer parte do programa pode "levantar a bandeira" (`jogando = 0`) para encerrar tudo. É uma técnica muito usada, porque deixa o código legível: "enquanto estiver jogando".
]


#figure(caption: [Super Quiz])[
#codly.new(```basic
acertos = 0
jogando = 1

while jogando = 1
  a = floor(rnd() * 9) + 1
  b = floor(rnd() * 9) + 1
  input int$(a) + " x " + int$(b) + " = ", resp

  if resp = a * b
    acertos = acertos + 1
    print "Acertou!"
  else
    print "Errou! Era " + int$(a * b)
    jogando = 0
  endif
repeat

print "Fim de jogo! Sua sequência: " + int$(acertos)
end
```,
file: "super-quiz.bas") ]


#etapa("rodar")[Jogue até errar. Quantas você acertou seguidas?]

== Dificuldade crescente

Com 9 como limite, o jogo cansa depressa. Podemos fazer o limite *crescer* junto com a sequência. Crie uma variável `limite`, comece com 9 e use-a nos sorteios:

Antes do `while`:

```plain
limite = 9                     
```

Dentro do `while`:

```plain
a = floor(rnd() * limite) + 1 
b = floor(rnd() * limite) + 1
```

Dentro do `if`, depois de somar o acerto:

```plain
limite = 9 + 2 * acertos    
```

Assim, depois de 5 acertos os números chegam até 19, depois de 10 até 29, e assim por diante.

= Laço dentro de laço

Observe o código abaixo:

#figure(caption: [Super Quiz com laço aninhado])[
#codly.new(```basic
recorde = 0
continuar = 1

while continuar = 1
  acertos = 0
  limite = 9
  jogando = 1

  while jogando = 1
    a = floor(rnd() * limite) + 1
    b = floor(rnd() * limite) + 1
    input int$(a) + " x " + int$(b) + " = ", resp

    if resp = a * b
      acertos = acertos + 1
      limite = 9 + 2 * acertos
    else
      jogando = 0
    endif
  repeat

  if acertos > recorde
    recorde = acertos
    msg$ = "Novo recorde: " + int$(recorde) + "!"
  else
    msg$ = "Sequência: " + int$(acertos) + "." 
  endif

  print msg$
  dialog.message "Fim de jogo", "Jogar de novo?", escolha, "Sim", "Não"
  if escolha <> 1 then continuar = 0
repeat
end
```,
  file: "super-quiz-rec.bas") 
  ]

Ele adiciona um recorde e a opção de jogar de novo. Isso exige *dois* laços: o de *dentro* controla uma partida, e o de *fora* controla se haverá outra. O laço de fora precisa *zerar* as variáveis da partida a cada recomeço.


#tela[
  Fim de jogo \
  Novo recorde: 7! Jogar de novo? \
  \
  [ Sim ]  [ Não ]
]


Veja como as responsabilidades se dividem:

#table(
  columns: (6cm, 1fr),
  [Laço], [Responsabilidade],
  [`while continuar = 1`], [Uma volta equivale a *uma partida inteira*.],
  [`while jogando = 1`], [Uma volta equivale a *uma pergunta*.],
  [`recorde`], [Criada *fora* de tudo, para sobreviver entre as partidas.],
  [`acertos`, `limite`, `jogando`], [Zeradas no início de cada partida.],
)

#atencao[
  Lembra do experimento da Aula 3, em que colocar `acertos = 0` dentro do `for`
  zerava o placar a cada volta e estragava tudo? Aqui fazemos de propósito: cada
  partida *deve* recomeçar do zero. A diferença está no *laço* em que a linha
  mora.
]

= Quebre o código!

#etapa("quebrar")[Apague a linha `jogando = 0` e execute. O que acontece? (Use o botão voltar para sair.)]
#etapa("quebrar")[Coloque `jogando = 1` *dentro* do laço interno, logo depois do `while`. O jogo ainda termina quando você erra? Por quê?]
#etapa("quebrar")[Troque `while jogando = 1` por `while jogando = 0`. O que o jogo faz? Por que o corpo nunca roda?]
#etapa("quebrar")[Na versão final, apague `acertos = 0` do início da partida. O que acontece na segunda partida?]
#etapa("quebrar")[Mova `recorde = 0` para dentro do laço externo. Ainda funciona o recorde? Por quê?]

#dica[
  Quase todo erro de `while` cai em uma de duas famílias: a condição *nunca
  muda* (laço infinito) ou *já começa falsa* (laço que nunca roda). Treine o
  olho para as duas.
]

#desafio("Corrida contra o relógio")[
  Em vez de parar no primeiro erro, o jogo dura *30 segundos*. Vale quantas
  contas o jogador acertar nesse tempo.

  + guarde o instante de início com `inicio = clock()`;
  + o laço continua enquanto `clock() - inicio < 30000`;
  + errar não encerra o jogo, mas *tira 1 ponto*;
  + no final, o celular fala o placar.

]

= Resumo

#table(
  
  columns: (5.7cm, 1fr),
  [Ideia ou comando], [Para que serve],
  [`while condição ... repeat`], [Repete o corpo enquanto a condição for verdadeira.],
  [Condição testada no início], [Se começar falsa, o corpo nunca roda.],
  [Laço infinito], [Condição que nunca muda; botão voltar encerra.],
  [Variável sentinela], [Guarda a decisão de continuar (`jogando = 1`) ou parar (`0`).],
  [`mod(n, 10)`, `floor(n / 10)`], [Último dígito e remoção do último dígito.],
  [Laços aninhados], [O laço de dentro roda inteiro a cada volta do de fora.],
  [`dialog.message`], [Mostra uma caixa com botões e devolve o botão escolhido.],
  [`clock()`], [Relógio do aparelho, em milissegundos.],
)

#proxima[
  *Aula 5: Sensor de nível.* A grande estreia dos sensores. O celular vai descobrir se está de pé, deitado ou sendo chacoalhado. Usaremos o laço `do ... until` para *esperar* um evento, como "repita até chacoalhar", e juntaremos tudo o que aprendemos até aqui.
]
