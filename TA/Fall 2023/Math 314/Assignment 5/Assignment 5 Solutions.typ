#import "/Templates/generic.typ": generic
#import "/Templates/question.typ": question_heading
#import "@preview/cetz:0.1.2"
#show: doc => generic(title: "Tutorial 8 Solutions", name: "Jacob Reznikov", doc)
#show: doc => question_heading(doc)
#let curl = $op("curl") thin$
#let vect(symbol) = $upright(bold(symbol))$
#let anglevec(body) = { $lr(angle.l body angle.r)$ } 

= Question 1
== Statement
Let $C$ be the positively oriented square with vertices $(0,0)$, $(3,0)$, $(3,3)$, $(0,3)$. Use Green's Theorem to evaluate the line integral $integral_C 5 y^2 x dif x + 5 x^2 y dif y$.
== Solution 
Positive orientation for curves means that as you walk along the curve the interior of the curve will be on your left. In our case this means the square is walked along in a counter-clockwise fashion.

Since Green's Theorem requires positive orientation we can apply it directly, first let us compute the curl of this vector field.
$
curl(5 y^2 x, 5x^2 y)
=
(diff (5x^2 y))/(diff x) 
-
(diff (5y^2 x))/(diff y)
=
10 x y
-
10 x y
=
0
$
since this is zero we get
$
integral_C 5 y^2 x dif x + 5 x^2 y dif y
=
integral.double_D curl (5 y^2 x, 5x^2 y) dif A
=
integral.double_D 0 dif A
=
0
$
/// 
/// 
/// 
= Question 2
== Statement
Find a parametrization of the curve $x^(2/3) + y^(2/3) = 1$ and use it to find its area.
== Solution 
By looking at the equation of this curve we can quickly see that it is very similar to the equation of a circle, which is $x^2 + y^2 = 1$. Due to the similarity we see that if $x = a^3$ and $y = b^3$ for some $a,b$ then 
$
  x^(2/3) + y^(2/3) = 1 => a^2 + b^2 = 1
$
and so we can parametrize by setting $a = cos(t)$ and $b = sin(t)$ giving us $x = cos^3(t)$ and $y = sin^3(t)$.

By this parametrization we can now find the integral of this 

