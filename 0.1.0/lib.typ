#import "support/basicSettings.typ": *
#import "support/basicLayout.typ": *
#import "support/cover.typ": *
#import "support/expInfoChart.typ": *
#import "chapnum/chapnum.typ": chap-num

// To use the template, paste the following code to the very top of your typst file

// #import "@local/tplt:0.1.0": *
//
// #show: BL.with()
// #show: RP.with( // or HW.with(
//   course:
//   short-course-name:
//   proj_name:
//   ymd:
//   English:
// )


//复用模块
// 1. homework Info
#let hwInfo(English, ymd, isInfoStyleLong) = par(spacing: 21pt)[
  #let infoLong = [Gong Yuchuan, Major in Biomedical Engineering | Student ID: 3220102299]
  #let name = if English {
    "Gong Yuchuan | "
  } else {
    "龚玉传｜"
  }
  #if English {
    set text(font: enserif_c)
    if isInfoStyleLong { text(infoLong) } else [#name#text(weight: "semibold")[BME] 3220102299]
    linebreak()
    Ymd0(English: English, ymd)
  } else {
    if isInfoStyleLong {
      set text(font: sans)
      box(
        grid(
          align: center + horizon,
          columns: (1fr, 1fr, 1fr),
          column-gutter: 5pt,
          [#box2Grid("姓　　名：", "龚玉传")],
          [#box2Grid("专　　业：", "生物医学工程")],
          [#box2Grid("学　　号：", "3220102299")],
        ),
      )
    } else [
      #name#text(font: enserif_c)[*BME* 3220102299]\
      #Ymd0(English: English, ymd)]
  }
]
// 2. Heading & Paragraph style For different languages
#let langSet(English, doc) = if English {
  set heading(
    numbering: numbly(
      "{1:I}.",
      "{1}.{2}",
      "{1}.{2}.{3}",
      "{1}.{2}.{3}.{4}",
      "{1}.{2}.{3}.{4}.{5}",
      "{1}.{2}.{3}.{4}.{5}.{6}",
    ),
  )
  set par(
    first-line-indent: (
      amount: 1.5em,
    ),
  )
  doc
} else {
  show heading: it => {
    show h.where(amount: 0.3em): none
    it
  }
  set heading(
    numbering: numbly(
      "{1:一}、",
      "{1}.{2} ",
      "{1}.{2}.{3} ",
      "{1}.{2}.{3}.{4} ",
      "{1}.{2}.{3}.{4}.{5} ",
      "{1}.{2}.{3}.{4}.{5}.{6} ",
    ),
  )
  set par(
    justify: true,
    first-line-indent: (
      amount: 2em,
      all: true,
    ),
  )
  set text(lang: "zh", region: "cn")
  set figure.caption(separator: [ -- ])
  show outline.entry: it => {
    show "、": "、" + h(-0.5em)
    show " ": none
    it
  }
  doc
}



// HOMEWORK
// hw functions
#let problemCounter = counter("problems")
#let problem(order, body) = {
  problemCounter.step()
  context if problemCounter.get().at(0) != 1 {
    v(10pt)
  } else {
    v(1.3pt)
  }
  rect(
    fill: luma(97%),
    width: 100%,
    radius: 6pt,
    inset: 8pt,
    stroke: 1.8pt + luma(80%),
    if order == none or order == -1 {
      [#body]
    } else {
      grid(
        columns: 2,
        column-gutter: 5pt,
        [*#order*], [#body],
      )
    },
  )
}
#let labeling(body) = {
  text(font: enserif_c, size: 10pt, fill: rgb(83, 102, 193), weight: "black")[
    #h(2.5%)*#body*
  ]
}
#let ans(mode) = {
  if mode == 1 {
    labeling("SOLUTION:")
  } else if mode == 0 {
    labeling("PROOF:")
  } else if mode == 2 {
    labeling("ANSWER:")
  }
}
#let SOLUTION = ans(1)
#let PROOF = ans(0)
#let ANSWER = ans(2)

// 证明结束符
#let done = [#h(1fr)■]
// part  // #let part(string) = align(center)[*_-- Part #string --_*]
#let partCounter = counter("parts")
#let part(isPartIncluded: true, string) = {
  partCounter.step()
  context if partCounter.get().at(0) != 1 { v(15pt) }
  align(center, if isPartIncluded [*_-- Part #string --_*] else [*_-- #string --_*])
  context if partCounter.get().at(0) != 1 { v(-10pt) } else { v(-1.3pt) }
}

// disclosure
#let disclosure(title: [Disclosure], doc) = rect(
  width: 100%,
  stroke: (thickness: 1.4pt, cap: "round", dash: (0pt, 4pt)),
  inset: 10pt,
  radius: 8pt,
)[
  #if title != none { h0(lvl: 2)[#title] }
  #doc
]

// math functions
// cases in display mode, not recommended though
#let dcase(..args) = math.cases(..args.pos().map(math.display))

// ----------------------- Main templates -------------------------
#let HW(
  course: "课程",
  short-course-name: none,
  proj_name: "Project",
  ymd: none,
  English: false,
  isInfoStyleLong: false,
  doc,
) = {
  // set language for user's name


  // header & footer
  set page(
    header: context if counter(page).get().first() > 1 {
      zjuHeader(
        course: if short-course-name != none { short-course-name } else { course },
        proj_name: proj_name,
      )
    } else {
      box(
        baseline: 25%,
        image("support/zju.svg", height: 1.7em),
      )
    },
    footer: context basicFooter(English: English),
  )
  v(15pt)
  // Title
  align(center)[
    #par(
      spacing: 0pt,
      leading: 1em,
      if English {
        SansH(size: 26pt)[#course\ #proj_name]
      } else {
        SansH(size: 28pt, course + " " + proj_name)
      },
    )
    // info
    #hwInfo(English, ymd, isInfoStyleLong)
  ]
  if English {
    doc
  } else {
    set text(lang: "zh", region: "cn")
    doc
  }
}


