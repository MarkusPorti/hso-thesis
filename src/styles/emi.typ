#import "../utils.typ": thesis-page-numbering
#import "../cover/cover1.typ": cover

#let setup(ctx, body) = {
  set document(author: ctx.info.author, title: ctx.info.title)

  set page(
    margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm),
    number-align: center,
    numbering: thesis-page-numbering,
    header: context {
      let all-headings = query(heading.where(level: 1))
      let target-heading = all-headings.filter(h => h.location().page() <= here().page()).last(default: none)

      if target-heading != none {
        if target-heading.numbering != none and target-heading.numbering not in ("A.", "I.") {
          let num = counter(heading).at(target-heading.location())

          block(width: 100%, stroke: (bottom: 0.5pt + luma(50%)), inset: (bottom: 5pt))[
            #grid(
              columns: (1fr, 1fr),
              align: (left, right),
              [#ctx.strings.chapter #numbering(target-heading.numbering, ..num)], [#target-heading.body],
            )
          ]
        }
      }
    },
  )

  set text(font: ctx.style.font, size: ctx.style.fontsize, lang: ctx.info.lang)

  body
}

#let style-content(ctx, body) = {
  set par(leading: 1em, spacing: 1.5em, justify: true, first-line-indent: 0pt)
  set terms(hanging-indent: 1.5em)

  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: (left: 0.3cm, y: 0.4cm),
    radius: 4pt,
    width: 100%,
  )

  show raw.where(block: false): r => {
    set text(size: 1em / 0.9)
    box(fill: luma(220), outset: (y: 3pt), inset: (x: 2pt), radius: 3pt, r)
  }

  show figure.caption: set text(size: 11pt, style: "italic")
  show figure.where(kind: table): set figure.caption(position: top)

  set math.equation(numbering: "(1)")

  show ref: it => {
    let el = it.element
    if el != none and el.func() == heading {
      if el.level == 1 and el.body == [#ctx.strings.appendix] {
        link(el.location(), [#ctx.strings.appendix])
      } else if el.level == 1 {
        link(el.location(), [#ctx.strings.chapter #numbering(el.numbering, ..counter(heading).at(el.location()))])
      } else {
        link(el.location(), [#ctx.strings.section #numbering(el.numbering, ..counter(heading).at(el.location()))])
      }
    } else {
      it
    }
  }

  body
}

#let style(components: (:)) = (
  font: "Arial",
  fontsize: 12pt,
  setup: setup,
  cover: cover,
  style-content: style-content,
  chapters: (
    components.declaration,
    components.abstract,
    components.toc,
    components.nomenclature,
    components.body,
    components.bibliography,
    components.figures,
    components.tables,
    components.listings,
    components.appendix,
  ),
)
