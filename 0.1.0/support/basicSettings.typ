#import "@preview/xarrow:0.3.1": xarrow
#import "@preview/equate:0.3.0": equate
#import "@preview/numbly:0.1.0": numbly
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "easiMath.typ": *

// default fonts
#let ensans = "SF Pro Display"
#let ensans_h = "SF Pro Display"
#let enserif = "New Computer Modern"
#let enserif_h = "EB Garamond"
#let enserif_c = "Charter"
#let hei = "FZHei-B01"
#let dh = "FZDaHei-B02"
#let song = "FZShuSong-Z01"
#let xbs = "FZXiaoBiaoSong-B05"
#let kai = "FZKai-Z03"

// font func dh: 大黑，h: 黑体，bt: 标宋，k: 楷体
#let DH(size: 12pt, body) = text(font: dh, size: size)[#body]
#let H(size: 12pt, body) = text(font: hei, size: size)[#body]
#let BT(size: 12pt, body) = text(font: xbs, size: size)[#body]
#let K(size: 12pt, body) = text(font: kai, size: size)[#body]

#let DH0(body) = text(font: dh)[#body]
#let H0(body) = text(font: hei)[#body]
#let BT0(body) = text(font: xbs)[#body]
#let K0(body) = text(font: kai)[#body]

// font Groups
#let sans = (ensans, hei)
#let sans_nt = (ensans, "PingFang SC")
#let serif = (enserif, song)
#let sans_h = (ensans_h, dh)
#let serif_h = (enserif_h, xbs)
#let Sans(size: 12pt, body) = text(font: sans, size: size)[#body]
#let Serif(size: 12pt, body) = text(font: serif, size: size)[#body]
// title
#let SansH(size: 12pt, body) = text(font: sans_h, size: size, weight: "semibold")[#body]
#let SerifH(size: 12pt, body) = text(font: serif_h, size: size, weight: "medium")[#body]
// stretched title
#let Sans__H(tracking: 5pt, size: 12pt, body) = text(
  tracking: tracking,
  font: sans_h,
  size: size,
  weight: "semibold",
)[#body]
#let Serif__H(tracking: 5pt, size: 12pt, body) = text(
  tracking: tracking,
  font: serif_h,
  size: size,
  weight: "medium",
)[#body]

// number format functions
// ①
#let cir(number) = numbering("①", number)
// 1.1º
#let qf(sequence) = underline(
  stroke: 1pt,
  offset: 2.3pt,
  text(weight: "semibold")[#sequence°],
)
// (1.1)_underlined
#let eqp(sequence) = underline(
  stroke: 0.5pt,
  offset: 3.3pt,
  [(#sequence)],
)


// styling functions

// wavy underline
#let drawWavyLine(color: black) = pattern(
  size: (4pt, 3pt),
  path(
    stroke: color + 0.5pt,
    ((0%, 10%), (-20%, 0%)),
    ((50%, 40%), (-20%, 0%)),
    ((100%, 10%), (-20%, 0%)),
  ),
)

#let wavy(color: black, content) = {
  underline(
    stroke: (thickness: 3pt, paint: drawWavyLine(color: color)),
    evade: false,
    offset: 2pt,
    [#content],
  )
}

// double underline
// offset is set for English and Chinese
#let u2e(offset: 3.6pt, content) = underline(underline(offset: offset)[#content])
#let u2z(offset: 4pt, content) = underline(underline(offset: offset)[#content])


// Miscellaneous 杂项

// underlined box
#let underlinedRect(width: 1cm, stroke: 0.6pt, content) = rect(width: width, stroke: (bottom: stroke), [#content])
// underlined box with text
#let box2Grid(stuff, filling, miniWidth: 100%) = box(
  grid(
    inset: (y: -6pt),
    columns: 2,
    align: center + horizon,
    [#stuff], [#underlinedRect(width: miniWidth)[#filling]],
  ),
)

// math vertical spacing
// used with
// #show math.equation.where(block: false): math.display
#let mv = v(10pt)

// Add a blank page
#let blankPage(content, margin: (x: 0cm, y: 0cm)) = page(
  margin: (x: margin.x, y: margin.y),
  header: [],
  footer: [],
)[#content]

// headers
#let zjuHeader(
  course: "课程名",
  proj_name: "Project Name",
  isTitleInHeaderIncluded: true,
) = {
  set text(10pt)
  box(baseline: 25%)[#image("zju.svg", height: 1.7em)]
  h(7pt)
  Sans(size: 10pt)[*#course*]
  h(1fr)
  if isTitleInHeaderIncluded {
    text(style: "italic", font: ("Charter", kai))[#proj_name]
  }
}

// footers
#let basicFooter(English: false) = [
  #set text(10pt)
  #set text(weight: "bold", font: "Charter")
  #counter(page).display(
    if English { "1 of 1" } else { "1 – 1" },
    both: true,
  )
]

// layout
#let d2 = h(-2em)
#let h0(
  outlined: false,
  lvl: 1,
  centent,
) = heading(
  outlined: outlined,
  level: lvl,
  numbering: none,
  centent,
)

