#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/cetz:0.2.0"
#let head(doc) = header(doc, title: "Assignment 6")
#show: head
#show: latex
#show: thmrules
#show: symbol_replacing

= Prescribed curvature
== Statement
Show that a curve may be obtained from its affine curvature by integration of
$ T = d x slash d sigma, quad T'' = - ov(kappa)(sigma) T. $
Find the curve of the natural equation $ov(kappa)(sigma) = sigma$.
== Solution
Assume that a curve $x(sigma)$ satisfies the above differential equation, by the parametrization in (7-21) we know that
$||x',x''|| = ||T,T'|| = 1$ for all $sigma$.
Next we know from equation (7-23) that
$
  kappa(sigma) = ||x'', x'''|| = ||T', T''|| = ||T', - ov(kappa)(sigma)T|| = -ov(kappa)(sigma)||T', T|| = ov(kappa)(sigma)||T, T'|| = ov(kappa)(sigma).
$
And so indeed $x(sigma)$ has prescribed curvature $ov(kappa)(sigma)$.


// it is hard to see how these two are related but if we set $sigma = 2/3 x^(2/3)$ then we get $(d sigma)/(d x) = 4/9 x^(-1/3)$ and so we can compute
// $
//   x^2 d/(d x) ((d y)/(d sigma) (d sigma)/(d x)) + x ((d y)/(d sigma) (d sigma)/(d x)) + (x^2 - 1/9) y
//   \
//   x^2 d/(d x) ((d y)/(d sigma) 4/9 x^(-1/3)) + x ((d y)/(d sigma) 4/9 x^(-1/3)) + (x^2 - 1/9) y
//   \
//   4/9 x^2 (x^(-1/3) d/(d x)(d y)/(d sigma) + (d y)/(d sigma) (-1/3 x^(-4/3)) ) + 4/9 x^(2/3) (d y)/(d sigma) + (x^2 - 1/9) y
//   \
//   4/9 x^(2) (x^(-1/3) (d sigma)/(d x) d/(d sigma) (d y)/(d sigma) -1/3 (d y)/(d sigma) x^(-4/3) ) + 4/9 x^(2/3) (d y)/(d sigma) + (x^2 - 1/9) y
//   \
//   4/9 x^(5/3) (4/9 x^(-1/3) (d^2 y)/(d sigma^2)) -4/27 x^(2/3) (d y)/(d sigma)  + 4/9 x^(2/3) (d y)/(d sigma) + (x^2 - 1/9) y
// $

