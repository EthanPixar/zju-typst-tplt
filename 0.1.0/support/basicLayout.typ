#import "basicSettings.typ": *

#let BL(
  author: "Ethan Pixar",
  isTableCellStroked: false,
  doc,
) = {
  show: show-cn-fakebold
  set document(author: author)

  // basic styles
  set text(
    font: serif,
    size: 12pt,
    top-edge: 0.65em,
  )
  set par(leading: 0.88em)
  // page
  set page(
    margin: (x: 1.45cm, top: 2.25cm, bottom: 2cm),
    header-ascent: 23%,
    footer-descent: 21%,
  )

  // heading
  show heading.where(level: 1): set text(font: sans, weight: "medium")
  show heading: it => {
    set block(above: 1.25em)
    it
    v(12pt, weak: true)
  }

  // numbering
  set enum(
    full: true,
    numbering: numbly(
      "({1})",
      "{2:①}",
      "{3:a}.",
      "{4:i}.",
    ),
  )

  // mono font
  show raw: set text(font: ("SF Mono", "PingFang SC"))

  // basic table
  show figure.where(kind: table): set figure.caption(position: top)
  set table(
    align: center,
    inset: (
      x: if isTableCellStroked { 5pt } else { 16pt },
      y: 5pt,
    ),
    stroke: (x, y) => (
      left: if x > 0 { if isTableCellStroked { 0.5pt } else { 0pt } },
      top: if y == 0 { 1.2pt },
      bottom: if y == 0 { 1.2pt } else { if isTableCellStroked { 0.5pt } else { 0pt } },
    ),
  )
  set table.hline(stroke: 1.2pt)

  // center
  show image: set align(center)
  show table: set align(center)

  // math styles
  show math.equation: set text(font: ("New Computer Modern Math", song))
  set math.cases(gap: 0.3em)
  set math.mat(delim: "[", column-gap: 0.8em, row-gap: 0.3em)
  set math.vec(delim: "[", gap: 0.3em)
  // math equation numbering
  show: equate.with(breakable: true, sub-numbering: true, number-mode: "label")
  set math.equation(numbering: "(1a)", supplement: none)

  doc
}
