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

Não se preocupe com os códigos agora, apenas aprecie as capacidades que o hBASIC proporciona. Neste momento você pode testar alguns exemplos com a opção *Load and Run*, como atalho. Caso precise, use a tecla voltar do seu aparelho para sair do programa e retornar ao editor de código.


= Capacidades

Como você deve ter notado nos exemplos de programas, é possível acessar recursos do celular tais como:


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

Para acompanhar os exemplos e exercícios diretamente no seu dispositivo Android, você vai transferir os arquivos do GitHub para a pasta correta do hBASIC. São quatro etapas:

#v(4pt)
#fluxo(
  ("Baixar", "pacote no GitHub"),
  ("Descompactar", "o arquivo .zip"),
  ("Enviar", "para a pasta do hBASIC"),
  ("Executar", "no aplicativo"),
)
#v(6pt)

#caixa("Antes de começar", azul, azul-claro)[
  Você vai precisar de:
  - um *computador* com acesso a _internet_ 
  - Um cabo USB *ou* a mesma rede Wi-Fi no computador e no celular.
]

Também é possível acompanhar o curso digitando diretamente no celular todos os exemplos.

// ------------------------------------------------------------
== Baixar o pacote de códigos

#acoes(
  [Acesse o repositório do curso: #lnk("https://github.com/brunofx-ufersa/programacao-de-bolso")[github.com/brunofx-ufersa/programacao-de-bolso].],
  [No menu do repositório, toque na aba *Actions*.],
  [Nas execuções (_Workflows_), toque na *mais recente* que tenha o ícone de confirmação.],
  [Role a página até o final, até a seção *Artifacts* (Artefatos).],
  [Toque em `curso-ufersa.zip` para baixar o arquivo compactado com os códigos.],
)

#dica[
  Execuções com ícone *vermelho* falharam e não têm o pacote completo. Se a mais
  recente estiver vermelha, use a verde anterior.
]

// ------------------------------------------------------------
== Descompactar os arquivos

#acoes(
  [Navegue até a pasta onde foi feito o _download_ (normalmente *Downloads*).],
  [Localize o arquivo baixado e *descompacte-o*.],
  [Uma pasta será criada, com uma divisão por aula e, dentro dela, os arquivos `.bas`.],
)

/* 
#arvore(
  "curso-ufersa/",
  "├── aula01/",
  "│   ├── ... .bas",
  "│   └── ... .bas",
  "├── aula02/",
  "│   └── ... .bas",
  "└── ...",
)
*/

// ------------------------------------------------------------
== Enviar para a pasta do hBASIC

#atencao[
  O Android restringe o acesso às pastas do sistema (`Android/data`), e o hBASIC
  guarda seus programas lá. Por isso, a forma mais confiável de enviar os
  arquivos é *pelo computador*. Escolha um dos dois caminhos:
]

#grid(columns: (1fr, 1fr), column-gutter: 12pt,
  opcao("Opção A: cabo USB", "recomendada", azul)[
    Precisa de cabo USB e computador.

    É o mais rápido e não depende de rede nem de programas
    extras.
  ],
  opcao("Opção B: FTP via Wi-Fi", "alternativa", verde)[
    Precisa de computador na mesma rede Wi-Fi e o programa FileZilla.

    Não precisa de cabo.
  ],
)

// ---- Opção A ----
=== Opção A: cabo USB (MTP)

#etiqueta("No celular", azul)

#acoes(
  [Conecte o celular ao computador com o cabo USB.],
  [Permita a transferência de arquivos:
    #list(
      [puxe a barra de notificações no topo da tela;],
      [toque na opção referente ao *USB*;],
      [altere o modo de conexão para *Transferência de arquivos* (ou *MTP*).],
    )
  ],
)

#etiqueta("No computador", rgb("#475569"))

#acoes(
  [Abra a memória interna do celular.],
  [Navegue até a pasta do hBASIC: `Android/data/com.rfo.hbasic/rfo-basic/source`.],
  [Arraste a pasta `curso-ufersa` descompactada para *dentro* da pasta `source`.],
)

#atencao[
  A pasta `curso-ufersa` deve ficar *dentro* de `source`, e não ao lado dela.
  É dali que o hBASIC lista os seus programas.
]

// ---- Opção B ----
=== Opção B: FTP via Wi-Fi

Sem cabo USB? O hBASIC tem um servidor FTP embutido. O celular fica "visível"
na rede e o computador envia os arquivos por ele.

