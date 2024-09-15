#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#set page(numbering: "1")
#let bar(el) = $overline(#el)$


*Sources consulted* \
Classmates: Henry Hu, Panos Tsimpos. \
Texts: Class Notes, Evan's PDEs.

= Question
== Statement
Consider the Green functions, for $n = 2$ we have
$
G_y (x) = - 1 / (2 pi) ln norm(x - y) quad x,y in RR^2,
$
and for $n >= 3$ we have
$
G_y (x) = norm(x-y)^(2-n) / ((n-2)abs(S^(n-1))) quad x,y in RR^n.
$
Prove that $integral_(RR^n) Delta f dot G_0 = - f(0)$ for any $f in C_c^infinity (RR^n)$. As well as
$
u(x) = integral G_y (x) f(y) d y
$
satisfies $Delta u = - f$.

== Solution
We will use the outline given in the question
#proposition[
  If $u in C^2(ov(Omega))$ and $Delta u = 0$ then $integral_(diff Omega) arrow(nu) dot nabla u = 0$.
]
#proof[
  Set $v = 1$ in Green's formula, this gives us
  $
  integral_Omega Delta u dot 1 - u dot 0
  &= integral_(diff Omega) (arrow(nu) dot nabla u) dot 1
  - u (arrow(nu) dot 0)
  \
  0
  &= integral_(diff Omega) (arrow(nu) dot nabla u)
  $
]

#proposition[
  $G_0 (x)$ is harmonic in $RR^n backslash {0}$ and $integral_(diff B_1(0)) (arrow(nu) dot nabla G_0) = -1$
]
#proof[
  First check $n = 2$, take any $x != 0$ and after throwing away constants compute
  $
  nabla (ln norm(x))
  =
  (nabla norm(x)) / norm(x)
  =
  (x) / norm(x)^2.
  $
  Next we calculate the divergence,
  $
  div(x/norm(x)^2) = div(x) / norm(x)^2 + x dot nabla (1 / norm(x)^2)
  =
  2 / r^2 + r diff_r (1 / r^2)
  = 2 / r^2 - 2 / r^2 = 0.
  $
  Next we check for $n = 3$, we can ignore the constants so we compute
  $
  nabla norm(x)^(2-n)
  =
  (2-n) norm(x)^(1-n) nabla norm(x)
  =
  (2-n) norm(x)^(1-n) (x / norm(x))
  =
  (2-n) x norm(x)^(-n).
  $
  Next, after again throwing away constants,
  $
  div(x norm(x)^(-n)) = div(x) norm(x)^(-n) + x dot nabla norm(x)^(-n)
  = n r^(-n) + r diff_r (r^(-n))
  = n r^(-n) - n r^(-n) = 0.
  $
  
  Finally, we compute for $n = 2$
  $
  integral_(partial B_1(0)) arrow(n) dot nabla G_0
  =
  - integral_(partial B_1(0)) arrow(n) dot x / (2pi norm(x)^2)
  =
  - integral_(partial B_1(0)) 1 / (2pi)
  =
  -1,
  $
  where we used the fact that $2pi$ is the perimeter of the circle.
  For $n = 3$ we have
  $
  integral_(partial B_1(0)) arrow(n) dot nabla G_0
  &=
  - integral_(partial B_1(0)) arrow(n) dot ((2-n) x) / ((
    n-2
  ) abs(S^(n-1)) norm(x)^n)
  =
  - integral_(partial B_1(0)) arrow(n) dot x / (abs(S^(n-1)) norm(x)^n)
  \ &=
  - integral_(partial B_1(0)) 1 / (abs(S^(n-1)))
  = -1.
  $
]

