// Cover-Page for Thesis with Companies
#let cover(ctx) = {
  let info = ctx.info
  
  page(numbering: none, margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm))[

    // Logo Hochschule
    #align(center, image("../../assets/hs-logo.png", height: 2cm))
    #v(0.5cm)

    #align(center)[
      #text(size: 14pt)[Fakultät #info.faculty \
        an der Hochschule für Technik, Wirtschaft und Medien Offenburg]

      #v(1.5cm)

      #text(size: 17pt, weight: "bold")[#info.type]

      #v(1cm)

      // Linie
      #line(length: 100%, stroke: 0.5pt)

      // Titel
      #text(size: 19pt, weight: "bold")[#info.title]
      #v(0.1cm)
      #text(size: 14pt)[#info.subtitle]

      #line(length: 100%, stroke: 0.5pt)
      #v(1cm)

      #if info.companies.len() > 0 {
        [Durchgeführt in Zusammenarbeit mit\ ]
        v(0.1cm)
        let company_names = info.companies.map(c => c.name).join(" und ")
        text(size: 13pt)[#company_names]
        v(0.5cm)

        // Firmenlogos nebeneinander
        let logos = info.companies.filter(c => c.logo != none).map(c => image(c.logo, height: 1.2cm))
        if logos.len() > 0 {
           grid(
            columns: (1fr, auto, 1fr),
            align: center + horizon,
            [],
            grid(
              columns: logos.len(),
              gutter: 30pt,
              ..logos
            ),
            [],
          )
        }
      }
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
        "Autor:", info.author,
        "Studiengang:", info.degree,
        "Bearbeitungszeitraum:", [#info.period.from.display("[day].[month].[year]") -- #info.period.to.display("[day].[month].[year]")],
        ..for s in info.supervisors {
          ("Betreuer " + s.institution + ":", s.name)
        }
      )
    ]

    #v(1fr)
  ]
}
