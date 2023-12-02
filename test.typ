#import "generic.typ": generic
#import "question.typ": question_heading
#import "@preview/metro:0.1.0": unit, units, prefixes
#import units: gram, metre, second
#import prefixes: kilo, centi
#show: doc => generic(title: "Midterm Solutions", name: "Jacob Reznikov", question_heading(doc))
#let ve = $epsilon$

= Question 1
== Statement
Consider a physical system in which a rocket's total energy is constant, given by 
$ E = 1/2 m v^2 e^(k m v) $
where $m$ is the mass of the rocket, $v$ is its velocity, and $k$ is a constant equal to $4 unit(second/ kilo gram / metre)$.

Assume that at a certain snapshot in time, $t = 0$, we measure the mass of the rocket to be $1 unit(kilo gram)$, its velocity to be $1 unit(metre/second)$ and its acceleration to be $(diff v)/(diff t) |_(t=0) = 5 unit(metre/second^2)$. Determine the rate at which it is losing mass, in other words, what is $(diff m)/(diff t) |_(t=0)$?
#v(10pt)
(a) $-4 unit(kilo gram / second)$
#h(1fr)
(b) $-5 unit(kilo gram / second)$
#h(1fr)
(c) $-6 unit(kilo gram / second)$
#h(1fr)
(d) $-7 unit(kilo gram / second)$
#h(1fr)
(e) None of the above
== Solution 
This is an implicit differentiation question since we are solving for the change of one variable when some implicit equation of them holds.
Since $E$ is constant we have that 
$ 
0 
&= (diff E)/(diff t) = (diff)/(diff t) 1/2 m v^2 e^(k m v) 
\ &= 1/2 v^2 e^(k m v) (diff m)/(diff t) 
+ m v e^(k m v) (diff v)/(diff t)  
+ 1/2 m v^2 e^(k m v) (k v) (diff m)/(diff t) 
+ 1/2 m v^2 e^(k m v) (k m) (diff v)/(diff t) 
\ &= (1 + m k v)1/2 v^2 e^(k m v) (diff m)/(diff t) 
+ (2 + m k v) 1/2 m v e^(k m v) (diff v)/(diff t)  
$
We now have the values at $t = 0$ of all variables here except the one we want to know. We thus get 
$
  0 &= (1 + 4)1/2  e^(4) (diff m)/(diff t) unit(m^2 / s^2)
+ (2 + 4) 1/2 e^(4) (5) unit(kilo gram m^2 / s^3)
\ &= 5 (diff m)/(diff t) +
30 unit(kilo gram / s)
$
giving us $(diff m)/(diff t) = -6 unit(kilo gram / s)$


#pagebreak(weak: true)
= Question 2
== Statement
Consider the region $R = { (x, y) | x^2 + y^2 <= 1 }$. For which of the following functions is the point (0.8, 0.6) an absolute maximum over $R$?

$"(a)" f(x,y) = x^3 - x + y "(b)" f(x,y) = (4x + 3y - 1)^2 "(c)" f(x,y) =  e^(x y) "(d)" f(x,y) =\ 4x + 3y "(e) none of the above"$ 
== Solution
This one was the hardest question for the most students, the key is that the the point is on the boundary of $R$ and so we can immediately use Lagrange multipliers to eliminate some options. 

The gradient of the constraint function is easily seen to be $(2x,2y) = (1.6, 1.2)$ and so we need to compute the gradients of the options, these are 
$ 
nabla(x^3 - x + y) &= (3(0.8)^2 - 1, 1) = (1.92, 1) \
nabla((4x + 3y - 1)^2) &= 2(4 dot (0.8) + 3 dot (0.6) - 1) (4,3)= (32, 24) \
nabla(e^(x y)) &= e^(0.8 dot 0.6) (0.6, 0.8) \
nabla(4x + 3y) &= (4,3) 
$
We can quickly see that both options (a) and (c) cannot be correct since the gradient is not colinear with $(1.6,1.2)$. Options $(b)$ and $(d)$ are both on the table. We now explicitly use Lagrange multipliers on those two options. Let us first try for (b), this gives us 
$ lambda (2x,2y) = 2(4x + 3y - 1)(4, 3) $ which then 
gives us
$ 
  lambda x = 16x + 12y - 4, quad 
  lambda y = 12x + 9 y - 3
