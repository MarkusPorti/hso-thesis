#import "../utils.typ": thesis-page-numbering
#import "../cover/cover1.typ": cover

#let setup(ctx, body) = {
  set document(author: ctx.info.author, title: ctx.info.title)
  set page(
    margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm),
    number-align: center,
    numbering: thesis-page-numbering,
  )
  set text(font: ctx.style.font, size: ctx.style.fontsize, lang: ctx.info.lang)
  set heading(numbering: "1.1")
  
  body
}

#let style-content(ctx, body) = {
  set par(leading: 1em, spacing: 1.5em, justify: true, first-line-indent: 0pt)
  body
}

// W Style
#let style(components: (:)) = (
  font: "Calibri",
  fontsize: 11pt,
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
