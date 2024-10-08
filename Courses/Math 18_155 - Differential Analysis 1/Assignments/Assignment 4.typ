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
Assume that $X$ is a closed set in $RR^n$ and $K$ is a compact set in $RR^n$. Show that $X + K := { x + y : x in X, y in K}$ is closed.
== Solution
Let $z_n$ be a converging sequence of points in $X + K$ with limit $z$, then we write $z_n = x_n + y_n$ for some sequences of points $x_n in X, y_n in K$. But now $y_n$ has some convergent subsequence $y_(n_k) -> y$ with $y in K$ because $K$ is compact, so since $z_(n_k) -> z$ we get that $x_(n_k) -> x$ for some $x$. Closedness of $X$ then guarantees that $x in X$ so since $z = x + y$ we get that $z in X + K$ and so $X + K$ is closed.

= Question
== Statement
Show that if $u in cal(E)'(RR^n)$ and $phi in C^infinity (RR^n)$ then $supp u * phi seq supp u + supp phi$. 
== Solution
Using the previous question we know that $supp u + supp phi$ is a closed set, so fix some point $x$ not in $supp u + supp phi$ and let $B_r (x)$ be some open neighborhood of it that does not intersect $supp u + supp phi$.

Now let $psi in C_c^infinity (B_r (x))$ be any test function supported in $B_r (x)$, we have
$
  pair(u * phi, psi) = pair(u times.circle phi, psi(x+y))
$
but then we have
$
  pair(u times.circle phi, psi(x + y))
  = pair(u, integral_(RR^n) phi(x) psi(x + y) d y)
$
but now this integral can only be non-zero if $x in supp phi$ and $x + y in supp psi$ for some $x$, or otherwise said, $y in (-supp phi) + supp psi = -supp phi + B_r (x)$ where $- supp phi = {- z : z in supp phi}$. But now notice that $(- supp phi) + supp psi$ cannot intersect $supp u$ since then we would have $supp u + supp phi$ intersect $B_r (x)$. Hence we get
$
  pair(u times.circle phi, psi(x + y))
$
and so we have showed that $x in.not supp u * phi$.

= Question
== Statement
If $u in cal(D)'(RR^n)$ and $phi,psi in C_c^infinity (RR^n)$, then
$
  (u * phi) * psi = u * (phi * psi)
$
== Solution
By definition for any test function
$
  pair((u * phi) * psi,  eta)
  =
  pair((u * phi), integral_(RR^n) phi(x) eta(y + x) d x) 
  =
  pair(u * phi, ov(psi) * eta)
$
where $ov(phi)(x) = phi(-x)$.
Now we continue this calculation
$
  pair(u * phi, ov(psi) * eta)
  =
  pair(u, ov(phi) * (ov(psi) * eta))
$ 
then as we saw in class we know that for $C_c^infinity$ functions we always have $phi * (psi * eta) = (phi * psi) * eta$, so we have
$
  pair(u, ov(phi) * (ov(psi) * eta))
  =
  pair(u, (ov(phi) * ov(psi)) * eta)
$
now we have
$
  (ov(phi) * ov(psi))(x)
  &=
  integral_(RR^n) ov(phi)(y) ov(psi)(x-y) d y
  =
  integral_(RR^n) phi(-y) psi(y-x) d y
  =
  integral_(RR^n) phi(y) psi(-y-x) d y
  \ &= 
  (phi * psi)(-x) = ov(phi * psi)(x)
$
so we have
$
  pair(u, ov(phi) * (ov(psi) * eta))
  =
  pair(u, ov(phi * psi) * eta)
  =
  pair(u * (phi * psi), eta)
$
so since this is true for any test function $eta$ we have $(u * phi) * psi = u * (phi * psi)$.
 
