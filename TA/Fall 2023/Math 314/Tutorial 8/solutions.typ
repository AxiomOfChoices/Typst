#import "../../../../Templates/generic.typ": generic
#import "../../../../Templates/question.typ": question_heading
#show: doc => generic(title: "Tutorial 8 Solutions", name: "Jacob Reznikov", doc)
#show: doc => question_heading(doc)
#let ve = $epsilon$
#let vect(symbol) = { [#math.upright(math.bold(symbol))] } 

= Question 1
== Statement
Evaluate the following line integrals
- $integral_C y dif s$ where $C : x = t^2, y = 2t, 0 <= t <= 3$.
- $integral_C x y^4 dif s$ where $C$ is the right half of the circle $x^2 + y^2 = 16$.
- $integral_C (x^2 y + sin x) dif y$, where $C$ is the arc of the parabola $y = x^2$ from $(0,0)$ to $(pi, pi^2)$.
== Solution
- First we need to calculate the length element $dif s$. We use the formula 
  $ dif s 
  = sqrt( ((diff x)/(diff t))^2 + ((diff y)/(diff t))^2 ) dif t 
  = sqrt((2t)^2 + (2)^2) dif t 
  = 2 sqrt(1 + t^2) dif t $ 
  we then can compute the integral 
  $ 
  integral_C y dif s 
  = integral_0^3 2t (2 sqrt(1 + t^2)) dif t 
  = integral_1^10 2 sqrt(u) dif u 
  = [ 4/3 u^(2/3) ]^10_1 
  = 4/3 (10 sqrt(10) - 1) 
  $
- First thing we want to do is to parametrize the circle, this is almost always done with polar coordinates with $r$ fixed, for us this will be $x = 4 cos(t), y = 4 sin(t)$. Now the whole circle is given by $0 <= t <= 2pi$, but since we only want the right part we will instead want $-pi/2 <= t <= pi/2$. 
  With this parametrization we get that 
  $ 
    dif s = sqrt( ((diff x)/(diff t))^2 + ((diff y)/(diff t))^2 ) dif t 
    = sqrt((4 cos t)^2 + (4 sin t)^2) dif t 
    = 4 dif t 
  $
  and so we can compute
  $
    integral_C x y^4 dif s 
    = integral_(-pi/2)^(pi/2) 4 cos(t) (4 sin(t))^4 4 dif t 
    = 4^6 integral_(-1)^(1) u^4 dif u
    = (2 dot 4^6)/5 
  $ 
#pagebreak(weak: true)
- This time our parametrization is easy since we can simply use $x = t, y = t^2$. Note that our integration now is with respect to $dif y$ which we compute to be 
  $
    dif y = (diff y)/(diff t) dif t 
    = 2t dif t
  $
  This then gives us 
  $
    integral_0^pi ((t)^2 (t^2) + sin t) 2t dif t
    &=
    2 integral_0^pi t^5 + t sin t dif t
    =
    1/3 pi^6 + 2 integral_0^pi t sin t dif t
    \ &=
    1/3 pi^6 + 2 [t (-cos t)]^pi_0 - 2 integral_0^pi (- cos t) dif t 
    \ &=
    1/3 pi^6 + 2 pi
  $

= Question 2
== Statement
Evaluate the following line integrals
- $integral_C y^2 z dif s$, where $C$ is the line segment from $(3,0,2)$ to $(1,2,5)$.
- $integral_C x y e^(y z) dif y$, where $C: x = t, y = t^2, z = t^3, 0 <= t <= 1$.
- $integral_C z dif x + x y dif y + y^2 dif z$, where $C: x = sin(t), y = cos(t), z = tan(t), -pi/4 <= t <= pi / 4$
== Solution
- Our first job is to parametrize the line segment, for line segments there is a nice formula and it is $ (3,0,2) (1-t) + (1,2,5) t = (3 - 2t, 2t, 2 + 3t) $ with $0 <= t <= 1$.
  This then gives us 
  $ 
    dif s 
    = sqrt(
      ((diff x)/(diff t))^2 
      + 
      ((diff y)/(diff t))^2 
      + 
      ((diff z)/(diff t))^2 
    ) dif t
    = sqrt(
      (-2)^2 
      + 
      (2)^2 
      + 
      (3)^2 
    ) dif t
    = sqrt(
      17
    ) dif t
  $
  and so we can compute 
  $
    sqrt(17) integral_0^1 (2t)^2 (2 + 3t) dif t
    &=
    sqrt(17) integral_0^1 8t^2 + 12t^3 dif t
    =
    sqrt(17) [8/3 t^3 + 3t^4]^1_0
    \ &=
    sqrt(17) [8/3 + 3] 
    = (17sqrt(17))/3
  $
