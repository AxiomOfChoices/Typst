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
  nabla ln(norm(x))
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
integral_RR sum_(k=1)^M i^(N+2)/(k^(N+2)) a_k e^(i k x) f^((n+2))(x)
$
so since $|a_k| <= C k^N$ we get
$
abs(integral_(RR) sum_(k=1)^M a_k e^(i k x) f(x)) &<= sum_(k=1)^M abs(i^(N+2)/(k^(N+2)) a_k)  integral_RR abs(e^(i k x) f^((n+2))(x))
\ &<= sum_(k=1)^M C/(k^2) integral_RR abs(f^((n+2))(x)) <= pi^2/6 norm(f)_(C^(n+2) (RR))
$
Now because the absolute values converge the sequence itself also converges so we get that these sums do indeed converge in distribution.

= Question

