#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#let head(doc) = header(doc, title: "Assignment 3")
#show: head
#show: latex
#show: NumberingAfter
#show: thmrules
#show: symbol_replacing

#set page(margin: (x: 1.6cm, top: 2.5cm, bottom: 2cm))
#show math.equation: it => {
  if it.has("label"){
    return math.equation(block: true, numbering: "(1)", it)
  }
  else {
    it
  }
}

#show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(),numbering(
        "(1)",
        counter(math.equation).at(el.location()).at(0)+1
      ))
    } else {
      it
    }
}

#let lemma = lemma.with(numbering: none)
#set enum(numbering: "(a)")
= Question
== Statement
A model $mM$ of a theory $T$ is called existentially closed if whenever $sigma$ is an existential $L(|mM|)$-sentence satisfied in a model $mN sat T$ containing $mM$, then $mM sat sigma$.

Show that the following are equivalent for a theory $T$:
  + all models of $T$ are existentially closed,
  + for every formula $phi(x)$ there exists a universal formula $psi(x)$ such that $T proves forall x (phi(x) <-> psi(x))$
== Solution
The backwards direction is simple, let $sigma(ov(c)) = exists ov(y) (phi(ov(c), ov(y))) $ be an existential $L(|mM|)$-sentence for some model $mM sat T$. Now if for some model $mN sat T$ that contains $mM$ we have $mN sat sigma$, then by assumption there exists a universal formula $psi(ov(c)) = forall ov(y) (psi'(ov(c), ov(y)))$ such that $T proves forall ov(c) (exists ov(y)(phi(ov(c),ov(y))) <-> psi(ov(c)))$ and so $mN sat psi$

