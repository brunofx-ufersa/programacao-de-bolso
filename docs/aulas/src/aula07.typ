#import "modelo-aula.typ": *

#show: aula.with(
  numero: 7,
  titulo: "Funções",
  subtitulo: "Dê nome a pedaços de código e reaproveite-os em qualquer programa.",
  recurso: "Funções e include",
  conceitos: ("fn.def", "parâmetros", "valor devolvido", "escopo"),
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "fn.def rebate(",
    "  pos, vel,",
    "  raio, lim)",
    "  if pos < raio",
    "    fn.rtn -vel",
    "  endif",
    "  fn.rtn vel",
    "fn.end",
    "",
    "> vx = rebate(...)",
  ),
)

#nesta-aula(
  [Reconhecer *repetição* no código e transformá-la em uma função.],
  [Criar funções com `fn.def`, `fn.rtn` e `fn.end`.],
  [Usar *parâmetros* e *valor devolvido*, inclusive com texto.],
  [Entender o *escopo*: variáveis locais e globais.],
  [Chamar funções *sem retorno* com `call`.],
  [Montar uma *biblioteca* pessoal de funções com `include`.],
)

Olhe de novo para os programas das aulas passadas. A mesma conta de sorteio apareceu na tabuada, no dado e no duelo. Os dois blocos `if` de colisão da bolinha são quase idênticos, um para x e outro para y. Quando você copia e cola um trecho, e depois precisa corrigir o original, tem de lembrar de corrigir *todas* as cópias. Quem esquece, tem um _bug_.

A solução é dar nome a um pedaço de código e chamá-lo quando precisar. Isso é uma *função*.

/* #atencao[
  Esta apostila usa o *hBasic*, uma variante do RFO Basic. Alguns recursos desta
  aula (como funções que devolvem *arrays*) existem no hBasic mas *não* no RFO
  Basic original.
] */

= O problema

Na Aula 3, cada pergunta sorteava dois números:

```
a = floor(rnd() * 9) + 1
b = floor(rnd() * 9) + 1
```

Duas linhas quase iguais. E se o jogo passar a sortear de 1 a 20? Você precisa
trocar o `9` em dois lugares, e no duelo seriam quatro. Que tal escrever a
conta uma vez só e dar a ela um nome?

= Sua primeira função

A fim de escolher aleatoriamente um inteiro entre $[1,b]$, podemos usar a fórmula:

#align(center)[
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ f(b)=floor("rnd()" dot b ) + 1 $
    ]
  ]
]

A função possui um entrada $b$ e uma saída $f(b)$. A parte $floor("rnd()" dot b ) + 1$ é o corpo da função. 

Transformando em código (@codigo-sorteia):

#figure(caption: [Função para realizar sorteio])[
#codly.new(```basic
fn.def sorteia(limite)
  fn.rtn floor(rnd() * limite) + 1
fn.end

