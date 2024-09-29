#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 2", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#set page(numbering: "1")
#let bar(el) = $overline(#el)$
#set enum(numbering: "(a)")
// #show math.equation: set text(font: "Latin Modern Math")

*Sources consulted* \
Classmates: Frank Wang, Michael Panner, Julia Meng.\
Texts: Class Notes, Algebraic Number Theory by Milne, Elementry and Analytic Theory of Algebraic Numbers by Narkiewicz, Number Fields by Marcus.

= Question
== Statement

