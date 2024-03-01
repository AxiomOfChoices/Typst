#let _typst-numbering = numbering


#let _prepare-dict(it, level, zero-fill, leading-zero, numbering) = {
  let numbers = counter(heading).at(it.location())
  // if zero-fill is true add trailing zeros until the level is reached
  while zero-fill and numbers.len() < level { numbers.push(0) }
  // only take the first `level` numbers
  if numbers.len() > level { numbers = numbers.slice(0, level) }
  // strip a leading zero if requested
  if not leading-zero and numbers.at(0, default: none) == 0 {
    numbers = numbers.slice(1)
  }

  let dic = it.fields()
  let _ = if "body" in dic { dic.remove("body") }
  let _ = if "label" in dic { dic.remove("label") }
  let _ = if "counter" in dic { dic.remove("counter") }
  dic + (numbering: n => _typst-numbering(numbering, ..numbers, n))
}

#let show-equation(
  it,
  level: 1,
  zero-fill: true,
  leading-zero: true,
  numbering: "(1.1)",
  prefix: "eqn-",
  only-labeled: false,
  unnumbered-label: "-",
) = {
  if (
    only-labeled and not it.has("label")
    or it.has("label") and (
      str(it.label).starts-with(prefix)
      or str(it.label) == unnumbered-label
    )
    or not it.block
  ) {
    it
  } else {
    let equation = math.equation(
      it.body,
      .._prepare-dict(it, level, zero-fill, leading-zero, numbering),
    )
    if it.has("label") {
      let new-label = label(prefix + str(it.label))
      [#equation #new-label]
    } else {
      let new-label = label(prefix + _prefix + "no-label")
      [#equation #new-label]
    }
  }
}

#let show-equation-refrences(
  it,
  level: 1,
  numbering: "(1.1)"
) = {
  let el = it.element
  if el != none and el.func() == math.equation {
    let numbers = counter(heading).at(el.location())
    if numbers.len() > level { numbers = numbers.slice(0, level) }

    link(el.location(), _typst-numbering(
      numbering,
      ..numbers, 
      counter(math.equation).at(el.location()).at(0)
    ))
  } else {
    it
  }
}