a = sorteia(9)
b = sorteia(20)
print int$(a) + " x " + int$(b) + " = " + int$(a * b)
end
```, file: "sorteia.bas",)
]<codigo-sorteia>

#etapa("rodar")[Execute algumas vezes. A variável `a` fica sempre entre 1 e 9? E `b`, entre 1 e 20?]

Cada parte da função tem um papel:

#table(
  columns: (4.2cm, 1fr),
  [Parte], [O que é],
  [`fn.def`], [Começa a *definição* da função.],
  [`sorteia`], [O *nome* que você escolhe.],
  [`(limite)`], [Os *parâmetros*, isto é, valores que a função recebe para trabalhar.],
  [corpo], [As instruções que a função executa.],
  [`fn.rtn valor`], [O *valor devolvido*.],
  [`fn.end`], [Termina a definição.],
)

#conceito("Função")[
  Uma função é uma *caixa preta* com nome: entram valores (*parâmetros*), ela
  trabalha e sai um valor (o *retorno*). É a mesma ideia da função matemática: para cada entrada, uma saída. Quem *chama* a função não precisa saber *como* ela calcula, só *o que* ela faz.
]


#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- 1. CAIXA DA FUNÇÃO (PROCESSAMENTO) ---
    rect((-2.2, -1.6), (2.2, 1.6), fill: rgb("#E8F5E9"), stroke: 1.5pt + rgb("#2E7D32"), radius: 0.25)
    
    // Título da Função
    content((0, 1.0), text(weight: "bold", fill: rgb("#1B5E20"), size: 10pt)[fn.soma(a, b)])
    
    // Corpo do Processamento (Código RFO BASIC)
    rect((-1.8, -1.1), (1.8, 0.5), fill: rgb("#FFFFFF"), stroke: 0.5pt + luma(180), radius: 0.1)
    content((0, 0.1), text(size: 8pt, fill: luma(100))[Corpo:])
    content((0, -0.3), text(size: 8.5pt, font: "DejaVu Sans Mono", fill: luma(30))[res = a + b])
    
    // Comando de Retorno
    content((0, -1.35), text(size: 8.5pt, font: "DejaVu Sans Mono", weight: "bold", fill: rgb("#2E7D32"))[fn.rtn res])

    // --- 2. ENTRADAS (PARÂMETROS / INPUTS) ---
    // Seta 1: Parâmetro a
    line((-4.5, 0.6), (-2.2, 0.6), mark: (end: ">", fill: rgb("#1565C0")), stroke: 1.3pt + rgb("#1565C0"))
    content((-3.35, 0.85), text(size: 8.5pt, fill: rgb("#1565C0"), weight: "bold")[Param. a])

    // Seta 2: Parâmetro b
    line((-4.5, -0.6), (-2.2, -0.6), mark: (end: ">", fill: rgb("#1565C0")), stroke: 1.3pt + rgb("#1565C0"))
    content((-3.35, -0.35), text(size: 8.5pt, fill: rgb("#1565C0"), weight: "bold")[Param. b])

    // Rótulo da Seção de Entrada
    content((-3.35, 1.4), text(size: 9pt, weight: "bold", fill: rgb("#1565C0"))[ENTRADAS])

    // --- 3. SAÍDA (VALOR DE RETORNO / OUTPUT) ---
    // Seta de Saída: Resultado
    line((2.2, -0.3), (4.5, -0.3), mark: (end: ">", fill: rgb("#D32F2F")), stroke: 1.3pt + rgb("#D32F2F"))
    content((3.35, -0.05), text(size: 8.5pt, fill: rgb("#D32F2F"), weight: "bold")[Valor res])

    // Rótulo da Seção de Saída
    content((3.35, 1.4), text(size: 9pt, weight: "bold", fill: rgb("#D32F2F"))[SAÍDA])

    // --- 4. FLUXO EXTERNO DA CHAMADA ---
    //content((-3.35, -1.3), text(size: 7.5pt, fill: luma(120))[soma = fn.soma(10, 20)])
  }),
  caption: [Representação do fluxo de uma função: as entradas (parâmetros) são processadas na caixa da função e o resultado retorna pelo comando `fn.rtn`.]
) <figura-conceito-funcao>



#atencao[
  A função precisa ser *declarada antes* de ser chamada. Coloque as definições
  no *começo* do programa.
]

Agora você pode reescrever o jogo da Aula 3. Em vez de repetir a conta, chamamos `sorteia`:

#figure(caption: [Quiz da tabuada])[
#codly.new(```basic
fn.def sorteia(limite)
  fn.rtn floor(rnd() * limite) + 1
fn.end

acertos = 0
total = 10

for i = 1 to total
  a = sorteia(9)
  b = sorteia(9)
  input int$(a) + " x " + int$(b) + " = ?", resp
  if resp = a * b
    acertos = acertos + 1
  endif
next i

print "Você acertou " + int$(acertos) + " de " + int$(total)
end
```, file: "for-quiz.bas.bas",)
]

#dica[
  O nome `sorteia` explica o que acontece. Ler `a = sorteia(9)` é mais
  fácil do que decifrar `floor(rnd() * 9) + 1`. Uma boa função também serve de
  *documentação* do programa.
]

Se o nome da função termina em `$`, como as variáveis que armazenam texto, ela devolve *texto*. Lembra da cadeia de `elseif` do nível de posição? Ela cabe numa função:


#figure(caption: [Função que determina a posição do celular])[
#codly.new(```basic
fn.def posicao$(x, y, z)
  if z > 8
    fn.rtn "deitado, tela para cima"
  endif
  if z < -8
    fn.rtn "deitado, tela para baixo"
  endif
  if y > 8
    fn.rtn "de pé"
  endif
  if y < -8
    fn.rtn "de cabeça para baixo"
  endif
  if abs(x) > 8
    fn.rtn "de lado"
  endif
  fn.rtn "inclinado"
