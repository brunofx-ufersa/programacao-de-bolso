#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 4,
  titulo: "Estruturas de dados",
  subtitulo: "Introdução à lista.",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Entender e usar ponteiros.],
  [Criar listas de números e _strings_.],
  [Manipular listas.],
  [Converter arrays em listas e vice-versa.],
)

No *Material Complementar 00*, você estudou ligeiramente que a linguagem possui quatro estruturas de dados básicas: arrays, listas, pacotes (_bundle_) e pilhas.

 
É hora de apronfundar nossos conhecimentos sobre esas estruturas. 
Elas são importantes para gerenciar os dados e otimizar nosso código. Agora é a hora das listas.


= Ponteiro

Antes de entrar em ação, vamos estudar esse tópico super importante: ponteiros. Esse termo é muito utilizado quando programamos em C e costuma trazer muitas dificuldades para os alunos.

Um ponteiro é um valor numérico que representa um índice em uma tabela. Imagine que a memória usada pelo programa seja um grande gaveteiro. Quando você cria um objeto, seu assistente o guarda em uma gaveta e te entrega o número correspondente dela. Esse número é único. Logo, você não possui o objeto, mas sabe onde encontrá-lo.


#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- 1. LADO ESQUERDO: PROGRAMA / SUA VARIÁVEL (O PAPELZINHO) ---
    rect((-4.8, 0.5), (-1.8, 3.8), fill: rgb("#FFFDE7"), stroke: 1.2pt + rgb("#F57F17"), radius: 0.1)
    content((-3.3, 3.4), text(size: 9pt, weight: "bold", fill: rgb("#F57F17"))[`b_ptr`])

    // O "Papelzinho com a Ficha/Número" (Slip of Paper)
    rect((-4.2, 1.0), (-2.4, 2.9), fill: rgb("#FFFFFF"), stroke: 1pt + rgb("#F57F17"), radius: 0.05)
    content((-3.3, 2.5), text(size: 8pt, style: "italic", fill: luma(100))[Ticket])
    content((-3.3, 1.7), text(size: 16pt, weight: "bold", fill: rgb("#D84315"))[#42])

   
    // --- 2. CENTRO: ASSISTENTE (INTERPRETADOR hBASIC) ---
    rect((-0.9, 1.0), (0.9, 3.3), fill: rgb("#F3E5F5"), stroke: 1.2pt + rgb("#7B1FA2"), radius: 0.2)
    content((0.0, 2.7), text(size: 9pt, weight: "bold", fill: rgb("#7B1FA2"))[Assistente])
    content((0.0, 2.1), text(size: 8.5pt, weight: "bold", fill: rgb("#4A148C"))[hBASIC])

    // Seta 1: Usuário envia a ficha
    line((-1.7, 2.1), (-1.0, 2.1), mark: (end: ">", fill: rgb("#7B1FA2")), stroke: 1.2pt + rgb("#7B1FA2"))

    // Seta 2: Assistente busca na gaveta correspondente
    line((1.0, 2.1), (2.0, 2.1), mark: (end: ">", fill: rgb("#7B1FA2")), stroke: 1.2pt + rgb("#7B1FA2"))

    // --- 3. LADO DIREITO: GAVETEIRO (MEMÓRIA VIRTUAL / TABELA DE OBJETOS) ---
    // Estrutura Externa do Arquivo Morto
    rect((2.1, -0.5), (6.8, 4.6), fill: rgb("#ECEFF1"), stroke: 1.5pt + rgb("#37474F"), radius: 0.1)
    content((4.45, 4.25), text(size: 9.5pt, weight: "bold", fill: rgb("#37474F"))[Gaveteiro])

    // Gaveta #10 (Outro objeto)
    rect((2.4, 3.2), (6.5, 3.9), fill: rgb("#CFD8DC"), stroke: 0.8pt + rgb("#455A64"), radius: 0.05)
    content((2.9, 3.55), text(size: 8.5pt, weight: "bold", fill: luma(80))[#10])
    content((4.6, 3.55), text(size: 8pt, style: "italic", fill: luma(120))[Vazio ])

    // Gaveta #42 (GAVETA SELECIONADA PELO ASSISTENTE)
    rect((2.4, 1.1), (6.5, 3.0), fill: rgb("#E3F2FD"), stroke: 1.5pt + rgb("#1565C0"), radius: 0.05)
    content((2.9, 2.6), text(size: 9.5pt, weight: "bold", fill: rgb("#1565C0"))[#42])

    // A Pasta Recheada de Dados (O Objeto Real dentro da Gaveta)
    rect((3.4, 1.3), (6.3, 2.8), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.05)
    content((4.85, 2.45), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[List])
    content((4.85, 1.95), text(size: 7.5pt, fill: luma(40))[1 ->4 -> 8 -> 3])
    
    // Gaveta #99 (Outro objeto)
    rect((2.4, -0.2), (6.5, 0.9), fill: rgb("#CFD8DC"), stroke: 0.8pt + rgb("#455A64"), radius: 0.05)
    content((2.9, 0.35), text(size: 8.5pt, weight: "bold", fill: luma(80))[#99])
    content((4.6, 0.35), text(size: 8pt, style: "italic", fill: luma(120))[Objeto])

    

  }),

) <figura-ponteiro-gaveteiro-cetz>

Na ilustração acima, dizemos que o ponteiro `b_prt` aponta para o objeto `List`. 

Existem outros elementos, além das estruturas de dados como `List`, `Bundle` e `Stack`, que são acessados ​​por meio de ponteiros. Entre eles estão bitmaps e objetos gráficos, por exemplo.


#conceito("bitmap")[
Um bitmap é uma imagem digital formada por uma grade de pixels que, juntos, formam a imagem completa.]

= Lista


A lista é bem semelhante a um _array_ de uma dimensão. Porém, não precisamos saber quantos elementos vão ser inseridos na lista, pois ela cresce dinâmicamente. Podemos começar com uma lista vazia e ir adicionando elementos conforme a necessidade.

Outra característica que a difere de vetor é que podemos remover um elemento em qualquer posição.

Por fim, a identificação de um _array_ é por variável (`vetor[]` ou `vetor$[]`), enquanto em listas o elemento é representado por um *ponteiro*. 
 
  
== Criação e adição de elementos

```
list.create S, fruta_ptr
list.create N, medicao_ptr

list.add fruta_ptr, "maçã", "banana", "laranja"
list.add medicao_ptr, 1.25, 2.15, 1.75
```

As variáveis que nomeamos com o sufixo `_prt`, por convenção, são ponteiros.

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Cria uma nova lista (vazia) de _strings_],
  [2], [Cria uma nova lista (vazia) de números],
  [4], [Insere _strings_ ],
  [5], [Insere números],
)

== Busca e modificação de elementos


```
list.search fruta_ptr, "abacaxi", has_abacaxi

if has_abacaxi 
  print "Temos abacaxi."
else
  print "Abacaxi? Tem, mas ta faltando."
endif     

List.replace fruta_ptr, 1, "abacaxi"
list.search fruta_ptr, "abacaxi", has_abacaxi

if has_abacaxi 
  print "Temos abacaxi."
else
  print "Abacaci? Tem, mas ta faltando."
endif     
```


#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Busca por um elemento (`"abacaxi"`) na lista e não encontra],
  [9], [Substitui o primeiro item por `"abacaxi"`],
  [10], [Busca por um elemento (`"abacaxi"`) na lista e o encontra],
)

Se o item não for encontrado, `has_abacaxi` receberá zero.

== Inserção, acesso e remoção

```
list.insert fruta_ptr, 2, "maçã"
for i = 1 to 4
  list.get fruta_ptr, i, fruta$
  print fruta$ + " ";
next i
print ""

list.remove fruta_ptr, 4
for i = 1 to 3
  list.get fruta_ptr, i, fruta$
  print fruta$ + " ";
next i
print ""
```

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Insere `"maça"` na segunda posição],
  [2-6], [Exibição da lista de frutas via `for`],
  [3], [Acessa o elemento da posição `i` e guarda em `fruta$`],
  [8], [Remove o quarto elemento da lista `"laranja"`],
  [9-13], [Exibição da lista de frutas via `for`],
  [10], [Acessa o elemento da posição `i`e guarda em `fruta$`],

)


