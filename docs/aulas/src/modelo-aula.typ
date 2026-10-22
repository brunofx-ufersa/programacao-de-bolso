// ============================================================
//  PROGRAMAÇÃO DE BOLSO · RFO Basic
//  Modelo de aula (tema azul, uma capa por aula)
//
//  Uso, no começo de cada aula:
//    #import "modelo-aula.typ": *
//    #show: aula.with(numero: 2, titulo: "...", ...)
// ============================================================

// ---------- Paleta ----------
#let azul-escuro = rgb("#0B2A5B")
#let azul        = rgb("#1565C0")
#let azul-medio  = rgb("#42A5F5")
#let azul-claro  = rgb("#DCEBFB")
#let azul-gelo   = rgb("#F3F8FE")
#let cinza       = rgb("#5B6678")
#let laranja     = rgb("#F59E0B")
#let verde       = rgb("#1F9D6B")
#let tinta       = rgb("#1F2937")

// ---------- Fontes (usa a primeira disponível) ----------
#let fonte-texto  = ("Inter", "Liberation Sans")
#let fonte-codigo = ("JetBrains Mono", "Fira Code", "DejaVu Sans Mono")

// ============================================================
//  COMPONENTES
// ============================================================

// Caixa genérica com barra colorida à esquerda
#let caixa(rotulo, cor, fundo, body) = block(
  width: 100%, breakable: false, above: 1.1em, below: 1.1em,
  radius: 6pt, fill: fundo,
  stroke: (left: 4pt + cor),
  inset: (x: 13pt, y: 10pt),
)[
  #text(fill: cor, weight: "bold", size: 8.5pt, tracking: 0.8pt)[#upper(rotulo)]
  #v(3pt)
  #body
]

#let dica(body)     = caixa("Dica", azul, azul-claro, body)
#let atencao(body)  = caixa("Atenção", laranja, rgb("#FFF4DB"), body)
#let conceito(titulo, body) = caixa("Conceito · " + titulo, verde, rgb("#E4F5EE"), body)

// Moldura de celular mostrando a saída do programa
#let tela(body) = align(center, box(
  width: 11cm, fill: azul-escuro, radius: 14pt, inset: 7pt,
  box(width: 100%, fill: white, radius: 9pt, inset: 11pt,
    align(left, text(font: fonte-codigo, size: 9.5pt, fill: azul-escuro, body))),
))

// Etapas do método: rodar → quebrar → criar
#let etapas = (
  salvar:   (azul-medio, "SALVAR"),
  rodar:   (azul, "RODAR"),
  quebrar: (laranja, "QUEBRAR"),
  criar:   (verde, "CRIAR"),
)

#let etapa(tipo, body) = {
  let (cor, nome) = etapas.at(tipo)
  block(width: 100%, above: 1.1em, below: 0.9em, breakable: false)[
    #grid(
      columns: (auto, 1fr), column-gutter: 10pt, align: horizon,
      box(fill: cor, radius: 3pt, inset: (x: 8pt, y: 4.5pt),
        text(fill: white, weight: "bold", size: 8.5pt, tracking: 0.8pt)[#nome]),
      body,
    )
  ]
}

// Quadro de objetivos da aula
#let nesta-aula(..itens) = block(
  width: 100%, fill: azul-gelo, stroke: 1pt + azul-claro,
  radius: 8pt, inset: 14pt, above: 1em, below: 1.3em,
)[
  #text(fill: azul, weight: "bold", size: 8.5pt, tracking: 1pt)[NESTA AULA VOCÊ VAI]
  #v(5pt)
  #for item in itens.pos() [
    #grid(columns: (16pt, 1fr), column-gutter: 4pt,
      text(fill: azul, weight: "bold")[✓], item)
    #v(2pt)
  ]
]

