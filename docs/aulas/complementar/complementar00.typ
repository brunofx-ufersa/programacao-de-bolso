#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 0,
  titulo: "A linguagem",
  subtitulo: "Um tour sobre as características da linguagem",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

= Características

RFO Basic é uma linguagem *imperativa*. Isso significa que você especifica as operações que o computador deve executar. Portanto, a ordem importa.

Falando em ordem, o programa é processado de cima para baixo, linha por linha. Por isso, é uma linguagem *procedural*, ou seja, organizamos as instruções em sequências, sub-rotinas e funções.

Também é uma linguagem de *propósito geral* que permite desenvolver desde programas simples até aplicativos com interfaces gráficas, arquivos, bancos de dados e comunicação em rede.

Grande parte da sintaxe consiste em comandos. Neste curso, você vai ler bastante as palavras *comando* e *função*. Esse conceitos são usados para efetuar operações dentro dos programas.

Há diversas estruturas que servem para manipular dados de forma eficaz.

= Interação com o dispositivo

Uma das características mais legais de usar essa linguagem é que ela pode interagir com o dispositivo acessando sensores como acelerômetro, campo magnético, giroscópio, luminosidade, gravidade, detector de movimento, proximidade etc. Isso abrange muito o leque de programas com características ímpares. Mais ainda, podemos fazer leituras do GPS e criar aplicativos com geolocalização.


Além disso, um modo gráfico para animações e jogos e contamos com interação via _touchscreen_. com até dois toques de detecção. Conta também com acesso a interface de áudio. 

Obviamente, uma linguagem nativa como Java, Kotlin ou C pode fazer isso e até com algumas vantagens, todavia, para uma boa experiência, é necessário um computador com 16Gb de RAM para rodar o emulador sem travamentos ou 8Gb de RAM mais um aparelho Android para testes. Com o RFO Basic, precisamos apenas do celular; e isso é ideal para criar protótipo ou produto mínimo viável.

= Variáveis

As variáveis em BASIC são de dois tipos: numérica e textual. As numéricas armazenam números decimais e as textuais armazenam _strings_. Neste material, usamos as palavras "texto" e "_string_" como sinônimos.

Todas as variáveis que terminam com `$` são do tipo _string_. Sem esse caracter, a variável é numérica.

```
nota = 7.8
aluno$ = "Debora"
```

Ocasionalmente, pode ocorrer erros relacionados às variáveis. Por se tratar de uma linguagem simples, o interpretador se confundirá caso sua variável inicie com o nome de alguma palavra reservada. Veja o próximo trecho:

```
diminutivo$ = "gatinho"
```

Esse código gerará um erro, pois a palavra `dim` é uma palavra reservada para a linguagem. Nesses casos, devemos usar `let` para definir uma variável:

```
let diminutivo$ = "gatinho"
```

#atencao[
  Não podemos escrever uma variável sem atribuir um valor. Não é permitido fazer:

```
let animal$
...
...
animal$ = "gatinho"
```

Se você não tem um valor para iniciar uma variável, coloque uma string vazia ou zero.


]


= Estruturas de dados

A linguagem conta com quatro estruturas de dados, todas lineares.

== Array (vetor)

Embora um _array_ seja uma estrutura de dados, BASIC o trata como uma variável que pode guardar muitos valores organizados em uma sequência.

#table(
  columns: (1fr,1fr, 1fr, 1fr, 1fr, 1fr),
  [Posição],[1],[2],[3],[4],[5],
  [Elemento],["avião"],["carro"],["bicicleta"],["trêm"],["moto"]
)

A tabela acima representa um _array_ de uma dimensão que armazena _strings_. Se acessarmos a posição 4, por exemplo, devemos obter `"trem"`.



== List (lista)

Uma lista é similar a um _array_. A diferença fica a cargo de como ela é construída e usada. Um _array_ deve ser dimensionado antes de usar. Ou seja, o número de posições deve ser determinado antecipadamente.

Uma lista inicia vazia e cresce conforme a necessidade. Os elementos podem ser removidos, susbtituídos e inseridos em qualquer lugar da lista.


