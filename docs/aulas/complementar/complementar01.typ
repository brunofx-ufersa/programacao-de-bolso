#import "modelo-complementar.typ": *

#show: aula.with(
  numero: 1,
  titulo: "Entrada de Dados",
  subtitulo: "Entrada do usuário e interação.",
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Declarar mais de uma instrução por linha.],
  [Quebrar uma linha de instrução grande em partes menores.],
  [Trabalhar com entrada de dados pelo usuário.],
  [Exibir mensagens via caixas e _popups_.],
)

= Múltiplas instruções por linha

Podemos escrever mais de uma instrução por linha usando os dois pontos (`:`) como separador. Por exemplo,

```
nome$ = "Zeus" : altura = 1.86 : peso: 92 
```

Isso evita ter mais barra de rolagem para ler/estudar/modifcar o código. 

= Continuação de linha

As vezes, uma instrução é grande demais para colocar em uma linha. Principalmente, considerando a tela do celular que é limitada. Uma linha muito extensa torna a leitura e modificação do código comprometidas.


A solução é usar o caracter de continuação `~`. Exemplo de continuação de linha:

```
curso$ = "RFO Basic"
sentimento$ = "animado"
s$ = "Estou fazendo o curso de " + curso$ + " bastante " + sentimento$$ 
```

Pode ser escrito assim:
```
curso$ = "RFO Basic"
sentimento$ = "animado"
s$ = "Estou fazendo o curso de " +~
      curso$ +~       
      bastante " +~
      sentimento$ +~       

```

A seguir, vamos mostrar algo mais prático.

= Caixa de entrada

Sintaxe:

#table(
  columns: (2.5cm, 1fr, 1fr, 1fr, 1fr),
  [Comando], [1º argumento], [2º argumento], [3º argumento ], [4º argumento ],
  [`input`], [texto/pergunta], [variável], [valor padrão], [variável]
)

O segundo argumento é obrigatório.

#figure(caption: [Caixa de entrada])[
  #codly.new(
```basic
input "Digite sua nacionalidade", nacionalidade$, "Brasil"
input "Digite sua altura (metros)", altura

print "Nascimento: " + nacionalidade$
print "Altura: " + str$(altura) + " metros" 

end
```,
    file: "input.bas",
  )
]<codigo-input>

O `input` da linha 1 irá abrir uma caixa de entrada com o valor "Brasil" já digitado, pois escolhemos esse valor como padrão (_default_). Como estamos esperando receber texto, a variável termina com `$` (`nacionalidade$`).

O `input` da linha 2 irá abrir uma caixa de entrada vazia, pois não escolhemos um valor _default_. A variável `altura` irá receber o valor digitado pelo usuário. 

Exemplo de saída:
#tela[
 Nascimento: Brasil\
 Altura: 1.78 metros 

]

Outros exemplos:

1. *Completo*
```
input "Digite sua nacionalidade", nacionalidade$, "Brasil", cancelar
```

A variável `cancelar` receberá `1` se a caixa de diálogo for cancelada e `0` caso contrário.

2. *Sem valor default*
```
input "Digite sua nacionalidade", nacionalidade$, , cancelar
```

2. *Sem mensagem, default e variável de cancelamento*
```
input , altura
```

= Caixa de diálogo

Sintaxe:

#table(
  columns: (3.5cm, 3cm, 3.2cm, 3.2cm,1fr),
  [Comando], [1º argumento], [2º argumento], [3º argumento],[4º-6º argumento],
  [`dialog.message`], [título], [texto/pergunta], [variável], [textos dos botões]
)


#figure(caption: [Caixa de diálogo])[
  #codly.new(
```basic
dialog.message "Game Over", "Gostaria de continuar?", go, "SIM", "NÃO"

if go = 0 
   print "Não vamos continuar..."
else
   print "Vamos continuar..."
endif

end
```,
    file: "dialog.bas",
  )
]<codigo-dialog>

A variável `go` receberá o valor `0` se a opção `NÃO` for selecionada e `1` caso o `SIM`.


Outros exemplos:

1. *Completo*
```
dialog.message "Ei!", "Como você está?", ok, "Bem", "Levando", "Mal"
```

2. *Sem mensagem*
```
dialog.message "Game Over", , go, "SIM", "NÃO"
```

3. *Sem título*
```
dialog.message  ,"Continuar?", go, "SIM", "NÃO"
```

3. *Sem botões*
```
dialog.message  "Game Over", "Continuar?", go
```

Neste último caso, apenas uma caixa de mensagem será mostrada e o usuário precisa clicar no botão voltar do aparelho para poder sair.


= Caixa de diálogo com seleção

Sintaxe:

#table(
  columns: (3.5cm, 3cm, 3.8cm, 1fr),
  [Comando], [1º argumento], [2º argumento], [3º argumento],
  [`dialog.select`], [variável], [vetor de opções], [texto/pergunta]
)

O terceiro argumento é opcional.

#figure(caption: [Caixa de diálogo com seleção])[
  #codly.new(
```basic
DIM dias$[7]
dias$[1] = "Domingo" : dias$[2] = "Segunda"  
dias$[3] = "Terça"   : dias$[4] = "Quarta"  
dias$[5] = "Quinta"  : dias$[6] = "Sexta"  
dias$[7] = "Sábado"  

dialog.select dia, dias$[], "Selecione um dia da semana"

print "Você escolheu o dia: " + dias$[dia]

end
```,
    file: "dialog-message.bas",
  )
]<codigo-dialog-message>

A variável `dia` receberá o índice do vetor da opção selecionada.

Exemplo de saída:
#tela[
 Você escolheu o dia: Terça
]

= Popup

Sintaxe:

#table(
  columns: (3.5cm, 3cm, 4cm, 1fr),
  [Comando], [1º argumento], [2º-3º argumentos], [4º argumento],
  [`popup`], [texto], [coordemadas], [_flag_ de duração]
)

O exemplo a seguir mostrará uma mensagem no centro da tela por dois segundos.

#figure(caption: [Caixa de popup])[
  #codly.new(
```basic
popup "Eu quero merendar"
end
```,
    file: "popup.bas",
  )
]<codigo-popup>

Outros exemplos:

1. *Popup de 4 segundos*
```basic
popup "Eu quero merendar", , , 1
```

= Resumo

#table(
  columns: (4cm, 1fr),
  [Comando], [Para que serve],
  [`input`], [Pergunta e guarda a resposta em uma variável.],
  [`dialog.message`], [Cria uma caixa de mensagem],
  [`dialog.select`], [Cria uma caixa de seleção],
  [`popup`], [Mostra uma pequena mensagem com limite de duração.],
)

