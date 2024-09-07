#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "/Templates/math.typ": *
#import "/Templates/monograph.typ": frontpage
#import "@preview/cetz:0.2.2": canvas, draw, tree
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#set pagebreak(weak: true)

#show: doc => frontpage(
  toptitle: [Differential Analysis],
  name: [Jacob Reznikov],
  middletitle: [My course notes for the Fall 2024 Differential Analysis course by #link("https://math.mit.edu/directory/profile.html?pid=2579")[Alexander Logunov] at MIT],
  doc,
)

#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm), numbering: "1")
#set enum(numbering: "(1)", indent: 1em)
#outline()

#pagebreak(weak: true)

= Introduction

The first ideas resembling distribution theory was developed by L. Schwartz in 1945, although he called it 'Generalized functions' and was motivated by Physics. Some earlier attempts include those by N. Wiener in 1926 and H. Poincare in 1890, who were mainly motivated by generalized solutions to PDEs.
// TODO: Fill in full name.

To see the need for such a theory let us start with an example.
#example("Vibrating string")[
  Imagine that you have a string attached on both ends to an immovable surface. The string, for small perturbations, is well modeled by the differential equation $u_(x x) - u_(t t) = 0$.
  
  D'Alambert solved this equation and showed that solutions are of the form $u(x,t) = f(x+t) - g(x-t)$ where $f,g in C^2(RR)$. Euler then asked the question, what if we replace $f,g$ with continuous functions, is there still a sense in which $u$ solves the equation.
]

#example("Poisson's problem")[
  Consider the equation $Delta u = f$ where $f$ is a fixed function. It was well known even by Newton that if one defines $u$ as a potential, in the form
  $
  u(x) = - integral 1 / (4 pi abs(x - y)) f(y) d y
  $
  then $u$ satisfies the desired equation as long as $f in C^infinity_c (RR)$.
  
  Laplace then considered the function
  $
  G_y (x) = 1 / abs(x-y)
  $
  and calculated that it is harmonic outside of its singularity. The Laplacian argument was then that since
  $
  Delta integral 1 / abs(x - y) f(y) d y = integral (Delta 1 / abs(x-y)) f(
    y
  ) d y
  $
  then since the left term here is zero outside of a set of measure zero, this entire integral must also be zero and thus the solution makes no sense. The mistake Laplace makes here is the illegal swapping of the Laplacian and the integral, and it is this mistake that we will attempt to fix in first section of this course.
]

We will go about this by extending the idea of differentiation through integration by parts. We recall that for all functions $f in C^1_c (RR)$ and $g in C^1 (RR)$ we have
$
integral f g' = - integral f' g.
$

#definition[
  A function $h in L^1_("loc")$ is called a weak derivative of a function $f in L^1_("loc")$ if
  $
  integral f g' = - integral h g
  $
  for all $g in C_c^infinity (RR)$.
]

#example[
  Let $f = |x|$ and
  $
  h = cases(1 : x >= 0, -1 : x < 0)
  $
  We now claim that $h$ is the weak derivative of $f$, to see this we compute
  $
  - integral h g = integral_(-infinity)^0 g - integral_0^infinity g = - integral_(-infinity)^0 x g' + integral_0^infinity x g' = integral_RR |x| g'
  $
]

#example[
  We will say that $u$ is a weak solution to the wave equation if
  $
  integral u (diff_(x x) phi - diff_(t t) phi) = 0
  $
  for any $phi in C_c^infinity (RR^2)$.
  
  Assume that $u(x,t) = f(x+t)$ is a continuous function on $RR$ as we wanted to check before, we want to show that it is indeed a weak solution to the wave equation. To check this we want to show that
  $
  0 = integral u (diff_(x x) - diff_(t t)) phi.
  $
  To show this we will need to use a small lemma,
  #lemma("Approximation by smooth functions")[
    If $f in C(RR^n)$ and $K$ is a compact set in $RR^n$, then there is a sequence of $C^infinity$-smooth functions $f_n in C^infinity$ such that $f_n -> f$ pointwise on $K$.
  ]
  Applying this lemma to $f$ we get such a sequence $f_n$, and thus define $u_n(x,t) = f_n(x + t)$. We now compute
  $
  integral u (diff_(x x) - diff_(t t)) phi
  = integral (u - u_n) (diff_(x x) - diff_(t t)) phi
  + integral u_n (diff_(x x) - diff_(t t)) phi.
  $
  The right term here is zero by the standard argument for smooth solutions. The left term is dominated by $|K| sup_K abs(u - u_n)$ which vanishes in the limit.
]

Now this process we just went through is the template for the study of distributions, so we shall part by part formalize every part of this example.
#definition("Test Functions")[
  The space $C_c^infinity (Omega)$ for any open set $Omega$ is called the space of 'Test Functions'. Let $f$ be any test function and $f_n$ be any sequence. We say that $f_n$ converges to $f$ if there is some compact set $K$ containing the support of $f$ and the entire sequence $f_n$, such that for any $N$
  $
  max_(abs(alpha) <= N) sup_(x in K) abs(f^alpha (x) - f_n^alpha (x)) ->_(n -> infinity) 0.
  $
  For brevity we will refer to the left side here as $norm(f - f_n)_(C^N (K))$
]<def-test_function>

Let us now define the main object of study for the next few lectures.

#definition("Distribution")[
  A *Distribution* is a linear functional $ell : C_c^infinity (Omega) -> RR$ which is 'bounded', in the sense that for any compact set $K$ there are some constants $C,N$ such that
  $
  abs(ell(phi)) <= C dot norm(phi)_(C^N (K))
  $
  for any test function $phi$.
]<def-distribution>

To distinguish a distribution from the function it is acting on, we will write $ell(phi)$ as $pair(ell,phi)$.

#example[
  The most important examples of a distributions are regular locally integrable functions. For any function $g in L^1_("loc")(Omega)$, $g$ acts a linear functional by
  $
  pair(g, f) = integral_Omega g f.
  $
  One can easily check that this is indeed a bounded linear functional in $f$.
]
#example[
  The Dirac Delta functional $delta$ is defined by
  $
  delta(f) = f(0).
  $
  One can easily check that it is indeed a distribution and also that it is not given by a locally integrable function.
]
#definition[
  The *derivative* of a distribution $ell$ is the distribution $rho$ defined by
  $
  pair(ell, f') = - pair(rho, f)
  $
  for all $f$.
]
#example[
  The derivative of $delta$ is the distribution $delta'$ which gives $-f'(0)$ for any test function $f$.
]
= Appendix

#definition[
  We denote $L^1_("loc")$ the set of "locally integrable functions" that is measurable functions $f$ with $integral_K |f| < infinity$ for all compact sets $K$.
]

