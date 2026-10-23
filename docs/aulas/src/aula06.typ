#import "modelo-aula.typ": *

#show: aula.with(
  numero: 6,
  titulo: "Animação",
  subtitulo: "Sua primeira animação, passo a passo.",
  recurso: "Tela gráfica",
  conceitos: ("gráficos gr.*", "coordenadas", "animação", "colisão"),
   autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "gr.open 255,",
    "  11, 42, 91",
    "do",
    "  x = x + vx",
    "  gr.cls",
    "  gr.circle b,",
    "    x, y, 40",
    "  gr.render",
    "until toque",
  ),
)

#nesta-aula(
  [Abrir a *tela gráfica* e desenhar um círculo com `gr.*`.],
  [Entender o *sistema de coordenadas* da tela, com o eixo y de ponta-cabeça.],
  [Criar *animação*: mudar a posição e redesenhar a cada volta do laço.],
  [Detectar *colisões* com as bordas e *inverter* a velocidade.],
  [Conhecer três jeitos de animar: `gr.cls`, `gr.modify` e `gr.move`.],
)

Até aqui o celular falou, perguntou e calculou. Hoje ele vai *desenhar*, e a
partir de uma única bolinha vamos subir cinco degraus: desenhá-la, mantê-la na
tela, fazê-la atravessar a tela, bater e voltar, e por fim *rebater*. Cada degrau muda só um pouquinho do anterior, então o código novo cabe sempre numa ou duas linhas.

= O Sistema de cores RGBA

 O sistema de cores RGB (Red, Green, Blue, Alpha) é um modelo de cores aditivo baseado na emissão de luz, utilizado por telas de computadores, celulares e monitores para renderizar imagens e interfaces gráficas.
 
 
 As cores são formadas pela combinação de feixes de luz nas três cores primárias sobre uma tela originalmente preta (desligada). Cada uma das três cores possui um canal de intensidade que varia de 0 a 255.
 
 O valor _alpha_ é quantidade a transparência, ou seja, determina o quanto da cor do fundo irá atravessar o objeto desenhado.

#table(
  columns: (5cm, 3cm, 1fr),
  [Nível de Opacidade], [Alfa (0-255)], [Efeito Visual],
  [Opaco (Padrão)],	[255], [Oculta totalmente o fundo],
  [Alta Opacidade],	[192], [Sombra suave / vidro fosco escuro],
  [Média Transparência],	[128], [Mistura perfeita entre cor e fundo],
  [Baixa Opacidade],	[64], [Marca d'água / sobreposição leve],
  [Invisível],	[0],	[Totalmente transparente]
)


= A tela gráfica

Até agora usamos `print`, que escreve no *console*. Para desenhar, o hBasic tem uma segunda tela, a *gráfica*, controlada por comandos que começam com `gr.`:

#table(
  columns: (5cm, 1fr),
  [Comando], [O que faz],
  [`gr.open a, r, g, b`], [Abre a tela gráfica com uma cor de fundo.],
  [`gr.orientation 1`], [Fixa a tela em *retrato* (`0` é paisagem).],
  [`gr.close`], [Fecha a tela gráfica.],
)


