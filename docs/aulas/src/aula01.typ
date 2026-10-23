#import "modelo-aula.typ": *

#show: aula.with(
  numero: 1,
  titulo: "O celular que fala",
  subtitulo: "Voz, variáveis e decisões, direto do bolso.",
  recurso: "Síntese de voz (TTS)",
  conceitos: ("variáveis", "texto", "decimais", "entrada de dados", "condições"),
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
  trecho: (
    "tts.init",
    "tts.speak",
    "  \"Olá, mundo!\"",
    "",
    "> _",
  ),
)

#nesta-aula(
  [Fazer o aparelho *falar* e escrever na tela.],
  [Guardar informações em *variáveis* (números e textos).],
  [Perguntar o nome do usuário e reagir à resposta com um `if`.],
)

Programar costuma começar com uma tela preta e um "Olá, mundo" mudo. Aqui o "Olá, mundo" *fala*. Em poucos minutos o seu celular vai cumprimentar você pelo nome, calcular sua idade e comentar o resultado. Tudo isso sem computador: você escreve, executa e testa no mesmo aparelho.

#conceito("Algoritmo")[
  Um programa é uma lista de instruções executadas uma após a
  outra, de cima para baixo. O celular segue a receita sem interpretar nada, então cada instrução precisa ser exata.
]

= Seu primeiro programa

Abra o aplicativo *hBasic*. No canto superior esquerdo deve haver o nome *unnamed program* que siginifica que o programa não possui um nome, pois não foi salvo ainda. 

Na primeira linha deve estar escrito *REM Start of BASIC! Program*, isto é, ínicio do programa. A palavra-chave *REM* (Remark) significa que esta linha é um comentário, uma observação, e será ignorada quando executarmos o programa. Fique à vontade para apagá-la, se desejar.

#dica[Para iniciar um novo programa, selecione a opção *Clear* no menu.]

Em seguida, digite o código abaixo no editor:

#figure(caption: [Saudação])[
#codly.new(
```basic
tts.init
tts.speak "Olá! Eu sou o seu celular."
tts.stop
print "Olá! Eu sou o seu celular."
end "Fim do Programa."
```, file: "hello.bas", )
 ] <codigo-saudacao>


#etapa("salvar")[Salve o programa. Escolha um nome, `hello`, por exemplo!]

No canto superior direito aparecerá `hello.bas`. Antes de executar, vá ao menu e selecione *Format*. O texto que você criou será formatado para o padrão BASIC, onde as palavras-chave são capitalizadas e as linhas são indentadas apropriadamente.

Esta liguagem não é _case sensitive_, ou seja, tanto faz escrever `print` quanto `Print` ou `PRINT`, por exemplo.


#etapa("rodar")[Aumente o volume! Abra o menu e escolha *Run*.]

#tela[Olá! Eu sou o seu celular.

      Fim do Programa.]

Cada linha é uma instrução. Veja o que cada uma faz:

#table(
  columns: (3.2cm, 1fr),
  [Comando], [O que faz],
  [`tts.init`], [Liga o sintetizador de voz. Deve vir antes de qualquer fala.],
  [`tts.speak`], [Fala o texto que vem depois, entre aspas.],
  [`tts.stop`], [interrompe a reprodução atual],
  [`print`], [Imprime o texto entre aspas na tela.],
  [`end`], [Indica que o programa finalizou. É opcional],
)


#atencao[
  A sigla TTS significa Text to Speech (Texto para Fala). 
  O texto que o celular fala ou escreve vai sempre *entre aspas*. As aspas dizem: "isto é um texto, não um comando". Ademais, o comando `end` pode ser usado em qualquer lugar do código. Ele imprime a mensagem e para a execução do programa. Se nenhum texto for passado para `end`, será escrito na tela "END".  
]

= Variáveis

Escrever a mesma frase várias vezes é cansativo. Para guardar uma informação e reutilizá-la, usamos uma *variável*.

#conceito("Variável")[
  Uma variável é uma caixinha com uma etiqueta. A etiqueta é o *nome* e o conteúdo é o *valor*. 
]

O hBasic tem dois tipos básicos de variável, distinguidos pelo nome:

