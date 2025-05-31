#import "basic-settings.typ": *

#let insert-info(english, ymd, is-long-info) = secenter({
  let long-info = [Gong Yuchuan, Major in Biomedical Engineering | Student ID: 3220102299]
  let name = if english [Gong Yuchuan | ] else [龚玉传｜]

  v(5pt)
  if english {
    set text(font: enserif-c)
    if is-long-info { long-info } else { name + [*BME* 3220102299] }
    linebreak()
    emph(insert-date(english: true, ymd))
  } else {
    if is-long-info {
      set text(font: sans)
      grid(
        align: center + horizon,
        columns: if ymd != none { (1fr, 1fr, 1fr, 1fr) } else { (1fr, 1fr, 1fr) },
        column-gutter: 5pt,
        box-2grid([姓#if ymd == none [　　]名：], "龚玉传"),
        box-2grid([专#if ymd == none [　　]业：], "生物医学工程"),
        box-2grid([学#if ymd == none [　　]号：], "3220102299"),
        if ymd != none { box-2grid("日期：", insert-date(condensed: true, ymd)) }
      )
    } else {
      name
      text(font: enserif-c)[*BME* 3220102299]
      linebreak()
      insert-date(ymd)
    }
  }
  v(5pt)
})