#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- ELEMENTOS DA LISTA (ÍNDICES DE 1 A 4) ---
    // Índice 1
    rect((0.0, 0.0), (1.6, 1.0), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0.8, 0.68), text(size: 7.5pt, weight: "bold", fill: luma(100))[Índice 1])
    content((0.8, 0.30), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))["Espada"])

    // Índice 2
    rect((1.8, 0.0), (3.4, 1.0), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((2.6, 0.68), text(size: 7.5pt, weight: "bold", fill: luma(100))[Índice 2])
    content((2.6, 0.30), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))["Escudo"])

    // Índice 3
    rect((3.6, 0.0), (5.2, 1.0), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((4.4, 0.68), text(size: 7.5pt, weight: "bold", fill: luma(100))[Índice 3])
    content((4.4, 0.30), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))["Porção"])

    // Índice 4
    rect((5.4, 0.0), (7.0, 1.0), fill: rgb("#64B5F6"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((6.2, 0.68), text(size: 7.5pt, weight: "bold", fill: luma(100))[Índice 4])
    content((6.2, 0.30), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))["Chave"])

    // --- OPERAÇÃO DE ACESSO DIRETO (list.get) ---
    line((2.6, -0.9), (2.6, -0.1), mark: (end: ">", fill: rgb("#1565C0")), stroke: 1.2pt + rgb("#1565C0"))
    content((2.6, -1.2), text(size: 8pt, weight: "bold", fill: rgb("#1565C0"))[Item da posição 2])

    // --- OPERAÇÃO DE ADIÇÃO NO FINAL (list.add) ---
    rect((7.2, 0.0), (8.8, 1.0), fill: rgb("#C8E6C9"), stroke: 1pt + rgb("#2E7D32"), radius: 0.08)
    content((8.0, 0.68), text(size: 7.5pt, weight: "bold", fill: rgb("#2E7D32"))[Índice 5])
    content((8.0, 0.30), text(size: 8.5pt, weight: "bold", fill: rgb("#2E7D32"))["Anel"])

    line((8.0, 1.9), (8.0, 1.1), mark: (end: ">", fill: rgb("#2E7D32")), stroke: 1.2pt + rgb("#2E7D32"))
    content((8.0, 2.2), text(size: 8pt, weight: "bold", fill: rgb("#2E7D32"))[Inserção de "Anel"])

    // --- TAMANHO DA LISTA (list.size) ---
    line((0.0, 1.2), (7.0, 1.2), stroke: 0.8pt + luma(120))
    line((0.0, 1.1), (0.0, 1.3), stroke: 0.8pt + luma(120))
    line((7.0, 1.1), (7.0, 1.3), stroke: 0.8pt + luma(120))
    content((3.5, 1.5), text(size: 8pt, style: "italic", fill: luma(80))[4 itens (antes da inserção)])

    // --- LEGENDA ---
    content((4.4, -1.9), text(size: 9pt, style: "italic", fill: luma(100))[Acesso por posição indexada (1 a n) e expansão dinâmica])
  }),
  caption: [Estrutura visual de uma lista, destacando consulta por índice e adição ao final.]
) <figura-lista-cetz>

== Bundle (pacote)

Um bundle é um conjunto de valores reunidos em um único objeto. Um objeto bundle pode conter qualquer quantidade de valores do tipo _string_ ou numéricos. 

Os valores são definidos e acessados ​​por meio de chaves. Uma chave é uma _string_ que identifica o valor.

Cadastro de um jogador:
#table(
    columns: (1.2fr, 1fr, 1.2fr, 2fr),
    [Chave], [Tipo], [Valor Exemplo], [Descrição],
    [`"first_name"`], [String], [`"Carlos"`], [Primeiro nome do usuário],
    [`"last_name"`], [String], [`"Silva"`], [Sobrenome do usuário],
    [`"age"`], [Numérico], [`28`], [Idade],
    [`"score"`], [Numérico], [`1540`], [Pontuação atual no jogo],
    [`"is_active"`], [Numérico], [`1`], [Flag de status (`1` = ativo)],
  )

Ponto cartesiano:
#table(
    columns: (1.2fr, 1fr, 1.2fr, 2fr),
    [Chave], [Tipo], [Valor Exemplo], [Descrição],
    [`"eixo_x"`], [Numérico], [`100`], [Abscissa],
    [`"eixo_y"`], [Numérico], [`200`], [Coordenada],
  )



== Stack (pilha)

Uma pilha é uma estrutura de dados linear que funciona sob a lógica LIFO (Last-In, First-Out), isto é, o último elemento a entrar é o primeiro a sair.

