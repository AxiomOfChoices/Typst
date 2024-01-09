#import "@preview/ctheorems:1.1.0": *


#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let lemma = thmbox("theorem", "Lemma")
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("theorem", "Definition", base: "heading", inset: (x: 0em))
#let remark = thmbox("theorem", "Remark", base: "heading", inset: (x: 0em))

#let proposition = thmplain("theorem", "Proposition", base: "heading", inset: (x: 0em), bodyfmt: body =>
[
  #set enum(numbering: "(a)")
  #body
])

#let example = thmplain("example", "Example", inset: (x: 0em)).with(numbering: none)
#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)

#let equation_references(doc) = {
  // set math.equation(numbering: "(1)")
  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq{
      // el.fields()
      numbering(el.numbering,
        ..counter(eq)
        .at(el.location()))
    }
    else {
      it
    }
  }
  doc
}
