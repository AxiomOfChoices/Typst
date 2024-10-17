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


= Question
== Statement
+ Let $L := span(delta_x, x in RR^n)$ be the space of all finite linear combinations of $delta$-functions. Prove that $L$ is dense in $cal(D)' (RR^n)$.
+ Let $W := span(delta_x - delta_y, x, y in RR^n)$. Is $W$ dense in $cal(D)' (RR^n)$? Is $W$ dense in $ cal(E)' (RR^n)$.
== Solution
+ Using the Wikipedia page for test functions and distributions, we know that $C_c^infinity (RR^n)$ is reflexive, so it is equal to its own bidual. Now assume that $ov(L) != cal(D)'(RR^n)$ then pick some distribution $u$ which is not in $ov(L)$, we can use Hahn-Banach to create a functional on $cal(D)' (RR^n)$ which is zero on $ov(L)$ and non-zero on $u$, using the biduality we thus have a function $f in C_c^infinity (RR^n)$ such that $pair(delta_x, f) = 0$ for all $delta_x$ and also $pair(u, f)$ for some non-zero $u$. But this is clearly impossible so $ov(L) = cal(D)'(RR^n)$.
+ In fact, $W$ is dense in $cal(D)' (RR^n)$, we will show this by showing it is dense in $L$, which we know to be dense in $cal(D)' (RR^n)$. To see this let $delta_x$ be arbitrary and consider the sequence  $delta_(x) - delta_((m,0,...,0)) in W$. For any function $phi in C_c^infinity (RR^n)$ we have that for large enough $m$, $(m,0,...,0)$ is outside the support of $phi$ so
  $
    pair(delta_x - delta_((m,0,...,0)), phi) -> pair(delta_x, phi)
  $
  for all $phi$. However, $W$ is not dense in $cal(E)' (RR^n)$, for consider the function $1 in C^infinity (RR^n)$, we have that for any $u in W$, $pair(u, 1) = 0$ by definition. But for example any bump function $psi$ considered as an element of $cal(E)' (RR^n)$ through integration has $pair(psi, 1) != 1$. Hence $W$ is not dense in $cal(E)' (RR^n)$.

= Question
== Statement
Let $u_1,...,u_n$ be non-zero homogeneous distributions in $cal(D)' (RR^n)$ and let the degree of $u_k$ be a real number $lambda_k$.

Assuming that $lambda_k != lambda_ell$ for $k != ell$, show that $u_1,...,u_N$ are linearly independent.
== Solution
We prove by induction, clearly this is true for $n = 1$. Now for $n + 1$ let us assume that
$
  sum_(k=1)^(n+1) c_k u_k (x) = 0
$
in the sense of distributions. Clearly $0$ is homogeneous of any degree so we also have
$
  sum_(k=1)^(n+1) 2^(lambda_k) c_k u_k (x) =
  sum_(k=1)^(n+1) c_k u_k (2 x) = 0
$
now consider the weighted sum
$
  2^(lambda_(n+1)) 
  (sum_(k=1)^(n+1) c_k u_k (x)) - 
  (sum_(k=1)^(n+1) 2^(lambda_k) c_k u_k (x)) 
  &=
  0
  \
  sum_(k=1)^(n+1) (2^(lambda_(n+1)) - 2^(lambda_k)) c_k u_k (x)
  &=
  0
  \
  sum_(k=1)^(n) (2^(lambda_(n+1)) - 2^(lambda_k)) c_k u_k (x)
  &=
  0
$
Now this is a linear combination of $u_1,...u_n$ which by inductive hypothesis are linearly independent, we thus know the coefficients are all zero, namely
$
  (2^(lambda_(n+1)) - 2^(lambda_k)) c_k = 0
$
for all $k$ with $1 <= k <= n$. Now because the $lambda_k$'s are distinct and $2^x$ is injective on $RR$, the brackets here never vanish, and so $c_k$ must vanish. We thus have that
$
  c_(n+1) u_(n+1) (x) = 0
$ 
but since $u_(n+1)$ is non-zero we thus know that $c_(n+1)$ is zero and so $u_1,...,u_(n+1)$ are independent.

= Question
== Statement
Let $f$ be a measurable function on $RR$ satisfying $abs(f(x)) <= abs(x)^(-2024)$ for $x in RR backslash {0}$. Show that there is $u in cal(D)' (RR)$ such that $u = f$ on $(-infinity, 0) union (0, + infinity)$.
== Solution
Let $V$ be the subspace of $C_c^infinity (RR)$ defined by
$
  V := { phi : phi^(k) (0) = 0, k <= 2024}.
$
For any $phi in V$ we have $phi = x^(2024) psi$ for some smooth compactly supported function $psi$, so we have
$
  abs(integral f phi) = abs(integral f x^2024 psi) <= integral abs(psi) < infinity
