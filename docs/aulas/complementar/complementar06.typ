#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 6,
  titulo: "Estruturas de dados",
  subtitulo: "Introdução à pilha.",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Trabalhar com expressões que envolvem texto.],
  [Usar funções básicas sobre textos.],
  [Aprender a usar o console com mais propriedade.],
)


No *Material Complementar 00*, você estudou ligeiramente que a linguagem possui quatro estruturas de dados básicas: arrays, listas, pacotes (_bundle_) e pilhas.

 
É hora de apronfundar nossos conhecimentos sobre esas estruturas. Elas são importantes para gerenciar os dados e otimizar nosso código. Agora é a hora das pilhas.


= Pilhas

Pilha ou _stack_ é uma estrutura da dados na qual seus elementos são empilhados como um carregador de armas. As balas vão sendo inseridas uma após a outra. A arma só tem acesso a última inserida.

Dizemos que o elemento que temos acesso está o topo da pilha. De maneira alguma teremos acesso a outro elemento que não esteja no topo.

Muitos professores usam outras analogias como uma pilha de pratos sujos. O lavador pega o prato que está em cima, no topo. Parece uma analogia ideal também, mas sabemos que podemos a qualquer momento remover o segundo, terceiro ou quarto prato da pilha sem retirar o primeiro. E isso não é permitido na estrutura de dados. Na analogia do pente de balas, para pegar a terceira temos que remover primeiramente a primeira e segunda do topo. 

A duas funções básicas que toda pilha tem são empilhar (_push_) e desempilhar (_pop_). No contexto de jogos e aplicativos _mobile_, pilhas são amplamente utilizadas para gerenciar navegação de menus e sistemas de desfazer/refazer. É graças as pilha que as linguagens de programação possui recursos como funções.



== Criação e adição de elementos

A criação de uma pilha é semelhante à criação de uma lista, com a palavra `create`. Usamos `S` para uma pilha de strings e `N` para uma pilha de números. 


```
stack.create S pilha_ptr
stack.push pilha_ptr, "Linux"
stack.push pilha_ptr, "Windows"
stack.push pilha_ptr, "Mac"
```

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Cria uma nova pilha do tipo _string_. Use `N` para números],
  [2], [Insere o valores "Linux" no topo da pilha],
  [3], [Insere o valores "Windows" no topo da pilha],
  [4], [Insere o valores "Mac" no topo da pilha],
 )



#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- RECIPIENTE DA PILHA (ESTRUTURA) ---
    line((-1.5, 3.2), (-1.5, -0.2), (1.5, -0.2), (1.5, 3.2), stroke: 2pt + luma(80))

    // --- ELEMENTOS EMPILHADOS ---
    // Base (Primeiro a entrar)
    rect((-1.4, 0.0), (1.4, 0.9), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linux])

    // Meio
    rect((-1.4, 0.9), (1.4, 1.7), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 1.3), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Windows])

    // Topo (Último a entrar / Próximo a sair)
    rect((-1.4, 1.8), (1.4, 2.6), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 2.2), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Mac])

    // --- INDICADOR DO TOPO ---
    line((1.6, 2.2), (2.3, 2.2), mark: (start: ">", fill: rgb("#1565C0")), stroke: 1.2pt + rgb("#1565C0"))
    content((3.6, 2.2), text(size: 9pt, weight: "bold", fill: rgb("#1565C0"))[TOPO DA PILHA])

    // --- OPERAÇÃO PUSH (ENTRADA) ---
    rect((-3.9, 3.5), (-1.7, 4.3), fill: rgb("#C8E6C9"), stroke: 1pt + rgb("#2E7D32"), radius: 0.08)
    content((-2.8, 3.9), text(size: 8pt, weight: "bold", fill: rgb("#2E7D32"))[Novo Item])
    line((-2.2, 3.4), (-0.5, 2.8), mark: (end: ">", fill: rgb("#2E7D32")), stroke: 1.5pt + rgb("#2E7D32"))
    content((-2.0, 2.8), text(size: 9pt, weight: "bold", fill: rgb("#2E7D32"))[PUSH])

  
  }),
) <figura-pilha-push>



== Acesso e remoção

Se `push` insere na lista, para remover usamos `pop`.

```
stack.pop pilha_ptr, sistema$
stack.peek pilha_ptr, sistema$
```

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Remove o valor do topo da pilha e o armazena em `sistema$`],
  [2], [Retorna o valor que está no topo da pilha, armazenando-o em `sistema$`. \ O valor permanece no topo da pilha],
 )

#grid(
  columns: (1fr, 1fr), // Duas colunas de tamanhos iguais
  gutter: 1cm,