// Desafio final
#let desafio(titulo, body) = block(
  width: 100%, breakable: false, above: 1.2em, below: 1em,
  radius: 8pt, fill: azul-escuro, inset: 16pt,
)[
  #set text(fill: white)
  #show strong: set text(fill: azul-medio)
  #box(fill: laranja, radius: 3pt, inset: (x: 8pt, y: 4.5pt),
    text(weight: "bold", size: 8.5pt, tracking: 0.8pt)[DESAFIO])
  #h(8pt)
  #text(weight: "bold", size: 14pt)[#titulo]
  #v(7pt)
  #body
]

// Fechamento: "na próxima aula..."
#let proxima(body) = block(
  width: 100%, breakable: false, above: 1.4em,
  radius: 8pt, fill: azul-claro, inset: 14pt,
)[
  #text(fill: azul, weight: "bold", size: 8.5pt, tracking: 1pt)[NA PRÓXIMA AULA]
  #v(4pt)
  #body
]

// ============================================================
//  CAPA
// ============================================================
#let telefone(trecho) = rect(
  width: 130pt, height: 250pt, radius: 22pt,
  stroke: 3pt + white, fill: azul.transparentize(65%), inset: 12pt,
)[
  #align(center, rect(width: 38pt, height: 5pt, radius: 3pt,
    fill: white.transparentize(40%)))
  #v(16pt)
  #for linha in trecho {
    text(font: fonte-codigo, size: 8pt, fill: azul-medio)[#linha]
    linebreak()
  }
]

#let capa(numero, titulo, subtitulo, recurso, conceitos, autor, instituicao, data, trecho) = {
  
  let nn = if numero < 10 { "0" + str(numero) } else { str(numero) }
  page(margin: 0pt, fill: azul-escuro, header: none, footer: none)[
    // círculos decorativos
    #place(top + right, dx: 90pt, dy: -90pt,
      circle(radius: 180pt, fill: azul.transparentize(55%)))
    #place(top + right, dx: 30pt, dy: -30pt,
      circle(radius: 95pt, fill: azul-medio.transparentize(60%)))
    #place(bottom + left, dx: -100pt, dy: 100pt,
      circle(radius: 160pt, fill: azul.transparentize(60%)))
    #place(top + right, dx: -20pt, dy: 50pt,
         image("figuras/assinatura_completa_cor_RGB.png", width: 3cm))

    // selo da coleção
    #place(top + left, dx: 50pt, dy: 55pt)[
      #text(fill: white, weight: "bold", size: 11pt, tracking: 2.5pt)[PROGRAMAÇÃO DE BOLSO]
      #h(8pt)
      #box(fill: laranja, radius: 3pt, inset: (x: 6pt, y: 3pt),
        text(fill: white, weight: "bold", size: 8pt, tracking: 1pt)[RFO BASIC])
    ]

    // celular decorativo
    #place(right + horizon, dx: -42pt, dy: -40pt, telefone(trecho))

    // número e título
    #place(left + horizon, dx: 50pt, dy: -30pt, block(width: 52%)[
      #text(fill: azul-medio, weight: "bold", size: 12pt, tracking: 3pt)[AULA]
      #v(-8pt)
      #text(fill: azul-medio, size: 110pt, weight: "black")[#nn]
      #v(-26pt)
      #text(fill: white, size: 34pt, weight: "bold")[#titulo]
      #v(12pt)
      #rect(width: 60pt, height: 5pt, radius: 3pt, fill: laranja)
      #v(12pt)
      #text(fill: azul-claro, size: 13pt)[#subtitulo]
    ])

    // rodapé da capa
    #place(bottom + left, dx: 50pt, dy: -48pt, block(width: 85%)[
      #text(fill: azul-medio, size: 8.5pt, weight: "bold", tracking: 1.5pt)[RECURSO DO CELULAR]
      #v(-2pt)
      #text(fill: white, size: 15pt, weight: "bold")[#recurso]
      #v(9pt)
      #for c in conceitos {
        box(stroke: 1pt + azul-medio, radius: 10pt, inset: (x: 8pt, y: 4pt),
          text(fill: white, size: 9pt, c))
        h(5pt)
      }
      #v(14pt)
      #line(length: 100%, stroke: 0.6pt + azul.lighten(30%))
      #v(2pt)
      #text(fill: azul-claro, size: 9.5pt)[#autor#if instituicao != "" [ · #instituicao]#if data != none [ · #data]]
    ])
  ]
}