#table(
  columns: (2.6cm, 5.4cm, 1fr),
  [Tipo], [Como se escreve], [Exemplo],
  [Texto], [nome *com* `$` no final], [`nome$ = "Ana"`],
  [Número], [nome sem `$`], [`idade = 17`],
)


Um programa que usa variáveis de texto:

#figure(caption: [Saudação com variável])[
#codly.new(
```basic
nome$ = "Ana"
mensagem$ = "Olá, " + nome$ + "! Bem-vinda à programação de bolso."
tts.init
tts.speak mensagem$
tts.stop
print mensagem$
end
```,
  file: "variavel.bas"),
 ] <codigo-saudacao-var>



#etapa("rodar")[Execute e depois troque `"Ana"` pelo seu nome.]
#tela[Olá, Ana! Bem-vinda à programação de bolso.]

#atencao[
O sinal `=` significa "guarde isto aí", e não "é igual a" como na matemática. Primeiro declaramos a variável com um rótulo seguido do sinal de igualdade e o valor a ser amazenado.
]


RFO Basic também usa o comando `let` para denotar uma operação de atribuição, mas pode ser opcional. Se você escrever uma variável cujo o nome inicia com uma palavra-chave de BASIC!, obterá um erro. Portanto, você deverá usar `let` neste caso. Existem palavras reservadas da linguagem e elas não podem aparecer no ínicio de uma linha. Por exemplo, `printer` é visto como `print er`. Para usar `printer` como variável escreva `let printer`.


#dica[
  Escolha nomes que contem uma história: `idade` e `nome$` dizem mais do que
  `x` e `a$`. Você vai agradecer quando reler o programa daqui a um mês.
]

== Juntando textos

Um número em RFO Basic é sempre um decimal. Isso significa que quando imprimimos, por exemplo 17, o resultado na tela será 17.0.


#figure(caption: [Concatenando texto com número])[
#codly.new(
```basic
idade = 17
print idade
print "Idade: " + str$(idade) + " anos."
```,
  file: "variavel.bas",)
] <codigo-concatenacao>


O sinal `+` entre textos os *concatena*, ou seja, cola um no outro. Para colar
um *número* num texto, é preciso convertê-lo antes com `str$()`. Troque `str$` por `int$` e veja  a diferença. 



#atencao[
  `"Idade: " + idade` provoca erro, porque não se pode misturar texto e número sem converter. 
]


Você deve ter notado que o comando `print` escreve um texto na tela do seu celular e salta para a próxima linha. Se o texto que quisermos mostrar for muito grande, podemos usar `;` para evitar a quebra de linha.

#figure(caption: [Impressão sem nova linha])[
#codly.new(
```basic
print "Idade: ";
print idade
```,
  file: "variavel.bas",)
] <codigo-print-sem-nova-linha>



= Perguntando ao usuário

Um programa fica interessante quando conversa. O comando `input` mostra uma
pergunta e guarda a resposta numa variável:

#figure(caption: [Entrada de dados])[
#codly.new(
```basic
input "Como você se chama?", nome$
input "Em que ano você nasceu?", nasc

idade = 2026 - nasc
frase$ = nome$ + ", você tem cerca de " + int$(idade) + " anos."
tts.init
tts.speak frase$
tts.stop
print frase$

end
```,  
  file: "input.bas", ),
] <codigo-input>


Note que `nome$` recebe texto e `nasc` recebe um número. A linha `idade = 2026 - nasc` mostra que variáveis também fazem contas.


#etapa("rodar")[Execute com seus dados.]


= Tomando decisões

Até agora o programa seguiu sempre o mesmo caminho. Com `if`, ele escolhe caminhos diferentes conforme uma *condição*:

#table(
  columns: (2.2cm, 1fr, 4cm),
  [Símbolo], [Significa], [Exemplo],
  [`=`], [igual a (numa condição)], [`idade = 18`],
  [`<>`], [diferente de], [`idade <> 18`],
  [`<`], [menor que], [`idade < 18`],
  [`>`], [maior que], [`idade > 18`],
  [`<=`], [menor ou igual a], [`idade <= 18`],
  [`>=`], [maior ou igual a], [`idade >= 18`],
)

Juntando tudo, temos o *assistente de bolso*:

