#import "@preview/glossy:0.9.0": *

#let project(
  title: "",
  subtitle: "",
  author: "",
  degree: "",
  period: "",
  supervisors: (:),
  companies: (:),
  logo_hs: none,
  logo_company1: none,
  logo_company2: none,
  body,
) = {
  // --- Grundeinstellungen
  set document(author: author, title: title)

  // Seite einrichten
  set page(
    margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm),
    numbering: "1",
    number-align: center,
  )

  // Schriftart auf Sans-Serif setzen
  // Tipp: "Roboto", "Arial" oder "Linux Biolinum" eignen sich gut.
  set text(font: "Arial", lang: "de", size: 12pt)

  // Code Blöcke stylen
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: (left: 0.3cm, y: 0.4cm),
    radius: 4pt,
    width: 100%,
  )

  // --- Titelseite ---
  // Wir kapseln die Titelseite, damit sie keine Seitenzahl hat
  page(numbering: none, margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm))[

    // Logo Hochschule
    #if logo_hs != none {
      align(center, image(logo_hs, height: 2cm))
    }
    #v(0.5cm)

    #align(center)[
      #text(size: 14pt)[Fakultät Elektrotechnik, Medizintechnik und Informatik\
        an der Hochschule für Technik, Wirtschaft und Medien Offenburg]

      #v(1.5cm)

      #text(size: 17pt, weight: "bold")[Bachelor-Thesis]

      #v(1cm)

      // Linie
      #line(length: 100%, stroke: 0.5pt)
      // #v(0.5cm)

      // Titel
      #text(size: 19pt, weight: "bold")[#title]
      #v(0.1cm)
      #text(size: 14pt)[#subtitle]

      // #v(0.5cm)
      #line(length: 100%, stroke: 0.5pt)
      #v(1cm)

      Durchgeführt in Zusammenarbeit mit\
      #v(0.1cm)
      #text(size: 13pt)[#companies.c1] und #text(size: 13pt)[#companies.c2]
      #v(0.5cm)

      // Firmenlogos nebeneinander
      #grid(
        columns: (1fr, auto, 1fr),
        align: center + horizon,
        [],
        // Leerer Platz links (optional, je nach gewünschtem Layout)
        grid(
          columns: 2,
          gutter: 30pt,
          if logo_company1 != none { image(logo_company1, height: 1.2cm) },
          if logo_company2 != none { image(logo_company2, height: 1.2cm) },
        ),
        [],
      )
    ]

    #v(1fr)

    // Tabelle für Autor & Betreuer
    #align(center)[
      #set text(size: 12pt)
      #grid(
        columns: (auto, auto),
        gutter: 15pt,
        align: (left, left),
        row-gutter: 10pt,
        "Autor:", author,
        "Studiengang:", degree,
        "Bearbeitungszeitraum:", period,
        "Betreuer 1:", supervisors.company,
        "Betreuer 2:", supervisors.university,
      )
    ]

    #v(1fr)
  ]

  // Inhaltsverzeichnis
  pagebreak()

  show outline.entry.where(
    level: 1,
  ): set block(above: 1.2em)
  outline(depth: 3, indent: 2em)
  pagebreak()

  // --- Abkürzungen ---
  show: init-glossary.with(yaml("glossary.yaml"))
  let glossary-theme = (
    // Main glossary section
    section: (title, body) => {
      heading(level: 1, title)
      // v(1em)
      body
    },
    // Group of related terms
    group: (name, index, total, body) => {
      table(
        columns: (16%, 1fr),
        stroke: none,
        inset: (x, y) => {
          if (x == 0) {
            (left: 0pt, rest: 5pt)
          } else if (x == 2) {
            (right: 0pt, rest: 5pt)
          } else {
            5pt
          }
        },
        ..if name != "" {
          (
            table.header(repeat: false, table.cell(colspan: 2, text(weight: "bold", name))),
            table.hline(),
          )
        },
        ..body,
      )
    },
    entry: (entry, index, total) => {
      (
        entry.short + entry.label,
        entry.long,
        // entry.description,
        // table.cell(text(entry.pages.join(", "), size: 9pt), align: right),
      )
    },
  )

  set heading(numbering: "I.")
  glossary(
    title: "Abkürzungsverzeichnis",
    theme: glossary-theme,
    sort: false,
    ignore-case: false,
    show-all: false,
  )
  pagebreak()

  // Absätze (ersetzt parskip)
  set par(leading: 1em, justify: true, first-line-indent: 0pt)
  show par: set par(spacing: 1.2em)

  // Überschriften nummerieren
  set heading(numbering: (..n) => {
    if n.pos().len() < 4 {
      numbering("1.1", ..n)
    }
  })
  // set heading(numbering: "1.1.1")
  // show heading.where(level: 4): it => it.body
  show heading.where(level: 5): it => strong(it.body, delta: 100) + [ ]
  counter(heading).update(0)

  set math.equation(numbering: "(1)")

  // Der eigentliche Inhalt
  body

  // --- Verzeichnisse & Anhang ---
  pagebreak()

  set heading(numbering: "A.")
  counter(heading).update(0)

  // Literaturverzeichnis (BibLaTeX Ersatz)
  // hayagriva ist der Standard YAML Stil, aber biblatex Dateien gehen auch
  // Diese Website kann BibLaTeX zu hayagriva umwandeln: https://jonasloos.github.io/bibtex-to-hayagriva-webapp/
  bibliography("Bibliography.yaml", full: false, title: "Literaturverzeichnis", style: "ieee.csl")

  // Abbildungsverzeichnis
  pagebreak()
  outline(
    title: "Abbildungsverzeichnis",
    target: figure.where(kind: image),
  )

  // Tabellenverzeichnis
  //  pagebreak()
  outline(
    title: "Tabellenverzeichnis",
    target: figure.where(kind: table),
  )

  // Anhang
  pagebreak()
  heading(numbering: none)[Anhang]
  include "appendix.typ"
}
