#import "@preview/ctheorems:1.1.0": *


#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let lemma = thmbox("theorem", "Lemma")
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("theorem", "Definition", base: "heading" , inset: (x: 1.2em))

#let proposition = thmplain("theorem", "Proposition", base: "heading")

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [#body #h(1fr) $square$]
).with(numbering: none)