fn.end

print posicao$(0, 9.7, 0.5)     
```, file: "posicao.bas",)
]

#conceito("Retorno antecipado")[
  O `fn.rtn` encerra a função na hora. Por isso a cadeia de `if` pode ser
  uma lista de testes simples. Logo, assim que um deles acertar, a função devolve
  o resultado e para. O último `fn.rtn` é o caso "nenhuma das anteriores".
]

#etapa("rodar")[Teste `posicao$` com `(0, 0, 9.8)`, `(0, -9.8, 0)` e `(5, 5, 5)`. Os resultados batem com o que você espera?]

= Funções sem retorno e chamada

Nem toda função precisa devolver algo. Algumas só fazem alguma coisa como falar,
desenhar, escrever. Elas simplesmente não têm `fn.rtn`:

#figure(caption: [Função sem retorno explícito])[
#codly.new(
```basic
fn.def apresenta(nome$)
  print "Olá, " + nome$ + "!"
  tts.speak "Olá, " + nome$ + "!"
fn.end

tts.init
call apresenta("Ana")
apresenta("Bruno")
pause 3000
end
```, file: "saudacao.bas",)
]

O comando `call` chama a função e ignora o que ela devolve. Uma função sem
`fn.rtn` devolve `0` (ou texto vazio `""`, se o nome terminar em `$`) quando
chega ao `fn.end`. 

Na linha 8, chamamos a função *sem* o `call` e também funciona. O uso de `call` é mais seguro, 
principalmente quando o nome da função começa com uma palavra reservada da linguagem (por exemplo, um nome que comece com
  `print`), porque o `call` evita confusão com o comando. 

#atencao[
Quando atribuímos o valor da saída da função a uma variável, não devemos usar `call`. 
Ou seja, não podemos fazer `a = call sorteia(9)`.
]


= Variáveis locais e globais

O que acontece com as variáveis criadas dentro de uma função? Por padrão, elas só existem dentro da função. Após o término, elas são descartadas.


#figure(caption: [Variável global e local])[
#codly.new(```basic
fn.def dobra(n)
  resultado = n * 2
  fn.rtn resultado
fn.end

resultado = 100
x = dobra(5)
print resultado       
print x               
```, file: "variavel-global.bas",)
]

A variável `resultado` de dentro da função é outra, embora com o mesmo nome. Dizemos que ela é *local*, existe só enquanto a função roda. A `resultado` de fora é *global*.

#table(
  columns: (2cm, 1fr, 5cm),
  [Tipo], [Onde vive], [A função enxerga?],
  [*Local*], [Dentro da função: parâmetros e variáveis criadas ali.], [Sim, só dentro dela.],
  [*Global*], [No programa principal, fora das funções.], [*Não*, por padrão.],
)

#conceito("Escopo")[
  *Escopo* é a região do programa onde um nome vale. A função vive numa "sala
  fechada": só vê o que recebe como parâmetro (ou o que importar de propósito).
  Isso protege o programa, pois uma função não bagunça por acidente as variáveis de
  quem a chamou.
]

= Passagem de argumentos

Há dois modos de passagem de argumentos: por valor e por referência. A passagem por valor já conhecemos, a variável é local, apenas uma cópia do valor é passado.

#figure(caption: [Passagem por valor e por referência])[
#codly.new(
```basic
fn.def incrementa(n)
  n = n + 1
fn.end