#figure(caption: [Abrir o modo gráfico, canvas])[
#codly.new(```basic
gr.open 255, 11, 42, 91
gr.orientation 1
pause 3000
gr.close
end
```,file: "tela.bas")
]

#etapa("rodar")[Execute. Será mostrada uma tela com o mesmo azul-escuro das capas deste material por 3 segundos.]


== Coordenadas


A origem das coordenadas na tela do celular fica no canto *superior* esquerdo. O eixo x cresce para a direita e o y para baixo. Não se preocupe se você confundir, isso é normal já que as coordenadas não estão distribuídas como aprendemos na matemática.

#atencao[
  Na tela, o eixo y está de *ponta-cabeça* em relação ao plano cartesiano que usamos na escola. Um ponto "mais baixo" tem `y` *maior*.
]



= Figuras geométricas simples

É necessário determinar a cor do objeto antes de desenhá-lo e ele torna-se visível apenas após a renderização.


#table(
  columns: (5cm, 1fr),
  [Comando], [O que faz],
  [`gr.color a, r, g, b`], [Escolhe a cor.],
  [`gr.render`], [Atualiza a tela com tudo o que foi desenhado.],
)


Em todos os exemplos a seguir, o parâmetro `obj` é uma variável que guarda a referência do objeto na memória. Essa referência é o *número do objeto*, isto é, a "etiqueta" e é útil para quando quisermos mexer nele depois.

=== Círculo

O comando abaixo cria um círculo com raio `radius` ao redor do centro (`x`, `y`).

```
Gr.circle obj, x, y, radius
```

 O comando `gr.circle` recebe uma variável (`obj`) que guarda o *número do objeto*. É a "etiqueta" do círculo, útil quando quisermos mexer nele depois.

O programa a seguir desenha três circulos de diametro 80 pixels lado a lado com um espaçamento de 20 pixels entre eles.

#figure(caption: [Desenho de três círculos com espaçamento uniforme])[
#codly.new(```basic
gr.open

gr.color 255, 255, 0, 0, 1
gr.circle c1, 50, 100, 40               

gr.color 255, 0, 255, 0, 1
gr.circle c2, 150, 100, 40

gr.color 255, 0, 0, 255, 1                     
gr.circle c3, 250, 100, 40

