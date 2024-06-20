#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#set pagebreak(weak: true)
#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm), numbering: "1")
#set enum(numbering: "(1)", indent: 1em)

#show heading: it => {
  if (it.numbering == none or it.level > 1) {
    return it
  }
  let numbers = counter(heading).at(it.location())
  let body = it.body
  //pagebreak(weak: true)
  block([*#body*])
}
#outline()

= Lecture 1
The setting is as follows, we take a surface $M_0 seq RR^3$ evolving under the following evolution equation
$
diff_t x = arrow(H)(x).
$
Here $arrow(H) = H arrow(nu)$ is the mean curvature vector and $H = kappa_1 + kappa_2 = tr(A)$ is the mean curvature.
// TODO: Maybe insert diagram here.

#example[
  The standard example of MCF is the evolution of the round sphere, if we start with a sphere $S_R$ then the equation reduces to the ode $dot(r) = 2/r$ which gives us the equation
  $
  r(t) = sqrt(R^2 - 4t).
  $
]
#example[
  Another example is the cylinder $C_R$, which evolves as
  $
  r(t) = sqrt(R^2 - 2t).
  $
]

#exercise[
  Show that if $M_t$ is an entire graph of a function $u_t$, then the function $u_t$ solves the PDE
  $
  diff_t = sqrt(1 + |D u|^2) div((D u)/(sqrt(1 + |D u|^2)))
  $
]

More precisely if $M_t = X(M,t)$ where $X : M times I -> RR^3$ then we get the following PDE
$
diff_t X(p,t) = laplace_(M_t) X(p,t)
$

#theorem("Huisken 1984")[
  If $M_t$ is ever then $M_t$ converges to a _round point_ in finite time, meaning that under rescaling it approaches a sphere.
]

#remark[
  $M$ being convex is equivalent to $kappa_1 >= 0$ and $kappa_2 >= 0$.
]

Without convexity the situation is a lot more difficult, and typically the flow encounters local singularities.

#example[
  There exists a surface resembling a dumbbell whose neck pinches under MCF resulting in a local singularity. If the flow is continued after the singularity the flow splits into two connected components.
  
  If we call $X_0$ the point of singularity, and if one rescales this example by $lambda$ around $X_0$ and then lets $lambda -> infinity$, then by passing to this limit the neck pinch looks like a round shrinking cylinder. Thus in some sense, the self-shrinking cylinder is a _model_ for this singularity.
  
  Around $X_0$, we have
  $
  |A| <= C / (|t_0 - t|^(1 / 2))
  $
  which is the blow up rate we expect, since $A tilde 1/r tilde 1/(t^(1/2))$ so in some sense this singularity is well behaved.
]

#example[
  If one changes the dumbbell in just the right way, we can get much worse behaviour, which we call a type two singularity, characterized by
  $
  lim_(t -> t_0) sqrt(t - t_0) |A| = infinity
  $
]

There are now several natural questions we can ask about MCF:
+ What do singularities look like?
+ How can we continue the flow past its singularities?
+ What is the size and structure of the singular set?
+ Is evolution through singularities unique or non-unique?

We will now start developing the theory necessary to give full/partial answers to these questions.
== Basic properties of MCF
#proposition("Existence")[
  Let $M_0$ be any closed embedded initial hypersurface, then there exists a unique smooth solution ${ M_t }_(t in [0,T))$ for some maximal $T > 0$, which is characterized by
  $
  lim_(t -> T) max_(M_t) |A| = infinity.
  $
]
#proof[
  Standard consequence of short-time existence for parabolic PDEs.
]

#proposition("Parabolic rescaling")[
  If $M_t$ is a solution to MCF, then
  $
  M_t^lambda := lambda M_(lambda^(-2) t)
  $
  is also a solution to MCF.
]
#exercise[
  Prove this.
]

Due to this rescaling our estimates will always live in
$
P(x_0, t_0, r) = B(x_0,r) times (t_0 - r^2, t_0]
$

#proposition("Avoidance principle")[
  #let dist = math.op("dist")
  If $M_t, N_t$ are both solutions to MCF then $t -> dist(M_t, N_t)$ is non-decreasing.
  
  In particular if $M_0,N_0$ are disjoint then $M_t, N_t$ are also disjoint.
]

