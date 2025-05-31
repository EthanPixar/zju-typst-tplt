#import "support/basic-settings.typ": *

#let zju-cover(
  title: "本科实验报告",
  miname: "龚玉传",
  student-id: "3220102299",
  major: "生物医学工程",
  school: "生物医学工程与仪器科学学院",
  course: "课程名称",
  teacher: "指导老师",
  ymd: "today",
  english: false,
  student-count: 1,
  leader: none,
  students: none,
) = {
  set text(font: serif, top-edge: 0.65em)
  set page(
    paper: "a4",
    margin: (x: 0pt, top: 135pt, bottom: 60pt),
  )
  if english {
    // none for now
  } else {
    set align(center)
    image("zju.svg", height: 56pt)
    v(10pt)
    image("求是蓝.svg", height: 152pt)
    v(50pt)
    sec(sans--h(size: 32pt, title))

    set align(bottom)
    let columns = 2
    let row-gutter = 10pt
    let width = 256pt
    set text(16pt)
    if student-count == 1 {
      grid(
        columns: columns,
        row-gutter: row-gutter,
        align: center + horizon,
        [姓　　名：], underlined-rect(width: width, miname),
        [学　　号：], underlined-rect(width: width, student-id),
        [学　　院：], underlined-rect(width: width, school),
        [专　　业：], underlined-rect(width: width, major),
        [课程名称：], underlined-rect(width: width, course),
        [指导老师：], underlined-rect(width: width, teacher),
      )
    } else if student-count == 2 {
      grid(
        columns: columns,
        row-gutter: row-gutter,
        align: center + horizon,
        [学#h(0.5em)生#h(0.5em)一：], underlined-rect(width: width, students.at(0)),
        [学#h(0.5em)生#h(0.5em)二：], underlined-rect(width: width, students.at(1)),
        [学　　院：], underlined-rect(width: width, school),
        [专　　业：], underlined-rect(width: width, major),
        [课程名称：], underlined-rect(width: width, course),
        [指导老师：], underlined-rect(width: width, teacher),
      )
    } else {
      grid(
        columns: columns,
        row-gutter: row-gutter,
        align: center + horizon,
        [组　　长：], underlined-rect(width: width, leader),
        [成　　员：], underlined-rect(width: width, students),
        [学　　院：], underlined-rect(width: width, school),
        [专　　业：], underlined-rect(width: width, major),
        [课程名称：], underlined-rect(width: width, course),
        [指导老师：], underlined-rect(width: width, teacher),
      )
    }
    v(30pt)
    set text(size: 12pt)
    insert-date(ymd)
    counter(page).update(0)
  }
}

// --------- View the Cover ---------
#zju-cover()
