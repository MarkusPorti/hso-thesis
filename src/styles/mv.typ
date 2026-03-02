#import "../utils.typ": thesis-page-numbering
#import "../cover/cover2.typ": cover2

#let setup(ctx, body) = {
  set document(author: ctx.info.author, title: ctx.info.title)
  set page(
    margin: (left: 30mm, top: 25mm, right: 25mm, bottom: 25mm),
    number-align: center,
    numbering: thesis-page-numbering,
  )
  set text(font: ctx.style.font, size: ctx.style.fontsize, lang: "de")
  set heading(numbering: "1.1")
  
  body
}

// M+V Style
#let style(components: (:)) = (
  font: "Times New Roman",
  fontsize: 12pt,
  setup: setup,
  chapters: (
    cover2,
    components.toc,
    components.abbreviations,
    components.glossary,
    components.body,
    components.declaration,
    components.bibliography,
  ),
)