resultado = 100
incrementa(resultado)
print resultado       
```, file: "valor-referencia.bas",)
]

 Quando fazemos `incrementa(resultado)`, estamos passando o valor `100` e não a variável `resultado`. 
 
Se quisermos modificar a variável global devemos passar sua referência. Algo como o lugar na memória onde ela está armazenada. Isso pode ser feito acrescentando `&` no início do nome do argumento. 

#figure(caption: [Passagem por valor e por referência])[
#codly.new(
```basic
incrementa(&resultado)
print resultado       
```, file: "valor-referencia.bas",)
]

Ao rodar esse exemplo, você vai notar que a função `incrementa` realmente modificou a variável `resultado` quando passamos a referẽncia ao invés do valor.

#table(
  columns: (3.4cm, 1fr),
  [Modo], [O que acontece],
  [*Por valor*], [A função recebe uma *cópia*. \ Mudar o parâmetro lá dentro não altera a variável de fora.],
  [*Por referência*], [A função recebe a *própria* variável. \ Mudar o parâmetro lá dentro altera a variável de fora.],
)

// Os *arrays* são *sempre* passados por referência. 

Lembre-se: para passar um valor escalar (número ou texto) por referência, usamos o `&` na chamada. Dessa forma, a função altera a própria variável fora dela. 

/* #dica[
  O hBasic permite que uma função *devolva* um array (acrescentando `[]` ao nome, como em 
  `fn.def coordenadas(n)[]`) ou um *ponteiro* para uma estrutura (lista, pilha, bundle ou objeto gráfico). Voltaremos a isso quando estudarmos arrays e listas.
] */



= De volta à bolinha


Funções sem retorno, como `circulo`, brilham em gráficos, em que repetimos o mesmo desenho várias
vezes. Na Aula 6, os dois `if` de colisão eram a mesma lógica aplicada a eixos
diferentes. A função `rebate` resolve isso.

#figure(caption: [Biblioteca de funções])[
#codly.new(
  ```basic
fn.def circulo(x, y, raio, r, g, b)
  gr.color 255, r, g, b
  gr.circle obj, x, y, raio
fn.end

fn.def rebate(pos, vel, raio, limite)
  if (pos < raio & vel < 0) | (pos > limite - raio & vel > 0)
    fn.rtn -vel
  endif
  fn.rtn vel
fn.end
```, file: "minhalib.bas",)
]<codigo-minhalib>

A função `rebate` recebe a *posição*, a *velocidade*, o *raio* e o *limite* da 
parede, e devolve a velocidade nova. A mesma função serve para os 
dois eixos.

#conceito("Não se repita")[
  Programadores têm uma regra de não se repitir (em inglês, *DRY*:
  _don't repeat yourself_). Quando duas partes do código fazem quase a mesma
  coisa, extraia uma função. Menos código significa menos lugares para errar.
]


A seguir, vamos reescrever o programa em que a bolinha fica rebatendo nas paredes.
Ao invés de escrevermos as funções no mesmo arquivo, vamos importá-las usando `include`. 
Isso é bom caso seja do nosso interesse usar as funções em outros projetos. Além disso, torna o código mais legível.

Falando nisso, vamos também refatorar o código, ou seja, reorganizar e melhorar a estrutura interna sem alterar o seu 
comportamento externo. Resumindo, o programa continua a fazer exatamente 
a mesma coisa para o utilizador final, mas o código por trás fica mais limpo, 
organizado e fácil de entender. A própria DRY é um técnica de refatoração.


#figure(caption: [Bolinha que rebate nas pareces])[
#codly.new(
```basic
include "minhalib.bas"

gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = w / 2 : y = h / 3
vx = 12   : vy = 9

do
  x += vx : y += vy
  vx = rebate(x, vx, raio, w)
  vy = rebate(y, vy, raio, h)

  gr.cls
  call circulo(x, y, raio, 245, 158, 11)
  gr.render
  
  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
```, file: "circulo-rebate.bas",)
]

No código refatorado, você vai percerber:

1. Uso de funções para não repetir código
2. Atribuição de múltiplas variáveis na mesma linha (usando `:`)
3. Açúcar sintático (como `x += vx`)


Compare as diferenças implementadas:

#table(
  columns: (1fr, 1fr),
  [Antes], [Depois (com função)],
  [Dois blocos `if`, 6 linhas.], [Duas linhas com `rebate`.],
  [A lógica de colisão aparece duas vezes.], [A lógica aparece uma vez, em `rebate`.],
  [Corrigir um bug exige mexer em dois lugares.], [Corrige-se uma vez e vale para os dois eixos.],
)


#atencao[
  O `include` traz o conteúdo do arquivo para dentro do programa, no ponto
  em que aparece. Por isso, ponha-o no começo, antes de qualquer chamada. 
  mantenha na biblioteca apenas definições de função, uma vez que código solto lá
  dentro seria executado toda vez que algum programa a incluísse.
]


= Documentação


Além de escolhermos um bom nome para a função e seus parâmetros é de bom grado documentarmos 
o que ela faz. A maneira mais rápida e fácil é comentar a função no próprio código.
Os comentários em hBasic pode ser escritos de várias maneiras particulares.


#figure(caption: [Comentários em BASIC])[
#codly.new(```basic
REM comentário em uma única linha

