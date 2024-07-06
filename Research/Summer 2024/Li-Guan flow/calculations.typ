#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references

= Guan-Li flow
== Setup

We are living in the manifold $N^(n+1) = HH^(n+1)$ which is characterized by its sectional curvatures
$
  kappa(X,Y) = -1
$
for all orthonormal vectors $X,Y$.

Now since it is a space-form we have a nice form for the Riemann tensor, namely
$
  R(X,Y,Z,W)
  =
  ip(X,Z)ip(Y,W) - ip(X,W)ip(Y,Z)
$
And thus also
$
  Ric(X,Y)
  &=
  R(e_i,X,Y,e_i)
  = ip(e_i, Y) ip(X,e_i) - ip(e_i,e_i) ip(X,Y)
  \ &= ip(X,Y) - (n+1)ip(X,Y) = - n ip(X,Y).
$

$
  R(e_i, X, Y, e_i)
$

We fix a CKV $X$ induced by the warped product structure $g = d r^2 + sinh(r)^2 d s^2$ giving us a Conformal Factor of $phi = 2 cosh(r)$. We record for later some info about $phi$.
#proposition[
  + $nabla phi = 2 X$.
  + $laplace phi = (n+1) phi$.
]

We will follow the evolution of a hyper-surface $M$ which is 1-convex as well as star-shaped with respect to $X$, that is the support function $u := ip(X,nu)$ is positive everywhere on $M$. It will evolve under the speed function
$
  f := phi / H - u / n.
$

We will hence forth refer to all geometric quantities on $N$ with an overline to distinguish them from their counterparts on $M$. We will also use $pi$ to refer to the projection map onto the tangent plane of $M$.

We recall known identities
#lemma("Codazzi equations")[
  Let $h$ be the second fundamental form of $M$ then
  $
    ov(R)(X,Y,Z,nu) = - (nabla_X h) (Y,Z) + (nabla_Y h) (X,Z)
  $
]

== Calculations
We will use the Parabolic operator
$
  L = diff_t - phi/H^2 laplace.
$
We can check by manual calculations that
#proposition[
  $
    (nabla u)^j = h^j_i pi(X)^i 
  \ laplace u = - n nu(phi) + u n + ip(nabla H, X) + phi H - |A|^2u
  $
]<prop-u_laplace>
We then compute
#proposition[
  $
  diff_t u = phi^2/H - (u phi)/n - 2 (||pi(X)||^2)/H + (phi ip(X, nabla H))/H^2 + h_(i j) pi(X)^i pi(X)^j
  $
]
#proof[
$
  diff_t u
  & = diff_t ip(X, nu)
  = ip(diff_t X, nu)
  + ip(X, diff_t nu)
  = ip(f ov(nabla)_nu X, nu)
  + ip(X, - nabla f)
  \ &= ip(f ov(nabla)_nu X, nu)
  + ip(X, - nabla f)
  = (phi/H - u/n) phi - ip(X, nabla (phi/H - u/n))
  \ & = phi^2/H - (u phi)/n - ip(X, (nabla phi)/H - phi/H^2 nabla H - (nabla u)/n)
  \ & = phi^2/H - (u phi)/n - ip(X, pi(2 X)/H - phi/H^2 nabla H - (h^j_i pi(X)^i)/n)
  \ & = phi^2/H - (u phi)/n - 2 (||pi(X)||^2)/H + (phi ip(X, nabla H))/H^2 + h_(i j) pi(X)^i pi(X)^j
