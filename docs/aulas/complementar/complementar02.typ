#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 2,
  titulo: "Strings",
  subtitulo: "Trabalhando com textos.",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Trabalhar com expressões que envolvem texto.],
  [Usar funções básicas sobre textos.],
  [Aprender a usar o console com mais propriedade.],
)

As _strings_ são qualquer conjunto de caracteres envolvido por aspas duplas. Por exemplo, `"curso de progamação"`. As aspas não fazem parte da _string_, somente a delimitam.


/* Um caracter de nova linha pode ser inserido em uma _string_ usando `\n`. Por exemplo,

```
print "UFERSA\nUniversidade Federal Rural do Semi-Árido"
```

Vai exibir  

#tela[
  UFERSA\
  Universidade Federal Rural do Semi-Árido
]
*/

= Expressões com strings

Uma expressão com _string_ consiste de uma ou mais variáveis de texto ou _strings_ cruas separadas pelo operador de concatenação `+`:

```
linguagem$ = Java
print "Curso de " + linguagem$
```
#tela[
  Curso de Java 
]

== Operações

Já sabemos como usar `str$(expressao)` que converte a expressão numérica para texto e `int$(expressao)` que nos dá a parte inteira em formato texto.  Vamos estudar outras operações.

=== Converter para numérico 

Uma _string_ com caracter numérico pode ser convertida para um número usando a função `val`:

```
print 1 + val("1")
```

Vai exibir  

#tela[
  2.0
]

Antes de converter, é necessaŕio identificar se o conteúdo representa relamente um valor numérico. Para essa tarefa, usamos a função `is_number`. Ela retorna o valor `0` se o conteúdo não for numérico.


```
num1$ = "1.75"
num2$ = "1.75 de altura"

if is_number(num1$) then print num1$
if is_number(num2$) then print num2$
```

Vai exibir  

#tela[
  1.75
]


=== Maiúsculas e minúsculas

As funções `lower$` e `upper$` convertem a _string_ para minúscula e maiúscula, respectivamente.
```
curso$ = "Programação de bolso com RFO Basic"
cursolower$ = lower$(curso$)
cursoupper$ = upper$(curso$)
print curso$
print cursotrim$
```

#tela[
  Programação de bolso com RFO Basic\
  programação de bolso com rfo basic\
  PROGRAMAÇÃO DE BOLSO COM REFO BASIC 
]

Esses comandos são úteis quando queremos comparar a entrada do usuário.
```
input = "Sua cor favoriva", cor$
if lower$(cor) = "azul"
  print cor$ + ", a cor do ceú."
else  
  print "Bela cor."
endif
```

Dessa maneira, o usuário pode digitar qualquer variação: Azul, azul, AZUL, aZuL, etc.


=== Remove espaços

A função `Trim$` remove espaços em branco no ínicio e no fim.

```
curso$ = "   Programação de bolso com RFO Basic   "
cursotrim$ = trim$(curso$)
print curso$
print cursotrim$
```

#tela[
  $quad$ Programação de bolso com RFO Basic\
  Programação de bolso com RFO Basic 
]

=== `Word$`

Retorna uma palavra em uma _string_.

```
curso$ = "   Programacao de bolso com RFO Basic   "
resultado$ = word$(curso$, 3)
print resultado$
```

#tela[
  bolso\
]


= Console

Quando usamos o comando `print` a saída é exibida no console. Após a expressão que será exibida pode haver uma vírgula ou um ponto-e-vírgula. 

Se a vírgula for posta no final ou separando _strings_, então serão exibidos a expressão, a vígula e um espaço. Caso seja um ponto-e-vírgula no final, a saída não será exibida até que um `print` sem um ponto-e-vírgula no final seja executado.

```
print "Maçã", "Banana", "Laranja"               
print "Maçã "; 
print "Banana ";
print "Laranja "               
```

#tela[
  Maçã, Banana, Laranja\
  Maçã Banana Laranja 
]


O ponto-e-vírgula entre duas expressões funciona como um concatenador.

```
print "Idade: "; 15; " anos\n" 
print "Matemática: "; 8.5, "Inglês: "; 6, "Português: "; 7               
```


#tela[
  Idade: 15.0 anos\
  \
  Matemática: 8.5, Inglês: 6.0, Português: 7.0  
]

O caracter `\n` força uma quebra de linha. 

== Outros comandos úteis

O comando `cls` limpa a tela do console. Ele é útil quando exibimos muitos dados. 

O comando `console.save` salva o conteúdo do console no arquivo indicado.

```
console.save "console.txt"
```



= Resumo

#table(
  columns: (4cm, 1fr),
  [Comando], [Para que serve],
  [`str$`], [Converte um número em _string_.],
  [`int$`], [Devolve a parte inteiro do número em _string_.],
  [`is_number`], [Determina se o conteúdo é um _string_ numérica.],
  [`val`], [Converte uma _string_ numérica em número.],
  [`lower$`], [Converte um texto para caixa baixa.],
  [`upper$`], [Converte um texto para caixa alta.],
  [`trim$`], [Remove os espaços em banco antes e depois da _string_.],
  [`word$`], [Extrai uma palavra de dentro de um texto.],
  [`cls`], [Limpa a tela do console.],
  [`console.save`], [Salva o conteúdo do console.],
)