// ARTICLE
// ----------------------- Main template -------------------------
#let AT(
  course: "课程",
  short-course-name: none,
  proj_name: "Project",
  ymd: none,
  isInfoStyleLong: true,
  English: false,
  doc,
) = {
  let name = if English {
    "Gong Yuchuan | "
  } else {
    "龚玉传｜"
  }
  // header & footer
  set page(
    header: context if counter(page).get().first() > 1 {
      zjuHeader(
        course: if short-course-name != none { short-course-name } else { course },
        proj_name: proj_name,
      )
    } else {
      zjuHeader(
        course: if short-course-name != none { short-course-name } else { course },
        proj_name: proj_name,
        isTitleInHeaderIncluded: false,
      )
    },
    footer: context basicFooter(English: English),
  )
  v(15pt)
  // Title
  align(center)[
    #par(
      spacing: 0pt,
      leading: 1em,
      SerifH(size: 26pt, proj_name),
    )
    // info
    #hwInfo(English, ymd, isInfoStyleLong)
  ]
  langSet(English, doc)
}


// REPORT
// rp functions
// #let sectionCounter = counter("sections")

// ----------------------- Main template -------------------------

#let RP(
  course: "课程",
  proj_name: "Project",
  ymd: none,
  English: false,
  doc,
) = {
  // header & footer
  set page(
    // 页眉
    header: context if counter(page).get().first() > 1 {
      zjuHeader(
        course: course,
        proj_name: proj_name,
      )
    },
    // 页脚
    footer: context basicFooter(English: English),
  )

  // Title
  // not in use for now
  // #expInfoChart() is used though.

  // Language settings
  langSet(English, doc)
}


// NOTE
// note functions
#let h1(outlined: false, content) = {
  show heading: it => {
    show line: none
    show v.where(amount: -8pt): none
    it
  }
  heading(
    outlined: outlined,
    level: 1,
    numbering: none,
    content,
  )
}
// ----------------------- Main template -------------------------
#let NT(
  title: none,
  ymd: none,
  English: false,
  doc,
) = {
  set page(
    margin: (x: 25pt, top: 25pt, bottom: 150pt),
    paper: "iso-b5",
    height: auto,
  )
  // Title
  align(center)[
    #if title != none {
      v(10pt)
      par(
        spacing: 0pt,
        leading: 1em,
        SansH(size: 22pt, title),
      )
    }
    // date
    #set text(font: enserif_c)
    #if ymd == none { v(5pt) } else if ymd == "today" {
      [_#datetime.today().display("[year] – [month padding:none] – [day padding:none]")_]
    } else {
      let date = datetime(year: ymd.at(0), month: ymd.at(1), day: ymd.at(2))
      [_#date.display("[year] – [month padding:none] – [day padding:none]")_]
    }
  ]
  // heading style
  show heading.where(level: 1): it => {
    line(length: 100%)
    v(-8pt)
    it
  }
  set text(font: sans_nt)
  show heading.where(level: 1): set text(font: sans_nt, weight: "medium")
  // Language settings
  langSet(English, doc)
}