#proposition[
  We have
  $
  lim_(epsilon -> 0)
  integral_(partial B_epsilon (0))
  (arrow(nu) dot nabla G_0) f = f(0)
  wide
  "as well as"
  wide
  lim_(epsilon -> 0) integral_(partial B_epsilon (0)) (
    arrow(nu) dot nabla f
  ) G_0 = 0
  $
]
#proof[
  We first simplify
  $
  integral_(partial B_epsilon (0))
  (arrow(nu) dot nabla G_0)(x) f(x) d S
  &=
  - integral_(partial B_epsilon (0))
  (arrow(nu) dot x / (abs(S^(n-1)) norm(x)^(n))) f(x) d S
  \ &=
  - 1 / (abs(S^(n-1)) epsilon^(n-1))integral_(partial B_epsilon (0))
  f(x) d S.
  $
  Now we do a change of variables
  $
  - 1 / (abs(S^(n-1)) epsilon^(n-1)) integral_(partial B_epsilon (0))
  f(x) d S
  &=
  - 1 / (abs(S^(n-1)) epsilon^(n-1)) integral_(partial B_1 (0))
  f(epsilon x) epsilon^(n-1) d S
  \ &=
  - 1 / (abs(S^(n-1))) integral_(partial B_1 (0))
  f(epsilon x) d S
  $
  now as $epsilon -> 0$, $f(epsilon x) -> f(0)$ and it becomes dominated by $1 + |f(0)|$ so we can use dominated convergence theorem to get
  $
  lim_(epsilon -> 0)
  (-1) / (abs(S^(n-1))) integral_(partial B_1 (0))
  f(epsilon x) d S
  =
  (- 1) / (abs(S^(n-1))) integral_(partial B_1 (0))
  f(0) d S
  =
  - f(0).
  $
  
  Now we need to do a quick limit calculation
  $
  abs(G_0(x)) norm(x)^(n-1) = cases(r abs(ln r) : n = 2, r : n >= 3)
  $
  in either case we have $lim_(x -> 0) abs(G_0(x))norm(x)^(n-1) = 0$.
  $
  abs(integral_(partial B_epsilon (0))
  (arrow(nu) dot nabla f)(x) G_0(x) d S
  )
  &<=
  integral_(partial B_epsilon (0)) norm(nabla f)_(C^0(RR^n)) abs(G_0(x)) d S
  \ &=
  norm(nabla f)_(C^0(RR^n))
  abs(G_0(epsilon)) epsilon^(n-1) abs(S^(n-1))
  $
  where in the final step we used that $G_0$ is always radial. This then gives us that
  $
  lim_(epsilon -> 0)
  abs(integral_(partial B_epsilon (0))
  (arrow(nu) dot nabla f)(x) G_0(x) d S)
  <=
  C
  lim_(epsilon -> 0)
  abs(G_0(epsilon)) epsilon^(n-1)
  =0
  $
]

#proposition[
  We have
  $
  integral_(RR^n) Delta f dot G_0 = - f(0)
  $
]
#proof[
  Let $K$ be a large compact set containing the origin which also contains the support of $f$. We will compute this integral by computing it on $K backslash partial B_epsilon (0)$, the compliment of a radius $epsilon$ ball, and then letting $epsilon -> 0$, this is a valid limit since $G_0$ is locally integrable and thus some multiple of it dominates $Delta f dot G_0 dot bb(1)_(K backslash B_epsilon (0))$. To that end we compute
  $
  integral_(K backslash B_epsilon (0)) Delta f dot G_0
  &=
  integral_(K backslash B_epsilon (0)) f Delta G_0
  + integral_(diff B_epsilon (0))
  (-arrow(nu) dot nabla f) G_0
  -
  (-arrow(nu) dot nabla G_0) f
  \ &=
  0
  + integral_(diff B_epsilon (0))
  (-arrow(nu) dot nabla f) G_0
  -
  (-arrow(nu) dot nabla G_0) f
  \ &=
  integral_(diff B_epsilon (0))
  (arrow(nu) dot nabla G_0) f
  -
  (arrow(nu) dot nabla f) G_0.
  $
  Note that we did not need to worry about the outer boundary of $K$ because $f,nabla f, Delta f$ all vanish there, also we had to put an extra negative sign for our normal vectors since they are the outer normal vector from $K backslash B_epsilon (0)$ is oriented opposite from how it was oriented previously.
  
  We thus get by the previous proposition
  $
  lim_(epsilon -> 0)
  integral_(K backslash B_epsilon (0)) Delta f dot G_0
  =
  lim_(epsilon -> 0)
  integral_(diff B_epsilon (0))
  (arrow(nu) dot nabla G_0) f
  -
  (arrow(nu) dot nabla f) G_0
  =
  -f(0)
  $
]

