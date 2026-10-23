#import "modelo-aula.typ": *

#show: aula.with(
  numero: 2,
  titulo: "Expressões",
  subtitulo: "Pense como um algoritmo.",
  recurso: "Caixa de Diálogo",
  conceitos: ("pensamento algorítmico", "expressões", "condições", "caixas de diálogo"),
 autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "dialog.message",
    "titulo$,",
    "  mensagem$,",
    "  opcao,",
    "  opcao1$,",
    "  opcao2$",
    "",
    "> _",
  ),
)

#nesta-aula(
  [Resolver problemas em quatro passos: *entender, planejar, codificar e testar*.],
  [Montar *expressões* com contas, comparações e operadores lógicos.],
 )


= Pensar antes de codar

Um bom programador gasta mais tempo pensando do que digitando. Resolver um
problema com algoritmos costuma seguir quatro passos:

#table(
  columns: (3cm, 1fr),
  [Passo], [Pergunta que você faz],
  [*1. Entender*], [O que entra? O que deve sair? Há casos especiais?],
  [*2. Planejar*], [Dá para quebrar em partes menores? Qual é a sequência?],
  [*3. Codificar*], [Como traduzo cada parte para comandos?],
  [*4. Testar*], [Funciona com valores simples? E com valores extremos?],
)

#conceito("Entrada, processamento, saída")[
  Quase todo programa tem esse formato. A *entrada* é o que ele recebe (um
  toque, um número, um sensor). O *processamento* são as contas e decisões.
  A *saída* é o resultado (um texto, uma fala, um som).
]

Exemplo: _"fazer o celular avisar quando for chacoalhado"_. Pelo método:

#table(
  columns: (4cm, 1fr),
  [Parte], [Decisão],
  [Entrada], [Os três valores do acelerômetro, lidos sem parar.],
  [Processamento], [Calcular a *intensidade* do movimento e compará-la com um limite.],
  [Saída], [Falar uma mensagem e contar quantas vezes aconteceu.],
)

/* Em *pseudocódigo* (português estruturado, ainda sem comandos de verdade):

```
repita para sempre:
  leia x, y, z do sensor
  forca = raiz(x² + y² + z²)
  se forca passou do limite:
    some 1 ao total
    avise
```

#dica[
  Escrever o plano em pseudocódigo, num papel ou no próprio editor como
  comentário, é o melhor jeito de evitar a tela em branco.
]
*/


= Expressões

Uma *expressão* é qualquer coisa que o computador consegue calcular e
transformar em um valor, por exemplo, contas, comparações ou combinações delas. Existem expressões númericas e expressões lógicas.

#table(
  columns: (5cm, 1fr, 4cm),
  [Operação], [Escrita], [Exemplo],
  [Soma, subtração], [`+`  `-`], [`a + b - 1`],
  [Multiplicação, divisão], [`*`  `/`], [`n * 2 / 4`],
  [Potência], [`^`], [`x^2`],
  [Raiz quadrada], [`sqr( )`], [`sqr(16)` dá 4],
  [Valor absoluto], [`abs( )`], [`abs(-7)` dá 7],
  [Resto da divisão], [`mod( , )`], [`mod(7, 3)` dá 1],
  [Arredondar], [`round( )`, `floor( )`], [`floor(3.8)` dá 3],
)

#dica[
  A ordem das contas é a mesma da matemática: potência, depois multiplicação e
  divisão, depois soma e subtração. Em caso de dúvida, use parênteses.
]

Para combinar condições, use os operadores *lógicos*:

#table(
  columns: (5cm, 1fr, 4cm),
  [Operador], [Escrita], [Exemplo],
  [Negação], [`!` (inverte o valor lógico)], [`!(y > 1)`],
   [Conjunção], [`&` (as duas precisam ser verdade)], [`y > 1 & y < 9`],
  [Disjunção], [`|` (basta uma ser verdade)], [`x > 8 | x < -8`],
)


O operadores lógicos criam expressões lógicas que podem ser verdadeiras ou falsas. Esse tipo de expressão é muito usado com `if` e estruturas de repetição. Em Basic!, consideramos o `1` como verdadeiro e `0` como falso. Logo `1 & 0` (lê-se $1$ *e* $0$) é falso, pois a conjunção somente é verdadeira se ambos forem verdadeiros, já  `1 | 0` (lê-se $1$ *ou* $0$) é verdadeiro, pois a disjunção é verdadeira sempre que pelo menos um dos componentes também seja. Outros exemplos:

#table(
  columns: (1fr, 1fr),
  [Expressão], [Valor],
  [`2 < 1 & 3 <> 4`], [falso],
   [`"a" < "bcd" | 0 = 1`],  [verdade],
  [`!(1 | 0)`], [falso],
)

#desafio("Equação do segundo grau")[
  Crie um programa novo:

  + crie três variáveis para os coeficientes de um equação do segundo grau;
  + calcule o delta;
  + use um `if` para determinar se a equação tem solução real;
  + caso haja solução real, determine as raízes.
Exemplos para testar:
  - $x^2-6x+9=0$ (uma solução) 
  - $x^2+5x+5=0$ (sem solução)
  - $x^2-4x+3=0$ (duas soluções) 
]

= Calculadora de gorjeta

#figure(caption: [Conta do restaurante])[
  #codly.new(
```basic
input "Valor da conta? ", conta
input "Porcentagem da gorjeta? ", pct
input "Quantas pessoas? ", pessoas

gorjeta = conta * pct / 100
total = conta + gorjeta
porcab = total / pessoas

print using$("br", "Gorjeta ........... R$ %.2f", gorjeta)
print using$("br", "Total ............. R$ %.2f", total)
print using$("br", "Por pessoa ........ R$ %.2f", porcab)
```,
    file: "gorjeta.bas",
  )
]<codigo-gorjeta>