#proposition("Evolution equations")[
  If $M_t$ is a solution to MCF, then its geometric quantities evolve as:
  + $diff_t g_(i j) = - 2 H A_(i j)$
  + $diff_t dif mu = - H^2 dif mu$
  + $diff_t arrow(nu) = - nabla H$
  + $diff_t H = laplace H + |A|^(2)H$
  + $diff_t A^i_j = laplace A^i_j + |A|^(2)A^i_j$
]
#proof[
  For the induced metric we have
  $
  diff_t g_(i j) = 2 diff_i (
    H arrow(nu)
  ) dot diff_j X = 2 H diff_i arrow(nu) dot diff_j X = - 2 H A_(i j)
  $
  
  #exercise[
    Prove the other evolution equations.
  ]
]

#corollary[
  Under MCF the area evolves as
  $
  d / (d t) Area(M_t) = - integral_(M_t) H^2 dif mu.
  $
  
  In fact MCF is the $L^2$ gradient flow of the area functional.
]

#corollary[
  If $H >= 0$ at $t = 0$ then $H >= 0$ for all $t > 0$, similarly if $A >= 0$ at $t = 0$ then $A >= 0$ for all $t > 0$.
]
= Lecture 2

Now studying area of MCF is not particularly useful since the blow up will cause the area to explode to infinity. Instead, we will look at a weighted area that will be scale invariant. Specifically, we define
$
GaussArea(M_t) = integral_(M_t) rho_(x_0,t_0) (x,t) dif mu
$
where
$
rho_(x_0,t_0) (x,t) = 1 / (4 pi (t_0 - t)) exp(- (|x-x_0|^2)/(4 (t_0-t))).
$

#theorem("Huisken's monotonicity formule")[
  Under MCF we have
  $
  (d) / (d t) integral_(M_t) rho_(x_0, t_0) dif mu = - integral_(M_t) lr(|arrow(H) - ((
    x-x_0
  )^perp) / (2 (t-t_0))|)^2 rho_(x_0, t_0) dif mu_t
  $
]<thrm-Huisken>
#exercise[
  Let $x' = lambda(x - x_0)$, $t' = lambda^2 (t - t_0)$ and consider the rescaled flow
  $
  M_t^lambda = lambda (M_(t_0 + lambda^(-2) t') - x_0).
  $
  
  Show that
  $
  integral_(M_t) rho_(x_0, t_0)(x,t) dif mu (x) =
  integral_(M_t) rho_(0, 0)(x', t') dif mu_t' (x')
  $
]

#exercise[
  Let ${ M_t }_(t in (-infinity, 0))$ be an ancient MCF. Prove that
  $
  arrow(H) - x^perp / (2t) = 0, quad forall t <0 <=> M_t = sqrt(-t) M_(-1), quad forall t < 0
  $
]

#proof([of @thrm-Huisken])[
  WLOG we assume that $(x_0, t_0) = (0,0)$ and write $rho = rho_(0, 0)$.
  #claim[
    $(d / (d t) + laplace_(M_t) - H^2) rho = -|arrow(H) - x^perp / (2 t)|^2rho$
  ]
  Note that this claim would prove the theorem since it would imply that
  $
  d / (d t) integral rho dif mu_t = integral (
    d / (d t) rho - H^2 rho
  ) dif mu_t = integral lr(|arrow(H) - x^perp/(2 t)|)^2 rho dif mu_t - integral laplace_(M_t) rho dif mu_t
  $
  and the last term vanishes due to divergence theorem.
  
  Now let us prove the claim, first note that the tangential derivative of $rho$ is its projection onto the tangent plane of $M_t$, which can be written as:
  $
  nabla^(M_t) rho = D rho - (D rho dot nu) nu.
  $
  Taking the divergence gives us that
  $
  laplace_M_t rho = div_(M_t) (nabla^(M_t) rho) = div_(M_t) (
    D rho
  ) + arrow(H) dot D rho.
  $
  
  We also have that
  $
  (d) / (d t) rho = diff_t rho + arrow(H) dot D rho
  $
  along MCF so we get
  $
  (d / (d t) + laplace_(M_t)) rho &= diff_t rho + div_(M_t) (
    D rho
  ) + 2 arrow(H) dot D rho
  \ &= diff_t rho + div_(M_t) (
    D rho
  ) + (|nabla^perp rho|^2) / rho - lr(|arrow(H) - (nabla^perp rho)/rho|)^2 + H^2 rho
  $
  One can then explicitly check using the formula for $rho$ that
  $
  diff_t rho + div_(M_t) (D rho) + (|nabla^perp rho|^2) / rho = 0
  $
  and so we are done.
]

