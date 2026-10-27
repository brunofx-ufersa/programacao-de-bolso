#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 3,
  titulo: "Estruturas de dados",
  subtitulo: "Introdução ao array.",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Definir _arrays_.],
  [Aplicar operações sobre _arrays_.],
  [Manipular _arrays_.],
)


No *Material Complementar 00*, você estudou ligeiramente que a linguagem possui quatro estruturas de dados básicas: arrays, listas, pacotes (_bundle_) e pilhas.

 
É hora de apronfundar nossos conhecimentos sobre esas estruturas. 
Elas são importantes para gerenciar os dados e otimizar nosso código. Primeiramente, vamos abordar os vetores.

= Arrays

Sobre _arrays_, é frequente ouvirmos falar de vetor como sinônimo. 


== Declaração

Para criar um _array_ usamos a palavra-chave `dim` seguida do nome da variável mais os colhetes com a quantidade de elementos que ele armazenará.

```
dim altura[5]
dim peso[5]
```

Também podemos declarar mais de um _array_ usando somente um `dim`:

```
dim disciplina$[3], nota[3]
```

No exemplo acima, criamos dois _arrays_: um de _strings_ e o outro numérico. Eles são automaticamente preechidos com `""` e `0`, respectivamente.


Depois de declarados podemos preenche-los:

```
disciplina$[1] = "Matemática"
disciplina$[2] = "Inglês"
disciplina$[3] = "Português"

nota[1] = 8.5
nota[2] = 6
nota[3] = 7
```


É importante destacar que essa estrutura pode ter mais de uma dimensão. Dessa forma, podemos criar matrizes, por exemplo.

```
dim semestre[3, 3]
```

No _array_ `semestre` podemos armazenar as notas de três avaliações de três disciplinas. Cada linha pode representar uma disciplina e cada coluna um avaliação.




== Acesso


Para acessar um elemento de um _array_ basta escrever seu nome com colchetes e a posição do item. Note que o índice 1 é referente ao primeiro elemento.

```
for i = 1 to 3
  print disciplina$[i]; ": "; nota[i] 
next i
```

Para um array com mais de uma dimensão o raciocínio é o mesmo:
#align(center)[`semestre[1, 1]`, `semestre[2, 2]` e `semestre[3, 3]` formam a diagonal principal]

Vamos preencher esse array para usarmos nos próximos exemplos:
```
! Matemática
semestre[1,1] = 8.5 : semestre[1,2] = 7 : semestre[1,3] = 5.5
! Inglês
semestre[2,1] = 6 : semestre[2,2] = 7.5 : semestre[2,3] = 8
! Português
semestre[3,1] = 7 : semestre[3,2] = 7 : semestre[3,3] = 9.5
```


== Medidas

O hBasic já oferece algumas facilidades quando se trata de _arrays_, principalmente os numéricos. 

=== Soma

Calcular a soma dos valores de um _array_ ou de um subconjunto.

```
array.sum soma_mat, semestre[1,3]
print "Soma: "; soma_mat
```

Esse exemplo calcula a soma das notas de matemática. 
Aqui, temos de ser cautelosos. Sabemos que `semestre[1,3]` acessa o 
elemento da primeira linha e terceira coluna, que no nosso caso é o `5.5`. 
No entanto, esse valores que usamos no cálculo da soma não são índices do 
_array_, eles são o par _start_ e _length_, isto é, posição no _array_ e tamanho. 
Logo, estamos dizendo, que a partir do elemento na posição 1 some 3 elementos.

#atencao[
  Quando passamos um _array_ com os valores _start_ e _length_ para um comando,
  estamos passando um segmento e não um elemento específico.
]

Você pode pensar: fácil, para calcular a soma das notas de inglês farei 

```
array.sum soma, semestre[2,3]
print "Soma: "; soma
```

