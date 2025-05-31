#import "basicSettings.typ": *

#let expInfoChart(
  titled: true,
  course: "课程名称",
  expCate: "实验类型",
  teacher: "指导老师",
  expName: "试验名称",
  miname: "龚玉传",
  studentid: "3220102299",
  major: "生物医学工程",
  studentCount: 1,
  isStudentsTitled: false,
  students: none,
  classmateCount: 0,
  classmates: none,
  where: "玉泉创客空间",
  ymd: "today",
) = {
  set text(font: sans)
  set align(center)
  if titled {
    grid(
      columns: 2,
      column-gutter: 8pt,
      align: (right + horizon, left + horizon),
      [#image("zju.svg", height: 30pt)], [*#K(size: 24pt, "实验报告")*],
    )
  }
  grid(
    align: center + horizon,
    columns: (1fr, 1fr, 1fr),
    column-gutter: 5pt,
    [#box2Grid("课程名称：", course)], [#box2Grid("实验类型：", expCate)], [#box2Grid("指导老师：", teacher)],
  )
  box2Grid("实验名称：", expName)

  if studentCount != 1 {
    if isStudentsTitled {
      let n = 1
      while n <= studentCount {
        grid(
          align: center + horizon,
          columns: (1fr, 1fr, 1fr),
          column-gutter: 5pt,
          [#box2Grid(students.at(n - 1).at(0) + "：", students.at(n - 1).at(1))],
          [#box2Grid("学　　号：", students.at(n - 1).at(2))],
          [#box2Grid("专　　业：", students.at(n - 1).at(3))],
        )
        n += 1
      }
    } else {
      let n = 1
      while n <= studentCount {
        grid(
          align: center + horizon,
          columns: (1fr, 1fr, 1fr),
          column-gutter: 5pt,
          [#box2Grid([学#h(0.5em)生#h(0.5em)#numbering("一",n)：], students.at(n - 1).at(0))],
          [#box2Grid("学　　号：", students.at(n - 1).at(1))],
          [#box2Grid("专　　业：", students.at(n - 1).at(2))],
        )
        n += 1
      }
    }
  } else {
    grid(
      align: center + horizon,
      columns: (1fr, 1fr, 1fr),
      column-gutter: 5pt,
      [#box2Grid("姓　　名：", miname)], [#box2Grid("学　　号：", studentid)], [#box2Grid("专　　业：", major)],
    )
  }

  if classmates != none {
    if classmateCount >= 3 {
      box2Grid("同组学生姓名：", classmates)
      grid(
        align: center + horizon,
        columns: (1fr, 1fr),
        column-gutter: 5pt,
        [#box2Grid("实验地点：", where)],
        [#box2Grid(
            "日　　期：",
            Ymd(ymd),
          )
        ],
      )
    } else {
      grid(
        align: center + horizon,
        columns: (1fr, 1fr, 1fr),
        column-gutter: 5pt,
        [#box2Grid("同组学生：", classmates)],
        [#box2Grid("实验地点：", where)],
        [#box2Grid(
            "日　　期：",
            Ymd(condensed: true, ymd),
          )
        ],
      )
    }
  } else {
    grid(
      align: center + horizon,
      columns: (1fr, 1fr),
      column-gutter: 5pt,
      [#box2Grid("实验地点：", where)],
      [#box2Grid(
          "日　　期：",
          Ymd(ymd),
        )
      ],
    )
  }
  v(3pt)
}