= Question
== Statement
Let $U seq RR^n, V seq RR^m, W seq RR^ell$, and let $u in cal(D)'(U), v in cal(D)'(V), w in cal(D)'(W)$
+ $supp (u times.circle v) = supp u times supp v$.
+ If $u_k -> u$ in $cal(D)'(U)$ and $v_k -> v$ in $cal(D)'(V)$, then $u_k times.circle v_k -> u times.circle v$ in $cal(D)'(U times V)$.
+ $diff_(x_j) (u times.circle v) = (diff_(x_j) u) times.circle v$ and $diff_(y_j) (u times.circle v) = u times.circle (diff_(y_j) v)$.
== Solution
+ Let $(x,y) in.not supp u times supp v$, then either $x in.not supp u$ or $y in.not supp v$. In the first case, we find neighborhood $U'$ such that $u|_(U') = 0$, and we get for any $phi in C_c^infinity (U' times V)$,
  $
    pair(u times.circle v, phi) = pair(u, v(phi)(x)) 
  $
  but $v(phi)(x)$ can only be non-zero at the $x$ for which $phi(x,y)$ is a non-zero function of $y$ which means $supp (v(phi)) seq U'$ and thus 
  $
    pair(u, v(phi)(x)) = 0.
  $
  Similarly in the second case, we can find a neighborhood $V'$ such that $v|_(V') = 0$, and we get for any $phi in C_c^infinity (U times V')$ that
  $
    pair(u times.circle v, phi) = pair(u, v(phi)(x))
  $
  but $supp phi(x,y) seq V'$ for any fixed $x$ so $v(phi)$ is always zero and thus
  $
    pair(u, v(phi)(x)) = 0.
  $
  In either case $(x,y) in.not supp (u times.circle v)$.

  On the other hand, assume that $(x,y) in supp u times supp v$, then take any neighborhood $U' times V'$ of $(x,y)$. By assumption there exists some test function $phi in C_c^infinity (U')$ such that $pair(u, phi) != 0$, similarly there exists some test function $psi in C_c^infinity (V')$ such that $pair(v, psi) != 0$. We thus have
  $
    pair(u times.circle v, phi(x) psi(y))
    =
    pair(u, v(phi(x) psi(y)))
    =
    pair(u, phi(x) v(psi(y)))
    =
    pair(u, phi) pair(v, psi)
    != 0
  $
  and so $(x,y) in supp (u times.circle v)$.
+ We simply compute for any $phi in C_c^infinity (U times V)$,
  $
    pair(u_k times.circle v_k - u times.circle v, phi)
    =
    pair(u_k times.circle v_k - u_k times.circle v + u_k times.circle v - u times.circle v, phi)
  $
  now we can split this into two terms, first we have
  $
    pair(u_k times.circle v - u times.circle v, phi)
    =
    pair(u_k - u, pair(v, phi)) -> 0
  $
  since $u_k -> u$. Next we have
  $
    pair(u_k times.circle v_k - u_k times.circle v, phi)
    =
    pair(u_k, pair((v_k - v)(y), phi(x,y)))
  $
  now by uniform boundedness principle (see Theorem 4.16 in Dyatlov's notes) we have that there exists a constant $C$ and an integer $N$ such that
  $
    abs(pair(u_k, pair((v_k - v)(y), phi(x,y)))) 
    <= C norm(pair((v_k - v)(y), phi(x,y)))_(C^N)
  $
  but we know by definition that $pair((v_k - v)(y), phi(x,y)) -> 0$ in $C_c^infinity (U)$ so 
  $
    pair(u_k, pair((v_k - v)(y), phi(x,y))) -> 0
  $
+ Finally we can compute
  $
    pair(diff_(x_j) (u times.circle v), phi)
    &=
    - pair((u times.circle v), diff_(x_j) phi)
    =
    - pair(u, pair(v(y), diff_(x_j) phi(x,y)))
    \ &=
    - pair(u, diff_(x_j) pair(v(y), phi(x,y)))
    = 
    pair(diff_(x_j) u,pair(v(y), phi(x,y)))
    \ &= 
    pair(diff_(x_j) u times.circle v, phi)
  $
  where the important step was $pair(v(y), diff_(x_j) phi(x,y)) = diff_(x_j) pair(v(y), phi(x,y))$ which is true because we saw in class that partial pairing with a distribution does not affect derivatives in the other variables.
  Similarly we also get
  $
    pair(diff_(y_j) (u times.circle v), phi)
    &=
    - pair((u times.circle v), diff_(y_j) phi)
    =
    - pair(u, pair(v(y), diff_(y_j) phi(x,y)))
    \ &=
    pair(u, pair(diff_(y_j) v(y), phi(x,y)))
    =
    pair(u times.circle diff_(y_j) v, phi).
  $
  which finishes the proof.