e obterá `18.5`. O resultado deveria ser $6+7.5+8=21.5$. A razão é que cada valor é representado por um índice, então no nosso _array_ (3x3) deve haver 9 posições. O elemento `semestre[2,1]` corresponde à posição 4.

```
array.sum soma_ing, semestre[4,3]
print "Soma: "; soma_ing
```

Ou seja, some três valores a partir do quarto elemento.

Com a seguinte ilustração tudo ficará mais claro, tenha ela em mente.

#figure(
  cetz.canvas({
    import cetz.draw: *

    // --- RÓTULOS DAS COLUNAS (TOPO) ---
    content((0.8, 4.0), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Coluna 1])
    content((2.6, 4.0), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Coluna 2])
    content((4.4, 4.0), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Coluna 3])

    // --- RÓTULOS DAS LINHAS (ESQUERDA) ---
    content((-1.2, 2.95), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linha 1])
    content((-1.2, 1.75), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linha 2])
    content((-1.2, 0.55), text(size: 8.5pt, weight: "bold", fill: rgb("#1565C0"))[Linha 3])

    // --- COLCHETE ESQUERDO DA MATRIZ ---
    line((-0.2, 3.65), (-0.5, 3.65), (-0.5, -0.15), (-0.2, -0.15), stroke: 1.5pt + rgb("#1565C0"))

    // --- CÉLULAS DA MATRIZ (LINHA 1) ---
    rect((0.0, 2.4), (1.6, 3.5), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0.8, 3.15), text(size: 7.5pt, weight: "bold", fill: luma(100))[(1,1)])
    content((0.8, 2.70), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[1])

    rect((1.8, 2.4), (3.4, 3.5), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((2.6, 3.15), text(size: 7.5pt, weight: "bold", fill: luma(100))[(1,2)])
    content((2.6, 2.70), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[2])

    rect((3.6, 2.4), (5.2, 3.5), fill: rgb("#E3F2FD"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((4.4, 3.15), text(size: 7.5pt, weight: "bold", fill: luma(100))[(1,3)])
    content((4.4, 2.70), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[3])

    // --- CÉLULAS DA MATRIZ (LINHA 2) ---
    rect((0.0, 1.2), (1.6, 2.3), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0.8, 1.95), text(size: 7.5pt, weight: "bold", fill: luma(100))[(2,1)])
    content((0.8, 1.50), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[4])

    rect((1.8, 1.2), (3.4, 2.3), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((2.6, 1.95), text(size: 7.5pt, weight: "bold", fill: luma(100))[(2,2)])
    content((2.6, 1.50), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[5])

    rect((3.6, 1.2), (5.2, 2.3), fill: rgb("#BBDEFB"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((4.4, 1.95), text(size: 7.5pt, weight: "bold", fill: luma(100))[(2,3)])
    content((4.4, 1.50), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[6])

    // --- CÉLULAS DA MATRIZ (LINHA 3) ---
    rect((0.0, 0.0), (1.6, 1.1), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((0.8, 0.75), text(size: 7.5pt, weight: "bold", fill: luma(100))[(3,1)])
    content((0.8, 0.30), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[7])

    rect((1.8, 0.0), (3.4, 1.1), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((2.6, 0.75), text(size: 7.5pt, weight: "bold", fill: luma(100))[(3,2)])
    content((2.6, 0.30), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[8])

    rect((3.6, 0.0), (5.2, 1.1), fill: rgb("#90CAF9"), stroke: 1pt + rgb("#1565C0"), radius: 0.08)
    content((4.4, 0.75), text(size: 7.5pt, weight: "bold", fill: luma(100))[(3,3)])
    content((4.4, 0.30), text(size: 12pt, weight: "bold", fill: rgb("#1565C0"))[9])

    // --- COLCHETE DIREITO DA MATRIZ ---
    line((5.4, 3.65), (5.7, 3.65), (5.7, -0.15), (5.4, -0.15), stroke: 1.5pt + rgb("#1565C0"))

   }),
  caption: [Representação visual de uma matriz $3 times 3$ bidimensional.]
) <figura-matriz-3x3-cetz>



Se nenhum dos valores for designado, será feita a soma de todos os elementos do _array_. 

```
array.sum total, semestre[]
print "Total: "; total
```


Esse raciocínio servirá para outros exemplos.

=== Média

Calcular a média dos valores de um _array_ ou de um subconjunto.

```
array.average media_mat, semestre[1,3]
print "Matemática (Média): "; media_mat

array.average media_ing, semestre[4,3]
print "Inglês (Média): "; media_ing

array.average media_por, semestre[7,3]
print "Português (Média): "; media_por
```
Segue o mesmo raciocínio de antes com _start_ e _length_.

=== Máximo e mínimo 

Determinar os valores máximo e mínimo média de um _array_ ou de um subconjunto.

```
array.max max, semestre[]
array.min min, semestre[]
print "Maior nota: "; max
print "Menor nota: "; minr
```

Da mesma forma de antes:

```
array.max max_mat, semestre[1,3]
array.min min_mat, semestre[1,3]
print "Maior nota em matemática: "; max_mat
print "Menor nota em matemática: "; min_mat
```

=== Outras medidas

Também podemos calcular a variância e desvio padrão com `array.variance` e `array.std_dev`, respectivamente. A sintaxe é a mesma até aqui.


== Operações


=== Carregar ao criar

Podemos inserir os elementos de um _array_ unidimensional no momento da criação.

```
array.load nota[], 9, 7.5, 5.7
```

Neste caso, não precisamos especificar a dimensão. O tamanho do array será a quantidade
de itens da lista disponibilizada como argumento. 

=== Número de elementos

O comando `array.length` determina a quantidade de elementos de um _array_. 

```
array.length len_semestre, semestre[]
print "Quantidade de elementos: "; len_semestre
```

A variável `len_semestre` receberá a quantidade de elementos do _array_
`semestre[]`.

=== Busca

Para buscar um elemento, use o comando `array.search`.

```
array.search disciplina$[], "História", exists_his
array.search disciplina$[], "Inglês", exists_ing

if exists_his 
  print "História é História"
else
  print "História é Estória"
endif
```

Se o valor for encontrado, a variável numérica guardará sua posição.
Caso contrário, receberá `0`.


=== Apagar

Para apagar e liberar memória alocada para um _array_ podemos usar 
o comando `undim` ou `array.delete`:


```
array.delete nota[], disciplina[]
undim semestre[]
```

=== Outras operações

Essa estrutura também possui comandos para:

#table(
  columns: (4cm, 1fr),
  [Comando], [Para que serve],
  [`array.reverse`], [Inverter a ordem dos elementos],
  [`array.sort`], [Ordena os elementos],
  [`array.shuffle`], [Bagunça a ordem aleatóriamente],
  [`array.fill`], [Preenche um array com um valor específico],

)



= Resumo

#table(
  columns: (4cm, 1fr, 3.7cm),
  [Comando], [Para que serve], [Tipo],
  [`array.sum`], [Calcula a soma],[Numérico],
  [`array.average`], [Calcula a média aritmética],[Numérico],
  [`array.max`], [Determina o maior valor],[Numérico],
  [`array.min`], [Determina o menor valor],[Numérico],
  [`array.std_dev`], [Calcula o desvio padrão],[Numérico],
  [`array.variance`], [Calcula a variância],[Numérico],
  [`array.length`], [Determina o número de elementos],[Numérico/String],
  [`array.search`], [Busca a posição de elemento],[Numérico/String],
  [`array.reverse`], [Inverter a ordem dos elementos],[Numérico/String],
  [`array.sort`], [Ordena os elementos],[Numérico/String],
  [`array.shuffle`], [Bagunça a ordem aleatóriamente],[Numérico/String],
  [`array.fill`], [Preenche um array com um valor específico],[Numérico/String],
)

Todas essas operações podem ser realizadas em segmentos de _array_.