Motivated by this monotonicity we define
$
Theta(M, x_0, t_0, r) = integral_(M_(t_0 - r^2)) rho_(x_0) dif mu.
$

Note that
$
Theta(M, x_0, r) = 1, quad forall r > 0 <=> M "is a static multiplicity one plane".
$

#theorem([$epsilon$-regularity])[
  There exists constants $epsilon > 0, C < infinity$ universal such that if $M$ is a smooth MCF with
  $
  sup_((x,t) in P(x_0, t_0, r)) Theta(M, x, t, r) < 1+ epsilon
  $
  then
  $
  sup_(P(x, r slash 2)) |A| <= C / r
  $
]
#proof[
  We prove by contradiction, then by rescaling, there exists a sequence $M^j$ of mean curvature flows such that
  $
  sup_((x,t) in P(0,1)) Theta(M^j, x, t, 1) < 1 + 1 / j
  $
  but there is some $(x_j, t_j) in P(0, 1/2)$ such that
  $
  |A|(x_j, t_j) > j
  $
  
  By point selection, there are points $(x_j', t_j') in P(0, 3/4)$ such that
  $
  Q_j = |A|(x_j', t_j') > j "and also"
  sup_(P(x_j', t_j', j / (10 Q_j))) <= 2 Q_j
  $
  
  Now let $hat(M)^j$ be the sequence of flows we get by shifting $M^j$ to place $(x_j', t_j')$ at the origin and parabolically rescaling by $Q_j$. This guarantees that
  $
  |A|(0) = 1 "and" sup_(P(0, j / 10))|A|<= 2
  $
  so by standard parabolic theory we also get similar estimates on the derivatives of $A$ so $hat(M)^j$ converges smoothly to a non-flat limit $M^infinity$. But now
  $
  Theta(M^j, 0, Q_j) < 1 + 1 / j
  $
  so $Theta(M^infinity, 0, r) = 1$ so $M^theta$ is a flat plane, which is a contradiction.
]

#exercise[
  Prove Allards $epsilon$-regularity theorem using the same method.
]

= Lecture 3
We will call a closed embbedded mean-convex surface $alpha$-noncollapsed if each $p in M$ admits exterior & interior balls of radius $alpha/H(p)$.

Each embedded surface is clearly $alpha$-non-collapsed for _some_ $alpha$, but a key property of MCF is that it preserves this property.
#theorem("Andrews")[
  If $M_t$ is a MCF and $M_0$ is $alpha$-noncollapsing then so its $M_t$.
]
#proof[
  For $x in M$ we define $c(x) = x + r(x) nu$, $r(x) = alpha/H(x)$, then
  $
  "interior ball at" x <=> ||y - c(x)||^2 >= r(x)^2, quad forall y in M
  $
  Rewriting this we have
  $
  ||y-c(x)||^2 = ||y-x||^2 - 2r(x) ip(y -x, r(x)) + r(x)^2
  $
  so
  $
  ||y - c(x)||^2 >= r(x)^2 <=> (2 ip(y-x, r(x))) / (||y-x||^2) <= H(x) / alpha.
  $
  Now given $M_t$ a MCF we consider
  $
  Z^* (x,t) := sup_(y != x) (2ip(X(y,t) - X(x,t), nu(x,t))) / (||X(y,t) - X(
    x,t
  )||^2)
  $
  a computation shows that $Z^*$ evolves (weakly in the sense of viscosity solutions) under the equation
  $
  diff_t Z^* (x,t) <= laplace Z^* + |A|^2Z^*
  $
  and comparing this with the evolution equation of $H$:
  $
  diff_t H = nabla H + |A|^2H
  $
  we see that since $H$ and $Z^*$ are positive then we can consider the quotient $Z^* /H$ which gives us
  $
  diff_t Z^* / H <= laplace Z^* / H + 2 ip(nabla ln(H), nabla Z^* /H)
  $
  and so by standard maximum principle $max (Z^* / H)$ is non-increasing.
  A similar computation is done for the exterior ball.
]