$
]
now using @prop-u_laplace we get
$
  L u &= col(phi^2/H, #yellow) - (u phi)/n - 2 (||pi(X)||^2)/H + col((phi ip(X, nabla H))/H^2, #red) + h_(i j) pi(X)^i pi(X)^j
\ &- phi/H^2 (- n nu(phi) + u n + col(ip(nabla H, X), #red) + col(phi H, #yellow) - |A|^2u)
  \ & = - (u phi)/n - 2 (||pi(X)||^2)/H  + h_(i j) pi(X)^i pi(X)^j
+(phi n nu(phi))/H^2 - (phi u n)/H^2 + (phi|A|^2u)/H^2
$
Now recall that since $pi(X)$ is an orthogonal projection then we can decompose the norm of $X$ as 
$
  ||X||^2 = ||pi(X)||^2 + ||ip(X, nu) nu||^2 = ||pi(X)||^2 + u^2
$
plugging this in we get
$
  L u = - (u phi)/n - 2(||X||^2 - u^2)/H + h_(i j) pi(X)^i pi(X)^j + (phi n ip(nu, ov(nabla) phi))/H^2 - (phi u n)/(H^2) + (phi|A|^2u)/H^2.
$
Now combining the first and last term we get using @prop-eigenvalue_identity
$
  phi u ((|A|^2)/(H^2) - 1/n) = phi u(sum_(i < j)(kappa_i - kappa_j)^2)/(H^2 n),
$
we will drop the sum for clarity.
We now keep computing
$
  L u &= (phi u(kappa_i - kappa_j)^2)/(H^2 n) - (u phi)/n - 2(||X||^2 - u^2)/H + h_(i j) pi(X)^i pi(X)^j + (phi n ip(nu, ov(nabla) phi))/H^2 - (phi u n)/(H^2)
$
We will now define the auxiliary function $Theta := 1 - u^2/(||X||^2)$, note that $Theta = 0$ when $X$ is parallel to $nu$ or equivalently $pi(X) = 0$. Then we further simplify the above to get
$
  L u &= (phi u(kappa_i - kappa_j)^2)/(H^2 n) - (u phi)/n - (2 Theta)/(||X||^2H) + h_(i j) pi(X)^i pi(X)^j + (phi n ip(nu, ov(nabla) phi))/H^2 - (phi u n)/(H^2)
  \ & = (phi u(kappa_i - kappa_j)^2)/(H^2 n) - (u phi)/n - (2 Theta)/(sinh^2(r) H) + h_(i j) pi(X)^i pi(X)^j + (phi n ip(nu, 2 X)/H^2 - (phi u n)/(H^2))
  \ & = (phi u(kappa_i - kappa_j)^2)/(H^2 n) - (u phi)/n - (2 Theta)/(sinh^2(r) H) + h_(i j) pi(X)^i pi(X)^j + (phi n u)/H^2.
$
Now assume that we are at a minimum point of $u$, then $nabla u = h^i_j pi(X)^j = 0$ and so we have two cases.
+ $pi(X)$ is zero, then $Theta = 0$ and so we are left with #h(1fr)
  $
    L u = phi u (((kappa_i - kappa_j)^2)/(H^2 n) - 1/n + (n)/H^2)
  $ 
  Here in order for $u$ to decrease we must have $H$ be quite larger (at least larger than $n$) but also $(kappa_i - kappa_j)^2$ should remain quite small compared to $H$. I feel like this should be impossible due but cannot find a contradiction just yet.
+ $pi(X)$ is not zero but it is in the nullspace of $h^i_j$, this means that $h^i_j$ has at least one zero eigenvalue, hence we can estimate the first term. Since $(lambda_i - lambda_j)^2 >= (H/n - lambda_1)^2$ where $lambda_1$ is the smallest eigenvalue, then we have $(lambda_i - lambda_j)^2 >= (H/n)^2$. This then gives us
  $
    L u >= phi u /n^3 - u phi/n - (2 Theta)/(sinh^2(r) H) + (phi n u)/(H^2)
  $
  so we are actually even in worse shape than the first case. We have an extra negative term to deal with which doesn't even include $u$.


= Appendix
== Eigenvalues
#proposition[
  Let $M$ be any diagonalizable matrix with eigenvalues $lambda_1, ..., lambda_n$, and let $T$ be its trace and $|M|^2$ its squared norm, then
  $
    n|M|^2 - T^2 = sum_(i < j) (lambda_i - lambda_j)^2
  $
]<prop-eigenvalue_identity>
#proof[
  We decompose the right hand sum
  $
    sum_(i < j) (lambda_i - lambda_j)^2
    &= 
    sum_(i) (n-1) lambda_i^2 - 2 sum_(i < j) lambda_i lambda_j
    \ &=
    n sum_(i) lambda_i^2 - (sum_(i) lambda_i^2 + 2 sum_(i < j) lambda_i lambda_j)
    \ & =
    n sum_(i) lambda_i^2 - (sum_(i) lambda_i)^2
    \ & =
    n|M|^2 - T^2
  $
]
