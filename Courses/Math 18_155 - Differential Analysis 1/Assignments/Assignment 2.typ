#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 2", name: "Jacob Reznikov", doc)
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
Let $u,v in D'(RR^n)$.
+ Show that $supp (u + v) seq supp (u) union supp (v)$.
+ If $u_k -> u$ in $D' (RR^n)$ then $supp (u)$ is a subset of the closure of $union.big_(k=1)^infinity supp (u_k)$.
== Solution
+ Let $x in.not supp u union supp v$, then since $x in.not supp u$ we have for some neighborhood $U$, $u|_U = 0$, and since $x in.not supp v$ we have for some other neighborhood $V$, $v|_V = 0$. Now if we consider the open set $U sect V$ then we get
  $
  u|_(U sect V) = 0, quad v|_(U sect V) = 0
  $
  so $(u + v)|_(U sect V) = 0$ and thus $x in.not supp(u + v)$.
+ Let $U^c = overline(union.big_(k=1)^infinity supp (u_k))$, then $U seq RR^n backslash supp (u_k)$ for every $k$, by theorem 4 in Dyatlov's notes we know that $u_k|_(RR^n backslash supp (u_k)) = 0$ so $u_k|_U = 0$ for all $k$. But then for any $f in C_c^infinity (U)$ we have that $pair(u_k, f) = 0$ for all $k$. So by definition of $u_k -> u$ we know that $pair(u,f) = 0$. Thus $supp u seq U^c$ and so we are done.

= Question
== Statement
Prove that for any open set $Omega seq RR^n$ there is a collection of $phi_i in C_c^infinity (Omega)$ such that
+ $sum f_i = 1$ in $Omega$
+ $0 <= f_i <= 1$ in $Omega$.
+ For any compact set $K seq Omega$ we $supp phi_i sect K = nothing$ for all but finitely many $i$.

Use the following outline, write $Omega = union.big_(i = 1)^omega K_i$ where $K_i$ are all compact sets, and $O_i$ open sets satisfying $K_i seq O_i seq K_(i+1)$.
Let $psi_i$ be a cutoff for $K_i$ supported in $O_i$ satisfying
+ $phi_i = 1$ on $K_i$.
+ $0 <= phi_i <= 1$.

Show the following
+ $0 <= psi_(i+1) - psi_i <= 1$ in $Omega$.
+ $psi_(i+1) - psi_i$ in $C_c^infinity (Omega)$.
+ $1 = psi_1 + sum_(i=1)^infinity (psi_(i+1) - psi_i)$ where the sum makes sense as a locally finite sum, also for any compact set $K seq Omega$ there is an $n_k >= 0$ such that $psi_(i+1) - psi_i = 0$ on $K$

== Solution
+ We need to check 3 cases: $x in K_i, x in K_(i+1) backslash K_i, x in.not K_(i+1)$. In the first case we have $psi_i = 1$ and $psi_(i+1) = 1$ so we have $psi_(i+1) - psi_i = 0$. In the second case we have $psi_i <= 1, psi_(i+1) = 1$, so we have $0 <= psi_(i+1) - psi_i <= 1$. In the third case we have $psi_i = 0, psi_(i+1) <= 1$, so we have $0 <= psi_(i+1) - psi_i <= 1$.
+ This is immediate as $psi_i$ and $psi_(i+1)$ are both in $C_c^infinity (Omega)$.
+ Let $K$ be any compact subset of $Omega$, then since $O_i$ are a covering of $K$ there exists a $j$ such that $K seq O_j$, then $K seq K_(j+1)$. But then $psi_(n+1) - psi_n = 0$ on $K$ for each $n >= j+1$ by part a), so we know that the sum is finite. This gives us
  $
  psi_1 + sum_(i=1)^infinity (psi_(i+1) - psi_i)
  = psi_1 + sum_(i=1)^(j+1) (psi_(i+1) - psi_i)
  = psi_(j+1) = 1
  $
  on $K$.

= Question
== Statement
#let norm2(x) = math.abs([#h(-2pt) #math.norm(x) #h(-2pt)])
Set $norm(f)_(C^N (K)) = sup_(K) sum_(abs(alpha) <= N) abs(diff^alpha f)$ and $norm2(f)_(C^N (K)) = max_(x in K, abs(alpha) <= N) abs(diff^alpha f)$.
Show that these are equivalent norms.

Show that
$
norm(phi psi)_(C^N (K)) <= C_N norm(phi)_(C^N (K)) dot norm(psi)_(C^N (K))
$
== Solution
First to show they are equivalent norms, we have
$
norm(f)_(C^N (K))
= sup_(K) sum_(abs(alpha) <= N) abs(diff^alpha f)
<=sup_(K) sum_(abs(alpha) <= N) max_(abs(alpha) <= N) abs(diff^alpha f)
<=sup_(K) 2 n^N max_(abs(alpha) <= N) abs(diff^alpha f)
\ <= 2 n^N max_(x in K, abs(alpha) <= N) abs(diff^alpha f)
<= 2 n^N norm2(f)_(C^N (K)).
$

And we also have
$
norm2(f)_(C^N (K))
= max_(x in K, abs(alpha) <= N) abs(diff^alpha f)
<= max_(x in K) sum_(|alpha| <= N) abs(diff^alpha f)
= norm(f)_(C^N (K)).
$

For the next part we do a straight forward computation.
$
norm(phi psi)_(C^N (K))
= sup_(K) sum_(beta + gamma = alpha, abs(alpha) <= N) abs(diff^beta phi diff^gamma psi)
= sup_(K) sum_(abs(beta), abs(gamma) <= N) abs(diff^beta phi) abs(diff^gamma psi)
\ = sup_(K) sum_(abs(beta), abs(gamma) <= N) abs(diff^beta phi) abs(diff^gamma psi)
<= (sup_(K) sum_(abs(beta) <= N) abs(diff^beta phi))
(sup_(K) sum_(abs(gamma) <= N) abs(diff^gamma psi))
= norm(phi)_(C^N (K)) norm(psi)_(C^N (K))
$

= Question
== Statement
Prove that if a linear map $u : C_c^infinity (Omega) -> RR$ is positive, in the sense that $pair(u,f) >= 0$ for all $f>=0,f in C_c^infinity (Omega)$, then $u$ is a distribution or order zero.

Next show that $u$ is a positive measure.
== Solution
Let $psi$ be a cutoff function of a compact set $K$, then for any $phi$ with $supp phi in K$ fix $M = norm(phi)_(C(K))$ and note that $phi + M psi >= 0$ and $phi - M psi <=0$ so we have
$
0 <= pair(u, phi + M psi) = pair(u, phi) + M pair(u, psi)
\
0 >= pair(u, phi - M psi) = pair(u, phi) - M pair(u, psi)
$
which when rearranged give us
$
-M pair(u, psi) <= pair(u, phi) <= M pair(u, psi).
$
Thus we have
$
abs(pair(u, phi)) <= M pair(u, psi) = norm(phi)_(C(K)) pair(u,psi).
$

Now to show it is a measure, consider for any compact $K seq RR^n$ the inclusion $C_c^infinity (K) seq C(K)$. By the Hahn-Banach theorem, since the functional $u$ is bounded by the norm in $C(K)$ then we can extend $u$ to a functional $hat(u)_K : C(K) -> RR$. By the Riesz–Markov–Kakutani theorem we then know that $pair(hat(u)_K, f) = integral_(K) f d mu_K$. We know that the measure is positive because the functional is positive.

We take the sequence $K_n = ov(B_n (0))$ and then the