gr.render
pause 3000
gr.close
```, file: "circulos.bas",)
]

#figure(
  cetz.canvas({
    import cetz.draw: *

    let s = 0.03 // Escala (100px = 1 unidade)

    // Coordenadas dos centros e raio
    let y_c = -100 * s
    let r = 40 * s
    let x1 = 50 * s
    let x2 = 150 * s
    let x3 = 250 * s

    // 1. Limite da Tela
    rect((0, 0), (330 * s, -180 * s), stroke: (dash: "dotted", paint: luma(160)), fill: rgb("#FAFAFA"))
    content((25 * s, -12 * s), text(size: 7.5pt, fill: luma(100))[Tela])

    // 2. Linha guia central (Eixo Y = 100)
    line((0, y_c), (310 * s, y_c), stroke: (dash: "dashed", paint: luma(200)))
    content((0, y_c), text(fill: rgb("#D32F2F"), size: 7.5pt, weight: "bold")[y: 100], anchor: "east")

    // 3. Desenho dos Círculos
    circle((x1, y_c), radius: r, fill: rgb("#FFCDD2"), stroke: 1.2pt + rgb("#D32F2F"))
    circle((x2, y_c), radius: r, fill: rgb("#C8E6C9"), stroke: 1.2pt + rgb("#388E3C"))
    circle((x3, y_c), radius: r, fill: rgb("#BBDEFB"), stroke: 1.2pt + rgb("#1976D2"))

    // 4. Marcação dos Pontos Centrais (x, y)
    for (x, col) in ((x1, "#B71C1C"), (x2, "#1B5E20"), (x3, "#0D47A1")) {
      circle((x, y_c), radius: 1.5 * s, fill: rgb(col), stroke: none)
    }

    // 5. Linhas de projeção do Eixo X para os centros
    line((x1, 0), (x1, y_c), stroke: (dash: "dashed", paint: rgb("#0066CC")))
    line((x2, 0), (x2, y_c), stroke: (dash: "dashed", paint: rgb("#0066CC")))
    line((x3, 0), (x3, y_c), stroke: (dash: "dashed", paint: rgb("#0066CC")))

    content((x1+r/2, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[x: 50], anchor: "south")
    content((x2+r/2, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[x: 150], anchor: "south")
    content((x3+r/2, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[x: 250], anchor: "south")

    // 6. Rótulo do raio e espaçamento
    // Raio no primeiro círculo
    line((x1, y_c), (x1 + r, y_c), stroke: 1pt + rgb("#B71C1C"))
    content((x1 + r / 2, y_c - 10 * s), text(size: 6.5pt, fill: rgb("#B71C1C"), weight: "bold")[r=40])

    // Indicador do espaçamento de 20px entre c1 e c2
    let gap_start = x1 + r
    let gap_end = x2 - r
    content(((gap_start + gap_end) / 2, y_c + 15 * s), text(size: 6.5pt, fill: rgb("#E65100"), weight: "bold")[20px])
  }),
  caption: [Geometria do comando `gr.circle`.]
) <figura-geometria-circulos>

O comando `gr.open` sem valores significa o mesmo que `gr.open 255, 255, 255, 255`, ou seja, uma tela com fundo branco. Para cada retangulo, definimos a cor de preenchimento antes. O sistema não desenha o circulo quando definimos `gr.circle`, na verdade ele adiciona em uma lista chamada *Display List*. Somente quando o `gr.render` é chamado que o sistema desenha tudo dentro dessa lista especial.

Os objetos são desenhados na tela na ordem em que aparecem na _Display List_. Os objetos não ficam visíveis na tela até que o comando `gr.render` seja chamado.



=== Retângulo

```
gr.rect obj, left, top, right, bottom
```

Cria um retângulo delimitado pelas coordenadas informadas. Obviamente, `right - left` é a largura e `bottom - top` é a altura do retângulo. 


#figure(
  cetz.canvas({
    import cetz.draw: *

    // Posições numéricas de exemplo (escala do canvas)
    let l = 1.8  // left
    let t = -1.0 // top (no Y negativo para simular tela de cima para baixo)
    let r = 4.8  // right
    let b = -3.2 // bottom

    // 1. Representação do limite do Canvas/Tela
    rect((0, 0), (5.8, -4.2), stroke: (dash: "dotted", paint: luma(160)), fill: rgb("#FAFAFA"))
    content((0.5, -0.3), text(size: 8pt, fill: luma(100))[Tela])

    // 2. Linhas de projeção tracejadas indicando as coordenadas
    line((l, 0), (l, t), stroke: (dash: "dashed", paint: rgb("#0066CC"))) // Linha até Left
    line((r, 0), (r, t), stroke: (dash: "dashed", paint: rgb("#0066CC"))) // Linha até Right
    line((0, t), (l, t), stroke: (dash: "dashed", paint: rgb("#D32F2F"))) // Linha até Top
    line((0, b), (l, b), stroke: (dash: "dashed", paint: rgb("#D32F2F"))) // Linha até Bottom

    // 3. O Retângulo principal
    rect((l, t), (r, b), fill: rgb("#E3F2FD"), stroke: 1.5pt + rgb("#1565C0"))

    // 4. Rótulos das dimensões nas linhas indicativas
    content((l, t / 2), text(fill: rgb("#0066CC"), weight: "bold", size: 9pt)[left], anchor: "east")
    content((r, t / 2), text(fill: rgb("#0066CC"), weight: "bold", size: 9pt)[right], anchor: "west")
    content((l / 2, t), text(fill: rgb("#D32F2F"), weight: "bold", size: 9pt)[top], anchor: "south")
    content((l / 2, b), text(fill: rgb("#D32F2F"), weight: "bold", size: 9pt)[bottom], anchor: "south")

    // 5. Rótulo central
    content(((l + r) / 2, (t + b) / 2), text(fill: rgb("#1565C0"), weight: "bold")[gr.rect])
  }),
  caption: [Entendimento das coordenadas delimitadoras no canvas.]
) <figura-coordenadas-rect>


O programa a seguir desenha três quadrados (80x80 pixels) lado a lado com um espaçamento de 20 pixels entre eles.

#figure(caption: [Retangulos])[
#codly.new(```basic
gr.open

gr.color 255, 255, 0, 0, 1
gr.rect r1, 50, 100, 130, 180               

gr.color 255, 0, 255, 0, 1
gr.rect r2, 150, 100, 230, 180

gr.color 255, 0, 0, 255, 1                     
gr.rect r3, 250, 100, 330, 180