We can now use this preservation to prove curvature estimates.
#theorem[
  For all $alpha > 0$, we have constants $rho = rho(alpha) > 0$ and $C = C(alpha) < infinity$ such that if $M$ is an $alpha$-noncollapsed flow in $P(p,t,r)$ where $H(p,t) <= r^(-1)$ then
  $
  H <= C r^(-1) "in" P(p,t,rho r)
  $
]<thrm-local_curv_estimate>
Note that this is very similar to Harnack inequalities for positive solutions of elliptic/parabolic PDEs.
#proof[
  Assume that this does not hold, so we have MCFs $M^j$ all $alpha$-noncollapsed in $P(0,0,j)$ with
  $
  H(0,0) <= j^(-1) "but" sup_(P(0,0,1)) H >=j.
  $
  For $j -> infinity$, we have that $M^j$ converges in the Hausdorff sense to a static plane.
  
  #exercise[
    Show using Stokes theorem that this setup guarantees an estimate of the form
    $
    Area(M_t^j sect B(x,r)) <= (1 + epsilon) pi r^2
    $
  ]
  So $epsilon$-regularity then guarantees that $limsup_(j -> infinity) sup_(P(0,0,1)) |A| = 0$
]

#theorem("Convexity Estimate")[
  For all $epsilon > 0, alpha > 0$ there exists some constant $eta(epsilon, alpha) < infinity$ such that if $M$ is $alpha$-noncollapsed in $P(p,t,eta r)$ and $H(p,t) <= r^(-1)$ then
  $
  kappa_1(p,t) >= - epsilon r^(-1)
  $
  where $kappa_1$ is the smallest principal curvature.
]<thrm-convex_estimate>

#corollary[
  Any ancient $alpha$-noncollapsed flow $M_t$ is convex.
]

#proof([of @thrm-convex_estimate])[
  Fix $alpha$ and let $0 < epsilon_0 <= 1/alpha$ be the infimum of $epsilon$'s for which the assertion holds.
  
  Then we know that there exist MCFs $M^j$ that are $alpha$-noncollapsed in $P(0,0,j)$ with $H(0,0) <= 1$ and $kappa_1 (0,0) -> - epsilon_0$. Then by @thrm-local_curv_estimate we get that $M^j -> M^infinity$ smoothly in $P(0,0, rho/2)$ modulo passing to a subsequence.
  
  Now $M^infinity$ satisfies $kappa_1 (0,0) = - epsilon_0$ and $H(0,0) = 1$ so by continuity $H > 1/2$ in some smaller ball $P(0,0,r)$.
  #exercise[
    Show that $kappa_1/H > - epsilon_0$ everywhere in $P(0,0,r)$.
  ]
  
  Thus $kappa_1/H$ attains a negative minimum inside $P(0,0,r)$, which contradicts strong maximum principle (???).
]

#remark[
  As a consequence of this, a grim repear times $RR$ cannot be a blowup limit of embedded mean-convex MCF.
]

#remark[
  Blowup limits of $alpha$-noncollapsed flows are always smooth and convex.
]

#theorem("Brendle-Choi")[
  Any singularity at the first singular time is modelled by $S^2$, $S^1 times R$ or Bowl soliton.
]

= Lecture 4
A family of weak closed sets ${C_t}$ is called a subsolution of MCF if $forall {M_t}_(t in [t_0,t_1])$ a smooth compact MCF then
$
C_(t_0) sect M_(t_0) = nothing =>
C_t sect M_t = nothing, quad forall t in [t_0, t_1]
$

The level-set flow ${F_t(C)}_(t >= 0)$ of any closed set $C$ is the maximal subsolution ${C_t}_(t >= 0} $ with $C_0 = C$.
#proposition[
  + The level set flow exists and is unique.
  + $F_0 (C) = C, F_(t + t') (C) = F_t (F_(t') (C))$.
  + $F_t (C+x) = F_t (C) + x$.
  + $C seq C' => F_t (C) seq F_t (C')$.
]
#proof[
  We first show existence and uniqueness, this is easy by showing that
  $
  F_t (C)
  = overline(union {C_(t') | {C_t}_(t >= 0) "is a subsolution with" C_0 = C})
  $
]
Then
