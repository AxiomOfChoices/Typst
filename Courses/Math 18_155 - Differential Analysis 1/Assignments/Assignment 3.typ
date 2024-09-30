#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 3", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#set page(numbering: "1")
#let bar(el) = $overline(#el)$
#set enum(numbering: "a)")

*Sources consulted* \
Classmates: . \
Texts: Class Notes.

= Question
== Statement
Let $Omega$ be a bounded open set in $RR^d$ with $C^infinity$-smooth boundary. Show that
$
  Delta bb(1)_Omega = sum_(i = 1)^d diff_(x_i) dot nu_i d S
$
where $nu$ is the normal to $diff Omega$.
== Solution
Let $phi$ be any smooth test function, then we have
$
  pair(Delta bb(1)_Omega, phi) 
  = sum_(i=1)^d pair(diff_i diff_i bb(1)_Omega, phi)
  = - sum_(i=1)^d pair(diff_i bb(1)_Omega, diff_i phi)
  = sum_(i=1)^d pair(bb(1)_Omega, diff_i diff_i phi)
  = pair(bb(1)_Omega, Delta phi)
  = integral_Omega Delta phi
$
But now we use divergence theorem to get that 
$
  integral_Omega Delta phi = integral_(diff Omega) (nu dot nabla phi) d S = sum integral_(diff Omega) nu_i diff_i phi d S = pair(sum_(i=1)^d diff_(x_i) dot nu_i d S, phi)
$

= Question
== Statement
Solve the system of equations in $D' (RR^n)$:
$
  u dot x_i = 0, quad i = 1,...,n
$
== Solution
I claim that the only solution is $u = c dot delta_0$ for some constant $c$, we prove this by induction. Assume this is true for $d - 1$, then let $phi$ be a test function. Next fix $phi.alt$ to be a bump function on $RR$ with $phi.alt = 1$ on $[-1,1]$ and $phi.alt = 0$ on $[-2,2]^c$. We now define a new test function
$
  psi (x) := phi(x_1,...,x_d) - phi.alt(x_d) phi(x_1,...,x_(d-1),0)
$
which namely satisfies $psi(x) = 0$ if $x_d = 0$. Now $psi(x) / x_d$ is clearly a smooth function everywhere away from $x_d = 0$ and the fact that $psi(x) = 0$ when $x_d = 0$ also gives us that $psi(x) / x_d$ is smooth at $x_d = 0$ so $psi(x) / x_d$ is also a test function.

We now have
$
  pair(u, phi)
  &= pair(u, psi) + pair(u, phi.alt(x_d) phi(x_1,...,x_(d-1), 0))
  \ &= pair(u, x_d psi/x_d) + pair(u, phi.alt(x_d) phi(x_1,...,x_(d-1), 0))
  \ &= pair(underbrace(u x_d, 0), psi/x_d) + pair(u, phi.alt(x_d) phi(x_1,...,x_(d-1), 0))
  \ &= pair(u, phi.alt(x_d) phi(x_1,...,x_(d-1), 0)).
$
We now can define a map $g : C_c^infinity (RR^(d-1)) -> C_c^infinity (RR^d)$ by $g(phi)(x) = phi(x_1,...,x_(d-1)) phi.alt(x_d)$.

Now we can define a distribution $v$ in $D'(RR^(d-1))$ through $pair(v, f) = pair(u, g(f))$ and the calculations above should demonstrate that the behaviour of $u$ is entirely captured in that of $v$. But now clearly $v dot x_i = 0$ for all $i <= d - 1$ so by induction $v = c dot delta_0$, hence we have $u = c dot delta_0$ and so we are done. The base case was covered in class.

= Question
== Statement
Show that $x_+^a - (-x)_+^a -> "P.V" 1/x$ in $D'(RR)$ as $a -> -1 + 0i$.
== Solution
Let $phi$ be a test function and we recall from assignment 1 that we can rewrite
$
  pair(x_+^a - (-x)_+^a, phi) 
  &= 1/(a+1) pair(diff_x (x_+^(a+1) - (-x)_+^(a+1)), phi) 
  \ &= -1/(a+1) integral_(0)^infinity t^(a+1) (phi'(t)- phi'(-t)) d t
  \ &= -1/(a+1) integral_(0)^infinity exp((a+1)ln(t)) (phi'(t) - phi'(-t)) d t
  \ &= -1/(a+1) integral_(0)^infinity (phi'(t) - phi'(-t)) d t
  \ &- integral_(0)^infinity ln(t) (phi'(t) - phi'(-t)) d t
  \ &- integral_(0)^infinity O(a+1) (phi'(t) - phi'(-t)) d t
$
now the first term is equal to $1/(a+1) (phi(0) - phi(0)) = 0$. The third term goes to $0$ as $a+1 -> 0$. The second term is thus the only one which survives the limit and we have
$
  integral_(0)^infinity ln(t) (phi'(t) - phi'(-t)) d t
  &= lim_(epsilon -> 0) integral_(epsilon)^infinity ln(t) (phi'(t) - phi'(-t)) d t
  \ &= lim_(epsilon -> 0) integral_(epsilon)^infinity 1/t (-phi(t) + phi(-t)) d t = -pair("P.V" 1/x, phi)
$
which is precisely the desired result.

