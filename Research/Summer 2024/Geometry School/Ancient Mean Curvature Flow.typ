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
  block([*#body*])
}
#outline()

= Lecture 1
We will start with a simpler model of mean curvature flow to get familiar with the subject.
== Ancient Curve Shortening Flow
Set $Gamma : M -> RR^2$, the mean curvature equation simplifies to
$
diff_t Gamma = diff_s diff_s Gamma
$
If $Gamma_t$ exists for $t in (-infinity, T)$ then we call $Gamma_t$ an ancient flow.

#remark[
  Ancient solutions to parabolic PDEs are rigid, and thus easier to analyze.
]

#example[
  Consider the heat equation $diff_t u = laplace u$ where $u : RR -> RR$, then
  $
  1 / 2 (d) / (d t) integral_RR u^2 dif x = integral u u_t = integral u u_(x x) = - integral u_x^2 <= - C integral u^2
  $
  where the last inequality is due to Poincare.
  
  Hence we have
  $
  integral u^2 dif x >= C e^(- s t)
  $
  and so with the correct boundary conditions $u equiv 0$ is the only ancient solution to the heat flow.
]

#remark[
  This is an analogue to the Louville type theory for elliptic PDEs, in the elliptic case we need the solution to be entire, in the parabolic case we need it to be ancient.
]

#example[
  In the case of CSF, we do have embedded ancient solutions.
  - The line is the simplest solution.
  - The self-shrinking circle.
  - The grim reaper curve.
  
  The line and grim reaper are actually solutions for $t in (-infinity, infinity)$, solutions of this type are called _eternal_ solutions.
]

We can also glue solutions together, one can in fact glue two grim reaper solutions together to get another ancient solution. This is called the paperclip solution.

There are also many other ways to glue these ancient solutions together.

We also have a solution named the Yin-Yang spiral, which is a rotator, it rotates symmetrically under MCF.

#theorem("Daskolopaulus-Hamilton-Sesmin")[
  A closed embedded compact CSF is a shrinking circle or a paperclip.
]

Under CSF the curvature satisfies
$
diff_t kappa = diff_s diff_s kappa + kappa^3,
$
if we instead parametrize using the Gauss map we get
$
diff_t kappa (theta, t) = kappa^2 diff_(theta) diff_theta + kappa^3.
$
Now if we set $p(theta, t) = k^2$, we call $p$ the 'pressure', and it solves
$
diff_t p = p diff_theta diff_theta p - 1 / 2 (diff_theta p)^2 + 2 p^2.
$
If $p(theta, t) = 1/(- 2t)$ then $Gamma_t$ is the shrinking circle. If $p(theta, t) = lambda (1/(1 - e^(2 lambda t)) - sin^2(theta + gamma))$ then $Gamma_t$ is a paper clip, $lambda$ is the top speed of the paper clip.

Set $alpha = p_theta$ then $alpha$ solves
$
diff_t alpha = p(diff_theta diff_theta alpha + 4 alpha)
$
and we define
$
I(alpha) = integral_0^(2 pi) (diff_theta alpha)^2 - 4 alpha^2 dif theta
$

#exercise[ Show that if $I equiv 0$ then $Gamma_t$ is a shrinking circle or a paper clip.
]

#lemma[
  $I$ evolves as
  $
  d / (d t) I = - 2 integral.dash (diff_t alpha)^2 / p dif theta <= 0
  $
]
#proof[
  We compute
  $
  d / (d t) I = integral 2 (diff_theta alpha) (
    diff_t diff_theta alpha
  ) - 8 alpha (diff_t alpha) = - integral (
    2 diff_theta diff_theta alpha + 8 alpha
  ) (diff_t alpha) = - 2 integral (diff_t alpha) / p (diff_t alpha)
  $
]

#theorem("Gage-Hamilton")[
  Convex closed CSF converges to a round point, in the sense that under the rescaling $tilde(Gamma)_t = (Gamma_t - x_0)/sqrt(2 (t_0 - t))$ and $tau = -1/2 log(t_0 - t)$ we have $lim_(tau -> infinity) tilde(kappa) - 1 = 0$.
]<thrm-gage_hamilton>

= Lecture 2
We now want to prove that $I equiv 0$, to do this we will use the fact that $I$ is monotone, as well as the fact that $lim_(t -> T) I(alpha(t)) = 0$ and $lim_(t -> -infinity) I(alpha(t)) = 0$.

#lemma[
  $lim_(t -> T) I(alpha(t)) = 0$.
]
To prove this we will consider the quantity $omega := tilde(kappa) - 1$, and find that it solves
$
diff_tau omega = L omega + E(omega)
$
where $L(omega) = omega_(theta theta) + 2 omega$ and we have bounds
$
|E(omega)| <= C|omega|||omega||_(L^2)
$

