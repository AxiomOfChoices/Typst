#import "../../../../Templates/generic.typ": generic
#import "../../../../Templates/question.typ": question_heading
#import "@preview/cetz:0.1.2"
#show: doc => generic(title: "Tutorial 8 Solutions", name: "Jacob Reznikov", doc)
#show: doc => question_heading(doc)
#let ve = $epsilon$
#let curl = math.op("curl")
#let vect(symbol) = $upright(bold(symbol))$
#let anglevec(body) = { $lr(angle.l body angle.r)$ } 


= Question 1
== Statement
Determine whether or not $F$ is a conservative vector field, if it is find its potential function.
+ $F(x,y) = (x y + y^2) vect(i) + (x^2 + 2 x y) vect(j)$ 
+ $F(x,y) = y e^x vect(i) + (e^x + e^y)vect(j)$ 
+ $F(x,y) = (y e^x + sin y) vect(i) + (e^x + x cos y)vect(j)$ 
== Solution
Finding whether $F$ is conservative is quite straight forward as long as the vector field is defined on all of $RR^2$/$RR^3$, we simply check that its curl is zero. (Note that this means we cannot have any division by zero or other undefined operations anywhere else in the definition of the vector field as that means the vector field won't be defined there).

The curl for a 2 dimensional vector field is quite simple, we think of it as alternating the derivatives and the terms. Visually what I like to do is place the elements of the vector field and the partial derivatives in a column, and then alternate. 

That is 
$
#cetz.canvas({
  import cetz.draw: *
  content((0,0), anchor: "right", [$ diff / (diff x) quad $])
  content((0,-1.5), anchor: "right", [$ diff / (diff y) quad $])
  content((2,0), anchor: "left", [$ quad F_1(x,y) $])
  content((2,-1.5), anchor: "left", [$ quad F_2(x,y) $])
  line((0,0), (2,-1.5))
  line((2,0), (0,-1.5))
})
=
(diff F_2(x,y))/(diff x)
-
(diff F_1(x,y))/(diff y)
$
where $F_1,F_2$ denote the first and second components of the vector field respectively.
////
////
+ Using the formula for a curl we have 
  $
  (diff (x^2 + 2 x y))/(diff x)
  -
  (diff (x y + y^2))/(diff y)
  =
  2x + 2y
  -
  (x + 2y)
  =
  x
  $
  and so the curl is non-zero, and so this is not a conservative vector field. 
////
////
+ Using the formula for a curl we have 
  $
  (diff (e^x + e^y))/(diff x)
  -
  (diff (y e^x))/(diff y)
  =
  e^x
  -
  e^x
  =
  0
  $
  and so the curl is zero, and so this is a conservative vector field. 
  To find the potential let us assume that 
  $
    nabla f = F = (y e^x, e^x + e^y)
  $
  then we must have 
  $
    (diff f)/(diff x) = y e^x
  $
  and so we must have
  $
    f = y e^x + g(y)
  $
  since the antiderivative of $y e^x$ in $x$ is $y e^x + C$ and the constant $C$ can depend on $y$. Next to find $g(y)$ we check the other component, one one hand we have
  $
    (diff f)/(diff y) = e^x + g'(y)
  $
  and on the other hand we have
  $
    (diff f)/(diff y) = F_2(x,y) = e^x + e^y
  $
  and so we must have $e^y = g'(y)$ and thus $g(y) = e^y + C$.
  Thus our potential function is $f = y e^x + e^y + C$ where $C$ is any constant.
////
////
+ Again, first we check that it is conservative, 
  $
  (diff (e^x + x cos y))/(diff x)
  -
  (diff (y e^x + sin y))/(diff y)
  =
  e^x cos y
  -
  e^x cos y
  =
  0
  $
  and so the curl is zero and so it is conservative. 
  To find the potential let us assume that 
  $
    nabla f = F = (y e^x + sin y, e^x + x cos y)
  $
  then we must have 
  $
    (diff f)/(diff x) = y e^x + sin y
  $
  and so we must have
  $
    f = y e^x + x sin y + g(y).
  $
  Next to find $g(y)$ we check the other component, one one hand we have
  $
    (diff f)/(diff y) = e^x + x cos y + g'(y)
  $
  and on the other hand we have
  $
    (diff f)/(diff y) = e^x + x cos y
  $
  and so we must have $0 = g'(y)$ and thus $g(y) = C$.
  Thus our potential function is $f = y e^x + x sin y + C$ where $C$ is any constant.
= Question 2
== Statement
Find a function $f$ such that $F = nabla f$ and use it to evaluate the integral $integral_C F dot dif r$ along the given curve $C$.
+ $F(x,y) = #anglevec()[$2x, 4y$]$ and $C$ is the arc of the parabola $x = y^2$ from $(4,-2)$ to $(1,1)$. 
+ $F(x,y) = (1 + x y)e^(x y) vect(i) + x^2 e^(x y) vect(j)$ and $C : r(t) = cos(t) vect(i) + 2 sin(t) vect(j) quad 0 <= t <= pi/2$.
+ $F(x,y,z) = (y^2 z + 2x z^2) vect(i) + 2x y z vect(j) + (x y^2 + 2x^2 z) vect(k)$  and $C : x = sqrt(t)$, $y = t + 1$,#linebreak() $z = t^2$ where $0 <= t <= 1$.
== Solution
For this question we repeat the same procedure that we for the previous question except we don't need to check that the vector field is conservative now since the question already gives us that. Then once we have the potential function we simply evaluate it at the two end points.
+ By the same method as above we get that
  $
    f(x,y) = x^2 + g(y)
  $
  and then that $g(y) = 2y^2 + C$ and so 
  $
    f(x,y) = x^2 + 2y^2 + C.
  $
  Since $C$ can be anything, and because we want our life to be easier, we will chose it to be $0$.
  The two end points are given in the question so we just evaluate
  $
    integral F dot dif r = f(1,1) - f(4,-2) = 1 + 2 - (16 + 8) = #(1 + 2 - (16 + 8)).
  $