! comentário em um única linha

!!
Esse é um bloco de comenrários.
Evitarmos colocar um ponto de exclamacação para cada linha
!!  

nota = 7.5 % comentário em um única linha após código
```, file: "comentarios.bas",)
]


Todos os comentários são ignorados quando o programa é processado. 

Os comentários na @codigo-documentacao indicam o que a função `distancia` faz,
seus parâmetros e o que ela devolve após processar o corpo.

#nota[Neste curso,
temos evitado colocar comentários no código por concisão. 
Essa restrição prática é fundamental, pois no desenvolvimento _mobile_, 
cada caractere a menos para digitar no teclado virtual reduz erros de 
digitação e melhora o ritmo da aula.

Por isso, adotamos uma estratégia de código minimalista, sem comentários, 
transferindo toda a explicação e os detalhes dos parâmetros para o texto do material.
]


#figure(caption: [Exemplo de função documentada])[
#codly.new(
```basic
!! 
===================================================================
Função: distancia
Calcula a distância euclidiana entre dois pontos (x1, y1) e (x2, y2). 
Parâmetros:
x1, y1 - Coordenadas do Ponto A
x2, y2 - Coordenadas do Ponto B
Retorno: Distância direta em pixels (número real).
 ===================================================================
!!

fn.def distancia(x1, y1, x2, y2)
  ! Aplicação da fórmula da distância (Pitágoras)
  fn.rtn sqr((x2 - x1)^2 + (y2 - y1)^2)
fn.end
```, file: "documentacao.bas",)
]<codigo-documentacao>


= Pêndulo simples

O pêndulo simples é um sistema físico composto por um corpo de massa $m$ suspenso por um fio de comprimento $L$ que oscila em torno de um ponto fixo de equilíbrio.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- PARÂMETROS GEOMÉTRICOS ---
    let L = 3.5          // Comprimento da haste
    let thet = 22deg    // Ângulo de desvio
    let pivot = (0, 0)

    // Posição da massa m: x = L*sin(theta), y = -L*cos(theta)
    let px = L * calc.sin(thet)
    let py = -L * calc.cos(thet)

    // --- 1. SUPORTE / TETO ---
    line((-1.5, 0), (1.5, 0), stroke: 1.5pt + luma(50))
    for x in range(-12, 13, step: 4) {
      let x_pos = x * 0.1
      line((x_pos, 0), (x_pos + 0.15, 0.2), stroke: 0.8pt + luma(120))
    }

    // Ponto de Pivô
    circle(pivot, radius: 0.06, fill: luma(30))

   // --- 2. LINHA VERTICAL DE REFERÊNCIA ---
    line(pivot, (0, -L - 0.4), stroke: (dash: "dashed", paint: luma(140), thickness: 0.8pt))

    // --- 3. HASTE (L) ---
    line(pivot, (px, py), stroke: 1.5pt + rgb("#1565C0"))
    content(
      (px * 0.8 , py * 0.5),
      text(size: 10pt, weight: "bold", fill: rgb("#1565C0"))[$L$]
    )

    // --- 4. ÂNGULO THETA (Arco Corrigido) ---
    arc(
      (0,-1),
      start: -90deg,
      stop: -90deg + thet,
      stroke: 2pt + rgb("#D32F2F")
    )
    content((0.25, -1.4), text(size: 10pt, fill: rgb("#D32F2F"), weight: "bold")[$theta$])

// --- 5. ACELERAÇÃO ANGULAR (alpha - Arco Corrigido com Seta) ---
    arc(
      (L - 2.6,-2.4),
      start: -90deg + thet,
      delta: -40deg,
      radius: 3,
      stroke: 2pt + rgb("#2E7D32"),
      mark: (end: ">", fill: rgb("#2E7D32"))
    )
    content((px - 0.8, py + 0.4 ), text(size: 10pt, fill: rgb("#2E7D32"), weight: "bold")[$alpha$])

    // --- 6. MASSA DO PÊNDULO (m) ---
    circle((px, py), radius: 0.35, fill: rgb("#E53935"), stroke: 1.2pt + rgb("#B71C1C"))
    content((px, py), text(size: 9pt, weight: "bold", fill: white)[$m$])

   // --- 7. VETOR DA FORÇA GRAVIDADE (mg) ---
    line((px, py - 0.4), (px, py - 1.2), mark: (end: ">", fill: luma(40)), stroke: 1.2pt + luma(40))
    content((px + 0.8, py - 1.2), text(size: 9pt)[$F_g = m g$])
 
  }),
  caption: [Esquema do pêndulo simples.]
) <figura-pendulo-cetz>

Onde 

  - $L$: comprimento da haste
  - $theta$: ângulo entre a haste e a posição vertical de equilíbrio.
  - $alpha$: aceleração angular
  - $m$: massa do corpo 
  - $g$: constante da gravidade  


Para a simulação de um pêndulo simples com a aproximação de pequenos ângulos, a aceleração angular é dada por:

#align(center)[
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ alpha = -g/L dot theta $
    ]
  ]
]

Em hBasic, teremos
```
fn.def accel(th, g, L)
  fn.rtn -(g / L) * th