- Here our parametrization is given and the integral is with respect to $dif y$ and so we calculate 
  $
    dif y = 
    (diff y)/(diff t) dif t = 
    2 t dif t
  $
  which then lets us compute 
  $
    integral_0^1 t^3 e^(t^5) 2t dif t 
    =
    2/5 integral_0^1 e^u dif u 
    =
    2/5 (e - 1)
  $
- Again the parametrization is given and so we simply compute
  $
    dif x = cos(t) dif t, quad
    dif y = - sin(t) dif t, quad 
    dif z = sec^2(t) dif t
  $
  this then gives us 
  $
    integral_(-pi/4)^(pi/4) (tan(t) cos(t) - sin^2(t) cos(t) + cos^2(t) sec^2(t)) dif t
  $
  and so after simplifying we get 
  $
    integral_(-pi/4)^(pi/4) (sin(t) - sin^2(t) cos(t) + 1) dif t
  $
  we split this integral up into 3 parts and we get 
  $
    integral_(-pi/4)^(pi/4) 1 dif t = pi/2
    quad quad
    integral_(-pi/4)^(pi/4) sin(t) dif t 
    =
    0
    quad quad 
    integral_(-pi/4)^(pi/4) sin^2(t) cos(t) dif t
    =
    integral_(-sqrt(2)/2)^(sqrt(2)/2) u^2 dif u
    =
    1/(3 sqrt(2))
  $
  giving us 
  $
    pi/2 + 1/(3 sqrt(2))
  $

#pagebreak(weak: true);
= Question 3
== Statement
Evaluate the line integral $integral_C F dot dif r$ (there were some typos here in the original questions).
- $F(x,y) = x y^2 vect(i) - x^2 vect(j)$ where $C$ is the curve $r(t) = t^3 vect(i) + t^2 vect(j), 0 <= t <= 1$.
- $F(x,y,z) = sin x vect(i) + cos y vect(j) + x z vect(k)$ where $C$ is the curve #linebreak() $r(t) = t^3 vect(i) - t^2 vect(j) + t vect(k), 0 <= t <= 1$.
- $F(x,y,z) = x z vect(i) + z^3 vect(j) + y vect(k)$ where $C$ is the curve $r(t) = e^t vect(i) - e^(2t) vect(j) + e^(-t) vect(k), -1 <= t <= 1$.
== Solution
- First we will compute the velocity of $C$, 
  $
    (diff r)/(diff t) = (3t^2, 2t)
  $
  and we also have
  $
    F(x(t),y(t)) = (t^5, -t^6)
  $
  and so we can compute
  $
    integral_C F dot dif r 
    =
    integral_0^1 (3t^2, 2t) dot (t^5, -t^6) dif t
    =
    integral_0^1 (3t^7 - 2t^7) dif t
    =
    1/8
  $
- Again we first compute the velocity of $C$,
  $
    (diff r)/(diff t) 
    =
    (3t^2, -2t, 1)
  $
  as well as 
  $
    F(x(t),y(t),z(t))
    =
    sin (t^3) vect(i) + cos(t^2) vect(j) + t^4 vect(k)
  $
  giving us 
  $
    integral_0^1 sin(t^3) 3t^2 - cos(t^2) 2t + t^4 dif t
    &=
    integral_0^1 sin(u) dif u 
    -
    integral_0^1 cos(u) dif u 
    +
    integral_0^1 t^4 dif t 
    \ &= 
    1 - cos(1) - sin(1) + 1/5 
    \ &= 
    6/5 - cos(1) - sin(1) 
  $
- Finally we one agian compute the velocity of $C$,
  $
    (diff r)/(diff t) 
    =
    (e^t, 2e^(2t), -e^(-t))
  $
  and also get
  $
    F(x(t),y(t),z(t))
    =
    1 vect(i) + e^(-3t) vect(j) + e^(2t) vect(k)
  $
  giving us 
  $
    integral_(-1)^1 
    e^t + 2 e^(-t) - e^t 
    dif t
    =
    integral_(-1)^1 
    2 e^(-t)
    dif t
    = 2(e^1 - e^(-1))
  $