#figure(caption: [Entrada de dados com decisão])[
#codly.new(
```basic
input "Como você se chama?", nome$
input "Em que ano você nasceu?", nasc
idade = 2026 - nasc
saudacao$ = "Olá, " + nome$ + "! Você tem " + int$(idade) + " anos."

if idade < 18
  comentario$ = "Você tem a vida inteira pela frente."
elseif idade < 30
  comentario$ = "Hora de programar no ônibus!"
else
  comentario$ = "Experiência vale ouro na programação."
endif

tts.init
tts.speak saudacao$
tts.speak comentario$
tts.stop

print saudacao$
print comentario$
```,  
  file: "input-if.bas", )
] <codigo-input-if>

#conceito("Condição")[
  O `if` testa uma pergunta de resposta *sim ou não*. Se for sim, executa o bloco abaixo dele. Se for não, passa para o `elseif` seguinte e, por fim, para o `else`. Só *um* dos blocos é executado, e o `endif` marca onde a decisão termina.
]

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge, shapes
#import fletcher.shapes: diamond
// #set text(font: "Comic Neue", weight: 600) 

#align(center)[
#diagram(
  node-stroke: 0.8pt,
  edge-stroke: 0.8pt,
  node-corner-radius: 4pt,
  spacing: (15mm, 8mm),

  // Início e Fim
  node((0, 0), [Início], shape: shapes.pill, fill: rgb("e3f2fd")),
  node((0, 4), [Fim], shape: shapes.pill, fill: rgb("ffebee")),

  // Primeira Condição: idade < 18
  node((0, 1), [idade < 18?], shape: shapes.diamond, fill: rgb("fff9c4")),
  edge((0, 0), (0, 1), "->"),
  edge((0, 1), (1, 1), "->", label: [Sim], label-pos: 0.35),
  edge((0, 1), (0, 2), "->", label: [Não], label-pos: 0.35),

  // Ação idade < 18
  node((1, 1), [`comentario$` =\ `"Você tem a vida inteira.."`], fill: rgb("f1f8e9")),
  edge((1, 1), (1, 4), (0, 4), "->"),

  // Segunda Condição: idade < 30
  node((0, 2), [idade < 30?], shape: shapes.diamond, fill: rgb("fff9c4")),
  edge((0, 2), (1, 2), "->", label: [Sim], label-pos: 0.35),
  edge((0, 2), (0, 3), "->", label: [Não], label-pos: 0.35),

  // Ação idade < 30
  node((1, 2), [`comentario$` =\ `"Hora de programar no ônibus!"`], fill: rgb("f1f8e9")),
  edge((1, 2), (1, 4), (0, 4), "->"),

  // Ação Else
  node((0, 3), [`comentario$` =\ `"Experiência vale ouro..."`], fill: rgb("f1f8e9")),
  edge((0, 3), (0, 4), "->"),
)
]

Se o seu bloco condicional contiver apenas uma instrução, 
você pode usar uma forma mais simples, toda em uma única linha. 
Nesta forma, a palavra-chave `then` é obrigatória, e não existem `elseIf` nem `endif`.

```plain
if idade < 18 then comentario$ = "Você tem a vida inteira pela frente."
```

#align(center)[
#diagram(
  node-stroke: 0.8pt,
  edge-stroke: 0.8pt,
  node-corner-radius: 4pt,
  spacing: (15mm, 8mm),

  // Início e Fim
  node((0, 0), [Início], shape: shapes.pill, fill: rgb("e3f2fd")),
  node((0, 2), [Fim], shape: shapes.pill, fill: rgb("ffebee")),

  // Primeira Condição: idade < 18
  node((0, 1), [idade < 18?], shape: shapes.diamond, fill: rgb("fff9c4")),
  edge((0, 0), (0, 1), "->"),
  edge((0, 1), (1, 1), "->", label: [Sim], label-pos: 0.35),
  edge((0, 1), (0, 2), "->", label: [Não], label-pos: 0.35),

  // Ação idade < 18
  node((1, 1), [`comentario$` =\ `"Você tem a vida inteira pela frente."`], fill: rgb("f1f8e9")),
  edge((1, 1), (1, 2), (0, 2), "->"),
)
]