Em uma pilha, você só tem acesso direto ao elemento do topo. Novos dados são empilhados no topo (push) e removidos do topo (pop). No contexto de jogos e aplicativos _mobile_, pilhas são amplamente utilizadas para gerenciar navegação de menus (telas sobrepostas) e sistemas de desfazer/refazer.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- RECIPIENTE DA PILHA (ESTRUTURA) ---
    line((-1.5, 3.2), (-1.5, -0.2), (1.5, -0.2), (1.5, 3.2), stroke: 2pt + luma(80))

    // --- ELEMENTOS EMPILHADOS ---
    // Base (Primeiro a entrar)
    rect((-1.4, 0.0), (1.4, 0.9), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Menu Principal])

    // Meio
    rect((-1.4, 0.9), (1.4, 1.7), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 1.3), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Configuracoes])

    // Topo (Último a entrar / Próximo a sair)
    rect((-1.4, 1.8), (1.4, 2.6), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 2.2), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Opcoes de Audio])

    // --- INDICADOR DO TOPO ---
    line((1.6, 2.2), (2.3, 2.2), mark: (start: ">", fill: rgb("#1565C0")), stroke: 1.2pt + rgb("#1565C0"))
    content((3.6, 2.2), text(size: 9pt, weight: "bold", fill: rgb("#1565C0"))[TOPO DA PILHA])

    // --- OPERAÇÃO PUSH (ENTRADA) ---
    rect((-3.9, 3.5), (-1.7, 4.3), fill: rgb("#C8E6C9"), stroke: 1pt + rgb("#2E7D32"), radius: 0.08)
    content((-2.8, 3.9), text(size: 8pt, weight: "bold", fill: rgb("#2E7D32"))[Nova Tela])
    line((-2.2, 3.4), (-0.5, 2.8), mark: (end: ">", fill: rgb("#2E7D32")), stroke: 1.5pt + rgb("#2E7D32"))
    content((-2.0, 2.8), text(size: 9pt, weight: "bold", fill: rgb("#2E7D32"))[PUSH])

    // --- OPERAÇÃO POP (SAÍDA) ---
    rect((1.7, 3.5), (3.9, 4.3), fill: rgb("#FFCDD2"), stroke: 1pt + rgb("#C62828"), radius: 0.08)
    content((2.8, 3.9), text(size: 8pt, weight: "bold", fill: rgb("#C62828"))[Tela Removida])
    line((0.5, 2.8), (2.2, 3.4), mark: (end: ">", fill: rgb("#C62828")), stroke: 1.5pt + rgb("#C62828"))
    content((2.0, 2.8), text(size: 9pt, weight: "bold", fill: rgb("#C62828"))[POP])

    // --- LEGENDA LIFO ---
    content((0, -0.6), text(size: 9pt, style: "italic", fill: luma(100))[LIFO: Last-In, First-Out (O último que entra é o primeiro que sai)])
  }),
  caption: [Representação visual de uma pilha e suas operações fundamentais.]
) <figura-pilha-cetz>

= Comandos

Um comando é uma palavra-chave da linguagem e opera sobre argumentos, sua sintaxe é:

#align(center)[
`nome_do_comando argumento_1, argumento_2, ..., argumento_n`
]

Alguns argumentos podem ser opcionais. Nesse caso, se o argumento estiver no meio da lista, devemos deixar o espaço vazio. Caso esteja no fim, não precisamos fazer isso.

Exemplo de um comando:

#align(center)[
`input "Digite seu nome", nome$, ,cancelou`
]

- Nome do comando: `input`
- Primeiro argumento: `"Digite seu nome"`
- Segundo argumento: `nome$`
- Terceiro argumento: vazio
- Quarto argumento: `cancelou`

Removendo os argumentos opcionais:

#align(center)[
`input "Digite seu nome", nome$`
]

- Nome do comando: `input`
- Primeiro argumento: `"Digite seu nome"`
- Segundo argumento: `nome$`
- Terceiro e quarto argumentos: vazio

== Entrada e saída de informação

Alguns argumentos são informações que passamos para o comando. Outros são *variáveis* que recebem informações. Por exemplo, no comando `input`, estamos passando um texto para ser exibido em uma caixa de diálogo, o que o usuário diigtar nessa caixa será guardado na variável `nome$`.

Outro exemplo:

```
gr.orientation 1
gr.screen w, h
```

O comando `gr.orientation` recebe `1`, que signifca deixar o celular no modo retrato. Já `gr.screen` calcula a largura e altura da tela e guarda essas informações em `w` e `h`, respectivamente.

#atencao[
  Não podemos criar nossos própios comandos.
]

= Funções

Uma função em programação funciona similar a uma função na matemática. Existe o nome da função, seu domínio e sua imagem. Os argumentos fazem parte do domínio da função. Sempre que formos usar uma função, seus argumentos devem estar entre parênteses.


#align(center)[
`nome_da_função(argumento_1, argumento_2, ..., argumento_n)`
]

A função sempre vai retornar um valor e todos os argumentos são de entrada. Veremos com mais detalhes na aula sobre funções.

A linguagem já vem com algumas funções embutidas. Por exemplo,

```
tam = len("Pau dos Ferros")
```

A função `len` (_length_) calcula o tamanho do texto dentro das aspas. O exemplo mostra que esse valor calculado está sendo guardado em `tam`.

#atencao[
  Podemos criar nossas própias funções. Neste caso, não existe argumento opcional. Além disso, podemos criar *funções recursivas*, ou seja, sub-rotinas que chamam a si mesmas durante a execução para dividir um problema maior em subproblemas menores e mais simples. 
]

= Case sensitive

_Case sensitive_ é um termo da computação que indica quando um sistema, programa ou linguagem faz distinção entre letras maiúsculas e minúsculas. A linguagem BASIC não é _case sensitive_. Portanto, por exemplo, os comandos `input`, `INPUT` ou `InPut` são equivalentes. No exemplo sobre funções, `tam` e `TAM` representam a mesma coisa. Isso vale para todas as palavras reservadas da linguagem.