$
Now also note that $ov(V) = V$ trivially so fix some bump function $psi$ supported on $[-1,1]$ and equal to 1 on $[-0.5, 0.5]$ and notice that we can always write $phi = p psi + x^2024 phi.alt$, so we will define
$
  pair(u, phi) = pair(u, p psi + x^(2024) phi) := integral f x^(2024) phi.
$
This is clearly linear, and it is continuous because $V$ is closed.

= Question
== Statement
Let $R_theta = mat(cos theta, - sin theta; sin theta, cos theta)$ denote the rotation in $RR^2$ with angle $theta$. For a distribution $u in cal(D)' (RR^2)$, define $u compose R_theta$ by $pair(u compose R_theta, phi) = pair(u, f compose R_(-theta))$. The distribution $u$ is called radial of $u compose R_theta = u$ for all $theta$. Prove that any radial distribution $u in cal(D)' (RR^2)$ satisfies
$
  x (partial u)/(partial y) - y (partial u)/(partial x) = 0.
$
== Solution
We have that for a radial distribution $u$
$
  0
  =
  pair((u - u compose R_theta)/theta, phi)
  =
  pair(u, (phi - phi compose R_(-theta))/theta).
$
But now we have
$
  (phi - phi compose R_(-theta))/theta
  =
  (phi(x,y) - phi(x cos theta + y sin theta, - x sin theta + y cos theta))/theta
$
so the limit as $theta -> 0$ is equal to, by definition,
$
  - partial/(partial theta)|_(theta = 0) phi(x cos theta + y sin theta, - x sin theta + y cos theta).
$
But now by chain rule this is equal to
$
  (partial_x phi)|_(x,y) (partial_theta|_(theta = 0) (x cos theta + y sin theta)) +
  (partial_y phi)|_(x,y) (partial_theta|_(theta = 0) (-x sin theta + y cos theta)) 
  = \
  (partial_x phi)|_(x,y) (y) 
  + (partial_y phi)|_(x,y) (-x)
$
hence we have
$
  lim_(theta -> 0) (phi - phi compose R_(-theta))/theta = y (partial phi)/(partial x) - x (partial phi)/(partial y).
$
We thus have for every $phi$, 
$
  pair(u, y (partial phi)/(partial x) - x (partial phi)/(partial y)) = 0
$
and so moving around the derivatives we get
$
  0 
  = pair((partial x u)/(partial y) - (partial y u)/(partial x), phi) 
  = pair(x (partial u)/(partial y) - y (partial u)/(partial x), phi) 
$
which is exactly what we wanted to show.

= Question
== Statement
Let $L = sum_(abs(alpha) <= N) a_alpha partial^alpha$ be a non-zero linear differential operator in $RR^n$ with constant coefficients.

Prove that if $u in cal(E)' (RR^n)$ satisfies $L u = 0$ in the space of distributions, then $u = 0$.
== Solution
We know by definition of the derivative that
$
  pair(L u, phi) = pair(u, ov(L) phi)
$
where $ov(L)$ is defined by $sum_(abs(alpha) <= N) (-1)^(abs(alpha)) a_alpha partial^(ov(alpha))$ and $ov(alpha)$ is the multi-index which is $alpha$ reversed.

Now set $phi = e^(i k x)$ be our test function, we have that 
$
  pair(u, ov(L) e^(i k x)) = 0.
$
Now it is clear that $ov(L) e^(i k x)$ is equal to $p(k_1,...,k_n) e^(i k x)$ for some polynomial $p$ because each derivative of $e^(i k x)$ just brings down an extra factor of $k$.

We thus have
$
  p(k_1,...,k_n) pair(u, e^(i k x))
  = pair(u, p(k_1,...,k_n) e^(i k x))
  = 0
$
for all vectors $k_1,...,k_n$. Now one can check by inspection that
$
  p(k_1,...,k_n) = sum_(abs(alpha) <= N) (-1)^(abs(alpha)) a_(alpha) k^(ov(alpha))
$
where the monomials $k^alpha$ are defined by
$
  k^(alpha) = product_(i=1)^abs(alpha) k_(alpha_i)
$
Now from this representation, we see that because $L$ is a non-zero operator, $p$ is a non-zero polynomial, thus we have that $p(k_1,...,k_n) != 0$ on an open dense set.

But now we see that $pair(u, e^(i k x)) = 0$ on an open dense set of $k$'s. But this quantity is continuous in $k$ because $e^(i k_n x) -> e^(i k x)$ on any compact set if $k_n -> k$. We thus know that $pair(u, e^(i k x)) = 0$ everywhere and so since $e^(i k x)$ are dense in $C^infinity (RR^n)$ we get that $pair(u, phi) = 0$ for all $phi in C^infinity (RR^n)$ and thus $u = 0$.