#atencao[O valores no laço `for` de 4 e 3 são chamados de números mágicos. Eles são valores numéricos soltos e sem explicação no código. E devem ser evitados. Sabemos que o laço deve ir de 1 até o tamanho da lista. O seguinte código corrigido não sofre desse mal:
```
list.insert fruta_ptr, 2, "maçã"
list.size fruta_ptr, fruta_size
for i = 1 to fruta_size
  list.get fruta_ptr, i, fruta$
  print fruta$ + " ";
next i
print ""

list.remove fruta_ptr, 4
list.size fruta_ptr, fruta_size
for i = 1 to fruta_size
  list.get fruta_ptr, i, fruta$
  print fruta$ + " ";
next i
print ""
```

Agora o limte do laçõ é o tamanho da lista calculado com `list.size`.

]

== Limpeza

```
list.size medicao_ptr, medicao_size
print "Tamanho antes da limpeza: " + int$(medicao_size)

list.clear medicao_ptr
list.size medicao_ptr, medicao_size
print "Tamanho depois da limpeza: " + int$(medicao_size)
```

O comando `list.clear` limpa a lista apontada pelo ponteiro e define o tamanho da lista como zero.

== Outras operações

#table(
  columns: (7cm, 1fr),
  [Cpmado], [Ação],
  [`list.add.list list_dest, list_src`], [Adiciona os elementos de `list_src` ao final de `list_dest`.],
  [`list.add.array list_dest, array[]`], [Adiciona os elementos de `array` ao final de `list_dest`.],
  [`list.toArray list_ptr, array[]`], [Converte a lista em array unidimensional],
  [`list.type list_prt, tipo$`], [Determina o tipo, "S" para string ou "N" para número],
  
)


