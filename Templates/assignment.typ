#let NumberingAfter(doc) = { 
  let level = 1
  set heading(
    numbering: (..numbers) =>
    if numbers.pos().len() <= level {
      return numbering("1", ..numbers)
    }
  )
  show heading: it => {
    if (it.numbering == none or it.level > 1) { return it }
    let numbers = counter(heading).at(it.location())
    let display-number = numbering(it.numbering, ..numbers)
    let body = it.body
    block([*#body #display-number*])
  }
  doc
};
