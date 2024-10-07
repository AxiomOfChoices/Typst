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
 
