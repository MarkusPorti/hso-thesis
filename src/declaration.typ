#let declaration(ctx) = {
  pagebreak(weak: true)
  heading(outlined: false, bookmarked: true)[#ctx.strings.at("declaration-title")]

  // scope enables to use variables inside the text block.
  // For example: ctx.info.type is one of ("Bachelorthesis", "Masterthesis", "Seminararbeit")
  eval(ctx.strings.at("declaration-text-thesis"), mode: "markup", scope: (ctx: ctx))

  v(2cm)

  grid(
    columns: (6cm, 1fr),
    align: bottom + left,
    column-gutter: 1cm,
    row-gutter: 0.3cm,
    grid.cell(stroke: (bottom: 0.5pt))[
      #text(
        font: "Courier New",
      )[#ctx.info.at("location"), #datetime.today().display("[day].[month].[year]")]
      #v(0.2cm)
    ],
    grid.cell(stroke: (bottom: 0.5pt))[
      #v(1cm)
    ],
    [#ctx.strings.at("location-date")],
    [#ctx.info.author],
  )

  v(4cm)

  heading(outlined: false, bookmarked: true)[#ctx.strings.at("copyright-title")]
  
  eval(ctx.strings.at("copyright-text"), mode: "markup", scope: (ctx: ctx))
}
