
#import "/Templates/generic.typ": latex, header
#import "/Templates/question.typ": question_heading
#import "@preview/cetz:0.1.2"
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: latex
#let ve = $epsilon$
#let ip(..x) = $lr(angle.l #x.pos().join(",") angle.r)$

Let $i <= n$, we define the following charts $(U_i, phi_i)$ on $CC P^n$ where
$
U_j = {[z_1,...,z_(n+1)] in CC P^n | z_i eq.not 0}
$
for any element $z in U_j$ we write it as
$
z = [z_1 / z_j,...,1,...,z_n / z_j] = [
  x_1 + i y_1, ...,x_(i-1) + i y_(i-1), x_(i+1) + i y_(i-1),...,x_n+i y_n
]
$
then we set
$
phi_i(z) = (x_1, y_1, ..., x_n, y_n) in RR^(2n)
$
