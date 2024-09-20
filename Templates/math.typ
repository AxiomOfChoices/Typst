#import "@preview/ctheorems:1.1.1": *

// Various symbols
#let supp = $op("supp")$
#let Mat = $op("Mat")$
#let Top = $bold(op("Top"))$
#let Ab = $bold(op("Ab"))$
#let Gp = $bold(op("Gp"))$
#let pair(x, y) = $lr(angle.l #x mid(|) #y angle.r)$
#let sl = $frak(op("sl"))$
#let Sl = $op("SL")$
#let gl = $frak(op("gl"))$
#let Gl = $op("GL")$
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let qd = math.op("qd")
#let fu = $frak(U)$
#let pb() = {
  pagebreak(weak: true)
}
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
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$
#let suc = math.op("suc")
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
#let Cl = math.op("Cl")
#let Lie = math.bold(math.op("Lie"))
#let iso = math.tilde.equiv
#let diam = math.op("Diam")
#let Lip = math.op("Lip")
#let Aut = math.op("Aut")
#let rng = math.op("rng")
#let dom = math.op("dom")
#let rad = math.op("rad")
#let acl = math.op("acl")
#let dcl = math.op("dcl")
#let Rad = math.op("Rad")
#let CB = math.op("CB")
#let Ord = math.op("Ord")
#let Clop = math.op("Clop")
#let conv = math.op("Conv")
#let RM = math.op("RM")
#let Age = math.op("Age")
#let SH = math.op("SH")
#let Sc = math.op("Sc")
#let span = math.op("Span")
#let ZFC = math.op("ZFC")
#let DLO = math.op("DLO")
#let ACF = math.op("ACF")
#let GaussArea = math.op("GaussArea")
#let flat = $♭$
#let gen(x) = $lr(angle.l #x angle.r)$
#let into = $arrow.hook$

#let col(x, color) = text(fill: color, $#x$)
#let col(x, color) = text(fill: color, $#x$)

#let symbol_replacing(doc) = {
  show math.equation: set text(features: ("cv01",))
  doc
}
#let theorem = thmbox(
  "theorem",
  "Theorem",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#e8e8f8"),
)

#let lemma = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Lemma",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#efe6ff")
)
#let conjecture = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Conjecture",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#FFBE98")
)
#let claim = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Claim",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#ffefe6")
)
#let technique = thmplain(
  "technique",            // Lemmas use the same counter as Theorems
  "Technique",
  padding: (top: 0em, bottom: 0em),
)
#let proposition = thmbox(
  "theorem",            // Lemmas use the same counter as Theorems
  "Proposition",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#efe6ff")
)
#let corollary = thmbox(
  "corollary",
  "Corollary",
  padding: (top: 0em, bottom: 0em),
  base: "theorem",      // Corollaries are 'attached' to Theorems
  fill: rgb("#f8e8e8")
)

#let definition = thmbox(
  "definition",         // Definitions use their own counter
  "Definition",
  padding: (top: 0em, bottom: 0em),
  fill: rgb("#e8f8e8")
)

#let exercise = thmbox(
  "exercise",
  "Exercise",
  padding: (top: 0em, bottom: 0em),
  stroke: rgb("#ffaaaa") + 1pt,
)

// Examples and remarks are not numbered
#let example = thmplain(
  "example",
  "Example",
  inset: (x: 0.0em),
).with(numbering: none)
#let remark = thmplain(
  "remark",
  "Remark",
  padding: (top: 0em, bottom: 0em),
  //stroke: rgb("#ffaaaa") + 1pt,
).with(numbering: none)

// Proofs are attached to theorems, although they are not numbered
#let proof = thmplain(
  "proof",
  "Proof",
  base: "theorem",
  bodyfmt: body => [
    #body #h(1fr) $square$ // Insert QED symbol
  ],
).with(numbering: none)

#let solution = thmplain(
  "solution",
  "Solution",
  base: "exercise",
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
      link(
        el.location(),
        numbering(
          section_based_equation_numbering,
          counter(math.equation).at(el.location()).at(0) + 1,
        ),
      )
    } else {
      it
    }
  }
  doc
}

#let section_based_equation_numbering(number, el) = {
  locate(loc => {
    let count = counter(heading.where(level: 1)).at(loc).last()
    numbering("(1.1)", count, number)
  })
}

#let equation_numbering(doc) = {
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  show math.equation: it => {
    if it.has("label") {
      math.equation(
        block: true,
        numbering: section_based_equation_numbering,
        it,
      )
    } else {
      it
    }
  }
  doc
}
