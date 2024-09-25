#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 3", name: "Jacob Reznikov", doc)
#let lecture = counter("lecture")
#lecture.step()
#let update_lecture = () => {
  lecture.step()
  counter(heading).update(0)
}
#let bonus_problem = {
  pagebreak()
  block(text([*Bonus Exercise*], size: 17pt))
}
#show: latex
#let NumberingAfter(doc) = {
  let level = 1
  set heading(
    numbering: (..numbers) => if numbers.pos().len() <= level {
      return context numbering(
        "1.1",
        lecture.get().first(),
        ..numbers,
      )
    },
    supplement: "Exercise",
  )
  show heading: it => {
    if (it.numbering == none) {
      return it
    }
    if (it.level > 1) {
      return text(it, size: 14pt)
    }
    let numbers = counter(heading).at(it.location())
    let display-number = numbering(it.numbering, ..numbers)
    let body = it.body
    // if (numbers.last() > 1) {
    pagebreak(weak: true)
    // }
    block(text([*#body #display-number*], size: 17pt))
  }
  doc
};
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let bar(el) = $overline(#el)$
#show: NumberingAfter
#set enum(numbering: "(a)")

*Sources consulted* \
Classmates: Julia Meng. \
Texts: Class Notes.
#update_lecture()
#update_lecture()
#update_lecture()
#update_lecture()
#update_lecture()
= Exercise
== Statement
Show that any non-abelian 3-dimensional nilpotent Lie Algebra is isomorphic to $heis_3$.
== Solution
As we saw in class, any nilpotent Lie Algebra has non-trivial center, so let $Z(frak(g))$ be that center.

Now since $frak(g)$ is non-abelian the center is not the whole of $frak(g)$, and so it has either dimension $1$ or $2$. But now assume