figure(
  cetz.canvas({
    import cetz.draw: *

    // --- RECIPIENTE DA PILHA (ESTRUTURA) ---
    line((-1.5, 3.2), (-1.5, -0.2), (1.5, -0.2), (1.5, 3.2), stroke: 2pt + luma(80))

    // --- ELEMENTOS EMPILHADOS ---
    // Base (Primeiro a entrar)
    rect((-1.4, 0.0), (1.4, 0.9), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linux])

    // Meio
    rect((-1.4, 0.9), (1.4, 1.7), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 1.3), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Windows])

// Topo (Último a entrar / Próximo a sair)
    rect((-1.4, 1.8), (1.4, 2.6), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 2.2), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Mac])

    // --- INDICADOR DO TOPO ---
    line((1.6, 2.2), (2.3, 2.2), mark: (start: ">", fill: rgb("#1565C0")), stroke: 1.2pt + rgb("#1565C0"))
    content((3.6, 2.2), text(size: 9pt, weight: "bold", fill: rgb("#1565C0"))[TOPO DA PILHA])


    // --- OPERAÇÃO POP (SAÍDA) ---
    rect((1.7, 3.5), (3.9, 4.3), fill: rgb("#FFCDD2"), stroke: 1pt + rgb("#C62828"), radius: 0.08)
    content((2.8, 3.9), text(size: 8pt, weight: "bold", fill: rgb("#C62828"))[Mac])
    line((0.5, 2.8), (2.2, 3.4), mark: (end: ">", fill: rgb("#C62828")), stroke: 1.5pt + rgb("#C62828"))
    content((2.0, 2.8), text(size: 9pt, weight: "bold", fill: rgb("#C62828"))[PEEK])

     }),
),

figure(
  cetz.canvas({
    import cetz.draw: *

    // --- RECIPIENTE DA PILHA (ESTRUTURA) ---
    line((-1.5, 3.2), (-1.5, -0.2), (1.5, -0.2), (1.5, 3.2), stroke: 2pt + luma(80))

    // --- ELEMENTOS EMPILHADOS ---
    // Base (Primeiro a entrar)
    rect((-1.4, 0.0), (1.4, 0.9), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 0.4), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linux])

    // Meio
    rect((-1.4, 0.9), (1.4, 1.7), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0, 1.3), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Windows])


    // --- INDICADOR DO TOPO ---
    line((1.6, 1.3), (2.3, 1.3), mark: (start: ">", fill: rgb("#1565C0")), stroke: 1.2pt + rgb("#1565C0"))
    content((3.6, 1.3), text(size: 9pt, weight: "bold", fill: rgb("#1565C0"))[TOPO DA PILHA])


    // --- OPERAÇÃO POP (SAÍDA) ---
    rect((1.7, 3.5), (3.9, 4.3), fill: rgb("#FFCDD2"), stroke: 1pt + rgb("#C62828"), radius: 0.08)
    content((2.8, 3.9), text(size: 8pt, weight: "bold", fill: rgb("#C62828"))[Mac])
    line((0.5, 2.8), (2.2, 3.4), mark: (end: ">", fill: rgb("#C62828")), stroke: 1.5pt + rgb("#C62828"))
    content((2.0, 2.8), text(size: 9pt, weight: "bold", fill: rgb("#C62828"))[POP])

     }),
)

)

== Limpeza


```
stack.isEmpty pilha_ptr, is_empty
stack.clear pilha_ptr
```

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Determina se a pilha está vazia: `0` para falso e `1` para verdadeiro. 
],
  [2], [Limpa a pilha],

 )


O comando `stack.type pilha_ptr, tipo$` determina se a pilha é de _strings_ ou números. A variável `tipo$` será `"S"` se a pilha for de _strings_ e `"N"` caso seja numérica.


= Resumo

= Resumo

#table(
  columns: (7.8cm, 1fr),
  [Comando], [Para que serve], 
[`stack.create S, pilha_ptr`], [Cria uma pilha vazia para _strings_],
  [`stack.create N, pilha_ptr`], [Cria uma pilha vazia para números],
  [`stack.push pilha_ptr, e`], [Adiciona o elemento `e` no topo d apilha],
  [`stack.peek pilha_ptr, e`], [Consulta o elemento do topo da pilha],
  [`stack.pop pilha_ptr, e`], [Remove o elemento do topo da pilha],
  [`stack.isempty pilha_ptr, is_empty`], [Determina se a pilha está vazia],
  [`stack.clear pilha_ptr`], [Limpa toda a pilha],
  [`stack.type pilha_prt, tipo$`], [Determina o tipo, `"S"` para string ou `"N"` para número],


)


