#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Midterm", name: "Jacob Reznikov", doc)
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
+ Let $L := span(delta_x, x in RR^n)$ be the space of all finite linear combinations of $delta$-functions. Prove that $L$ is dense in $cal(D)' (RR^n)$.
+ Let $W := span(delta_x - delta_y, x, y in RR^n)$. Is $W$ dense in $cal(D)' (RR^n)$? Is $W$ dense in $ cal(E)' (RR^n)$.
== Solution
+ Using the Wikipedia page for test functions and distributions, we know that $C_c^infinity (RR^n)$ is reflexive, so it is equal to its own bidual. Now assume that $ov(L) != cal(D)'(RR^n)$ then pick some distribution $u$ which is not in $ov(L)$, we can use Hahn-Banach to create a functional on $cal(D)' (RR^n)$ which is zero on $ov(L)$ and non-zero on $u$, using the biduality we thus have a function $f in C_c^infinity (RR^n)$ such that $pair(delta_x, f) = 0$ for all $delta_x$ and also $pair(u, f)$ for some non-zero $u$. But this is clearly impossible so $ov(L) = cal(D)'(RR^n)$.
// + First set $V := span(diff^alpha delta_x, x in RR^n)$, we prove that $L$ is dense in $V$. To see this we notice that $ov(L)$ is translation invariant, because $L$ is translation invariant. Then $ov(L)$ is also closed under taking derivatives, to see this, let $u in ov(L)$ be arbitrary, then we have that $tau_(x e_i) u in ov(L)$, and so
//   $
//     (u - tau_(h e_i) u)/h in ov(L)
//   $
//     for all $h > 0$. Now we also find that for any $phi in C_c^infinity (RR^n)$ we get
//   $
//     pair((u - tau_(h e_i) u)/h, phi) =
//     pair((u - tau_(h e_i) u), phi/h) =
//     pair(u, (phi - tau_(-h e_i) phi)/h)
//   $
//   and now taking the limit we get that in a weak sense
//   $
//     lim_(h -> 0) ((u - tau_(h e_i) u)/h) = diff_i u,
//   $
//   and so since the limit is clearly in $ov(L)$ then this set is closed under differentiation.
//
//   This set hence clearly contains $V$, and so $L$ is dense in $V$. Next we show that $V$ is dense in $cal(D)'_C (RR^n)$, the space of compactly supported distributions. To see this we can use Riesz-Markov-Kakutani theorem, let $u$ be an arbitrary element of $cal(D)'_C (RR^n)$, then we know that we can write
//   $
//     pair(u, phi)
//     = sum_(abs(alpha) <= N) integral_K D^alpha phi d mu_alpha
//   $
//   and so it is enough to approximate these measures. For each $alpha$ we have
//   $
//
//   $
//
