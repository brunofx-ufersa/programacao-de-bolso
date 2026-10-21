// ============================================================
//  Contracapa (créditos, instituição, versão)
//
//  Uso, no FIM de qualquer aula:
//    #import "info-curso.typ": info
//    #import "contracapa.typ": contracapa
//    #contracapa(..info)
//
//  Os dados ficam todos em info-curso.typ.
//  Campos vazios ("") simplesmente não aparecem.
// ============================================================

#import "modelo-aula.typ": *

// Bloco com rótulo pequeno em azul e conteúdo em branco
#let bloco(titulo, body) = block(breakable: false)[
  #text(fill: azul-medio, weight: "bold", size: 8pt, tracking: 1.5pt)[#upper(titulo)]
  #v(4pt)
  #set text(size: 10.5pt, fill: white)
  #body
]

#let contracapa(
  curso: "Programação de Bolso",
  subtitulo: "",
  autor: "",
  instituicao: "",
  departamento: "",
  colaboradores: (),   // lista de ("Nome", "Papel") ou apenas "Nome"
  agradecimentos: "",
  licenca: "",
  contato: "",
  versao: "",
  data: "",
  logo: none,          // ex.: image("logo.png", height: 36pt)
) = {
  // ----- monta os blocos que existirem -----
  let itens = ()

  if autor != "" {
    itens.push(bloco("Autoria")[#autor])
  }

  if instituicao != "" or departamento != "" {
    itens.push(bloco("Instituição")[
      #instituicao
      #if departamento != "" [ \ #text(fill: azul-claro, size: 9.5pt)[#departamento]]
    ])
  }

  let cols = ()
  for c in colaboradores {
    if type(c) == str {
      cols.push(text(weight: "bold")[#c])
    } else {
      cols.push([
        #text(weight: "bold")[#c.at(0)] \
        #text(fill: azul-claro, size: 9pt)[#c.at(1)]
      ])
    }
  }
  if cols.len() > 0 {
    itens.push(grid.cell(colspan: 2, bloco("Colaboradores",
      grid(columns: (1fr, 1fr), column-gutter: 20pt, row-gutter: 10pt, ..cols))))
  }

  if agradecimentos != "" {
    itens.push(grid.cell(colspan: 2, bloco("Agradecimentos")[
      #text(size: 10pt, fill: azul-claro)[#agradecimentos]
    ]))
  }

  if licenca != "" {
    itens.push(bloco("Licença")[#text(size: 10pt)[#licenca]])
  }
  if contato != "" {
    itens.push(bloco("Contato")[#text(size: 10pt)[#contato]])
  }

  // ----- página -----
  page(
    margin: (x: 50pt, top: 60pt, bottom: 55pt),
    fill: azul-escuro, header: none, footer: none,
    background: {
      place(top + right, dx: 90pt, dy: -90pt,
        circle(radius: 180pt, fill: azul.transparentize(55%)))
      place(bottom + left, dx: -100pt, dy: 100pt,
        circle(radius: 160pt, fill: azul.transparentize(60%)))
    },
  )[
    #set text(font: fonte-texto, fill: white, size: 10pt, lang: "pt", region: "br")
    #set par(justify: false, leading: 0.6em)

    // topo: logotipo da instituição e selo
    #grid(columns: (1fr, auto), align: horizon,
      if logo != none { logo } else { [] },
      box(fill: laranja, radius: 3pt, inset: (x: 7pt, y: 4pt),
        text(weight: "bold", size: 8pt, tracking: 1pt)[RFO BASIC]))

    #v(1.2cm)

    // título do curso
    #text(fill: azul-medio, weight: "bold", size: 10pt, tracking: 2.5pt)[SOBRE ESTE MATERIAL]
    #v(6pt)
    #text(size: 30pt, weight: "bold")[#curso]
    #v(8pt)
    #rect(width: 60pt, height: 5pt, radius: 3pt, fill: laranja)
    #if subtitulo != "" [
      #v(8pt)
      #text(fill: azul-claro, size: 12.5pt)[#subtitulo]
    ]

    #v(1fr)

    // créditos
    #grid(columns: (1fr, 1fr), column-gutter: 26pt, row-gutter: 22pt, ..itens)

    #v(1.4cm)

    // rodapé: versão, data, ferramenta
    #line(length: 100%, stroke: 0.6pt + azul.lighten(30%))
    #v(2pt)
    #grid(columns: (auto, 1fr, auto), column-gutter: 12pt, align: horizon,
      if versao != "" {
        box(fill: azul, radius: 4pt, inset: (x: 9pt, y: 5pt),
          text(weight: "bold", size: 9pt)[Versão #versao])
      } else { [] },
      text(size: 9pt, fill: azul-claro)[#data],
      text(size: 8.5pt, fill: azul-medio)[Composto com Typst])
  ]
}