O comando `using$` formata uma _string_, o primeiro parametro é a localidade. No caso acima, usamos `br` para Brasil, então a casa decimal vai ser exibida com vírgula ao invés de ponto. Em seguida, temos uma _string_ com `%f` e depois um valor. Esse `f` significa _float_ e é usado para números decimais. 

Quando o texto for exibido, o valor de `gorjeta`, por exemplo, vai substituir o `%f`, portanto trata-se de um espaço reservado. O fato de colocarmos `.2f` significa que estamos limitando em duas casas decimais.


= Quebre o código!

#etapa("quebrar")[Troque `br` por `it`, `en` e `fr` e note a diferença na formatação do dinheiro] 
#etapa("quebrar")[Remova o primeira parametro ou coloque o valor `""`]
#etapa("quebrar")[Mude a precisão para quatro casas decimais]
#etapa("quebrar")[Mostre o valor de gorjeta sem a formatação]


#desafio("Cardápio")[
  Usando o comando `using$`, monte um cardárpio de comidas e bebidas.

  + Crie o nome do seu estabelecimento no topo;
  + Crie o cardápio de comidas;
  + Crie o cardápio de bebidas.
  
]

= Números aleatórios

A função `rnd()` retorna um número decimal aleatório maior do que ou igual a zero e menor do que um ($0 <= n < 1$). Por exemplo, `6 * rnd()` irá gerar números aleatórios no intervalo $[0,6)$ e `6 * rnd() + 1` irá gerar números aleatórios no intervalo $[1,7)$. 

Se escrevermos `d = floor(6 * rnd()) + 1`, `d` será um número aleatório dentro do conjunto ${1.0, 2.0, 3.0, 4.0, 5.0, 6.0}$. O próximo exemplo sorteia um número de 1 a 6, ou seja, simula um dado.

#figure(caption: [Dado de seis faces])[
  #codly.new(
```basic
dado = floor(6 * rnd()) + 1

print "Você jogou o dado..."
print "Resultado: " + int$(dado)
end
```,  
  file: "dado.bas",
  )
]<codigo-dado>


Use o intervalo de `rnd()` ($0 <= n < 1$) para criar uma probabilidade de $50%$ para cada evento do lançamento de uma moeda.

#figure(caption: [Cara ou coroa])[
  #codly.new(
```basic
print "Lançando a moeda..."

if rnd() < 0.5 
    print "Resultado: CARA"
else
    print "Resultado: COROA"
endif

end
```,  
  file: "moeda.bas",),
] <codigo-moeda>



= Jogo Craps

A cena clássica hollywoodiana com a mesa cheia de gente gritando números, assoprando os dados e torcendo junta é do jogo _Craps_. Ele usa dois dados comuns e gira em torno do _shooter_ (o jogador da vez que lança os dados). As apostas são feitas antes dos lançamentos, tentando prever a soma dos dois dados.

O programa a seguir simula uma rodada do jogo. O _shooter_ faz um palpite, o sistema lança os dados e imprime o resultado.


#figure(caption:[Craps])[
#codly.new(
```basic
input "Aposte na soma dos dois dados (2 a 12): ", palpite

dado1 = floor(6 * rnd()) + 1
dado2 = floor(6 * rnd()) + 1
soma = dado1 + dado2

print "Dado 1: " + int$(dado1)
print "Dado 2: " + int$(dado2)
print "Soma final: " + int$(soma)

if palpite = soma
  print "PARABÉNS! Você acertou a soma exata!"
else
  print "Que pena! A sorte não estava com você desta vez."
endif

end
```, file: "craps.bas"),
] <codigo-craps>


#etapa("rodar")[Execute e boa sorte!]

Mude o código para exibir os resultados dos dados e da soma usando `using$`, por exemplo:

```plain
print using$("", "Valor: %d", int(123))  
```

#desafio("Craps modificado")[

Mude as regras do jogo _Craps_ da seguinte forma:

- _Field_: Ganha se a soma do próximo tiro for 2, 3, 4, 9, 10, 11 ou 12.
- _Hardways_: Aposta que a soma virá em um par idêntico.
- _Any 7_, _Any Craps_: O próximo tiro é exatamente 2, 3, 7 ou 12.

Para isso:

  + pergunte qual tipo de jogo o usuário deseja jogar;
  + pergunte o valor da soma;
  + jogue os dados e determine o resultado.

Exemplo de como usar uma caixa de diálogo para selecionar uma opção

```plain
mode1$ = "Field"
mode2$ = "Hardways"
mode3$ = "Any 7, Any Craps"
msg$ = "Qual modalidade você deseja jogar?"

dialog.message "Craps", msg$, mode, mode1$, mode2$, mode3$
```
Se o usuário selecionar `Field`, a variável `mode` receberá o valor `1.0`, se for `Hardways`, `mode` será `2.0` e assim por diante.
]



= Resumo

#table(
  columns: (5cm, 1fr),
  [Ideia ou comando], [Para que serve],
  [`&`   `|`], [e, ou: combinam condições.],
  [`sqr`, `abs`, `mod`, `floor`], [raiz, valor absoluto, resto, arredondar para baixo.],
    [`rnd()`], [Sorteia um decimal de 0 até quase 1.],
  [`floor(rnd() * n) + 1`], [Sorteia um inteiro de 1 até `n`.],
  [`using$`], [Formata uma _string_ substituindo espaços reservadas],
  [`dialog.message`],[Cria uma caixa de dialogo com até três botões]
)


#proxima[
  *Aula 3: Quiz.* Vamos aprender a fazer o celular repetir tarefas usando o laço `for` e com isso implementaremos um jogo de tabuada com placar para testar a criançada.
]
