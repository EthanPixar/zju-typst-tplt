#import "basicSettings.typ": *
#import "basicLayout.typ": *

#let cover(
  title: "本科实验报告",
  miname: "龚玉传",
  studentid: "3220102299",
  school: "生物医学工程与仪器科学学院",
  major: "生物医学工程",
  course: "课程名称",
  teacher: "指导老师",
  ymd: "today",
  English: false,
  studentCount: 1,
  leader: none,
  students: none,
) = page()[
  #if English {
    // none for now
  } else {
    set align(center)

    v(70pt)
    image("zju.svg", height: 56pt)
    v(10pt)
    image("求是蓝.svg", height: 152pt)
    v(20pt)
    Sans__H(size: 32pt, title)

    set align(center + bottom)
    if studentCount == 1 {
      text(
        16pt,
        grid(
          columns: 2,
          row-gutter: 10pt,
          align: center + horizon,
          [姓　　名：], [#underlinedRect(width: 9cm)[#miname]],
          [学　　号：], [#underlinedRect(width: 9cm)[#studentid]],
          [学　　院：], [#underlinedRect(width: 9cm)[#school]],
          [专　　业：], [#underlinedRect(width: 9cm)[#major]],
          [课程名称：], [#underlinedRect(width: 9cm)[#course]],
          [指导老师：], [#underlinedRect(width: 9cm)[#teacher]],
        ),
      )
    } else if studentCount == 2 {
      text(
        16pt,
        grid(
          columns: 2,
          row-gutter: 10pt,
          align: center + horizon,
          [学#h(0.5em)生#h(0.5em)一：], [#underlinedRect(width: 9cm, students.at(0))],
          [学#h(0.5em)生#h(0.5em)二：], [#underlinedRect(width: 9cm, students.at(1))],
          [学　　院：], [#underlinedRect(width: 9cm)[#school]],
          [专　　业：], [#underlinedRect(width: 9cm)[#major]],
          [课程名称：], [#underlinedRect(width: 9cm)[#course]],
          [指导老师：], [#underlinedRect(width: 9cm)[#teacher]],
        ),
      )
    } else {
      text(
        16pt,
        grid(
          columns: 2,
          row-gutter: 10pt,
          align: center + horizon,
          [组　　长：], [#underlinedRect(width: 9cm)[#leader]],
          [成　　员：], [#underlinedRect(width: 9cm)[#students]],
          [学　　院：], [#underlinedRect(width: 9cm)[#school]],
          [专　　业：], [#underlinedRect(width: 9cm)[#major]],
          [课程名称：], [#underlinedRect(width: 9cm)[#course]],
          [指导老师：], [#underlinedRect(width: 9cm)[#teacher]],
        ),
      )
    }
    v(30pt)
    Ymd(ymd)
  }
  #counter(page).update(0)
]

// --------- View the Cover ---------
#show: BL
#cover()
