#import "@preview/ctheorems:1.1.0": *


// #let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
// #let lemma = thmbox("theorem", "Lemma")
// #let corollary = thmplain(
//   "corollary",
//   "Corollary",
//   titlefmt: strong
// )
// #let definition = thmbox("theorem", "Definition", base: "heading", inset: (x: 0em))
// #let remark = thmbox("theorem", "Remark", base: "heading", inset: (x: 0em))
//
// #let proposition = thmplain("theorem", "Proposition", base: "heading", inset: (x: 0em), bodyfmt: body =>
// [
//   #set enum(numbering: "(a)")
//   #body
// ])
//
// #let example = thmplain("example", "Example", inset: (x: 0em)).with(numbering: none)
// #let proof = thmplain(
//   "proof",
//   "Proof",
//   base: "theorem",
//   bodyfmt: body => [#body #h(1fr) $square$]
// ).with(numbering: none)

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8")
)

#let lemma = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Lemma",
  fill: rgb("#efe6ff")
)
#let proposition = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Proposition",
  fill: rgb("#efe6ff")
)
#let corollary = thmbox(
  "corollary",
  "Corollary",
  base: "theorem",      // Corollaries are 'attached' to Theorems
  fill: rgb("#f8e8e8")
)

#let definition = thmbox(
  "definition",         // Definitions use their own counter
  "Definition",
  fill: rgb("#e8f8e8")
)

#let exercise = thmbox(
  "exercise",
  "Exercise",
  stroke: rgb("#ffaaaa") + 1pt,
  base: none,           // Unattached: count globally
).with(numbering: "I")  // Use Roman numerals

// Examples and remarks are not numbered
#let example = thmplain("example", "Example").with(numbering: none)
#let remark = thmbox(
  "remark",
  "Remark",
  stroke: rgb("#ffaaaa") + 1pt
).with(numbering: none)

// Proofs are attached to theorems, although they are not numbered
#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [
    #body #h(1fr) $square$    // Insert QED symbol
  ]
).with(numbering: none)

#let solution = thmplain(
  "solution",
  "Solution",
  base: "exercise",
  inset: 0em,
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