$
we can multiply the left equation by 3 and the right equation by 4 and then subtract to get 
$
  3 lambda x - 4 lambda y = 0
$
and so $(x,y)$ must lie on the line $y = 3/4 x$. Since it must also be on the circle $x^2 + y^2 = 1$ and so that leaves us with the points $(-0.8,-0.6)$ as well as $(0.8, 0.6)$. We notice that the value at $(-0.8,-0.6)$ is $36$ which is higher than the value at $(0.8, 0.6)$ which is $16$ so $(0.8, 0.6)$ this is not true for (b).
#pagebreak(weak: true)
Next we have (d), we get 
$ lambda (2x, 2y) = (4,3) $
and so we again have that $(x,y)$ lies on the line $y = 3/4 x$. We then get that the points are again $(-0.8,-0.6)$ and $(0.8, 0.6)$.

But now the value at $(-0.8, -0.6)$ is $-5$ and the value at $(0.8, 0.6)$ is $5$ and so it could be a maximum. All that remains to check is that there are no other critical points in the interior of $R$. But this is immediate from the fact that the gradient $(4,3)$ is never zero and so we get that (d) is the right answer.

= Question 3
== Statement 
Consider the triangle $T$ with corners $(0,0), (0,2), (4,0)$ and constant density function $1$. Which point is its center of mass?
#v(10pt)
(a) $(1,2/3)$
#h(1fr)
(b) $(4/3,2/3)$
#h(1fr)
(c) $(4/3,1/2)$
#h(1fr)
(d) $(1,1/2)$
#h(1fr)
(e) None of the above

== Solution

First let us compute the mass of the triangle, we can easily find that the region enclosed by the triangle is given by $T = { (x,y) |  0 <= x <= 4,0 <= y <= 2 - x/2}$
$
  integral_0^4 integral_0^(2-x/2) 1 dif y dif x 
  = 
  integral_0^4 (2 - x/2) dif x
  =
  [2x - x^2/4]^4_0
  =
  8 - 4
  =
  4
$
Next we want to calculate all the moments of the triangle $T$
$
  integral_0^4 integral_0^(2-x/2) x dif y dif x
  =
  integral_0^4 x(2 - x/2) dif x
  =
  [x^2 - x^3/6]^4_0 = 16 - 32/3 = 16/3 
$
and also
$
  integral_0^4 integral_0^(2-x/2) y dif y dif x
  &=
  integral_0^4 1/2(2 - x/2)^2 dif x
  =
  integral_0^4 2 - x + x^2/8 dif x
  \ &=
  [2x - x^2/2 + x^3/24]^4_0 = 8 - 8 + 8/3
  = 8 / 3
$
So now we divide to get that the center of mass is $(4/3, 2/3)$.

= Question 4
== Statement
In class we found the following estimate $pi <= integral.double_D e^(x^2+y^2) <= e pi$ where $D$ is the region $D = { (x,y) | x^2 + y^2 <= 1 }$. Compute the exact value of this integral. The answer is 
#v(10pt)
(a) $pi (e - 1)$
#h(1fr)
(b) $2e$
#h(1fr)
(c) $(pi e)/2$
#h(1fr)
(d) $2 pi$
#h(1fr)
(e) None of the above

== Solution
We use polar coordinates to compute this integral
$
  integral_0^(2 pi) integral_0^1 e^(r^2) r dif r dif theta
  =
  integral_0^(2 pi) integral_0^1 1/2 e^(u) dif u dif theta
  =
  integral_0^(2 pi) 1/2 (e - 1) dif u dif theta
  =
  2 pi 1/2 (e-1) = pi (e-1)
$
and so $a$ is the right answer.

= Question 5
== Statement
Find the dimensions of a rectangular tile with maximal area subject to the constraint that the total perimeter of the tile is $64 unit(centi metre^2)$. Please show all your work. (Hint: set this question up as a Lagrange multiper problem).
== Solution
We 