// ============================================================
//  FUNÇÃO PRINCIPAL DA AULA
// ============================================================
#let aula(
  numero: 1,
  titulo: "Título da aula",
  subtitulo: "",
  recurso: "",
  conceitos: (),
  autor: "",
  instituicao: "",
  data: none,
  trecho: ("> _",),
  body,
) = {
  let nn = if numero < 10 { "0" + str(numero) } else { str(numero) }

  set document(title: "Aula " + nn + " — " + titulo, author: autor)
  set text(font: fonte-texto, size: 10.5pt, lang: "pt", region: "br", fill: tinta)
  set par(justify: true, leading: 0.72em)

  // ----- capa -----
  capa(numero, titulo, subtitulo, recurso, conceitos, autor, instituicao, data, trecho)

  // ----- páginas de conteúdo -----
  set page(
    paper: "a4",
    margin: (x: 2.2cm, top: 2.7cm, bottom: 2.4cm),
    header: {
      set text(size: 8.5pt, fill: cinza)
      grid(columns: (1fr, auto),
        [*PROGRAMAÇÃO DE BOLSO* · RFO Basic],
        [Aula #nn · #titulo])
      v(-4pt)
      line(length: 100%, stroke: 0.6pt + azul-claro)
    },
    footer: context {
      set text(size: 9pt, fill: cinza)
      grid(columns: (1fr, auto), align: horizon,
        [#autor],
        box(fill: azul, radius: 50%, inset: 5.5pt,
          text(fill: white, weight: "bold", counter(page).display())))
    },
  )

  // ----- títulos -----
  set heading(numbering: "1")
  show heading.where(level: 1): it => {
    v(1.3em, weak: true)
    block(width: 100%, below: 0.9em, sticky: true)[
      #grid(columns: (auto, 1fr), column-gutter: 10pt, align: horizon,
        box(fill: azul, radius: 5pt, inset: (x: 9pt, y: 5pt),
          text(fill: white, weight: "bold", size: 12pt,
            context counter(heading).display("1"))),
        text(fill: azul-escuro, weight: "bold", size: 17pt, it.body))
      #v(-3pt)
      #line(length: 100%, stroke: 1.2pt + azul-claro)
    ]
  }
  show heading.where(level: 2): it => block(above: 1.3em, below: 0.7em, sticky: true,
    text(fill: azul, weight: "bold", size: 12.5pt, it.body))
  show heading.where(level: 3): it => block(above: 1.3em, below: 0.7em, sticky: true,
    text(fill: cinza, weight: "bold", size: 12.5pt, it.body))

  // ----- detalhes tipográficos -----
  show strong: set text(fill: azul-escuro)
  set list(marker: text(fill: azul, weight: "bold")[•], indent: 4pt, spacing: 0.7em)
  set enum(numbering: n => text(fill: azul, weight: "bold")[#n.], indent: 4pt, spacing: 0.7em)

  // ----- código -----
  show raw: set text(font: fonte-codigo, size: 9.3pt)
  show raw.where(block: false): it => box(
    fill: azul-claro, radius: 3pt, inset: (x: 3pt), outset: (y: 3pt),
    text(fill: azul-escuro, it))
  show raw.where(block: true): it => block(
    width: 100%, breakable: false, above: 1em, below: 1em,
    fill: rgb("#0F1B33"), radius: 8pt, inset: (x: 12pt, y: 11pt),
  )[
    #set text(fill: rgb("#E6EEFA"))
    #show raw.line: l => {
      set block(spacing: 2pt) 
      grid(columns: (18pt, 1fr), align: horizon,
      text(fill: rgb("#6B84AD"), size: 7.5pt, str(l.number)), l.body)}
    #it
  ]

  // ----- tabelas -----
  set table(
    stroke: 0.5pt + azul-claro, inset: 8pt,
    fill: (_, y) => if y == 0 { azul } else if calc.even(y) { azul-gelo } else { white },
  )
  show table.cell.where(y: 0): set text(fill: white, weight: "bold")
  show figure.where(kind: table): set block(breakable: false)

  body
}

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


// ============================================================
//  GUIA: levando os códigos do curso para o celular (Aula 0)
// ============================================================
// ---------- componentes locais ----------

// link azul e sublinhado
#let lnk(url, texto) = link(url, underline(text(fill: azul)[#texto]))

// cabeçalho de passo: bolinha numerada + título
#let passo(n, titulo, sub: none) = block(
  width: 100%, above: 1.8em, below: 0.9em, sticky: true,
)[
  #grid(columns: (auto, 1fr), column-gutter: 12pt, align: horizon,
    circle(radius: 15pt, fill: azul, inset: 0pt)[
      #text(fill: white, weight: "bold", size: 14pt)[#n]
    ],
    [
      #text(fill: azul-escuro, weight: "bold", size: 15pt)[#titulo]
      #if sub != none [ \ #text(fill: cinza, size: 9.5pt)[#sub]]
    ],
  )
  #v(-2pt)
  #line(length: 100%, stroke: 1pt + azul-claro)
]

// lista de ações numeradas, com bolinha clara
#let acoes(..itens) = block(width: 100%, above: 0.4em, below: 0.6em)[
  #for (i, item) in itens.pos().enumerate() [
    #grid(columns: (20pt, 1fr), column-gutter: 8pt,
      circle(radius: 8.5pt, fill: azul-claro, inset: 0pt)[
        #text(fill: azul-escuro, weight: "bold", size: 9pt)[#(i + 1)]
      ],
      item,
    )
    #v(6pt)
  ]
]