gr.render
pause 3000
gr.close
```, file: "retangulos.bas",)
]


#figure(
  cetz.canvas({
    import cetz.draw: *

    // Escala: 1 unidade CeTZ = 100 pixels no canvas
    let s = 0.03 

    // Coordenadas Y comuns (altura de 80px)
    let t = -100 * s // top = 100
    let b = -180 * s // bottom = 180

    // Coordenadas X para os 3 quadrados (largura 80px + espaçamento 20px)
    let x1_l = 50 * s;  let x1_r = 130 * s  // r1: 50  a 130
    let x2_l = 150 * s; let x2_r = 230 * s  // r2: 150 a 230
    let x3_l = 250 * s; let x3_r = 330 * s  // r3: 250 a 330

    // 1. Limite da Tela (Canvas)
    rect((0, 0), (370 * s, -230 * s), stroke: (dash: "dotted", paint: luma(160)), fill: rgb("#FAFAFA"))

    // 2. Linhas de projeção e rótulos do Eixo Y (top e bottom)
    line((0, t), (x3_r + 15 * s, t), stroke: (dash: "dashed", paint: luma(200)))
    line((0, b), (x3_r + 15 * s, b), stroke: (dash: "dashed", paint: luma(200)))
    content((0, t), text(fill: rgb("#D32F2F"), size: 7.5pt, weight: "bold")[top: 100], anchor: "east")
    content((0, b), text(fill: rgb("#D32F2F"), size: 7.5pt, weight: "bold")[bottom: 180], anchor: "east")

    // 3. Projeções verticais do Eixo X
    let coords_x = (x1_l, x1_r, x2_l, x2_r, x3_l, x3_r)
    for x in coords_x {
      line((x, 0), (x, b - 15 * s), stroke: (dash: "dashed", paint: luma(210)))
    }

    // Valores numéricos de X na parte superior
    content((x1_l, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[50], anchor: "south")
    content((x1_r, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[130], anchor: "south")
    content((x2_l, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[150], anchor: "south")
    content((x2_r, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[230], anchor: "south")
    content((x3_l, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[250], anchor: "south")
    content((x3_r, -10 * s), text(size: 7pt, fill: rgb("#0066CC"))[330], anchor: "south")

    // 4. Desenho dos 3 Quadrados
    rect((x1_l, t), (x1_r, b), fill: rgb("#FFCDD2"), stroke: 1.2pt + rgb("#D32F2F"))
    rect((x2_l, t), (x2_r, b), fill: rgb("#C8E6C9"), stroke: 1.2pt + rgb("#388E3C"))
    rect((x3_l, t), (x3_r, b), fill: rgb("#BBDEFB"), stroke: 1.2pt + rgb("#1976D2"))

    // Rótulos dos objetos
    content(((x1_l + x1_r)/2, (t + b)/2), text(fill: rgb("#B71C1C"), weight: "bold", size: 9pt)[r1])
    content(((x2_l + x2_r)/2, (t + b)/2), text(fill: rgb("#1B5E20"), weight: "bold", size: 9pt)[r2])
    content(((x3_l + x3_r)/2, (t + b)/2), text(fill: rgb("#0D47A1"), weight: "bold", size: 9pt)[r3])

    // 5. Indicações de Largura e Espaçamento
    let y_indicador = -50 * s
    content(((x1_l + x1_r)/2, y_indicador), text(size: 7pt, fill: luma(80))[80px])
    content(((x1_r + x2_l)/2, y_indicador), text(size: 6.5pt, fill: rgb("#E65100"), weight: "bold")[20px])
    content(((x2_l + x2_r)/2, y_indicador), text(size: 7pt, fill: luma(80))[80px])
    content(((x2_r + x3_l)/2, y_indicador), text(size: 6.5pt, fill: rgb("#E65100"), weight: "bold")[20px])
    content(((x3_l + x3_r)/2, y_indicador), text(size: 7pt, fill: luma(80))[80px])
  }),
  caption: [Distribuição horizontal de três retângulos idênticos.]
) <figura-tres-quadrados>

#desafio("")[
  Crie um programa que desenhe três quadrados idênticos na horizontal alinhados e igualmente espaçados. 

  *Bônus 1:* use um `for`
]


=== Outros objetos gráficos

#table(
  columns: (6cm, 1fr),
  [Comando], [Efeito],
  [`gr.point obj, x, y`], [Cria um ponto na coordenada indicada.],
  [`gr.line obj, x1, y1, x2, y2`], [Cria uma linha entre os pontos (`x1`,`y1`) e (`x2`,`y2`)],

)



= Animação

Nesta seção iremos abordar um pouco de animação de nossos objetos criados no hBasic.

== Passo 1: desenhar

Primeiro, vamos desenhar um circulo no centro da tela. O comando `gr.screen w, h` devolve a largura (`w`) e a altura (`h`) da tela, em pixels. Logo, o centro deve estar no ponto `(w/2,h/2)`


#figure(caption: [Centro da tela])[
#codly.new(```basic
gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