fn.end
```

Para calcular as coordenadas horizontal e vertical:

#align(center)[
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ x = L dot sin theta $
    ]
  ]
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ y = L dot cos theta $
    ]
  ]
]


Em hBasic, teremos

```
fn.def get_x(cx, L, th)
  fn.rtn cx + L * sin(th)
fn.end

fn.def get_y(cy, L, th)
   fn.rtn cy + L * cos(th)
fn.end
```

Nota-se que a tradução da fórmula matemática para código é bastante direta. Porém, de onde vieram esses `cx` e `cy`? Lembre-se que, na tela do dispositivo Android, a origem $(0,0)$ fica no canto superior esquerdo.
Por isso, é necessário realizar uma translação para o sistema de coordenadas do dispositivo. O código acima ajusta a posição do pêndulo considerando o ponto de apoio centrado em `(cx, cy)`. 


Iremos adicionar essas funções, juntamente com uma função para desenhar a haste, a nossa biblioteca @codigo-minhalib. Portanto, agora podemos calcular a aceleração angular $alpha$. Com $alpha$, calcularemos a velocidade angular $omega$. E com $omega$, calcularemos a posição angular $theta$, 

#align(center)[
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ omega = omega + alpha dot Delta t $
    ]
  ]
  #box(fill: azul-gelo, stroke: 1pt + azul-claro, radius: 8pt, inset: (x: 18pt, y: 12pt))[
    #text(size: 13pt, fill: azul-escuro)[
      $ theta = theta + omega dot Delta t $
    ]
  ]
]


No código do pêndulo simples, @codigo-pendulo, criamos as duas variáveis `om` e `dt`.
  
1. A aceleração (`al`) altera a velocidade: `om = om + al * dt`.
2. A velocidade (`om`) altera a posição/ângulo: `th = th + om * dt`.
3. O passo de tempo (`dt`) controla o ritmo dessa atualização. 

#dica[
  Os cálculos da velocidade e posição fazem parte da *Integração de Euler*, a técnica usada para atualizar o movimento físico quadro a quadro. Ela permite transformar as leis da Física em um algoritmo que atualiza a posição e a velocidade de um objeto ao longo do tempo e isso é exatamente o que precisamos para criar uma animação, um jogo ou uma simulação física.
]

#figure(caption: [Biblioteca de funções])[
#codly.new(
```basic
include "minhalib.bas"

gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

L = 250 : g = 9.81 : th = 0.2
dt = 0.3 : om = 0
cx = w / 2 : cy = 150
raio = 20

do
  al = accel(th, g, L)
  om = om + al * dt
  th = th + om * dt

  px = get_x(cx, L, th)
  py = get_y(cy, L, th)

  gr.cls
  call linha(cx, cy, px, py, 100, 100, 100)
  call circulo(px, py, raio, 245, 158, 11)
  gr.render
  pause 16