#etiqueta("Preparação", rgb("#475569"))

#acoes(
  [Conecte o computador e o celular à *mesma rede Wi-Fi*.],
  [Instale o *FileZilla Client* no computador: #lnk("https://filezilla-project.org/")[filezilla-project.org].],
)

#etiqueta("No celular (hBASIC)", azul)

#acoes(
  [Abra o menu de opções e selecione *Start FTP server*.],
  [Uma mensagem mostrará os dados de conexão. Os *quatro primeiros números*, separados por ponto, são o *endereço IP*. O número depois dos dois-pontos é a *porta*.],
  [Anote o IP e a porta e toque em *OK*.],
)

#tela[
  192.168.0.15:2121 \
  \
  #text(size: 8pt, fill: cinza)[Exemplo: IP = 192.168.0.15, porta = 2121.]
]

#etiqueta("No computador (FileZilla)", rgb("#475569"))

Abra o FileZilla. Na barra superior de *Conexão Rápida*, preencha:


#table(
  columns: (4cm, 1fr),
  [Campo], [O que digitar],
  [Host], [O *IP* anotado no celular],
  [Nome de usuário], [`hbasic`],
  [Senha], [`hbasic`],
  [Porta], [O número da *porta* anotada no celular],
)

#acoes(
  [Clique em *Conexão Rápida*.],
  [No painel da *esquerda*, vá até a pasta onde você descompactou o curso.],
  [No painel da *direita*, vá até `rfo-basic/source`.],
  [Arraste a pasta `curso-ufersa` do lado esquerdo para dentro de `source`, no lado direito.],
)

#dica[
  Se o FileZilla avisar que a conexão *não é criptografada*, clique em *OK* para
  continuar. A conexão é só entre o seu computador e o seu celular, dentro da
  mesma rede.
]

// ------------------------------------------------------------
== Abrir e executar

#acoes(
  [Abra o aplicativo *hBASIC*.],
  [No menu principal, escolha *Load* (Carregar).],
  [Selecione o arquivo da aula desejada, por exemplo `curso-ufersa/aula01.bas`.],
  [Toque em *Run* no menu para rodar o código.],
)

#caixa("Pronto!", verde, rgb("#E4F5EE"))[
  A partir de agora, cada aula tem seu arquivo na pasta `curso-ufersa`.
  Carregue, rode, *quebre* o código e crie as suas variações.
]

/*
== Algo não funcionou?

#table(
  columns: (4.4cm, 1fr),
  [Problema], [O que conferir],
  [O celular não aparece no computador],
  [O modo USB está em *Transferência de arquivos (MTP)*? A tela do celular está desbloqueada?],
  [A pasta não aparece no *Load*],
  [A pasta `curso-ufersa` está *dentro* de `source`, e não ao lado dela?],
  [O FileZilla não conecta],
  [Celular e computador estão na *mesma rede*? O *servidor FTP* continua ligado no hBASIC? IP e porta foram digitados exatamente como no celular?],
  [Não encontro o `.zip` no GitHub],
  [Você está na execução *mais recente com ícone verde*, na aba *Actions*, e rolou até o final da página?],
)
*/

= Estrutura do curso

Com o ambiente configurado e os arquivos organizados, confira o que será abordado no decorrer do curso.

#table(
  columns: (3.2cm, 1fr),
  [Etapa], [Conceitos e Recursos],
  [Aula 00], [Instalação e configuração do ambiente],
  [Aula 01], [Entrada de dados, exibição na tela, tomada de decisão e síntese de voz],
  [Aula 02], [Expressões, números aleatórios, formatação de texto e caixa de diálogo],
  [Aula 03], [Laço `for`, acumulador e quiz da tabuada],
  [Aula 04], [Laço `while`, sentinela, laços aninhados e quiz da tabuada turbinado],
  [Aula 05], [Laço `do`, açúcar sintático, acelerômetro e variável de estado],
  [Aula 06], [Tela gráfica, formas geométricas, coordenadas, animação e colisão],
  [Aula 07], [Funções, parâmetros, escopo, retorno e `include`],
)


#proxima[
  *Aula 1: O celular que fala.* Vamos fazer o celular falar e ensiná-lo a tomar decisões baseadas em certas condições.
]

#import "info-curso.typ": info
 #import "contracapa.typ": contracapa
 #contracapa(..info)