gr.color 255, 66, 165, 245
gr.circle bolha, w / 2, h / 2, 60

gr.render
pause 3000
gr.close
end
``` , file: "circulo-centro.bas",)
]


#etapa("rodar")[Execute. Uma bolinha azul aparece no centro da tela por 3 segundos. Mude o raio, a cor e a posição.]

#atencao[
  A tela gráfica só é atualizada quando executamos `gr.render`. Sem ele, você
  desenha "nos bastidores" e nada aparece. Lembre-se a _Display List_. 
]

#desafio("Quadrado no centro")[
  Desenhe um quadrado no centro da tela.
  
  *Bônus*: Desenhe uma matriz 3x3 de quadrados igualmente espaçados.
]


== Passo 2: deixar na tela

Três segundos é pouco. Queremos a bolinha ali *até que o usuário decida sair*.
Um laço que espera um evento é a ferramenta certa. O evento agora é um
*toque na tela*, detectado por `gr.touch`. Usando o código anterior, depois de `gr.render`:

#figure(caption: [Detectar toque na tela])[
#codly.new(```basic
do
  gr.touch toque, tx, ty
  pause 50
until toque

gr.close
end
```, file: "toque.bas",)
]

O comando `gr.touch toque, tx, ty` guarda em `toque` um valor *verdadeiro* se há um
dedo na tela e, em `tx` e `ty`, o ponto tocado. O `do ... until toque` repete
até acontecer um toque. O `pause 50` dá um respiro ao aparelho entre as
verificações.

#etapa("rodar")[Execute. A bolinha fica na tela por quanto tempo você quiser. Toque para encerrar.]

== Passo 3: atravessar a tela

Agora a bolinha deve andar. Uma animação é uma *sequência de quadros*. Dessa forma, criaremos um laço e a cada volta mudamos a posição e redesenhamos a cena. A *velocidade* `vx` diz quantos pixels, na horizontal, a bolinha anda por quadro.

#figure(caption: [Bolinha se deslocando pela tela])[
#codly.new(```basic
gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = raio
y = h / 2
vx = 6

while x - raio < w
  x = x + vx

  gr.cls
  gr.color 255, 66, 165, 245
  gr.circle bolha, x, y, raio
  gr.render
  pause 15
repeat

pause 1000
gr.close
end
```, file: "circulo-move.bas",)
]


Cada quadro faz três coisas, sempre nesta ordem:

+ *Atualiza* os números (`x = x + vx`).
+ *Apaga* o quadro anterior com `gr.cls`.
+ *Redesenha* a cena e mostra com `gr.render`.

#conceito("Animação por quadros")[
  O `gr.cls` esvazia a tela, e o laço redesenha a bolinha na posição nova. Como
  fazemos isso muitas vezes por segundo, o olho enxerga *movimento contínuo*,
  como num desenho animado.
]

A bolinha sai de cena quando a sua borda *esquerda* (`x - raio`) passa da borda direita da tela (`w`). Por isso o laço roda enquanto `x - raio < w`. 

#etapa("rodar")[Execute e observe a bolinha sumir pela direita. Aumente o `vx` para 15 e depois diminua para 2. O que muda no tempo da travessia?]


#desafio("Movimento vertical")[
  Faça a bolinha descer verticalmente.

  *Bônus*: Faça a bolinha descer em diagonal.  
]

== Passo 4: colisão

Em vez de sair, a bolinha deve *bater na borda e voltar*. O que acontece numa
batida? A *velocidade troca de sinal*, logo se ela ia para a direita (`vx` positivo),
passa a ir para a esquerda (`vx` negativo). Mas *quando* ela bate? Quando a sua borda toca a parede:

#table(
  columns: (2.6cm, 1fr),
  [Parede], [Condição de batida],
  [Esquerda], [`x < raio`],
  [Direita], [`x > w - raio`],
  [Topo], [`y < raio`],
  [Base], [`y > h - raio`],
)

Estamos usando um circulo como modelo e se fosse, por exemplo, um quadrado? 

#dica[ No desenvolvimento prático de jogos, existe uma técnica chamada *Bounding Box*, também amplamente conhecida como *Hitbox*. Trata-se de uma simplificação geométrica onde, em vez de testar a colisão pixel por pixel da imagem do personagem (o que é computacionalmente pesado), envolve-se o _sprite_ dentro de uma forma simples (como um retângulo) para realizar os cálculos matemáticos.]


#figure(caption: [Bolinha que rebate na tela])[
#codly.new(```basic
gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = raio
y = h / 2
vx = 8

