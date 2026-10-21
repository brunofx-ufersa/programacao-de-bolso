#import "modelo-aula.typ": *

#show: aula.with(
  numero: 0,
  titulo: "Ambiente",
  subtitulo: "Instalação e configuração.",
  recurso: "",
  conceitos: ("instalação", "configuração", "exemplos"),
  autor: "Projeto de Ensino em Programação",
  data: "Novembro de 2026",
)

#nesta-aula(
  [Instalar o RFO BASIC e configurar.],
  [Rodar um programa no próprio celular.],
)


Este curso foi pensado para alunos de qualquer nível em programação e para execução inteiramente em um dispositivo Android. A organização parte de missões e projetos, não de uma sequência abstrata de comandos. Cada módulo propõe desafios, exemplos mínimos e extensões.

// O curso também serve para aqueles que desejam criar protótipos de aplicativos móveis sem a necessidade de recorrerem a um computador. Além de estudarem programação, vocês terão a oportunidade de criar rapidamente utilitários com acesso direto aos recursos do aparelho, como GPS, câmera, acelerômetro, Bluetooth, síntese/reconhecimento de voz e áudio.

= Princípios pedagógicos

- Primeiro o estudante vê o programa funcionando; depois nomeia os conceitos.
- Alterar valores, mensagens, limites, cores e regras é parte central de cada atividade.
- Antes de rodar, prever a saída; depois explicar a diferença entre previsão e resultado.
- Cada atividade cabe em uma sessão curta e gera algo demonstrável.
- Digitar, salvar, executar e depurar no próprio telefone.

= Preparando o ambiente

Neste curso iremos usar o interpretador hBasic por ser mais atual. Este aplicatio não se encontra na Play Store, logo devemos realizar a instalação manual. Siga os passos:

+ Permita a instalação de fontes desconhecidas no seu celular ou tablet.
+ Baixe o arquivo #link("https://humpity.github.io/promotes/rfo-basic/hbasic/repository/apks/hbasic.v5.68.apk")[hbasic.v5.68.apk].
+ Abra o seu gerenciador de arquivos ou vá na pasta de Downloads.
+ Toque sobre o arquivo `hbasic.v5.68.apk` e instale.
+ Abra o aplicativo. Você verá o editor, onde o código é digitado.


= Acessando o menu

No canto superior direito deve haver o menu (três pontinhos). As principaus opções são:


#table(
  columns: (3.2cm, 1fr),
  [Opção], [O que faz],
  [*Run*], [Roda, executa o programa atual.],
  [*Load*], [Carrega um programa (arquivo `.bas`).],
  [*Load and Run*], [Carrega um programa e roda imediatemente.],
  [*Save*], [Salva o programa atual.],
  [*Save and Run*], [Salva o programa atual e roda imediatemente.],
  [*Clear*], [Limpa a tela para inciar um programa do zero.],
  [*Search*], [Busca por palavras no programa.],
  [*Format*], [Formata o texto do programa que está no editor.],
  [*Delete*], [Apaga arquivos e diretórios.],
  )

Para ter acesso rápido a algumas opções, vá até a opção *Preferences->Menu Items on Action Bar* e selecione as opções (até duas) que você utilizará mais, por exemplo *LOAD* ou *SAVE* e *RUN*.


#dica[
  A opção *Start FTP server*, permite iniciar um servidor FTP onde você poderá transferir arquivos do computador para o celular e vice-versa. As configurações de acesso ficam em *Preferences->FTP Server settings*.  
]


= Exemplos

A pasta `.../rfo-basic/source/Sample_Programs` contém alguns exemplos de programas. Para acessar eles você pode selecionar a opção *Load* e tocar em `Sample_Programs`. Selecione um dos exemplos listados para ser carregado no editor.

Não se preocupe com os códigos agora, apenas aprecie as capacidades que o Basic proporciona. Neste momento você pode testar alguns exemplos com a opção *Load and Run*, como atalho. Caso precise, use a tecla voltar do seu aparelho para sair do programa e voltar ao editor de código.


= Capacidades

Como você deve ter notado nos exemplos de programas, é possível acessar recursos do celular tais como:


// 1. Função que cria a nuvem de palavras fluida (inline)
#let nuvem(palavras) = {
  align(center)[
    #for (texto-palavra, tamanho, cor) in palavras [
      #box(inset: (x: 4pt, y: 2pt))[
        #text(size: tamanho, fill: cor, weight: if tamanho >= 18pt { "bold" } else { "regular" })[#texto-palavra]
      ]
    ]
  ]
}


#nuvem((
  ("GPS", 26pt, rgb("#1e88e5")),
  ("Acelerômetro", 16pt, rgb("#d81b60")),
  ("Câmera", 22pt, rgb("#8e24aa")),
  ("Áudio", 12pt, rgb("#43a047")),
  ("Bluetooth", 18pt, rgb("#f57c00")),
  ("Bússola", 14pt, rgb("#00acc1")),
  ("Notificação", 10pt, rgb("#e53935")),
  ("Vibração", 15pt, rgb("#3949ab")),
  ("Touch", 9pt, rgb("#757575")),
))


Além disso, podemos tabalhar com banco de dados, realizar ligações, desenhar na tela, criar animações e até jogos. Dessa forma, transformamos nosso celular em um laboratório de programação interativo, com recursos que podem ser aplicados na solução de vários problemas.

= Guia

Para acompanhar os exemplos e exercícios do curso diretamente no seu dispositivo Android, siga o passo a passo abaixo para transferir os arquivos do GitHub para a pasta correta do hBasic.

Pré-requisitos

1. O hBasic instalado no celular.
2. O aplicativo _Files_ (Arquivos) instalado via Google Play.



#proxima[
  *Aula 1: O celular que fala.* Vamos fazer o celular falar e ensiná-lo a tomar decisões baseadas em certas condições.
]

#import "info-curso.typ": info
 #import "contracapa.typ": contracapa
 #contracapa(..info)
