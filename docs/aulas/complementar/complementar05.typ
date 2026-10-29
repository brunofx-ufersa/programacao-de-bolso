#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 5,
  titulo: "Estruturas de dados",
  subtitulo: "Introdução ao pacote (bundle).",
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
Elas são importantes para gerenciar os dados e otimizar nosso código. Agora é a hora dos _bundles_ (pacotes).



= Ponteiro

Você deve se lembrar da ilustração sobre ponteiros que fizemos no *Material Complementar 04*.

Na ilustração, dissemos que quando criamos um objeto, o assistente o guarda em uma gaveta e te entrega apenas o número que identifica a gaveta. Suponha que o objeto que você criou seja uma pasta contendo informações sobre alunos.


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
    content((4.85, 2.45), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Bundle])
    content((4.85, 1.95), text(size: 7.5pt, fill: luma(40))["nome": "Carlos"])
    content((4.85, 1.55), text(size: 7.5pt, fill: luma(40))["matricula": 2026159])

    // Gaveta #99 (Outro objeto)
    rect((2.4, -0.2), (6.5, 0.9), fill: rgb("#CFD8DC"), stroke: 0.8pt + rgb("#455A64"), radius: 0.05)
    content((2.9, 0.35), text(size: 8.5pt, weight: "bold", fill: luma(80))[#99])
    content((4.6, 0.35), text(size: 8pt, style: "italic", fill: luma(120))[Objeto])

    

  }),

) <figura-ponteiro-gaveteiro-cetz>

O número que seu assistente lhe fornecer ao arquivar a pasta passará a ser o número de identificação daquele aluno. Você pode recuperar as informações de qualquer aluno solicitando ao assistente que lhe traga a pasta correspondente ao número de identificação exclusivo do aluno.


No hBasic, você utilizará um *bundle* para criar esse objeto (pasta) contendo as informações do aluno. 


= Bundle

Um bundle é uma estrutura do tipo chave-valor, onde a chave é sempre uma _string_. Por exemplo, um bundle pode conter o nome e idade de uma pessoa; as chaves para acessar esses valores poderiam ser "name" (nome) e "age" (idade). 


== Criação e adição de elementos


```
bundle.create bun_ptr
bundle.put bun_ptr, "nome", "Chespirito"
bundle.put bun_ptr, "matricula", 2026159
bundle.put bun_ptr, "curso", "Teatro"
```

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Cria um nova bundle (vazia)],
  [2], [Adiciona o par `("nome", "Chespirito")`],
  [3], [Adiciona o par `("matricula", 2026159)`],
  [4], [Adiciona o par `("curso", "Teatro")`],
 )


Se você não criar um _bundle_ e acionar o comando `bundle.put` um novo será criado para você.

== Busca e modificação de elementos

Para saber se o _bundle_ possui uma chave especifíca use o comando `bundle.contain`. 

```
bundle.contain bun_ptr, "departamento" , has_depto

if has_depto
  print "Há uma chave departamento."
else
  print "NÃO há uma chave departamento."
endif     

bundle.put bun_ptr, "curso", "Dramaturgia"
```

O comando `bundle.put`, visto anteriormente, pode ser usado para modificar o valor de uma chave.

#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Verifica se há a chave `"departamento"`.],
  [9], [Modifica o valor do curso para `"Dramaturgia"`],
  [10], [Busca por um elemento (`"abacaxi"`) na lista e o encontra],
)


A chave é sempre uma _string_, se ela não existir `has_depto` receberá zero. 


== Inserção, acesso e remoção

A inserção acontece normalmente com o comando `bundle.put`. Já para acessar e remover, podemos fazer:


```
bundle.get bun_ptr, "nome", nome$
bundle.get bun_ptr, "matricula", matricula

bundle.remove bun_ptr, "curso"
```


#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [1], [Recupera o valor referente a chave `"nome"`],
  [2], [Recupera o valor referente a chave `"matricula"`],
  [4], [Remove a chave `"curso"` juntamente com sua chave associada],
  
)


== Limpeza

O comando abaixo vair apagar todas as chaves e valores e tornar o _bundle_ vazio.

```
bundle.clear bun_ptr
```

== Outras operações

#table(
  columns: (7.3cm, 1fr),
  [Cpmado], [Ação],
  [`bundle.type bun_ptr, "key", type$`], [Determina se o valor é _string_ `"S"` ou número `"N"`.],
  [`bundle.keys bun_ptr, list_ptr`], [Copia as chaves para uma lista.],
)

Exemplo de função para exibir os dados de um _bundle_:

```
fn.def print_bundle(bptr)
  bundle.keys bptr, lptr
  list.size lprt, lsize

  for i = 1 to lsize
    list.get lprt, i, key$
    bundle.type bptr, key$, type$
    
    if type$ = "S"
      bundle.get bptr, key$, value$
      print key$, value$
    else
      bundle.get bptr, key$, value
      print key$, value
    endif
  next i
fr.end  
```
#table(
  columns: (2cm, 1fr),
  [Linha], [Ação],
  [2], [Coloca todas as chaves em uma lista representada por `lptr`],
  [3], [Calcula o tamanho da lista, ou seja, a quantidade de chaves],
  [6-7], [Para cada chave na lista, recupera o tipo do valor],
  [10-11], [O valor é texto, recupera o valor e exibe junto com a chave],
  [13-14], [O valor é numérico, recupera o valor e exibe junto com a chave],
  
)

= Resumo

#table(
  columns: (7.8cm, 1fr),
  [Comando], [Para que serve], 
  [`bundle.create bptr`], [Cria uma _bundle_ vaziao],
  [`bundle.put bptr, "key", value`], [Adiciona o par `(key, value)`, \ se existe então substitui],
  [`bundle.get bptr, "key", value`], [Recupera o valor da chave `key` ],
  [`bundle.contain bptr, "key", has_key`], [Determina se uma chave está presente],
  [`bundle.remove bptr, "key"`], [Remove a chave e seu valor],
  [`bundle.clear bprt`], [Limpa todo o _bundle_],
  [`bundle.type bptr, "key", tipo$`], [Determina o tipo do valor],
  [`bundle.keys bptr, list`], [Extrai a lista de chaves],
)