= Resumo

#table(
  columns: (7.3cm, 1fr),
  [Comando], [Para que serve], 
  [`list.create S, list_ptr`], [Cria uma lista vazia para _strings_],
  [`list.create N, list_ptr`], [Cria uma lista vazia para números],
  [`list.add list_ptr, e1, e2, ...`], [Adiciona os elementos `e1, e2, ...` à lista],
  [`list.search list_ptr, e, has_e`], [Busca o elemento `e`. `has_e = 0` caso falhe ],
  [`List.replace list_ptr, i, e`], [Substitui o elemento da posição `i` por `e`],
  [`list.insert list_ptr, i, e`], [Insere o elemento `e` na posição `i`],
  [`list.remove list_ptr, i`], [Remove o elemento da posição `i`],
  [`list.get list_ptr, i, e`], [Acessa a posição `i` e guardo o elemento em `e`],
  [`list.clear list_ptr`], [Limpa toda a lista],
  [`list.size list_ptr, list_size`], [Calcula o tamanho da lista],
  [`list.add.list list_dest, list_src`], [Adiciona os elementos de `list_src` ao final de `list_dest`.], 
  [`list.add.array list_dest, array[]`], [Adiciona os elementos de `array` ao final de `list_dest`.],
  [`list.toArray list_ptr, array[]`], [Converte a lista em _array_ unidimensional],
  [`list.type list_prt, tipo$`], [Determina o tipo, "S" para string ou "N" para número],
)




O comando `list.add.array` aceita segmentos de _array_.