// etiqueta colorida para separar "no celular" e "no computador"
#let etiqueta(texto, cor) = block(above: 1.2em, below: 0.6em, sticky: true)[
  #box(fill: cor, radius: 3pt, inset: (x: 8pt, y: 4.5pt),
    text(fill: white, weight: "bold", size: 8pt, tracking: 1pt)[#upper(texto)])
]

// fluxo de quatro etapas no topo
#let fluxo(..etapas) = {
  let itens = ()
  for (i, e) in etapas.pos().enumerate() {
    if i > 0 {
      itens.push(align(center + horizon,
        text(fill: azul-medio, size: 18pt, weight: "bold")[›]))
    }
    itens.push(block(width: 100%, fill: azul-gelo, stroke: 1pt + azul-claro,
      radius: 8pt, inset: (x: 6pt, y: 9pt),
      align(center)[
        #text(fill: azul, weight: "bold", size: 15pt)[#(i + 1)] \
        #text(fill: azul-escuro, weight: "bold", size: 9.5pt)[#e.at(0)] \
        #text(fill: cinza, size: 8pt)[#e.at(1)]
      ]))
  }
  grid(columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr), column-gutter: 4pt,
    align: horizon, ..itens)
}

// cartão de opção (USB × FTP)
#let opcao(titulo, tag, cor, body) = block(
  width: 100%, breakable: false, radius: 8pt, stroke: 1.2pt + cor, clip: true,
)[
  #block(width: 100%, fill: cor, inset: (x: 12pt, y: 8pt))[
    #text(fill: white, weight: "bold", size: 11pt)[#titulo]
    #h(1fr)
    #text(fill: white, weight: "bold", size: 8pt, tracking: 0.8pt)[#upper(tag)]
  ]
  #block(width: 100%, inset: 12pt)[#body]
]

// árvore de pastas (sem numeração de linhas)
#let arvore(..linhas) = block(
  width: 100%, breakable: false, above: 1em, below: 1em,
  fill: rgb("#0F1B33"), radius: 8pt, inset: (x: 14pt, y: 12pt),
)[
  #for l in linhas.pos() {
    text(font: fonte-codigo, size: 9.3pt, fill: rgb("#E6EEFA"))[#l.replace(" ", "\u{00A0}")]
    linebreak()
  }
]