// ymd
#let Ymd(condensed: false, ymd) = if condensed {
  if ymd == none [　] else if ymd == "today" {
    [#datetime.today().display("[year]/[month padding:none]/[day padding:none]")]
  } else {
    let date = datetime(year: ymd.at(0), month: ymd.at(1), day: ymd.at(2))
    [#date.display("[year]/[month padding:none]/[day padding:none]")]
  }
} else {
  if ymd == none [　] else if ymd == "today" {
    [#datetime.today().display("[year]年[month padding:none]月[day padding:none]日")]
  } else {
    let date = datetime(year: ymd.at(0), month: ymd.at(1), day: ymd.at(2))
    [#date.display("[year]年[month padding:none]月[day padding:none]日")]
  }
}
#let Ymd0(English: false, ymd) = {
  if English {
    set text(font: enserif_c)
    if ymd == none { } else if ymd == "today" {
      [_#datetime.today().display("[year], [month repr:short] [day padding:none]")_]
    } else {
      let date = datetime(year: ymd.at(0), month: ymd.at(1), day: ymd.at(2))
      [_#date.display("[year], [month repr:short] [day padding:none]")_]
    }
  } else {
    set text(font: serif)
    if ymd == none { } else if ymd == "today" {
      [#datetime.today().display("[year]年[month padding:none]月[day padding:none]日")]
    } else {
      let date = datetime(year: ymd.at(0), month: ymd.at(1), day: ymd.at(2))
      [#date.display("[year]年[month padding:none]月[day padding:none]日")]
    }
  }
}
// ymd formatter
#let parse-date(date-str) = {
  // Split the string at "-"
  let parts = date-str.split("-")
  // Convert each part to an integer
  let year = int(parts.at(0))
  let month = int(parts.at(1))
  let day = int(parts.at(2))
  // Return as an array
  (year, month, day)
}

// codex input code from file
#let codex(code, lang: none, size: 1em, border: true) = {
  if code.len() > 0 {
    if code.ends-with("\n") {
      code = code.slice(0, code.len() - 1)
    }
  } else {
    code = "// no code"
  }
  set text(size: size)
  align(left)[
    #if border == true {
      v(-5pt)
      block(width: 100%, stroke: 0.5pt + luma(150), radius: 4pt, inset: 8pt)[
        #raw(lang: lang, block: true, code)
      ]
    } else {
      raw(lang: lang, block: true, code)
    }
  ]
}

// 3-column table
#let triTab(columns, header, data, caption: none) = {
  let rowCount = calc.ceil(data.len() / 3)
  let data1 = data.slice(0, rowCount)
  let data2 = data.slice(rowCount, 2 * rowCount)
  let data3 = data.slice(2 * rowCount, data.len())

  let extraLineCount = data1.len() - data3.len()
  for i in range(0, extraLineCount * columns) {
    data3 += ([--],)
  }
  figure(
    caption: caption,
    grid(
      columns: 3,
      column-gutter: 30pt,
      align: center,
      table(
        columns: columns,
        table.header(..header.map(eval.with(mode: "markup"))),
        ..data1.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..header.map(eval.with(mode: "markup"))),
        ..data2.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..header.map(eval.with(mode: "markup"))),
        ..data3.flatten().map(num => [#num]),
        table.hline(),
      ),
    ),
  )
}
// 3-column table with header included in csv
#let triTab0(columns, data, caption: none) = {
  let rowCount = calc.ceil((data.len() - 1) / 3)
  let data1 = data.slice(1, rowCount + 1)
  let data2 = data.slice(rowCount + 1, 2 * rowCount + 1)
  let data3 = data.slice(2 * rowCount + 1, data.len())

  let extraLineCount = data1.len() - data3.len()
  for i in range(0, extraLineCount * columns) {
    data3 += ([--],)
  }
  figure(
    caption: caption,
    grid(
      columns: 3,
      column-gutter: 30pt,
      align: center,
      table(
        columns: columns,
        table.header(..data.flatten().slice(0, columns).map(num => [#num])),
        ..data1.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..data.flatten().slice(0, columns).map(num => [#num])),
        ..data2.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..data.flatten().slice(0, columns).map(num => [#num])),
        ..data3.flatten().map(num => [#num]),
        table.hline(),
      ),
    ),
  )
}

// 2-column table
#let dbTab(columns, header, data, caption: none) = {
  let rowCount = calc.ceil(data.len() / 2)
  let data1 = data.slice(0, rowCount)
  let data2 = data.slice(rowCount, data.len())

  if data1.len() - data2.len() != 0 {
    for i in range(0, columns) {
      data2 += ([--],)
    }
  }
  figure(
    caption: caption,
    grid(
      columns: 2,
      column-gutter: 30pt,
      align: center,
      table(
        columns: columns,
        table.header(..header.map(eval.with(mode: "markup"))),
        ..data1.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..header.map(eval.with(mode: "markup"))),
        ..data2.flatten().map(num => [#num]),
        table.hline(),
      ),
    ),
  )
}
// 2-column table with header included in csv
#let dbTab0(columns, data, caption: none) = {
  let rowCount = calc.ceil((data.len() - 1) / 2)
  let data1 = data.slice(1, rowCount + 1)
  let data2 = data.slice(rowCount + 1, data.len())

  if data1.len() - data2.len() != 0 {
    for i in range(0, columns) {
      data2 += ([--],)
    }
  }
  figure(
    caption: caption,
    grid(
      columns: 2,
      column-gutter: 30pt,
      align: center,
      table(
        columns: columns,
        table.header(..data.flatten().slice(0, columns).map(num => [#num])),
        ..data1.flatten().map(num => [#num]),
        table.hline(),
      ),
      table(
        columns: columns,
        table.header(..data.flatten().slice(0, columns).map(num => [#num])),
        ..data2.flatten().map(num => [#num]),
        table.hline(),
      ),
    ),
  )
}


// 1-column table
#let unoTab(columns, header, data, caption: none) = {
  figure(
    caption: caption,
    table(
      columns: columns,
      table.header(..header.map(eval.with(mode: "markup"))),
      ..data.flatten().map(num => [#num]),
      table.hline(),
    ),
  )
}
// 1-column table with header included in csv
#let unoTab0(columns, data, caption: none) = {
  figure(
    caption: caption,
    table(
      columns: columns,
      table.header(..data.flatten().slice(0, columns).map(eval.with(mode: "markup"))),
      ..data.flatten().slice(columns).map(num => [#num]),
      table.hline(),
    ),
  )
}