#proposition[
  For any $f in C^infinity_c (RR^n)$ we have that
  $
  u(x) := integral_(RR^n) norm(x-y)^(2-n) f(y) d y
  = integral_(RR^n) norm(y)^(2-n) f(x-y) d y
  $
  satisfies $Delta u(x) = c_n dot f(x)$ for some numerical $C_n$.
]
#proof[
  We use the second form to compute
  $
  Delta u(x)
  = integral_(RR^n) norm(y)^(2-n) Delta f(x-y) d y
  = integral_(RR^n) (n-2) abs(S^(n-1)) G_0 (y) Delta f(x-y) d y,
  $
  then since $G_0$ is symmetric we can replace $y$ by $-y$ and then the previous proposition gives us
  $
  (n-2) abs(S^(n-1)) integral_(RR^n) G_0 (y) Delta f(x+y) d y
  =
  - (n-2) abs(S^(n-1)) f(x)
  $
  so the result holds with $C_n = - (n-2) abs(S^(n-1))$.
]

= Question
== Statement
Define the functional $u$ as
$
pair(u, f) = sum 1 / n (f(1 / n) - f(0)).
$
Prove that it is a distribution of order 1 and find its support.

Show that there does not exist a $C > 0$ such that for any $f in C_c^infinity$ we have
$
abs(pair(u,f)) <= max_(supp u) (abs(f(x)) + abs(f'(x))).
$
== Solution
First let's show that it is indeed a distribution of order $1$, let $f$ be a test function, we can use mean value theorem to get a sequence of points $c_n$ such that
$
abs(sum_n 1/n (f(1/n) - f(0)))
&=
sum_n 1 / n (abs(f(1/n) - f(0)) / (1 / n - 0) 1 / n)
\ &=
sum_n 1 / n^2 abs(f'(c_n))
<=
sum_n 1 / n^2 norm(f)_(C^1[0,1])
= pi^2 / 6 norm(f)_(C^1[0,1])
$

Now let us find the support of $u$. Set $K = {0} union {1/n : n in NN}$, then for any function $f$ supported on $RR backslash K$, then by definition $f(0) = f(1/n) = 0$ for all $n$ so $pair(u,f) = 0$. This proves that $RR backslash K seq supp u$.
On the other hand fix some $n$ and consider a bump function $phi_n$ which is $1$ at $1/n$ and is supported within $[1/(n+0.5), 1/(n-0.5)]$, it is clear that this function has $pair(u,phi_n) = 1/n$ so all of the points $1/n$ are in the support. Since the support is closed their limit is also in the support hence $K$ is exactly the support of $u$.

Finally we will construct a sequence of functions $f_n$ with
$
max_(supp u) (abs(f_n (x)) + abs(f_n' (x))) = 1
$
for all $n$ but which will satisfy
$
pair(u, f_n) -> infinity,
$
as $n -> infinity$, this will prove the last part of the question.

We will define $f_n$ to be a bump function which is equal to $1$ on $[1/n, 1]$ and is supported on $[1/(n+0.5), 2]$. We clearly have $f'_m (1/n) = 0$ for all $n$, and also $f'_m (0) = 0$. We hence have
$
max_(supp u) (abs(f_n (x)) + abs(f_n' (x))) = 1.
$
But we have
$
pair(u, f_n) = sum_(k=1) 1 / k (f_n (1 / k) - f(0)) = sum_(k=1)^n 1 / k (
  1 - 0
) = sum_(k=1)^n 1 / k -> infinity
$

= Question
== Statement
Let $a_k$ be a sequence with polynomial growth, in the sense that $|a_k| <= C k^N$ for some $C$ and $N$. Show that $sum_(k=1)^infinity a_k e^(i k x)$ converges in the sense of distributions.
== Solution
It is enough to prove that
$
lim_(M -> infinity) integral_(RR) sum_(k=1)^M a_k e^(i k x) f(x)
$
exists for any $f in C_c^infinity (RR)$, first we will need a lemma given in the question.
#lemma[
  $
  integral e^(i k x) f = - 1 / (i k) integral e^(i k x) f'
  $
]
Now consider the expression
$
integral_(RR) sum_(k=1)^M a_k e^(i k x) f(x).
$
If we iterate the lemma above $N + 2$ times we get
$
integral_(RR) sum_(k=1)^M a_k e^(i k x) f(x)
=
integral_RR sum_(k=1)^M i^(N+2) / (k^(N+2)) a_k e^(i k x) f^((n+2))(x)
$
so since $|a_k| <= C k^N$ we get
$
abs(integral_RR sum_(k=1)^M i^(N+2)/(k^(N+2)) a_k e^(i k x) f^((n+2))(x)) &<= sum_(k=1)^M abs(i^(N+2)/(k^(N+2)) a_k) integral_RR abs(e^(i k x) f^((n+2))(x))
\ &<= sum_(k=1)^M C / (k^2) integral_RR abs(f^((n+2))(x)) <= pi^2 / 6 norm(f)_(C^(n+2) (
  RR
))
$
Now it is well known that if the absolute value of a series converges then the series itself also converges, so we have proven that
$
sum_(k=1)^infinity a_k e^(i k x)
$
converges in the sense of distributions.

= Question
== Statement
The principal value functional is defined by
$
pair(u,f) := lim_(epsilon -> 0) integral_(abs(x) > epsilon) f(x) / x d x,
$
for all $f in C_c^infinity (RR)$. It is often denoted by $P. V. integral f(x)/x d x$.

Show that $pair(u,f)$ exists and defines a distribution.
== Solution
Let us first manipulate the integral into a nicer form using change of variables.
$
integral_(abs(x) > epsilon) f(x) / x d x
&=
integral_(-infinity)^(-epsilon) f(x) / x d x +
integral_(epsilon)^(infinity) f(x) / x d x
\ &=
integral_(infinity)^(epsilon) f(-u) / (-u) (-d u) +
integral_(epsilon)^(infinity) f(x) / x d x
\ &=
- integral_(epsilon)^(infinity) f(-u) / u d u +
integral_(epsilon)^(infinity) f(x) / x d x
\ &=
integral_(epsilon)^(infinity) (f(x) - f(-x)) / x d x
\ &=
integral_(epsilon)^(1) (f(x) - f(-x)) / x d x
+
integral_(1)^(infinity) (f(x) - f(-x)) / x d x
$
Now that the integral is in this form we can bound it using the differentiability of $f$ for the first integral and its compact support on the right term. Let $K$ be a compact set containing $supp f$ and compute
$
integral_(epsilon)^(1) abs(f(x) - f(-x)) / x d x
+
integral_(1)^(infinity) abs(f(x) - f(-x)) / x d x
& <=
integral_(epsilon)^(1) 2 norm(f')_(C^0 (RR)) d x
+
integral_(1)^(infinity) 2 abs(f(x)) d x
\ &<=
2 norm(f')_(C^0 (RR))
+
2 abs(K) norm(f)_(C^0 (RR))
\ &<=
2 norm(f)_(C^1 (RR))
+
2 abs(K) norm(f)_(C^1 (RR))
\ &<=
(2 + 2 abs(K)) norm(f)_(C^1 (RR))
$
Thus up to a constant $C(K)$ depending on the support, we get $pair(u, f) <= C(K) norm(f)_(C^1(RR))$.

= Question
== Statement
Consider the space $(C^k [0,1])'$ of bounded linear functionals on $C^k [0,1]$. Show that it can be identified with a set of functionals $pair(u,f) = sum_(j=1)^k integral_0^1 diff^j f d mu_j$ where each $mu_j$ is some finite Borel measure on $[0,1]$.
== Solution
Let us define the vector space $V := (C[0,1])^(k+1)$ and identify $C^k [0,1]$ with the subspace $S seq V$ through
$
f tilde (f,f',f'',...,f^((k))).
$
With this identification we can consider any element $u in (C^k [0,1])'$ as a linear functional on $S$. Now we define the norm on $V$ by
$
norm((f_0,f_1,...,f_k)) = sum_(j=1)^k max abs(f_0).
$
One can easily check that this is indeed a norm and if we restrict to to $S$, it coincides with the norm on $C^k [0,1]$. Thus we know that $u$, as a functional on $S$, is dominated by $norm(dot)$, so by the Hahn-Banach Theorem we can extend $u$ to a full functional on all of $V$, denoted $ov(u)$.

Now $ov(u)$ is a linear functional over a direct sum of vector spaces, and can thus be decomposed into its components as $ov(u) = ov(u)_0 + ov(u)_1 + ... + ov(u)_k$.
For each component we have $ov(u)_i : C[0,1] -> RR$ so by the Riesz-Markov-Kokutoni Theorem it can be written as
$
pair(ov(u)_i, f) = integral_0^1 f d mu_i
$
where $mu_i$ is some (possibly negative) finite Borel measure on $[0,1]$. Thus we get
$
pair(ov(u), (f_0,f_1,...,f_k)) = sum_(i=1)^k integral_0^1 f_i mu_i.
$
Restricting $ov(u)$ to $S$ then gives us exactly the required result since $f_i$ becomes $f^((i))$.

= Question
== Statement
Given a function $f$ on a compact set $K seq RR^n$, satisfying the Lipschitz condition with constant $L$, can we find a Lipschitz extension of $f$ onto the whole $RR^n$.
You are allowed to use the following lemma (I slightly modified the lemma to make it solvable).

#lemma[
  Given an open set $Omega seq RR^n$ there exists a collection of balls $B_i$, a collection of smooth compactly supported functions $phi_i$ and a constant $C_n$ such that
  + For each point $x in Omega$, $1 <= \# {B_i : x in B_i } <= C_n$.
  + $2 B_i seq Omega$ and $4 B_i sect diff Omega != nothing$ for all $i$.
  + $supp phi_i seq B_i$ for all $i$.
  + $sum_i phi_i = 1$ on $Omega$.
  + $norm(phi_i)_(Lip (RR^n)) <= C_n$ for all $i$.
]
== Solution
Using this lemma we can construct a Lipschitz extension, first we apply the lemma to $K^c$. Now for each ball $B_i$, we identify its center $c_i$ as well as the point $s_i$ of $K$ closest to it, which always exists because $K$ is compact. We now define
$
tilde(f)(x) = cases(sum_i f(s_i) phi_i (x) : x in K^c, f(x) : x in K)
$
This is well defined because at any point only finitely many of the $phi_i (x)$ are non-zero by property 1 of the lemma.

Now we check that $tilde(f)$ is Lipschitz, this is immediate for $x,y in K$ so assume that $x in K$ and $y in K^c$. We now compute
$
abs(tilde(f)(x) - tilde(f)(y)) &=
abs(f(x) - sum_(i) f(s_i) phi_i (y)) =
abs(sum_(i) phi_i (y) (f(x) - f(s_i)))
\ &<=
sum_i phi_i (y) abs(f(x) - f(s_i))
<=
sum_i phi_i (y) norm(f)_(Lip (K)) norm(x-s_i)
$
Now we just need to estimate $norm(x - s_i)$, we first use triangle inequality to get
$
norm(x - s_i) <= norm(x - y) + norm(y - s_i) <= norm(x - y) + 2r_i
$
where $r_i$ is the radius of $B_i$. Now assuming $phi_i (y)$ is non-zero then we know that $y in B_i$, and yet since $2 B_i seq K^c$ we know that
$
2 r_i <= norm(y - c_i) <= norm(y - x) + norm(x - c_i) <= norm(y - x) + r_i
$
so we get $r_i <= norm(y-x)$. We thus get
$
norm(x-s_i) <= 3norm(x-y).
$
Plugging this back into our original sum we have
$
abs(tilde(f)(x) - tilde(f)(y)) <=
sum_i phi_i (y) norm(f)_(Lip (K)) 3norm(x-y)
=
3 norm(x-y) norm(f)_(Lip (K))
$
thus we get
$
abs(tilde(f)(x) - tilde(f)(y)) / (norm(x-y)) <= 3 norm(f)_(Lip (K))
$

Now we check for $x,y in K^c$, if that is the case then
$
abs(tilde(f)(x) - tilde(f)(y)) =
abs(sum_(i) phi_i (x) f(s_i) - sum_i phi_i (y) f(s_i))
$
Now let $A$ be the collection of $i$ for which either $phi_i (x)$ or $phi_i (y)$ is non-zero, then note that since we can add any constant to $f$ without changing the Lipschitz constant we can replace $f(x)$ with $f(x) - f(z)$ for any arbitrary $z in K$. We then write
$
abs(sum_(i in A) phi_i (x) (f(s_i) - f(z)) - sum_(i in A) phi_i (x) (f(s_i) - f(z)))
\ <= sum_(i in A) abs(phi_i (x) - phi_i (y)) abs(f(s_i) - f(z))
\ <= sum_(i in A) C_n norm(x - y) norm(f)_(Lip (K)) diam (K)
$
where we used the fact that $phi$'s have Lipschitz constant at most $C_n$. Now $A$ has cardinality at most $2 C_n$ again by the lemma so we get
$
abs(tilde(f)(x) - tilde(f)(y)) / norm(x-y) <= 2 C_n^2 norm(f)_(Lip (K)) diam (K)
$

Combining these all together we get
$
norm(tilde(f))_(Lip (RR^n)) <= (3 + 2 C_n^2 diam(K)) norm(f)_(Lip (K))
$