#atencao[
  O sinal de igualdade é usado em com dois sentidos. Primeiro, quando queremos atribuir um valor a uma variável:
  
  - `nota = 7.5`
  - `conceito$ = "B"`
  
  Esse tipo de operação não é uma equação como aprendemos na escola. Por exemplo, `nota = nota + 1` significa: "pegue o valor atual de `nota`, some 1 e guarde o resultado de volta em `nota`", ou seja, `nota` agora é 8.5. O outro caso que usamos igualdade é em algum `if`, por exemplo:

  - `if nota = 10`: nota é igual a 10?
  - `elseif nota = 8: nota é igual a 8?`

  Nesse caso, o sinal de igualdade funciona como um teste de uma condição e não como uma atribuição de valor. O valor de `nota` não muda.  
]


= Quebre o código!

Programadores aprendem muito lendo mensagens de erro. Faça cada experimento abaixo no assistente de bolso, *um de cada vez*, e anote o que acontece:

#etapa("quebrar")[Apague a linha `tts.init`. O que o celular faz?]
#etapa("quebrar")[Troque `nome$` por `nome` em uma das linhas. Aparece algum erro? qual?]
#etapa("quebrar")[Tire o `str$( )` ao redor de `idade`. O que o interpretador reclama?]
#etapa("quebrar")[Apague o `endif`. Aparece algum erro? Use datas que caiam nas três situações]
#etapa("quebrar")[Mude `2026 - nasc` para `nasc - 2026`. O programa acusa erro? A resposta faz sentido?]

#dica[
 O celular obedece a receita *exatamente como escrita*, mesmo quando o resultado é absurdo. Um erro de lógica não gera mensagem de erro, e quem precisa perceber é você.
]

#desafio("Assistente falante")[
  Crie um programa novo que:

  + pergunte a nota da primeira, segunda e terceira avaliação;
  + calcule a média aritmética das três notas;
  + use um `if` para determinar se o aluno foi aprovado;
  + escreva e faça o celular falar o resultado.

#align(center)[
#diagram(
  node-stroke: 0.8pt,
  edge-stroke: 0.8pt,
  node-corner-radius: 4pt,
  spacing: (15mm, 8mm),

  // Início e Fim
  node((0, 0), [Início], shape: shapes.pill, fill:black),
  node((0, 4), [Fim], shape: shapes.pill, fill: red),

  // Primeira Condição: idade < 18
  node((0, 1), [media < 3.5?], shape: shapes.diamond, fill: orange),
  edge((0, 0), (0, 1), "->"),
  edge((0, 1), (1, 1), "->", label: [Sim], label-pos: 0.35),
  edge((0, 1), (0, 2), "->", label: [Não], label-pos: 0.35),

  // Ação idade < 18
  node((1, 1), [`resultado$` =\ `"Você está reprovado."`], fill: rgb("f1f8e9")),
  edge((1, 1), (1, 4), (0, 4), "->"),

  // Segunda Condição: idade < 30
  node((0, 2), [media < 7?], shape: shapes.diamond, fill: orange),
  edge((0, 2), (1, 2), "->", label: [Sim], label-pos: 0.35),
  edge((0, 2), (0, 3), "->", label: [Não], label-pos: 0.35),

  // Ação idade < 30
  node((1, 2), [`resultado$` =\ `"Você está em recuperação."`], fill: rgb("f1f8e9")),
  edge((1, 2), (1, 4), (0, 4), "->"),

  // Ação Else
  node((0, 3), [`resultado$` =\ `"Você está aprovado."`], fill: rgb("f1f8e9")),
  edge((0, 3), (0, 4), "->"),
)
]
]

= Resumo

#table(
  columns: (6.4cm, 1fr),
  [Comando], [Para que serve],
  [`tts.init`], [Liga a voz do celular.],
  [`tts.speak "..."`], [Fala o texto.],
  [`print "..."`], [Escreve na tela.],
  [`input "?", v$`], [Pergunta e guarda a resposta na variável.],
  [`nome$ = "..."`], [Cria uma variável de *texto*.],
  [`idade = 17`], [Cria uma variável *numérica*.],
 // [`+`], [Cola textos (com `str$()` para números).],
  [`if / elseif / else / endif`], [Escolhe caminhos conforme uma condição.],
)

#proxima[
  *Aula 2: Expressões.* Vamos escrever expressões matemáticas e lógicas. Vamos aprofundar nossos conhecimentos do `if`, conhecer o gerador de números aleatórios e como abrir uma caixa de diálogo. 
]