////
////
+ Again using the same method we get 
  $
    f(x,y) = x e^(x y) + g(y)
  "and then"
  g(y) = C
  $
  and again we choose $C = 0$ leaving us with just $f(x,y) = x e^(x y)$. The endpoints are not given this time, we must instead calculate them, but this is fairly easy, 
  $
    a = r(0) = 1 vect(i) "and" 
    b = r(π/2) = 2 vect(j)
  $
  which gives us 
  $
    integral_C F dot dif r = f(b) - f(a) 
    = 0 - 1 e^(0) = - 1
  $
////
////
+ Finally for 3 dimensions we do the exact same procedure except that finding the potential function is a little bit more complicated.
  First from integrating the second component we find that
  $
    f(x,y,z) = x y^2 z + x^2 z^2 + g(y,z)
  $
  then from the second one we find that
  $
    g(y,z) = h(z)
  $
  and from the last one we find that $h(z) = C$ for some constant $C$. Again we choose $C = 0$. Now the two points are calculated as
  $
    a = (sqrt(0), 0 + 1, 0^2) = (0,1,0) "and"
    b = (sqrt(1), 1 + 1, 1^2) = (1,2,1)
  $
  and so we have
  $
    f(b) - f(a) = (0 + 0) - (4 + 1) = -5
  $
= Question 3
== Statement
Use green's theorem to evaluate the line integral along the given positively oriented curve.
+ $integral_C y e^x dif x + 2 e^x dif y$, $C$ is the rectangle with vertices $(0, 0)$, $(3, 0)$, $(3, 4)$ and $(0, 4)$.
+ $integral_C x^2 y^2 dif x + y tan^(-1) y dif y$, $C$ is the triangle with vertices $(0, 0)$, $(1, 0)$ and $(1, 3)$.
+ $integral_C (x^2 + y^2) dif x + (x^2 - y^2) dif y$, $C$ is the triangle with vertices $(0, 0)$, $(2, 1)$ and $(0, 1)$.
== Solution
Green's theorem is quite simple in concept, it allows us to convert from line integrals to region integrals. It looks like this
$
  integral_(diff D) F dot dif r = 
  integral.double_D curl F dif A
$
The first thing we do when we have a Green's theorem question like this is to identify the region of integration. Once that is done the rest is easy.
+ Here identifying the region is easy since it is just the rectangle itself. We now need to calculate the curl 
  $
    curl thin (y e^x, 2 e^x) 
    =
    (diff (2 e^x)) / (diff x) 
    -
    (diff (y e^x)) / (diff y)
    =
    2 e^x 
    -
    e^x 
    =
    e^x 
  $
  and using this we get that 
  $
    integral_C y e^x dif x + 2 e^x dif y 
    =
    integral.double_R e^x dif A 
    =
    integral_0^3 integral_0^4 e^x dif y dif x
    =
    integral_0^3 4 e^x dif x 
    =
    4 (e^3 - 1)
  $
+ For a triangle the region is a bit trickier, but one can check that it can be written as the set
  $
    { 
      (x, y) | 
      0 <= x <= 1,
      0 <= y <= 3x
    }.
  $
  The curl is calculated as usual
  $
    curl thin (x^2 y^2, y tan^(-1) y)
    =
    (diff (y tan^(-1) y))/(diff x)
    -
    (diff (x^2 y^2))/(diff y)
    =
    0 
    -
    2 x^2 y
    =
    -2x^2 y
  $
  which gives us 
  $
    integral_C x^2 y^2 dif x + y tan^(-1) y dif y
    &=
    integral.double_R -2x^2 y dif A
    =
    -2 integral_0^1 integral_0^(3x) x^2 y dif y dif x
    \ &=
    - integral_0^1 x^2 [y^2]^(3x)_0 dif x 
    =
    - 9 integral_0^1 x^4 dif x 
    \ &=
    - 9 [1/5 x^5]^1_0
    = -9/5
  $
+ Again after some working out the region of integration can be written as 
  $
    { 
      (x, y) | 
      0 <= x <= 2,
      0 <= y <= 1/2x
    }.
  $
  and the curl can be found to be 
  $
    curl thin (x^2 - y^2, x^2 + y^2)
    =
    (diff (x^2 + y^2))/(diff x)
    -
    (diff (x^2 - y^2))/(diff y)
    =
    2x
    -
    (-2y)
    =
    2x + 2y
  $
  and so we can compute 
  $
    integral_C (x^2 - y^2) dif x + (x^2 + y^2) dif y
    &=
    integral.double_R 2x + 2y dif A
    =
    2 integral_0^2 integral_0^(1/2 x) 2x + 2y dif y dif x
    \ &=
    2 integral_0^1 [2x y + y^2]^(1/2 x)_0 dif x 
    =
    2 integral_0^1 5/4 x^2 dif x 
    \ &=
    5/2 [1/3 x^3]^1_0
    = 5/6
  $