do
  x = x + vx

  if x > w - raio | x < raio
    vx = -vx
  endif

  gr.cls
  gr.color 255, 66, 165, 245
  gr.circle bolha, x, y, raio
  gr.render

  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
end
```, file: "circulo-bate.bas",)
]

Observe as linhas 13-15, são elas que determinam quando a bolinha deve mudar de direção. 

Como o laço agora não tem fim natural, voltamos ao `do ... until toque` do
Passo 2. O operador `|` significa *ou*: a bolinha inverte a velocidade se bater
na direita *ou* na esquerda.

#etapa("rodar")[Execute e veja a bolinha indo e vindo. Mude o `vx` para -8. Ela ainda funciona? Por quê?]

#conceito("Reflexão")[
  Inverter o sinal da velocidade é como a *reflexão* de uma bola numa parede
  lisa. É a regra mais simples de colisão que existe, e ela basta para muitos jogos.
]


A esta altura, podemos propor o próximo desafio.

#desafio("No alvo: craque do timing")[

  + Um circulo parado no centro com somente a borda desenhada. 
  + Um circulo azul percorrendo a horizontal e passando por cima do circulo central.
  + Quando o usuário tocar na tela, o circulo deve parar. 
  + O objetivo e conseguir parar exatamente no centro do circulo central.

  *Dica*: se adicionarmos o valor 0 no final da lista de valores em `gr.color`, será preenchida somente a borda, se colocarmos 1 será preenchido somente o corpo.

  *Bonus*: troque o centro central por um quadrado que caiba exatamente o circulo azul
]


= Passo 5: rebater

A bolinha agora rebate nas *quatro* paredes. Precisamos só de uma velocidade
vertical `vy` e de um segundo `if` para o topo e a base. O comportamento *vertical* e o *horizontal* são independentes, pois cada eixo tem sua posição, sua velocidade e seu `if`. O resultado, juntos, é o movimento diagonal que rebate.


#figure(caption: [Bolinha que rebate em duas direções])[
#codly.new(```basic
gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = w / 2
y = h / 3
vx = 12
vy = 9

do
  x = x + vx
  y = y + vy

  if x > w - raio | x < raio
    vx = -vx
  endif
  if y > h - raio | y < raio
    vy = -vy
  endif

  gr.cls
  gr.color 255, 245, 158, 11
  gr.circle bolha, x, y, raio
  gr.render

  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
