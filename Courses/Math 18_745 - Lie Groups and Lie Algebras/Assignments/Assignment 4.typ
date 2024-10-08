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
#update_lecture()
#update_lecture()
= Exercise
== Statement
Let $G$ be an Algebraic group and, $H$ be an algebraic subgroup of $G$. Let $N_G (H) = {g in G | g H g^(-1) seq H }$ be the normalizer of $H$ in $G$. Prove that it is an algerbraic subgroup, whos Lie algerba is $N_(frak(g)) (frak(h))$, whose $frak(g) = Lie G, frak(h) = Lie H$.
== Solution
Let $C_G$ be the polynomials that define $G$ and $C_H$ be the polynomials that define $H$, then we define the polynomial set $C'$ by
$
  C' = { (det g)^(deg p) p((g x adj g)/(det g)): p in C_H, x in H}
$
where $adj g$ is the adjugate of $g$, which is equal to $g^(-1) det (g)$, and is polynomially dependent on $g$. It is easy to see then, that the elements of $C'$ are indeed polynomials, for any rational terms of $det g$ are cancelled out by the $(det g)^(deg p)$ up front. We then have that 
$
  N_G (H) = {g in Gl_n : q(g) = 0, p(g) = 0, forall q in C_G, p in C'}.
$

To check the second statement we check when $1 + epsilon X in N_G (H)$, we get that for each $h in H$ we have
$
  (1 + epsilon X) h (1 + epsilon X)^(-1)
  =
  (1 + epsilon X) h (1 - epsilon X)
  =
  h + epsilon (X h - h X)
$
thus $1 + epsilon X in Lie N_G (H)$ if and only if $h^(-1) X h - X in Lie H$ or otherwise said $X in frak(n)_(frak(g)) frak(h)$.

= Question
== Statement
Let $frak(g) in sl_2 (FF)$ with $char FF != 2$. Let $frak(h) = FF mat(0,1;0,0)$. This is a maximal nilpotent subalgebra, but not a Cartan subalgebra. 
== Solution
This is a subalgebra of dimension $1$, if it was not a maximal nilpotent subalgebra, then $sl_2$ would contain a 2 dimensional nilpotent subalgebra $frak(h)'$. Any other basis vector of $frak(h)'$ is of the form
$
  x = mat(a,0;b,-a)
$
but then we have
$
  [x,mat(0,1;0,0)] 
  =
  mat(a,0;b,-a) mat(0, 1;0, 0)
  -
  mat(0, 1;0, 0) mat(a,0;b,-a)
  =
  mat(0, a; 0, b) - mat(b, -a;0, 0) 
  =
  mat(-b, 2a; 0, b)
$
so since it it is a 2 dimensional Lie algebra we must assume that $b = 0$ as otherwise we can span the whole space. Then if $b = 0$ and $a != 0$ then $[frak(h)', frak(h)] = frak(h)$ so the algebra is not nilpotent. Thus $frak(h)$ is indeed maximal nilpotent. However, we have $frak(n)_(frak(g)) frak(h) != frak(h)$ because we have
$
  [
    mat(1,0;0,-1),
    mat(0,1;0,0) 
  ]
  =
  mat(1,0;0,-1) mat(0,1;0,0)
  -
  mat(0,1;0,0) mat(1,0;0,-1)
  =
  mat(0, 1;0, 0)
  -
  mat(0, -1;0, 0)
  =
  mat(0, 2;0, 0)
$
and so $mat(1,0;0,-1)$ is in $frak(n)_(frak(g)) frak(h)$ but is not in $frak(h)$.

= Question
== Statement





