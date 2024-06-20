#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "/Templates/math.typ": *
//#import "/Templates/monograph.typ": frontpage
//#import "@preview/cetz:0.2.2": canvas, draw, tree
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#set pagebreak(weak: true)
#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm), numbering: "1")
#set enum(numbering: "(1)", indent: 1em)
#outline()

#pagebreak(weak: true)

= The metric completion of the space of Kahler metrics and applications
Goal: teach overview about metric Geometry.

Let $(X, omega)$ be a compact connected Kahler manifold. That is a form $omega$ such that locally
$
omega = i partial ov(partial) g
$

If $omega'$ is another such metric with $[omega'] = [omega]$ we know that $omega' = omega + i diff ov(diff) v$ where $v$ is some smooth function. This is a sort of local to global result. This allows us to define what are called Kahler potentials
$
cal(H)_omega := {
  v in C^infinity (X) "such that" omega_v := omega + i diff ov(diff) v > 0
}
$

The natural question is to then nice nice/canonical metrics in $cal(H)_omega$, for us that will mean constant scalar curvature metrics.

Try try and tackle this we introduce $K$ energy functional, $K(u)$, who's critical points are constant scalar curvature metrics. Now this doesn't always happen, so we want to attain a characterization of when this happens.

Specifically, we want to prove a theorem of the form
#theorem[
  The following are equivalent
  + There exists a unique cscK metric in $cal(H)_omega$.
  + The $K$-energy is proper.
  + The $K$-energy is geodesically stable.
]

The second condition sort of controls the behaviour of energy $K$ 'at infinity'. The third one has to do with the variational structure of the functional.

To get a handle on these problems we look towards finite dimensions.
#theorem[
  Suppose $F : RR^n -> RR$ is a strictly convex functional. If $F$ has a minimizer it has to be unique.
  The following are equivalent:
  + $F$ has a unique minimizer.
  + $F$ is proper, in the sense that there exists $C,D > 0$ such that
    $
    F(x) >= C |x| - D, x in RR.
    $
  + $F$ is geodesically stable, i.e. there exist $C$ such that // TODO: FINISH
]
This is easy to prove for yourself, $(2) => (1)$ is easily seen by using compactness and convexity properties of $RR^n$ and $(1) => (2)$ is also easy using convexity and completeness.

Almost immediately this breaks when we try to apply it in our infinite dimensional setting, $cal(H)_omega$ is not classically convex.
The next attempt is to try and change the geometry of $C^infinity (M)$ to change what geodesics look like. We can do this using a Riemannian metric on $C^infinity (M)$ as a Frechet manifold, the metric being
$
|phi|_(2,u) := sqrt(integral_X |phi|^(2)omega_u^n)
$
where $u in H_omega, phi in C^infinity (M)$.

For added flexibility we want a family of metrics given by
$
|phi|_(p,u) := (integral_X |phi|^(p)omega_u^n)^(1 / p)
$

One can check that the geodesic equation is independent of $p$.

The good news is that if $u_t : [0,1] -> cal(H)_omega$ is a smooth geodesic, $K(u_t)$ is convex.

The bad news is, unfortunately such geodesics do not exist, but we can instead weaken the notion of of geodesic to $t -> u_t$ joining $u_0$ and $u_1$, with bounded Hessian.

Our key idea is then to extend $cal(H)_omega$ to accommodate weak geodesic segments. We consider the $L^p$ length
$
l_p (gamma) = integral_0^1 ||dot(gamma)_t||_(p) dif t = integral_0^1 (
  integral_X |dot(gamma)_t|^p omega_(gamma_t)^n
)^(1 / p) dif t
$
with
$
d_p (u, v) = inf_(gamma_0= u, gamma_1=v) l_p (gamma)
$

Now what we want to check is that this is indeed a metric space, since in infinite dimension these metrics can become degenerate. The metric completion is then the nice space $cal(E)^p$ and the $K$-energy extends to a convex functional $cal(K) : cal(E)^p -> RR union { infinity }$. And so we have convexity, and also we have compactness, since
#theorem[
  Let $C > 0$. The set ${ cal(K)(u) <= C, d_1 (0, u) <= C } seq cal(E)^1$ is $d_1$-compact.
]

We do lose some regularity but it turns out that this does not hurt our goal.
#theorem("Elliptic regularity")[
  Minimizers of $cal(K)$ in $cal(E)^1$ are smooth cscK metrics inside $cal(H)_omega$.
]

We then get the following theorem
#theorem[
  The following are equivalent:
  + There exists a unique cscK metric in $cal(H)_omega$.
  + The $cal(K)$-energy is 'proper' in the sense that there exists $C,D$ with
    $
    cal(K)(u) >= C d_1 (0, u) - D, quad u in cal(H)_omega
    $
  + The $K$-energy is uniformly stable along geodesic rays with bounded Laplacian.
    $
    lim_(t -> infinity) (cal(K)(u_t)) / t >= C > 0
    $
]

// OVERALL IDEAS
// Convexity for functionals is super cool and we like it.
// Convexity doesn't usually exist, so we add a metric to change what convexity means.
// Changed metric breaks existence of geodesics so we must weaken geodesics.
// With this weakening we need to add some extra points to guarantee their existence
// We then can with a clever choice of parameters, fix both elliptic regularity and compactness.
// This is enough to get what we want.