end
```, file: "circulo-rebate.bas",)
]

Adicionamos um velocidade vertical `vy = 9` e um teste `if` se a bola tocou a parede de cima ou de baixo.

#etapa("rodar")[Execute e toque para sair. Mude `vx` e `vy` para direções e velocidades diferentes. A trajetória lembra uma bola de bilhar?]

#atencao[
  Fizemos tudo no modo gráfico com `gr.cls`. Com ele, *apagamos tudo* e recriamos os objetos a cada quadro, como pintar uma tela nova a cada volta do laço. 
]

= Quebre o código!

Nos programas dos passos 3 a 5, mude *uma coisa de cada vez*:

#etapa("quebrar")[Apague o `gr.render` do laço. O que aparece na tela? Por quê?]
#etapa("quebrar")[Apague o `gr.cls`. O que acontece com a imagem? E com a velocidade do programa depois de alguns segundos?]
#etapa("quebrar")[Apague a linha `vx = -vx`. O que a bolinha faz ao chegar na parede?]
#etapa("quebrar")[Aumente o `vx` para 80. A bolinha ainda "bate" na parede de forma convincente? Por que isso pode acontecer?]
#etapa("quebrar")[No Passo 3, troque `x - raio < w` por `x < w`. Qual é a diferença visual no momento em que a bolinha some?]
#etapa("quebrar")[Apague o `pause 15`. A animação fica mais rápida? Mais suave?]

#dica[
  O quarto experimento revela uma limitação: a bolinha só "enxerga" a parede quando já está *dentro* dela. Se andar rápido demais, pode atravessá-la entre dois quadros. Jogos de verdade tratam disso com cuidado extra.
]

#desafio("Quique de verdade")[
  Uma bola de verdade não rebate com velocidade constante, pois a *gravidade* a puxa para baixo, e cada batida faz perder um pouco de energia.

  + crie `g = 0.6` e, a cada quadro, faça `vy = vy + g` *antes* de atualizar `y`;
  + ao bater na base, coloque a bolinha *exatamente* em `y = h - raio` e inverta a velocidade perdendo energia: `vy = -vy * 0.85`; se `abs(vy) < 1` faça `vy = 0` para que ela pare;
  + deixe as paredes laterais como estão.

  Pista para a base:

  ```plain
  if y > h - raio
    y = h - raio
    vy = -vy * 0.85
    if abs(vy) < 1 then vy = 0
  endif
  ```

  *Bônus 1:* troque a cor da bolinha por uma cor *aleatória* a cada batida, com
  `rnd()`. Você vai precisar de três variáveis para guardar as componentes
  vermelho, verde e azul.

  *Bônus 2:* ponha *duas* bolinhas, cada uma com suas variáveis (`x1`, `y1`,
  `vx1`, `vy1` e `x2`, `y2`, `vx2`, `vy2`). Repare quanto código se repete: isso
  é um convite para a próxima novidade do curso, as *funções*.
]

= Resumo

#table(
  columns: (4.8cm, 1fr),
  [Ideia ou comando], [Para que serve],
  [`gr.open` e `gr.close`], [Abrem e fecham a tela gráfica.],
  [`gr.screen w, h`], [Descobre o tamanho da tela em pixels.],
  [Origem no canto superior esquerdo], [`y` cresce para baixo.],
  [`gr.color`], [Escolhe cor e estilo (contorno ou preenchido).],
  [`gr.circle`], [Desenha um círculo e guarda seu número em uma variável.],
  [`gr.rect`], [Desenha um retangulo e guarda seu número em uma variável.],
  [`gr.render`], [Atualiza a tela. Sem ele, nada muda.],
  [`gr.touch t, tx, ty`], [Detecta toque; ótimo para `do ... until`.],
  [Animação por quadros], [Atualizar, apagar, redesenhar e mostrar, repetidamente.],
  [`gr.cls`], [Apaga tudo; o quadro é redesenhado por inteiro a cada volta.],
 // [`gr.modify` e `gr.move`], [Objetos criados *antes* do laço e alterados *dentro* dele: posição absoluta (`modify`) ou deslocamento (`move`).],
  [Velocidade `vx`, `vy`], [Quantos pixels a bolinha anda por quadro em cada eixo.],
  [Colisão com a parede], [Condição de batida e inversão de sinal: `vx = -vx`.],
)

#proxima[
  *Aula 7: Funções.* E se, em vez de `vx` e `vy` fixos, quem
  movesse a bolinha fosse a *inclinação do celular*? Juntaremos o
  *acelerômetro* da Aula 5 com a bolinha desta aula, em degraus bem pequenos:
  primeiro só o eixo x, depois os dois eixos, e no fim um nível que avisa quando
  você está nivelado.
]