We now want to analyze this linear operator, one can easily check that
$
1, cos(k theta), sin(k theta)
$
are all eigenfunctions of eigenvalue $2$ and $2-k^2$ respectively.

Now in order for $omega -> 0$ as $tau -> + infinity$ we need to have all the 'unstable' components, those with $2-k^2$ positive, not contribute to the solution as $tau -> +infinity$.

This motivates us to define the projection of $omega$ to the positive eigenvalues,
$
P_+ omega = a_0(tau) 1 / (2 pi) + a_1(tau) cos(theta) / pi + b_1(
  tau
) sin(theta) / pi
$
as well as the projection to negative eigenvalues
$
P_- omega = omega - P_+ omega
$

We can now find that
$
d / (d t) ||P_+ omega||^2_(L^2) = 2 ip(omega_tau, P_+ omega)_(L^2) = 2 ip(L omega + E, P_+ omega)_(L^2)
= 2 ip(L omega, P_+ omega)_(L^2) + 2 ip(E, P_+ omega)_(L^2)
\ >= 2 dot 1 ||P_+ omega||^2_(L^2) + 2 ip(E, P_+ omega)_(L^2)
$
and similarly
$
d / (d t) ||P_- omega||_(L^2)^2
<= 2 dot (-2) ||P_- omega||^2_(L^2) + 2 ip(E, P_- omega)_(L^2)
$

#exercise[
  $|ip(E, P_(plus.minus) omega)| <= C||omega||_(C^2)||omega||_(L^2)^2$
]

We can now use the fact that
$
||omega||_(L^2)^2
=
||P_+ omega||_(L^2)^2
+
||P_- omega||_(L^2)^2
$
and by writing $omega_(plus.minus) = ||P_(plus.minus) omega||_(L^2)^2$ we get
$
omega'_+ >= 2 omega_+ - C||omega||_(C^2)(omega_+ + omega_-)
\
omega'_- <= - 4 omega_- + C||omega||_(C^2)(omega_+ + omega_-)
$

#claim[
  $omega_+ <= C||omega||_(C^2)omega_-$
]
#proof[
  First notice that we expect this to be true, since otherwise the $2 omega_+$ term would dominate in the equation for $omega'_+$ and it would grow exponentially, which would contradict the fact that $omega -> 0$.
  
  Now for an actual proof we defined $f(tau) := omega_+ - G omega_-$, then we have
  $
  f' >= 2 omega_+ - C||omega||_(C^2)(
    omega_+ + omega_-
  ) + 4 G omega_- - G C||omega||_(C^2)(omega_+ + omega_-)
  \ = (2 - C||omega||_(C^2)) omega_+ + (4 G - C||omega||_(C^2)) omega_-
  $
  
  Now we know that in the limit, $2 - C||omega||_(C^2) > 1$ so the first coefficient here is at least $1$, hence if $4 G >= C||omega||_(C^2)$ for all $tau >= T_0$ then we have
  $
  f' >= omega_+ >= f
  $
  so $f$ would blow up to infinity as long as $f(T_0) > 0$.
  
  Thus if we set $G(T_0) = sup_(s > T_0) C_0||omega||_(C^2)$ then this blowup would happen unless
  $
  f(T_0) = omega_+ - G omega_- < 0
  $
  so since we know it cannot happen then we must have
  $
  omega_+ < G omega_- = C sup_(s > T_0)||omega||_(C^2)(s)
  $
]
Now we can use this result to get
$
omega'_- <= -4 omega_- + C G omega_- = - (4 - C G) omega_-
$
so for large enough $t$ we have $C G < 1$ so
$
omega'_- <=-3 omega_-
$
hence we get
$
omega_- <= C e^(- 3 tau)
$
so again by the claim
$
||omega||_(L^2)^2 = omega = (1 + o(1)) omega_- <= C e^(- 3tau)
$
and hence
$
||omega||_(L^2) <= C e^(- 3 / 2tau)
$

Then by interior Schauder estimates we get that
$
||omega||_(C^(2 alpha)) <= C||omega||_(L^infinity) <= C||omega||_(L^2)
$

= Lecture 3
Now we move on to the more interesting case of surfaces, if we set $M_t$ to be the graph of $u(dot, t)$ over $Sigma := M_0$ then under MCF this evolves as
$
u_t = L u + E(u)
$
where $L u = laplace_Sigma u + |A_sigma|^2 u + Ric(nu,nu) u$ and $|E(u)| <= C||u||_(C^2)||u||_(C^1)$

Now if we write this as
$
u_t = F(nabla^2 u, nabla u, u, x, t)
$
then we will define $v$ to be the solution of
$
0 = F(nabla^2 v, nabla v, v, x, t).
$
Now we define $w = u - v$ and note that $||omega||_(C^2) <= epsilon$ as well as
$
omega_t = L omega + E(omega)
$

