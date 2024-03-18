#let NumberingAfter(doc) = { 
  let level = 1
  set heading(
    numbering: (..numbers) =>
    if numbers.pos().len() <= level {
      return numbering("1", ..numbers)
    },
    supplement: "Question"
  )
  show heading: it => {
    if (it.numbering == none or it.level > 1) { return it }
    let numbers = counter(heading).at(it.location())
    let display-number = numbering(it.numbering, ..numbers)
    let body = it.body
    pagebreak(weak: true)
    block([*#body #display-number*])
  }
  doc
};

#let MultiColumnBox(body, height: 26pt, column_number: 3) = {
  box(height: height)[
    #columns(column_number)[
      #set par(justify: true)
      #body
    ]
  ]
}
