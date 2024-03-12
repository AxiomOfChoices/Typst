#import "@preview/ctheorems:1.1.0": *


// Various symbols
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let qd = math.op("qd")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}
#let sat = $tack.r.double$
#let satn = $tack.r.double.not$
#let proves = $tack.r$
#let elm = $lt.curly$
#let Th = math.op("Th")
#let mM = $cal(M)$
#let mN = $cal(N)$
#let ov(el) = math.overline(el)
#let quo = math.op("/")
#let subs(a, b) = $#a quo #b$
#let uproduct = $product mM_i slash.big cal(U)$
#let Def = math.op("Def")
#let cf = math.op("cf")
#let Cn = math.op("Cn")
#let ip(x,y) = $lr(angle.l #x, #y angle.r)$
#let Area = math.op("Area")
#let Volume = math.op("Volume")
#let Hess = math.op("Hess")
#let Rm = math.op("Rm")
#let Ric = math.op("Ric")
#let lie = $cal(L)$
#let Sym = math.op("Sym")
#let AntiSym = math.op("ASym")
#let div = math.op("div")
#let tp = math.op("tp")
#let Aut = math.op("Aut")
#let Age = math.op("Age")
#let SH = math.op("SH")
#let Sc = math.op("Sc")
#let span = math.op("Span")
#let flat = $♭$
#let gen(x) = $lr(angle.l #x angle.r)$


#let symbol_replacing(doc) ={
  show sym.emptyset: set text(font: "Fira Sans")
  doc
}
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
#let claim = thmbox(
  "claim",            // Lemmas use the same counter as Theorems
  "Claim",
  fill: rgb("#ffefe6")
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

#let assumptions = thmplain(
  "assumptions",
  "Assumptions",
)
#let conditions = thmplain(
  "conditions",
  "Conditions",
)

// #let equation_references(doc) = {
//   // set math.equation(numbering: "(1)")
//   show ref: it => {
//     let eq = math.equation
//     let el = it.element
//     if el != none and el.func() == eq{
//       // el.fields()
//       numbering("(1)",
//         ..counter(eq)
//         .at(el.location()))
//     }
//     else {
//       it
//     }
//   }
//   doc
// }
//
#let equation_references(doc) = {
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(), numbering(
        section_based_equation_numbering,
        counter(math.equation).at(el.location()).at(0) + 1
      ))
    } else {
      it
    }
  }
  doc
}

#let section_based_equation_numbering(number, el) = {
  locate(loc => {
    let count = counter(heading.where(level:1)).at(loc).last()
    numbering("(1.1)", count, number)
    }
  )
}

#let equation_numbering(doc) = {
  show heading.where(level:1): it => {
    counter(math.equation).update(0)
    it
  }
  show math.equation: it => {
    if it.has("label"){
      math.equation(block: true, numbering: section_based_equation_numbering, it)
    } else {
      it
    }
  }
  doc
}