until 0
end
```, file: "pendulo.bas", )
] <codigo-pendulo>


== Quebre o código!

Mude uma coisa de cada vez no código de @codigo-pendulo e observe o que acontece. Antes de executar, escreva a sua previsão; depois compare.

#etapa("quebrar")[Troque `th = 0.2` por `th = 0`. O que acontece? Por que o pêndulo não se mexe? (Pense: qual é a aceleração e qual é a velocidade inicial?)]

#etapa("quebrar")[Troque a ordem das linhas `om = om + al * dt` e `th = th + om * dt`. Deixe rodar por alguns segundos e observe a amplitude da oscilação. O que muda?]

#etapa("quebrar")[Mude o passo de tempo: `dt = 0.05`, depois `dt = 3` e depois `dt = 12`. O que cada valor faz com a velocidade da animação? Algum deles faz o pêndulo "explodir"?]

#etapa("quebrar")[Em `accel`, apague o sinal de menos. Em vez de oscilar, o que o pêndulo faz? Por que o sinal importa?]

#etapa("quebrar")[Em `get_x` e `get_y`, troque `sin` por `cos` e vice-versa. Para onde vai a bolinha quando `th = 0`? O que `th = 0` deve significar, fisicamente?]

#etapa("quebrar")[Troque `cy + L * cos(th)` por `cy - L * cos(th)`. Onde a bolinha aparece? Que valor de `cy` a traz de volta para a tela? O que isso revela sobre a origem no canto superior esquerdo?]

#etapa("quebrar")[Apague o `gr.cls` do laço. O que acontece com as linhas na tela? E com a velocidade do programa depois de algum tempo?]

#etapa("quebrar")[Comece com `th = 1.5` e troque a aceleração por `fn.rtn -(g / L) * sin(th)`. O período da oscilação aumenta ou diminui em relação à versão `-(g / L) * th`? Por quê?]

#dica[
  O segundo experimento mostra que a ordem das atualizações faz parte do método. No código original, a velocidade é atualizada primeiro, e a posição usa a velocidade nova.

  Com as linhas trocadas, a posição usa a velocidade antiga (é o *Euler
  explícito*), e a energia do pêndulo cresce um pouco a cada passo, até a
  oscilação ficar maior do que devia. O primeiro esquema (*Euler semi-implícito*
  ou *simplético*) mantém a energia aproximadamente constante, e por isso é o
  preferido em jogos e simulações de física.
]


#desafio("Pêndulo com atrito")[
  Mude o programa do pêndulo simples para comportar o componente de atrito. 

  + Acrescente uma variável `b` e use
    `al = accel(th, g, L) - b * om`. Teste `b = 0.05`, `b = 0.4` e `b = 1`.
    Em qual deles o pêndulo ainda oscila? Em qual ele só "desce devagar" até
    parar? (Pista: o valor crítico é $b = 2 sqrt(g / L)$.)
  
  *Bônus*: Rode dois pêndulos ao mesmo tempo, com o
  mesmo ângulo inicial e cores diferentes: um com a ordem correta e outro com a ordem trocada. Algum código se repete?
  Quais funções você criaria para evitar isso?
]

\

= Resumo

#table(
  columns: (5.3cm, 1fr),
  [Ideia ou comando], [Para que serve],
  [`fn.def nome(p1, p2)`], [Definição de uma função que retorna um decimal.],
  [`fn.def nome$(p1, p2)`], [Definição de uma função que retorna uma _string_.],
  [`fn.rtn valor`], [Devolve um valor e *encerra* a função.],
  [`fn.end`], [Termina a definição. Sem `fn.rtn`, devolve `0` ou `""`.],
  [`call nome(...)`], [Chama a função *ignorando* o retorno.],
  [Variável local], [Existe só dentro da função (parâmetros incluídos).],
  [`include "arquivo.bas"`], [Traz as funções de um arquivo-biblioteca para o programa.],
)

#proxima[
  *Aula 08: Bolha de nível.* Hora de pôr as funções para trabalhar! Juntaremos o acelerômetro da Aula 05, a bolinha da Aula 06 e
  as funções de hoje.
]
