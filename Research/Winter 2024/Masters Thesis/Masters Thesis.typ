#import "/Templates/monograph.typ": style, frontpage, outline_style, chapter_headings, start_outline
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "@preview/cetz:0.2.1"
#import "/Templates/i-figure.typ"
#show: style
#show math.equation: i-figure.show-equation.with(
  level: 1,
  only-labeled: true,
)
#show ref: i-figure.show-equation-refrences.with(
  level: 1,
)
// #show: equation_numbering
// #show: equation_references
#show: doc => frontpage(
  toptitle: [Conformally Induced\ Mean Curvature Flow],
  name: [Jacob Reznikov
  #linebreak()
  Master of Science
  ],
  middletitle: [
      Mathematics and Statistics \
      McGill University \
      Montreal, Quebec, Canada],
  bottomtitle: [
    A thesis submitted to McGill University in partial\
    fulfillment of the requirements of the degree of a\
    Master of Science
  ],
  info: [#sym.copyright Jacob Reznikov, #datetime.today().display("[year]")],
  doc)
#show: thmrules
#show: outline_style


#pagebreak(weak:true)
#show: start_outline
#pagebreak(weak:true)
= Abstract
This thesis aims to loosely cover the subject of geometric flows, and more specifically a variant of the mean curvature flow.
The subject of geometric flows uses results in PDE theory theory, more specifically parabolic PDEs, to gain new insight about Riemannian geometry.

One of the biggest problems often tackled by mean curvature flows is the Isoperimetric problem. The Isoperimetric problem asks us to classify the spaces that minimize perimeter for a given volume (hence the name), the first use of mean curvature flows to attack this problem was due to Huisken in 1984 #cite(<huiskenFlowMeanCurvature1984>) who proved it in case of boundaries of convex domains in Euclidean, and since then there have been attempts to push his methods further. More recently, in 2013, Guan and Li #cite(<guanMeanCurvatureType2013a>) constructed a new normalized flow which allows them to prove the inequality in the case of boundaries of star-shaped domains in Space forms. Shortly after, in 2018, Guan, Li and Wang pushed this flow even further which allowed them to prove the result in a certain class of warped product spaces #cite(<guanVolumePreservingFlow2018>).

Then, concurrently with the writing of this thesis, Li and Pan reframed the technique in terms of conformal vector fields, allowing them to weaken the assumptions on the ambient space @jiayuIsoperimetricProblemRiemannian2023a.

This thesis continues the effort to use such flows, together with my collaborator Joshua Flynn we pushed the flow even further, allowing us to weaken the assumptions on the ambient space even further and even weaken the star-shapedness assumption, which was key to all previous results.


#pagebreak(weak:true)
= Acknowledgements
First I would like to thank my supervisor, Professor Pengfei Guan, for his regular assistance both before and after the start of my Masters program. He was always there to help me understand concepts I would otherwise spend weeks grappling with. Secondly, I would like to thank my collaborator, Doctor Joshua Flynn, without whom this project would have never happened. He would always chime in with timely ideas whenever we would get stuck. I would additionally like to thank my two good friends, Sam Zeitler and Bart Syroka for always being there to bounce ideas of or listen to my insane ramblings.
Finally I would like to thank my family, and especially my mom, for always being there to help and support me whenever I would feel down and lost.

#pagebreak(weak:true)
= Contribution
This thesis and each chapter within was written solely by myself, with occasional assistance from colleagues regarding phrasing.
The body of the thesis is largely taken from the paper co-authored by myself and Joshua Flynn.

#show: chapter_headings
#pagebreak(weak:true)
= Introduction
== Background on the Isoperimetric Problem

The Isoperimetric Problem asks a seemingly simple question:\ Among all regions occupying a given volume which has the least perimeter?

In the simple case of 2 and 3 dimensions we all know that the answer is a circle and a sphere respectively, and when we extend it to $n$ dimensions in Euclidean space, the answer remains the $n-1$ dimensional hypersphere. However, if we try to generalize this question to a larger domain the answer very quickly becomes intractable.

One of the ways to answer such a question is with the method of geometric flows, we will start with a shape which will likely not be optimal, and then we will morph it over time to make it optimal.


== Concepts and Notation
This document assumes general knowledge of differential and Riemannian geometry, see @leeIntroductionSmoothManifolds2012 and @leeIntroductionRiemannianManifolds2018a for great introductions, respectively.

For the rest of this document we will use the following notation, $N$ is an $n+1$ dimensional Riemannian manifold with metric $ov(g)$ within which we have a compact domain $Omega$ with boundary $diff Omega = M$ such that $F : M -> N$ is an embedding making $M$ a Riemannian hypersurface. We then set $g := F^* ov(g)$ to be the induced metric on $M$. We will in general identify $M$ with its image $F(M)$ and use the two interchangeably. We will write $frak(X)(N)$ to the set of surfaces that can be defined as above and call any such surface any such surface an _admissable_ hypersurface.

In general, tensorial constructions defined on $N$ will be written with an overline and their versions on $M$ will be written normally. We will write the covariant derivatives on $M$ and $N$ as $nabla$ and $ov(nabla)$ respectively. We will write the Laplacian on $N$ and $M$ as $Delta$ and $ov(Delta)$ respectively. We will use Einstein summation notation for all tensor equations.

Often for a matrix $M_(i j)$ we will use the notation $M_(i j) >= #h(0em) (>) med med 0$ to denote the fact that $M_(i j)$ is positive semi-definite (definite), and similarly for $M_(i j) <= #h(0em) (<) med med 0$.

We can use the Riemannian metric $ov(g)$ to take inner products of tangent vectors in the same tangent space $T_p N$, for tangent vectors $X,Y in T_p N$ we will write this as $ip(X,Y)$. Since the metric $g$ is just the restriction of $ov(g)$ onto $T_p M$ when we think of it as a subspace of $T_p N$, because of this we will use the same notation $ip(X,Y)$ for $X,Y in T_p M$.

The Riemannian metric $ov(g)$ defines with it a Riemannian volume form which we will call $dif V$, this form can be restricted to $Omega$ to give and allow us to define 
$
  Volume(Omega) = integral_Omega dif V,
$
we will often write $Volume(M)$ as our $Omega$ can be determined uniquely an orientation on $M$ (more on that later). Similarly the metric $g$ defines a volume form on $M$ which we will call $dif S$, using which we define
$
  Area(M) = integral_M dif S.
$
We can now define the Isoperimetric profile of $N$ to be the function 
$
  I(v) := inf { Area(M) : M in frak(X)(N) "and" Volume(M) = v},
$
The Isoperimetric Problem now asks us to
+ Show there exist elements $M in frak(X)(N)$ that attain the infimum above.
+ Characterize these elements.

We will now start to build up the concepts that allow us to solve this problem.

== Riemannian Geometry
Recall that since $M$ is the boundary of a manifold it must be orientable,
it thus has a canonical 'outward' pointing unit normal vector field, which we will call $nu$.

Working with Riemannian geometry is almost always easier when done with coordinates. In extrinsic geometry, there are two coordinate systems that we will be using repeatedly so we will list some of their properties.
#proposition[
  Let $M$ be a Riemannian manifold, at any point $p$ there exists a chart $(U,phi)$ with the property that that the frame
  $
    e_i = diff/(diff x^i)
  $
  forms an orthonormal basis _at the point $p$_. These are called _orthonormal coordinates_.
]
#proposition[
  Let $M$ and admissible submanifold of $N$, at any point $p in M$ there exists a chart $(U,phi)$ of $N$ such that
  $
    e_i = diff/(diff x^i)
  $
  forms an orthonormal basis for $T_p M$ for $i <= n$ _at $p$_ and $e_(n+1) = nu$ _on $U$_. These are called _Fermi coordinates_. In general, when we are dealing with Fermi coordinates and write $e_i$ we are excluding $e_(n+1)$ and refer to it as $nu$ instead.
]<prop-fermi_coords>
#proof[
  The proof for the first proposition is standard and can be found in any differential geometry textbook, for the second proposition see @leeIntroductionRiemannianManifolds2018a(p.~183).
]

Then we define the second fundamental form $h$ to be the bilinear form given by
$
   h(X,Y) = ip(X, ov(nabla)_Y nu).
$
This second fundamental form encodes within itself how the manifold $M$ lies inside $N$, it also carries with it a number of useful properties, the most important of which is that it is symmetric, see @leeIntroductionRiemannianManifolds2018a[p.~227] for details. Also of much importance is the trace of this form, taken with respect to the metric, which we write as $H = h_(i i)$, which is called the _mean curvature_. Also its eigenvalues $kappa_i$ called _principle curvatures_.


Let us write up some properties of the second fundamental form.
#proposition[
Let $e_i$ be an orthonormal frame at $p$, the following are true:
#block(width: 100%, inset: (x: 2em))[
  + $h$ can be written in coordinates as $h_(i j) = ip(e_i, ov(nabla)_(e_j) nu)$. <prop-h_coords>
  + $ov(nabla)_i nu = h_(i j) e_j$. <prop-h_applied>
  + $ov(nabla)_i e_j = - h_(i j) nu$. <prop-h_neg>
  + If $f$ is a function $N -> RR$, then $ov(Delta) f = Delta f + ov(Hess)_f (nu,nu) + H nu(f)$. <prop-h_laplace>
  ]
]<prop-h_props>
#proof[
#link(<prop-h_coords>)[(a)] is directly from definition, to see #link(<prop-h_applied>)[(b)] note that ${ e_1, ..., e_n } union { nu }$ form a basis for the tangent space $T_p M$ and thus we have
$
  nabla_i nu = a^j e_j + b nu
$
for some coefficients $a^j,b in RR$. But now consider,
$
  0 = nabla_j ip(nu,nu) = 2 ip(nabla_j nu, nu) = 2 b
$
and so we have $b = 0$. We then get,
$
  a^j = ip(nabla_i nu, e_j) = h_(i j)
$
proving the claim.

Now for #link(<prop-h_neg>)[(c)] we note first that $nabla_X Y = ( ov(nabla)_Y X)^top$ for $X,Y in T_p M$, see, for instance, @jostRiemannianGeometryGeometric2011[p.~223]. This will mean that since $e_i$ are orthonormal then
$
  (ov(nabla)_i e_j)^top = nabla_i e_j = 0
$
for all $i,j$ and so $ov(nabla)_i e_j = b_(i j) nu$ for some matrix $b$ of coefficients. Now we have
$
  0
  = ov(nabla)_i ip(e_j, nu)
  = ip(ov(nabla)_i e_j, nu) + ip(e_j, ov(nabla)_i nu)
  = b_(i j) + h_(i j)
$
which proves the claim.

Finally for #link(<prop-h_laplace>)[(d)], we have
$
    ov(Delta) f
  & = ip(ov(nabla)_i ov(nabla) f, e_i) + ip(ov(nabla)_nu ov(nabla), nu)
  = ov(nabla)_i ip(ov(nabla) f, e_i) - ip(ov(nabla) f, ov(nabla)_i e_i) + ip(ov(nabla)_nu ov(nabla), nu)
  \ & = nabla_i ip(nabla f, e_i) - ip(ov(nabla) f, -H nu) + ip(ov(nabla)_nu ov(nabla), nu)
  \ & = Delta f + H nu(f) + ip(ov(nabla)_nu ov(nabla), nu)
$
]

#remark[We will also use the notation $A(X)$ to mean the endomorphism satisfying
$ h(X,Y) = ip(A(X), Y) $
which is given in coordinates by $A^i_j = g^(i k) h_(k j)$
and we will also use the notation $|A|^2$ to denote the squared norm of $h$ or $A$.
]

We will also need another well known geometric identity,
#lemma("Codazzi Equation")[
  We have for any $X,Y,Z in T_p M$
  $
    ov(Rm)(X,Y,Z,nu) = - (nabla_X h)(Y,Z) + (nabla_Y h)(X,Z)
  $
  in particular in coordinates we have
  $
    ov(Rm)_(i j k nu) = - nabla_i h_(j k) + nabla_j h_(i k)
  $
]<lemma-codazzi>
#proof[
  See @petersenRiemannianGeometry2016[p.~93], note that some references have a similar equation of opposite sign due to difference in defining the second fundamental form.
]

A conformal vector field is a vector field $X$ with the property that $lie_X ov(g) = 2 phi g$, where $phi$ is any smooth function called the _conformal factor_ of $X$. The Lie derivative is a little hard to work with for our purposes so we will follow the calculations of @deshmukhGeometryConformalVector2017 to obtain better formulations for the properties of conformal vector fields

#proposition[
  Let $X$ be a vector field on $N$, then for any $Y,Z in T_p N$ we have
  $
    2 ip(ov(nabla)_Y X, Z) = (lie_X g)(Y,Z) + dif eta (Y,Z)
  $
  where $eta$ is the dual one form to $X$ defined by $eta(Z) = ip(X,Z)$
]
#proof[
  We have by Koszul's formula (@leeIntroductionRiemannianManifolds2018a[p.~123])
  $
    2 ip(ov(nabla)_Y X, Z) =& Y(ip(X,Z)) + X(ip(Y,Z)) - Z(ip(X,Y))
    \ &- ip([X,Y],Z) - ip([Y,Z],X) - ip([X,Z],Y)
    \ =& lie_X (ip(Y,Z)) + lie_Y (eta(Z)) - lie_Z (eta(Y))
    \ &- ip(Z,lie_X Y) - eta(lie_Y Z) - ip(Y, lie_X Z)
    \ =& (lie_X ov(g)) (Y,Z) + lie_Y (eta(Z)) - lie_Z (eta(Y)) - eta(lie_Y Z)
    \ =& (lie_X ov(g)) (Y,Z) + (lie_Y eta)(Z) - lie_Z (eta(Y))
  $
  Now we can use Cartan's magic formula (@leeIntroductionSmoothManifolds2012[p.~372]) applied to the second term to get
  $
    2 ip(ov(nabla)_Y X, Z) &= (lie_X ov(g)) (Y,Z) + dif eta(Y,Z) + dif (eta(Y))(Z) - lie_Z (eta(Y))
    \ & = (lie_X ov(g)) (Y,Z) + dif eta(Y,Z)
  $
]
From this we see that an equivalent characterization of a Conformal vector field is $2 ip(ov(nabla)_Y X, Z) = 2 phi ip(Y,Z) + dif eta(Y,Z)$

We now define the skew-symmetric endomorphism $psi$ by
$
dif eta(Y,Z) = 2 ip(psi Y,Z)
$
This endomorphism is then called the _associated tensor field_ of $X$, and with it we can rewrite the above equation as
$
  ip(nabla_Y X, Z) = phi ip(Y,Z) + ip(psi Y, Z).
$
Note that this is also the decomposition of the $nabla X$ into its symmetric and anti-symmetric parts, that is $
  Sym(nabla X) = phi g
$

In the special case that $phi = 0$ we call $X$ a Killing vector field.

#definition[
  Given a fixed vector field $X$ on $N$ we define the support function $u_X$ on $M$ by
  $
    u_X := ip(X,nu)
  $
  where $nu$ is the normal vector to $M$.
]<def-support>

To see why conformal vector fields are so useful in the study of the Isoperimetric inequality, we will now derive a key result that was the basis of the results by Guan, Li and Wang and will also be the basis of the results in this thesis.

#lemma("Conformal Integral Identities")[
  Let $M seq N$ be an admissible hypersurface as defined above, and let $X$ be a conformal vector field on $N$ with conformal factor $phi$, the following identities hold
  $
    integral_M (n phi - H u) dif S = 0
  $
  and 
  $
    integral_M H (n phi - H u) dif S = n/(n-1) integral_M ov(Ric)(nu, X - u nu) dif S - 1/n integral_M u sum_(i < j) (kappa_i - kappa_j)^2 dif S
  $
  where $u = ip(X, nu)$ is called the support function.
]<lemma-integral_identities>
#proof[
  First we will define the vector field $Y = X - u nu$, which is the projection of $X$ onto the tangent space of $M$. Now consider the divergence of $Y$ on $M$, for an orthonormal frame $e_i$ of $M$ we have
  $
    div_M (Y) = tr(nabla_j ip(Y, e_i))
    = tr(ov(nabla)_j ip(X, e_i))
    = tr(ip(ov(nabla)_j X, e_i) + ip(X, ov(nabla)_j e_i)).
  $
  Now we combine the fact that $X$ is a conformal vector field and the fact that the trace of an endomorphism is the same as the trace of its symmetrization, giving us that 
  $
    tr(ip(ov(nabla)_j X, e_i)) = tr((ov(nabla) X)_(j i))
    = tr(Sym(ov(nabla) X)_(i j))
    = tr(phi ov(g)_(i j))
  $
  Now knowing that in our coordinates $ov(g)_(i j) = delta_(i j)$ and that the trace of $delta_(i j)$ is $dim M$ we get
  $
    div_M (Y) = tr(phi ov(g) + ip(X, -h_(i j) nu))
    = n phi - H u
  $
  then since $M$ is closed we have by divergence theorem
  $
    integral_M div_M (Y) dif S = integral_M (n phi - H u) dif S = 0
  $

  Secondly we will consider the vector field $Y' = (H I - A) Y$, its divergence gives us
  $
    div_M Y'
    & =
    tr(nabla_j (H I - A)^i_k Y^k)
    =
    tr(nabla_j ((H I - A)^i_k ip(X, e_k)))
    \ &= tr(ip(X, e_k) nabla_j (H I - A)^i_k + (H I - A)^i_k ov(nabla)_j ip(X, e_k))
    \ &= tr(ip(X, e_k) (nabla_j h_(ell ell) delta^i_k - nabla_j h_(i k)) + (H I - A)^i_k (phi delta_(j k) - u h_(j k)))
    \ &= ip(X, e_k) (nabla_k h_(ell ell) - nabla_i h_(j k)) + H(n phi - H u) - H phi + u|A|^2
    \ &= ip(X, e_k) (nabla_k h_(ell ell) - nabla_ell h_(ell k)) + H((n-1)phi - H u) + u|A|^2
  $
  We now use the #link(<lemma-codazzi>)[Codazzi equation] to get
  $
    div_M Y'
    & = ip(X, e_k) ov(Rm)_(ell k ell nu) + H((n-1)phi - H u) + u|A|^2
    \ &= ip(ov(Rm)(e_ell, Y) e_ell, nu) + H((n-1)phi - H u) + u|A|^2
  $
  now swapping the last two indices on the Riemann tensor flips its sign gives us the Ricci tensor, then applying divergence theorem once more gives us
  $
    & integral_M H ((n - 1)phi - H u) dif S = integral_M ov(Ric)(nu, Y) dif S - integral_M u|A|^2 dif S
    \ &(n-1)/n integral_M H (n phi - n/(n-1) H u) dif S = integral_M ov(Ric)(nu, Y) dif S - integral_M u|A|^2 dif S
    \ &integral_M H (n phi - n/(n-1) H u) dif S = n/(n-1) integral_M ov(Ric)(nu, Y) dif S - integral_M n/(n-1) u|A|^2 dif S
    \ &integral_M H (n phi - H u) dif S = n/(n-1) integral_M ov(Ric)(nu, Y) dif S - integral_M u(n|A|^2 - H^2)/(n - 1) dif S
    \ &integral_M H (n phi - H u) dif S = 1/(n-1) (integral_M n ov(Ric)(nu, Y) dif S - integral_M u sum_(i < j) (kappa_i - kappa_j)^2 dif S)
  $
]

== Partial Differential Equations <sect-PDE>
The Partial Differential Equations (PDEs) we will be dealing with most in this document are parabolic PDEs, so we will go over their properties first.



Let $T in (0,infinity]$ and $U seq M$ a smooth open domain, a function $u : [0,T] times U$ is said to solve a *quasi-linear parabolic PDE* if it satisfies a differential equation of the form
$ diff_t u (x,t) = a^(i j)(x,t,u,nabla u) nabla_i nabla_j u + G(x,t,u,nabla u) $<parabolic_pde>
where $a$ is symmetric positive definite matrix depending smoothly on its inputs and $G$ is a function depending smoothly on its inputs.

The equation is said to be in _divergence form_ if it can be written instead as
$ diff_t u (x,t) = nabla_i (b^(i j)(x,t,u,nabla u) nabla_j u) + G(x,t,u,nabla u) $<div_parabolic_pde>

We say that the PDE in @eqn-parabolic_pde is _uniformly parabolic_ if there exist constants $A,B$ such that
$
  A|v|^2 <= a^(i j) v_i v_j <= B|v|^2
$
for all $v in T_p M$ everywhere.

The most important tool in the analysis of parabolic PDEs is the maximum principle, a form of which we will now prove.

#proposition[
  Assume $u$ solves @eqn-parabolic_pde and that at a maximum of $u$ the inequality $G(x,t,u,nabla u) < f(t)$ holds, then we have for all $t in [0,T]$
  $ sup_(x in U) u(x,t) <= sup_(x in U) u(x,0) + integral_0^t f(s) dif s $<max_priniciple_linear>
  if instead we have $G(x,t,u,nabla u) < B u(x,t)$ for some constant $B in RR$ then we have
  $ sup_(x in U) u(x,t) <= (sup_(x in U) u(x,0)) e^(B t) $<max_priniciple_exp>
]<prop-max_principle>
#proof[
  First for @eqn-max_priniciple_linear consider the auxiliary function
  $ v(x,t) = u(x,t) - integral_0^t f(s) dif s - sup_(x in U) u(x,0) $
  which then solves
  $
    diff_t v(x,t) = a^(i j)(x,t,v,nabla v) nabla_i nabla_j v + G(x,t, v, nabla v) - f(t)
  $
  and also $v(x,0) <= 0$ on $U$.
  Now assume that @eqn-max_priniciple_linear fails to hold, that is, at some point $(y,t)$, we have
  $
    u(y,t) > sup_(x in U) u(x,0) + integral_0^t f(s) dif s
  $
  then we also have
  $
    v(y, t) > 0
  $
  and so the maximum of $v$ is positive. But now let $(z,t')$ be said maximum, we have that
  $
    nabla v(z,t') = 0, nabla_i nabla_j v(z,t') <= 0 "as well as" diff_t v(z,t') >= 0
  $
  we thus have
  $
    0 <= diff_t v(x,t) = a^(i j)(x,t,v,nabla v) nabla_i nabla_j v + G(x,t, v, nabla v) - f(t)
    < 0
  $
  this is a contradiction.

  For @eqn-max_priniciple_exp we use an identical argument except that we instead use
  $ v(x,t) = e^(-B t) u(x,t) - sup_(x in U) u(x,0) $
]

The second most important tool is short time-existence, which will be extremely important as we want to use the derivatives of geometric quantities to characterize them, so we need the flow to exists for some non-zero amount of time.

#theorem[
  If $u(0,dot)$ is a smooth initial condition and @eqn-parabolic_pde is uniformly parabolic then @eqn-parabolic_pde has a solution $u$ for some time $T > 0$ which is smooth on $[0,T)$. Furthermore, if there is a uniform bound 
  $
    ||u(t,dot)||_(C^(1+r)) <= K "with" t "fixed in" [0,s)
  $
  for some constants $r > 0$, $K > 0$ then $T > s$.
]
#proof[
  Proposition 8.2 in @taylorPartialDifferentialEquations2023[p.~411].
]

The last PDE results which we will need are the famous Nash-Moser estimates, for a detailed dive see @taylorPartialDifferentialEquations2023 @ladyzenskajaLinearQuasilinearEquations1968a.
#theorem("Nash-Moser estimates")[
  Let $u$ be a solution to uniformly parabolic @eqn-parabolic_pde on $[0,T)$ with smooth initial condition, if we know that
  $
    |u(t,dot)| < c_1 "and" ||nabla u(t, dot)|| <= c_2 "on" [0,T)
  $
  then on any subdomain $U'$ with $ov(U') seq U$ we have for some $r > 0$ depending only $c_1,c_2,A,B$ that
  $
    ||u(t,dot)||_(C^(1+r)) <= C(c_1,c_2,A,B,d)
  $
  where $d$ is the distance between $diff (U')$ and $diff U$.
]
#proof[
  We will use Theorem 1.1 in @ladyzenskajaLinearQuasilinearEquations1968a[p.~517], it is enough to show that the functions
  $
    diff_(x^k) a^(i j)(x,t,v,p),
    diff_v a^(i j)(x,t,v,p),
    diff_(p^k) a^(i j)(x,t,v,p),
    G(x,t,v,p)
  $
  are uniformly bounded on the set
  $
    { (x,t,v,p) : x in ov(U), |v| <= c_1 "and" ||p|| <= c_2}.
  $
  But this is immediate since these functions depend smoothly on their inputs and thus are continuous and so since the set above is compact they must attain their maximum inside that set and thus they are bounded by that maximum.
]


== Evolving Hypersurfaces

Now that we are familiar with geometry and parabolic PDEs we can start to use them together. This is done by use of *geometric flows*.
#definition[
  Let $F : M -> N$ be an admissible hypersurface. Let $F_t$ be a function $F : I times M -> N$, where $I = [0,T)$ for some fixed $T$ and $F_0 = F$ on $M$. $F_t$ is called a _normal flow_ with _normal velocity_ $f$ if
  $
    diff_t F_t (x) = f(t,x) nu(x)
  $
  where $nu(x)$ is the normal vector to $F_t (M)$ at $F_t (x)$.
]

#remark[
  We will often refer to $F_t (M)$ as $M_t$ for brevity. Additionally many constructions on $M_t$ will be denoted without explicit reference to $t$, i.e $g$ instead of $g(t)$, even though the metric of $M_t$ will depend on $t$. Keep in mind that any construction of the metric will also depend on $t$.
]

As a manifold flows it's various properties, both local and global, will change, the equations governing these changes are called _evolution equations_. For ambient objects, i.e. those objects that are simply restricted to the hypersurface, this evolution is simple.
#proposition[
  Let $T$ be any tensor on $N$, then we call $T|_(M_t)$ the orthogonal projection of $T$ onto $T_p M_t$. We then have
  $
    diff_t (T|_(M_t)) = (f ov(nabla)_nu T)|_(M_t)
  $
]<prop-ambient_evolution>
For objects that depend on the induced metric on $M_t$, these objects depend on the embedding of a whole neighborhood of a point, so their evolution equations are more complicated, but we can still compute them.
We will first start with the most important evolving tensor, the metric.

#remark[
    We will also adapt two important coordinate systems, we will be working in normal coordinates around a point $p in M$ which will call these coordinates $x^i$, we will denote their partial derivatives $diff_i$ or $e_i$ and the covariant derivatives with respect to the induced metric $nabla_i$. Secondly we will also have normal coordinates at $F(p) in N$, we will call these coordinates $y^i$, their partials $diff_y_i$ or $ov(e)_i$ and the covariant derivatives $ov(nabla)_i$. Note that we can rotate the normal coordinates $y^i$ so that they align with $x^i$, in the sense that _at the point $p$_
  $
    diff_i F = ov(e)_i, forall i <= n quad "and" quad nu = ov(e)_(n+1)
  $

  Since we are working in normal coordinates, note that the Christoffel symbols $Gamma$ and $ov(Gamma)$ both vanish at $p$, but their derivatives might not, so we have to be very careful when working with these expressions.
]

#proposition[
  The evolution equation for the metric is
  $
    diff_t g = 2 f h
  $
]<prop-metric_evoluion>
#proof[
 We prove by using Fermi coordinates, recall that we define the metric as the restriction of the ambient metric like so
  $
    g_(i j) = ip(diff_i F, diff_j F),
  $
  and thus we can differentiate in the ambient space to get an expression for the time derivative of the restriction
  $
    diff_t g_(i j) &= diff_t ip(diff_i F, diff_j F) = ip(diff_t diff_i F, diff_j F) + ip(diff_i F, diff_t diff_j F)
    \ &= ip(diff_i (f nu), e_j) + ip(e_i, diff_j (f nu))
    \ &= ip(nabla_i (f nu), e_j) + ip(e_i, nabla_j (f nu)) quad "because Christoffel symbols vanish"
    \ &= ip(f nabla_i nu + nu nabla_i f, e_j) + ip(e_i, f nabla_j nu + nu nabla_j f)
    \ &= f ip(nabla_i nu, e_j) + f ip(e_i, nabla_j nu) wide "by orthogonality"
    \ &= f ip(h_(k i) e_k, e_j) + f ip(e_i, h_(k j) e_k) = f h_(j i) + f h_(i j) = 2 f h_(i j)
  $
  where we used @prop-h_props in the final step.
]

Now that we know how the metric evolves there are some immediate consequences that we can show.
#proposition[
  The evolution equations for $nu,dif S$ are
  $
    diff_t nu = - nabla f 
    quad
    "and"
    quad
    diff_t dif S = f H dif S
  $
  respectively.
]
#proof[
  First note that $diff_t ip(nu,nu) = 0$ and so we have that in Fermi coordinates
  $
    diff_t nu = ip(diff_t nu, e_j) e_j
  $
  then we also have that for any $j$
  $
    0 = diff_t ip(nu, e_j) = ip(diff_t nu, e_j) + ip(nu, diff_t e_j)
  $
  and so
  $
    diff_t nu &= - ip(nu, diff_t e_j) e_j
    = - ip(nu, diff_t diff_j F) e_j
    = - ip(nu, diff_j (f nu)) e_j
    = - ip(nu, f diff_j nu + nu diff_j f) e_j
    \ &= - ip(nu, f h_(i j) e_i + nu nabla_e_j f) e_j wide "apply orthogonality of" nu "and" e_i
    \ &= - ip(nu, nu nabla_e_j f) e_j = - nabla_e_j f e_j = - nabla f.
  $
  Note that on line 2 we also implicitly used the fact that the Christoffel symbols vanish in Fermi coordinates around the point $p$.

  For the volume form, we know that $dif S = sqrt(det(g)) dif x_1 ... dif x_n$ and so we can compute
  $
    diff_t (dif S) = diff_t (sqrt(det(g))) dif x_1 ... dif x_n.
  $
  Now recall that for a parametrized matrix $A(t)$ we have $ diff_t det(A(t)) = det(A(t)) tr(diff_t A(t)) $ we then have
  $
    diff_t (sqrt(det(g))) dif x ... dif x
    &= 1/(2sqrt(det(g))) diff_t (det(g)) dif x_1 ... dif x_n 
    \ &= sqrt(det(g)) tr(diff_t (g_(i j))) dif x_1 ... dif x_n
    \ &= sqrt(det(g)) tr(f h_(i j)) dif x_1 ... dif x_n
    \ &= f H dif S
  $
]

Now that we have evolution equation for some local properties, we can extend those to evolution equation of global quantities.
#proposition[
  We have the following evolution equations for $V(M_t)$ and $A(M_t)$,
  $
    diff_t V(M_t) = integral_(M_t) f dif S, quad
    diff_t A(M_t) = integral_(M_t) H f dif S
  $
]<prop-vol_area_variation>
#proof[
  First for the volume, extend the vector field $f nu$ to a global vector $Y$ field on $N$. Now by classic geometry theorems @leeIntroductionSmoothManifolds2012[p.~425] we get that the change in volume for a domain evolving under a global vector field is
  $
    diff_t V(M_t) = integral_Omega div Y dif V.
  $
  Now by divergence theorem we get that
  $
    integral_Omega div Y dif V = integral_(M_t) ip(Y, nu) dif S,
  $
  but we know that $Y = f nu$ along $M_t$ so
  $
    diff_t V(M_t) = integral_(M_t) f dif S.
  $

  For the area, we get
  $
    diff_t A(M_t) = diff_t integral_(M_t) dif S
    = integral_(M_t) diff_t dif S
    = integral_(M_t) f H dif S.
  $
]

We have one final evolution equation to find, and that is the one for the second fundamental form $h_(i j)$.
#proposition[
  We have the following evolution equations for $h_(i j)$
  $
    diff_t h_(i j) = - nabla_i nabla_j f + f (h_(i ell) g^(ell k) h_(k j) - ov(R)^(nu)_(nu i j))
  $
]<prop-h_evolution>
#proof[
  Recall that $h_(i j) = ip(e_i, ov(nabla)_j nu) = ip(diff_i F, ov(nabla)_j nu)$.
  Then since $nu$ is orthogonal to all $diff_i F$'s we get
  $
    0 = ov(nabla)_j ip(diff_i F, nu) = ip(diff_i F, ov(nabla)_j nu) + ip(ov(nabla)_j diff_i F, nu)
  $
  and thus
  $
    ip(ov(nabla)_j diff_i F, nu) = - h_(i j).
  $
  With this in mind we can compute
  $
    - diff_t h_(i j) &= diff_t ip(nabla_j diff_i F, nu)
    =
    ip(diff_t nabla_j diff_i F, nu)
    + ip(diff_j diff_i F, diff_t nu)
    \ &=
    ip(diff_t (diff_j diff_i F + ov(Gamma)_(rho sigma)^k diff_i F^rho diff_j F^sigma ov(e)_k), nu)
    + ip(diff_j diff_i F, diff_t nu)
    \ &=
    ip(diff_j diff_i (f nu) + (diff_t ov(Gamma)_(rho sigma)^k) (diff_i F^rho diff_j F^sigma) ov(e)_k + ov(Gamma)_(rho sigma)^k diff_t (diff_i F^rho diff_j F^sigma ov(e)_k), nu)
    \ &- med ip(diff_j diff_i F, nabla f)
  $
  now the Christoffel symbols vanish at $p$, so we get
  $
    -diff_t h_(i j) &= ip(diff_j (nu diff_i f + f diff_i nu) + (f diff_nu ov(Gamma)_(rho sigma)^k) (diff_i F^rho diff_j F^sigma) ov(e)_k, nu)
    - ip(diff_j diff_i F, nabla f)
    \ &=
    ip((diff_j nu) diff_i f + (diff_j f) diff_i nu + nu (diff_j diff_i f) + f diff_j (diff_i nu) + (f diff_nu ov(Gamma)_(rho sigma)^nu) (diff_i F^rho diff_j F^sigma) nu, nu)
    \ &- ip(- h_(i j) nu, nabla f)
  $
  Now using the fact that $nu$ is orthogonal to any derivation of $nu$ (since it is a unit vector), the expression above simplifies to
  $
    - diff_t h_(i j)
    &=
    diff_i diff_j f
    +
    f ip(diff_j diff_i nu, nu)
    + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &=
    diff_i diff_j f
    +
    f ip(diff_j (nabla_i nu - ov(Gamma)_(rho sigma)^k diff_i F^rho nu^sigma ov(e)_k), nu)
    + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &=
    diff_i diff_j f
    +
    f ip(diff_j (h_(i k) diff_k F - ov(Gamma)_(rho sigma)^k diff_i F^rho nu^sigma ov(e)_k), nu)
    + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &=
    diff_i diff_j f + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &+ med
    f ip(h_(i k) diff_j diff_k F + (diff_j h_(i k)) (diff_k F) - (diff_j ov(Gamma)_(rho sigma)^k) diff_i F^rho nu^sigma ov(e)_k - ov(Gamma)_(rho sigma)^k diff_j (diff_i F^rho v^sigma), nu)
  $
  but now again the Christoffel symbols vanish and since $nu$ is orthogonal to all tangent vectors, we can simplify the second term to get
  $
    f ip(h_(i k) diff_j diff_k F - (diff_j ov(Gamma)_(rho sigma)^k) diff_i F^rho nu^sigma ov(e)_k, nu)
    =
    - f h_(i k) h_(j k) - f (diff_j ov(Gamma)_(rho sigma)^nu) diff_i F^rho nu^sigma
  $
  Now recall that in orthonormal coordinates the Riemann tensor is given by
  $
    ov(R)_(i j k)^l = diff_i Gamma_(j k)^l - diff_j Gamma_(i k)^ell
  $
  and so we get
  $
    - diff_t h_(i j) &=
    diff_i diff_j f + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma - f (diff_j ov(Gamma)_(rho sigma)^nu) diff_i F^rho nu^sigma + f h_(i k) h_(j k)
    \ &= diff_i diff_j f - f h_(i k) h_(j k) + f ov(R)^nu_(nu i j)
  $
  which then since we are in orthonormal coordinates we know that $diff_i diff_j f = nabla_i nabla_j f$, and since the middle term is not tensorial we make it tensorial by contracting with the metric and so we get the desired result.
]

#corollary[
  Immediately from @prop-h_evolution we get the following evolution equation for $H$
  $
    diff_t H = - Delta f - f(|A|^2 + ov(Ric)(nu,nu))
  $
]<cor-H_evolution>
#proof[
  We have $H = g^(i j) h_(i j)$ in coordinates so
  $
    diff_t H &= diff_t (g^(i j) h_(i j))
    = h_(i j) diff_t (g^(i j)) + g^(i j) diff_t (h_(i j))
    \ &= h_(i j) (- 2 f h^(i j)) + g^(i j) (- nabla_i nabla_j f + f (h_(i k) h_(k j) - ov(R)^(nu)_(nu i j)))
    \ &= - 2 f|A|^2 - Delta f + f (h_(i k)  h_(i k) - ov(R)^(nu)_(nu i i))
    \ &= - Delta f - f |A|^2 - f ov(Ric)(nu,nu)
  $
]

#pagebreak(weak: true)
= Warped Product-Like Spaces
With the preliminaries out of the way we can begin to discuss how we can attempt to attack the Isoperimetric problem in the class of warped product spaces, and specifically the key properties exhibited by these spaces that we will later use to generalize these methods.

== Warped Product Spaces
Warped products are in essence a generalization of the Polar coordinates in $RR^2$ so let us first look at those. The Polar coordinates $(r,theta)$ in $RR^2$ are defined implicitly in terms of standard Euclidean coordinates, through $(x,y) = (r cos(theta), r sin(theta))$, where we have $r > 0$ and $-pi/2 < theta < pi/2$. Now the Euclidean metric is given by $g = dif x^2 + dif y^2$ and so we can compute its form in polar coordinates as
$
  g &= dif x^2 + dif y^2 = (dif (r cos theta))^2 + (dif (r sin theta))^2
  \ &= (cos theta dif r - r sin theta dif theta)^2 + (sin theta dif r + r cos theta dif theta)^2
  \ &= cos^2 theta dif r^2 - 2 r cos theta sin theta dif r dif theta + r^2 sin^2 theta dif theta^2
  \ &+ sin^2 theta dif r^2 + 2 r sin theta cos theta dif r dif theta + r^2 cos^2 theta dif theta^2
  \ &= dif r^2 + r^2 dif theta^2
$
Note that if we instead consider the function $(r, theta) -> (r cos(theta), r sin(theta))$ as a function from $RR_+ times S^1 -> RR^2$, where $S^1$ is the unit circle, then this almost gives us a decomposition
$
  g_(RR^2) = g_RR + r^2 g_S^1
$
Note that this is not exactly the case because we first need to project a given vector down to its components in $RR$ and $S^1$ respectively and then apply the appropriate metrics. That is we actually have
$
  g_(RR^2) = g_RR compose pi_1 + g_S^1 compose pi_2
$
where $pi_1,pi_2$ are projections onto the tangent spaces of $RR$ and $S^1$ respectively.

A similar constructions works in higher dimensions, where we have $RR^n = RR_+ times S^(n - 1)$.

It is this decomposition that we aim to generalize with the warped product space.

#definition[
  Let $(M,g_M)$ and $(N,g_n)$ be Riemannian manifolds, we can define a metric on $M times N$ by
  $
    g(x,y) = g_M (x) compose pi_1 + f^2(x) g_N (y) compose pi_2,
  $
  where $x,y$ are points of $M$ and $N$ respectively. This is called the _warped product space_ with the _warping factor_ $f$ being a function $f : M -> RR_(> 0)$, it is often denoted $M times_f N$
]

Note that in practice we will always suppress, the projections $pi_1$ and $pi_2$ for clarity.

The most common warped product spaces we see in practice are those of the form $RR_+ times_f N$ for some $N$, for example the 3 space forms, $S^n, RR^n, HH^n$, are of the form
$
  RR_+ times_(sin r) S^n, quad
  RR_+ times_(r) S^n, quad
  RR_+ times_(sinh r) S^n
$
respectively.

These spaces carry a lot of nice properties, but the most important one for us is that they carry a natural conformal vector field.

#proposition[
  Let $RR_+ times_f N$ be a warped space and let $r$ be a coordinate on $RR_+$, then the vector field $X = f(r) diff_r$ is a conformal vector field with conformal factor $f'(r)$. Furthermore its associated tensor $psi$ vanishes.
]
#proof[
  Let us compute the Lie derivative $lie_X g$,
  $
    lie_X g
    &= lie_X (d r^2 + f^2(r) g_N^2)
    = 2 d r lie_X (d r) + g_N^2 lie_X (f^2(r))
    \ &= 2 d r (d (lie_X r)) + 2 g_N^2 f^2(r) f'(r)
    = 2 d r (d f(r)) + 2 f'(r) f^2(r) g_N^2
    \ &= 2 f'(r) d r^2 + 2 f'(r) f^2(r) g_N^2
    = 2 f'(r) (d r^2 + f^2(r) g_N^2).
  $
  Note that if we set $Phi(r) = integral_0^r f(s) dif s$ then $nabla Phi(r) = f(r) diff_r$ and so $ip(nabla_Y X, Z)$ is just $Hess_f (Y,Z)$ and so it is symmetric and so its anti-symmetric component vanishes.
]

Note that since its a gradient, $X$ in the above proposition is closed.

Apart from being a closed conformal vector field, this vector field also has other properties that help us with the flow we want to create. Recall that in Euclidean space spheres are the optimal shapes for the Isoperimetric inequality, in polar coordinates spheres take the simple form of sets where $r = r_0$ for some fixed $r_0$.

== Quasi-Closed Conformal Vector Fields
Now it turns out that these closed conformal vector fields characterize warped products of the form above, namely, if a manifold admits a closed conformal then it can locally be written in the form $RR_+ times_f N$ for some manifolds $N$ and function $f$, see @tashiroCompleteRiemannianManifolds1965[Lemma 1.2]. We thus know that having a closed conformal vector field is too strong of a condition, we want to try and weaken it.

This idea was first explored by Li and Pan @jiayuIsoperimetricProblemRiemannian2023a, where they formalized the necessary conditions on the ambient manifold in terms of conformal vector fields. They also derive a number of key properties for a conformal vector fields satisfying their conditions. In this section we will rewrite some of their conditions and conclusions in a form that is easier to use.

First let us declare some useful conditions that we will need, let $N$ be the complete ambient manifold which admits a conformal vector field $X$ on some open subset $U$ which does not vanish on that subset, with conformal factor $phi$. We will consider the following two conditions
#conditions[
+ The distribution $cal(D)(X) seq T U$ defined by $cal(D)(X)|_p = { v in T_p N | ip(v,X) = 0 }$ is integrable on the set $U$.
+ The integral surfaces of $cal(D)(X)$ are level sets of $(||X||)/phi$ wherever it is defined.
]<conditions-quasi_closed>

These conditions are key to the success of this method, they are vital to many of the identities that Li and Pan derived and used to get a handle on the normal flow they construct.

We will now start analysing the consequences of these conditions.
#proposition[
  Let $X$ be a conformal vector field $X$ such that condition 1 holds, then the associated tensor field $psi$ satisfies
  $
    ip(psi (v), w) = 0 "for" v,w in cal(D)(X) "eveywhere on" U
  $
]<prop-psi_vanish>
#proof[
  By definition the one form defined by $omega(v) = ip(X,v)$ annihilates $cal(D)(X)$, then by the one form condition for integrability @leeIntroductionSmoothManifolds2012[p.~495] we get that $dif omega$ also annihilates $cal(D)(X)$, that is $dif omega$ restricts to zero on $cal(D)(X)$, hence by definition of the associated tensor field, we get the result above.
]
We see then that such a conformal vector field is 'almost' closed since its associated tensor field 'almost' vanishes.
#definition[
  We will call a conformal vector field $X$ satisfying condition $1$, a _quasi-closed_ conformal vector field.
]
The rest of this section will be devoted to properties of quasi-closed conformal vector fields, for the rest of this section we will fix a quasi-closed conformal vector field $X$ with conformal factor $phi$ and associated tensor field $psi$. We will fix a point $p in U$ and an arbitrary vector $Y in T_p U$. We will denote $cal(N) = X/(||X||)$ the normal vector to the integral surfaces of $cal(D)(X)$. We will also refer to $cal(D)(X),U(X)$ as $cal(D),U$ for brevity. We will start with a key property regarding the integral surfaces of $cal(D)$.
#proposition[
  Let $S$ be an integral surface of $cal(D)$, then $S$ is totally umbilical, that is at every point $p in S$ we have
  $
    h_(i j) = f(p) g_(i j),
  $
  for some function $f$ on $S$. Furthermore we have $f$ is equal to $phi/(||X||)$.
]
#proof[
  We have in coordinates
  $
    h_(i j) = ip(ov(nabla)_i cal(N), e_j) = ip(ov(nabla)_i X/(||X||), e_j)
    = ip((ov(nabla)_i X)/(||X||) - X/(||X||^2) (ov(nabla)_i ||X||), e_j)
  $
  then since $X$ is orthogonal to the tangent vector $e_j$ we get
  $
    h_(i j) = ip((ov(nabla)_i X)/(||X||), e_j)
    = 1/(||X||) ip(ov(nabla)_i X, e_j)
    = 1/(||X||) (phi g_(i j) + ip(psi (e_i), e_j))
  $
  then by @prop-psi_vanish we get
  $
    h_(i j) = phi/(||X||) g_(i j)
  $
]
Now we want the integral surfaces $S$ of $cal(D)$ to be our Isoperimetric profile, hence they should be critical points of the surface area functional with respect to fixed volume. Hence by @prop-vol_area_variation we need to have $H = n phi/ (||X||)$ be constant, which motivates condition 2.
#corollary[
 If $X$ satisfies condition $2$, then the integral surfaces of $cal(D)$ are totally umbilical with constant mean curvature $H = n phi/(||X||)$.
]

Now consider, for a moment, the spheres in $RR^n$ of radius $r$. They are the integral surfaces for the orthogonal distribution to $X = x^i diff_i$ which is a closed conformal vector field with factor $phi = 2$. We see that their mean curvature is $H = (2n) / r$, we thus see that the mean curvature is inversely proportional to a certain 'scale' function, in this case $r$.

#definition[
  Wherever $phi != 0$ on $U$, we will call the following function the _scale_ function for $X$
  $
    lambda = (||X||^2)/phi^2
  $
]<def-scale>
Since we know $lambda$ is constant on integral surfaces, its gradient must be colinear with $X$, that is $ov(nabla) lambda = 2 Lambda X$ for some function $Lambda$. We note a convenient expression for $Lambda$.
#proposition[
  Where $lambda$ is defined, we have
  $
    ov(nabla) lambda = 2 Lambda X = 2 (phi^2 - X(phi))/phi^3 X
  $
]<prop-lambda_def>
#proof[
  We see that
  $
    ov(nabla) lambda &= ip(ov(nabla) lambda, cal(N)) cal(N)
    = X(lambda) X/(||X||^2)
    = X((||X||^2)/phi^2) X/(||X||^2)
    \ &= (2 ip(ov(nabla)_X X, X))/phi^2 X/(||X||^2) + (-2/phi^3) X(phi) X
    = 2 (phi ip(X,X))/phi^2 X/(||X||^2) - 2(X(phi)/phi^3) X
    \ &= 2 (phi^2 - X(phi))/phi^3 X
  $
]
This coefficient function will also appear many times so we will call it $Lambda$.

Now as we saw, for a quasi-closed conformal vector field we have that $ip(psi(v), w)$ vanishes on $cal(D)$, but with condition 2 we can actually be more precise than this.
#proposition[
  $
    psi(Y) = (ip(Y, ov(nabla)||X||) X - ip(Y, X) ov(nabla)||X||)/(||X||).
  $
  Furthermore if $X$ satisfies condition 2, wherever $phi != 0$ we have
  $
    psi(Y) = (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi).
  $
]<prop-psi_exact>
#proof[
  Recall that $ip(psi(Y),Z)$ is anti-symmetric in $Y,Z$ so we may assume WLOG one of the two is in $cal(D)$ and hence also WLOG assume that it is $Y$. Then by @prop-psi_vanish we may assume that $Z$ is colinear with $Y$. We thus have $ip(Y,Z) = 0$ so
  $
    ip(psi(Y), Z) &= ip(Z,X)/(||X||) ip(ov(nabla)_Y X, X) = 1/2 ip(Z,X)/(||X||) ov(nabla)_Y ip(X,X)\ &= 1/2 ip(Z,X)/(||X||) ip(Y, ov(nabla)||X||^2)
    = ip(Z,X)/(||X||) ip(Y, ov(nabla)||X||)
  $
  We can then anti-symmetrize this to get that for arbitrary $Y,Z$
  $
    ip(psi(Y),Z) = (ip(Z,X)ip(Y, ov(nabla)||X||) - ip(Y,X) ip(Z, ov(nabla)||X||))/(||X||)
  $
  which gives us the first result.

  For the second result, we compute
  $
    psi(Y)
    &=
    (ip(Y, ov(nabla)(phi dot (||X||)/phi)) X - ip(Y, X) ov(nabla)(phi dot (||X||)/phi))/(||X||)
    \ &=
    (ip(Y, (||X||)/phi ov(nabla)phi + phi ov(nabla)((||X||)/phi)) X - ip(Y, X) ((||X||)/phi ov(nabla)phi + phi ov(nabla)((||X||)/phi)))/(||X||)
    \ &=
    (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi)
    +
    phi (ip(Y,ov(nabla)((||X||)/phi)) X - ip(Y, X) ov(nabla)((||X||)/phi))/(||X||).
  $
  Now we recall that $(||X||)/phi$ is constant along integral surfaces and thus its gradient is colinear with $X$. At the point $p$ we then write $ov(nabla) ((||X||)/phi) = a X$ and get
  $
    psi(Y)
    &=
    (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi)
    +
    phi (ip(Y,a X) X - ip(Y, X) a X)/(||X||)
    \ &= (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi)
    + 0
  $
  which gets us the second result.
]

We note here two other useful ways to write the covariant derivative of $X$
#corollary[
  Where $phi = 0$ we have
  $
    ov(nabla)_Y X/(||X||) = - ip(X,Y)/(||X||) ov(nabla)||X||
  $
  if $X$ satisfies condition 2 then where $phi != 0$ we have
  $
    ov(nabla)_Y X/(phi) = X - ip(X,Y)/phi^2 ov(nabla) phi
  $
]<cor-simple_grad>
#proof[
  We prove directly, for the first case
  $
    ov(nabla)_Y X/(||X||)
    &= 1/(||X||) ov(nabla)_Y X  - X/(||X||^2) ov(nabla)_Y||X||
    \ &= 1/(||X||) ((ip(Y, ov(nabla)||X||) X - ip(Y, X) ov(nabla)||X||)/(||X||)) - X/(||X||^2) ov(nabla)_Y||X||
    \ &= -(ip(Y, X) ov(nabla)||X||)/(||X||^2).
  $
  And in the second case
  $
    ov(nabla)_Y X/(phi)
    &= 1/(phi) ov(nabla)_Y X  - X/(phi^2) ov(nabla)_Y phi
    \ &= 1/(phi) (phi X + (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi)) - X/(phi^2) ov(nabla)_Y phi
    \ &= X-(ip(Y, X) ov(nabla)phi)/(phi^2).
  $
]
#corollary[
  $
    (psi(Y),Z) = 2(AntiSym(ov(nabla)||X||^flat times.circle X^flat)(Y,Z))/(||X||).
  $
  Furthermore if $X$ satisfies condition 2, wherever $phi != 0$ we have
  $
    (psi(Y),Z) = 2(AntiSym(ov(nabla)phi^flat times.circle X^flat)(Y,Z))/(phi).
  $
  Here $♭$ represents raising an index and $AntiSym$ represents the anti-symmetrization.
]<cor-psi_antisym>
#proof[
  Immediate from @prop-psi_exact.
]

#pagebreak(weak: true)
We can also rewrite some of the Riemann and Ricci curvatures of the ambient manifold in terms of $X$.
#proposition[
  Wherever $phi = 0$ we have
  $
    ov(R)(Y,X,Y,X) &= -||X||ip(ov(nabla)_Y ov(nabla)||X||, Y) + ip(X,Y)^2/(||X||) ip(ov(nabla)_cal(N) ov(nabla)||X||, cal(N))
    \ ov(Ric)(X,Y) &= -(ip(X,Y))/(||X||) (ov(Delta)||X|| - ip(ov(nabla)_cal(N) ov(nabla) phi, cal(N)))
  $
  and in addition, if $Y in cal(D)$
  $
    ||X||ov(Ric)(X,Y) = ip(ov(nabla)_Y ov(nabla)||X||, X) = ip(ov(nabla)_X ov(nabla)||X||, Y) = 0
  $<ric_orthogonal>
  If $X$ satisfies condition 2, then wherever $phi != 0$ we have
  $
    ov(R)(Y,X,Y,X) &= -phi ip(ov(nabla)_Y ov(nabla)phi, Y) + ip(X,Y)^2/(phi) ip(ov(nabla)_cal(N) ov(nabla)phi, cal(N))
    \ ov(Ric)(X,Y) &= -(ip(X,Y))/(phi) (ov(Delta)phi - ip(ov(nabla)_cal(N) ov(nabla) phi, cal(N)))
  $<ric_x>
  and in addition, if $Y in cal(D)$
  $
    phi ov(Ric)(X,Y) = ip(ov(nabla)_Y ov(nabla)phi, X) = ip(ov(nabla)_X ov(nabla)phi, Y) = 0
  $<ric_orthogonal-phi>
]<prop-riemann_ricci_x_identity>
#proof[
  For the first case, we will consider $ov(R)(ov(e)_i, ov(e)_j, X/(||X||), ov(e)_k)$, then we will use linearity of the Ricci tensor to remove the denominator, we start with a use of @cor-simple_grad
  $
    ov(R)(ov(e)_i, ov(e)_j, X/(||X||), ov(e)_k)
    &=
    ip(ov(nabla)_i ov(nabla)_j X/(||X||) - ov(nabla)_j ov(nabla)_i X/(||X||), ov(e)_k)
    \ &=
    ip(ov(nabla)_i (-(ip(ov(e)_j, X) ov(nabla)||X||)/(||X||^2)) - ov(nabla)_j (-(ip(ov(e)_i, X) ov(nabla)||X||)/(||X||^2)), ov(e)_k)
    \ &=
    - ov(nabla)_i ((ip(ov(e)_j, X))/(||X||^2)) ov(e)_k (||X||) + ov(nabla)_j ((ip(ov(e)_i, X))/(||X||^2)) ov(e)_k (||X||)
    \ &-(ip(ov(e)_j, X))/(||X||^2) ip(ov(nabla)_i ov(nabla) ||X||, ov(e)_k) + (ip(ov(e)_i, X))/(||X||^2) ip(ov(nabla)_j ov(nabla) ||X||, ov(e)_k)
  $
  Now let us deal with the first two terms, expanding gives us
  $
    ov(e)_k (||X||) ((ip(ov(nabla)_j X, ov(e)_i)
    -
    ip(ov(nabla)_i X, ov(e)_j))/(||X||^2)
    +
    2 (ip(X, ov(e)_j) ov(e)_i (||X||)
    -
    ip(X, ov(e)_i) ov(e)_j (||X||))/(||X||^3))
  $
  then by definition the left denominator here is $ip(psi(ov(e)_j), ov(e)_i)$ which we can expand by @prop-psi_exact we will see that these terms exactly cancel the other terms in the brackets.

  Now we are left with
  $
    ov(R)(ov(e)_i, ov(e)_j, X/(||X||), ov(e)_k)
    = (ip(ov(e)_i, X))/(||X||^2) ip(ov(nabla)_j ov(nabla)||X||, ov(e)_k) - (ip(ov(e)_j, X))/(||X||^2) ip(ov(nabla)_i ov(nabla)||X||, ov(e)_k)
  $<riemann_exact>
  Now by linearity we can substitute $ov(e)_i = ov(e)_k = Y$ and $ov(e)_j = X$, this gives us
  $
    ov(R)(Y, X, X/(||X||), Y)
    = (ip(Y, X))/(||X||^2) ip(ov(nabla)_X ov(nabla)||X||, Y) - (ip(X, X))/(||X||^2) ip(ov(nabla)_Y ov(nabla)||X||, Y)
  $
  we now multiply by $||X||$ to get
  $
    ov(R)(Y, X, X, Y)
    = -||X||ip(ov(nabla)_Y ov(nabla)||X||, Y) + (ip(Y, X))/(||X||) ip(ov(nabla)_X ov(nabla)||X||, Y)
  $<riemann_simplified>

  Next consider the integral hypersurface $S$ of $cal(D)$ that passes through $p$, we know that $h_(i j)$ is identically zero everywhere on this hypersurface. Hence, by @lemma-codazzi, we have for any $e_i,e_j,e_k in T_p S$
  $
    ov(R)(e_i, e_j, e_k, cal(N)) = - nabla_i h_(j k) + nabla_j h_(i k) = 0
  $
  and so in particular, by linearity
  $
    ov(Ric)(Y, X) = 0
  $
  for any $Y in cal(D)$.

  Now by using @riemann_exact but tracing over $e_i$ and $e_k$ and plugging in $ov(e)_j = Y$ gives us
  $
    ov(Ric)(Y, X) = - ip(Y, X)/(||X||) ov(Delta)||X|| + 1/(||X||) ip(ov(nabla)_Y ov(nabla)||X||, X)
  $<ricci_simplified>
  then for any $Y in cal(D)$ we get
  $
    0 = - ip(Y, X)/(||X||) ov(Delta)||X|| + 1/(||X||) ip(ov(nabla)_Y ov(nabla)||X||, X)
    = 1/(||X||) ip(ov(nabla)_Y ov(nabla)||X||, X)
  $
  which gives us @eqn-ric_orthogonal.

  Now plugging @eqn-ric_orthogonal into @eqn-riemann_simplified gives us
  $
    ov(R)(Y, X, X, Y)
    &= -||X||ip(ov(nabla)_Y ov(nabla)||X||, Y) + (ip(Y, X))/(||X||)ip(ov(nabla)_(||X||cal(N)) ov(nabla)||X||, (cal(N)||X||ip(X,Y))/(||X||^2))
    \ &= -||X||ip(ov(nabla)_Y ov(nabla)||X||, Y) + (ip(Y, X)^2)/(||X||)ip(ov(nabla)_(cal(N)) ov(nabla)||X||, cal(N))
  $
  which is the first result.

  For the second result we do the same thing with @eqn-ricci_simplified, we get
  $
    ov(Ric)(Y, X) 
    &= - ip(Y, X)/(||X||) ov(Delta)||X|| + 1/(||X||) (||X||^2ip(X,Y))/ip(X,X) ip(ov(nabla)_(cal(N) ) ov(nabla)||X||, cal(N))
    \ &= - ip(Y, X)/(||X||) (ov(Delta)||X|| - ip(ov(nabla)_(cal(N)) ov(nabla)||X||, cal(N)))
  $
  which is our second result.

  Finally for the case where $phi != 0$, we start off similarly
  $
    ov(R)(ov(e)_i, ov(e)_j, X/(||X||), ov(e)_k)
    &=
    ip(ov(nabla)_i ov(nabla)_j X/phi - ov(nabla)_j ov(nabla)_i X/phi, ov(e)_k)
    \ &=
    ip(ov(nabla)_i (ov(e)_j -(ip(ov(e)_j, X) ov(nabla) phi)/(phi^2)) - ov(nabla)_j (ov(e)_i - (ip(ov(e)_i, X) ov(nabla) phi)/(phi^2)), ov(e)_k)
  $
  We now note that $ov(nabla)_i ov(e)_j$ and $ov(nabla)_j ov(e)_i$ are both zero because we are working in orthonormal coordinates. After that the calculation is identical to the first case.
]

We will now give an outline of the method used by Li and Pan, which we will then expand on in the next chapter.

Li and Pan assume that they have a quasi-closed conformal vector field $X$ which satisfies condition 2. \
Their basic plan then has 4 steps
+ They consider, for every admissable hypersurface $M$ in some class $cal(Z)$, the normal flow with velocity $f = n phi - H u$, where $u$ is the #link(<def-support>)[support function] for $X$.
+ They demonstrate the class $cal(Z)$ is preserved under this flow.
+ They demonstrate that under this flow, $V(M)$ is fixed and $A(M)$ is non-increasing.
+ They demonstrate that this flow always converges and it always converges to the integral hypersurface of $X$.

#proposition[
  Assume that the steps above all hold, then for every admissable hypersurface $M in cal(Z)$ there exists an integral hypersurface $S$ of $X$ with
  $
    V(M) = V(S) "and" A(M) >= A(S).
  $
  Hence the integral hypersurfaces of $S$ attain the Isoperimetric profile for $cal(Z)$.
]
#proof[
  Let $M_t$ be the flow of $M$ as in the steps above. Then $M_t -> S$ for some admissable hypersurface $S$ and so
  $
    V(M) = V(M_t) = lim_(t -> infinity) V(M_t) = V(S)
  $
  and
  $
    A(M) >= lim_(t -> infinity) A(M_t) = A(S)
  $
]

Now the class considered by Li and Pan is the class of star-shaped hypersurfaces, that is hypersurfaces with $u > 0$ everywhere.
In order to show all the steps of the plan work they had to make some additional assumptions on the ambient manifold.
#assumptions[
  + $U$ is a dense open set in $N$.
  + $phi > 0$ everywhere on $U$.
  + $Lambda > 0$ everywhere on $U$.
  + The integral hypersurfaces of $X$ are compact.
  + $cal(N)$ is the only direction of minimal Ricci curvature, that is for every unit vector $v$ which is not colinear with $cal(N)$ we have
    $
      ov(Ric)(cal(N),cal(N)) < ov(Ric)(v,v).
    $
]<assum-pan_li_general>

We will quickly show how under these assumptions the third step holds.
#proposition[
  Under @assum-pan_li_general, we have that for a star-shaped hypersurface
  $
    diff_t V(M_t) = 0 "and" diff_t A(M_t) <= 0.
  $
]
#proof[
  Immediately from @prop-vol_area_variation and @lemma-integral_identities, we have
  $
    diff_t V(M_t) = integral_M (n phi - H u) dif S = 0.
  $

  For area we have
  $
    diff_t A(M_t) &= integral_M H (n phi - H u) dif S 
    \ &= n/(n-1) integral_M ov(Ric)(nu, X - u nu) dif S - 1/n integral_M u sum_(i < j) (kappa_i - kappa_j)^2 dif S
  $
  now since $u$ is everywhere positive the second integral here is always positive and thus
  $
    diff_t A(M_t) <= n/(n-1) integral_M ov(Ric)(nu, X - u nu) dif S
  $
  now from @prop-riemann_ricci_x_identity we get that
  $
    ov(Ric)(nu, X - u nu)
    &=
    ov(Ric)(nu, X) - u ov(Ric)(nu, nu)
    =
    ip(nu, cal(N)) ov(Ric)(cal(N), X) - u ov(Ric)(nu, nu)
    \ &=
    u ov(Ric)(cal(N), cal(N)) - u ov(Ric)(nu, nu)
    = u (ov(Ric)(cal(N), cal(N)) - ov(Ric)(nu,nu))
  $
  and so by the last assumption we get that this is a non-positive term and so
  $
    diff_t A(M_t) <= n/(n-1) integral_M u (ov(Ric)(cal(N), cal(N)) - ov(Ric)(nu,nu)) dif S <= 0.
  $
]

We conclude this chapter with the main theorem proved by Li and Pan
#theorem("Li and Pan")[
  Let $N$ be an ambient manifold admitting a conformal vector field $X$ satisfying @conditions-quasi_closed and @assum-pan_li_general, then for any star-shaped hypersurface $M$ there exists an integral surface $S$ of $X$ with
  $
    V(S) = V(M) "and" A(M) >= A(S)
  $
]<thrm-li_pan>


#pagebreak(weak: true)
= Main Results
== Motivation
As we saw in the previous section, already with quasi-closed conformal vector fields we can prove a strong result regarding Isoperimetric inequalities. However, there are still cases which we would expect these techniques to be applicable to which cannot be reached with their approach.

#example[
  Consider $N = RR^(n+1)$ with the following conformal vector field
  $
    X(x^1,...,x^n) = x^i diff_i - x^2 diff_1 + x^1 diff_2
  $
  this is indeed a quasi-closed conformal vector field with conformal factor $phi$, but its integral surfaces are not compact and they do not have fixed mean curvature. Thus we have no hope of attaining a useful Isoperimetric inequality for star-shaped surfaces with respect to this flow.

  We could instead work with $Y = x^i diff_i$ but then there are hypersurfaces that will never be star-shaped with respect to $Y$ but are star-shaped with respect to $X$, we really need star-shapedness since it is needed to guarantee convergence and to guarantee that area decreases. An example of such a surface can be seen in @fig-star_shaped.
  #figure(
  [
  #set align(center);
  #cetz.canvas({
    import cetz.plot: *
    plot(size: (8,8), axis-style: "school-book", x-tick-step: none, y-tick-step: none, {
      add(domain: (0, 1), samples: 200, t => {
        let r = 1 + calc.pow(calc.sin(calc.pi*(2*t+1/4)),2);
        let theta = t + calc.sin(4*calc.pi*t)/8;
        return (r*calc.cos(2*calc.pi*theta), r*calc.sin(2*calc.pi*theta))
      })
      for s in (0,0.02452,0.04848,0.07392,0.10471,0.16832,0.26394,0.3846,0.4391,0.4728,
              0.5,0.52452,0.54848,0.57392,0.60481,0.66832,0.76394,0.8846,0.9391,0.9728) {
        let t = s;
        let r = 1 + calc.pow(calc.sin(calc.pi*(2*t+1/4)),2);
        let theta = t + calc.sin(4*calc.pi*t)/8;
        let p = (r*calc.cos(2*calc.pi*theta), r*calc.sin(2*calc.pi*theta))
        let v = (p.at(0) - p.at(1), p.at(1) + p.at(0))
        let factor = 0.3;
        let p_2 = (p.at(0) + factor*v.at(0), p.at(1) + factor*v.at(1))
        add((p,p_2), style: (stroke: (paint: red), mark: (end: ">", scale: 0.5)))
      }
    })
  })
  ],
  caption: [Hypersurface in $RR^2$ which is star shaped with respect to $X$ but not $Y$]
  )<fig-star_shaped>
]

We will shortly introduce the tools we will need to deal with this issue, but before we do that we want to motivate these tools a little. We can think of the quasi-closedness condition on $X$ as a compatibility condition between $X$ and a foliation $S_alpha$, namely that $X$ is everywhere orthogonal to $S_alpha$.

We can then try to consider foliations which are in some sense 'compatible' with $X$ given in the example above.

#example[
  Consider the foliation $cal(F)$ of $RR^(n+1) backslash 0$ given by spheres $S_alpha$ centered at the origin, this foliation is not everywhere orthogonal to $X$, however, the foliation is fixed under the normal flow $n phi - H u$ and the foliation induces a decomposition $X = X^perp + X^top$ where $X^perp$ is orthogonal to $S_r$ and $X^top$ is tangent to $S_r$.

  Now importantly $X^perp$ is just $Y$ and thus is also a conformal vector field, and thus since $X^top = X - X^perp$ then $X^top$ is also conformal. Now $X^perp$ is a quasi-closed conformal vector field which we can manage with the preexisting techniques, so our goal is to find a way to use this decomposition to reduce to the case of just $X^perp$.
]

== Setting
We will consider a complete $n+1$ dimensional Riemannian manifold $N$, with $n >= 2$. On this manifold we consider a conformal vector field $X$ along with a foliation $cal(F)$ which are compatible in the sense that the foliation $cal(F)$ induces a decomposition $X = X^perp + X^top$ where $X^perp$ is a quasi-closed conformal vector field with integral surfaces $S_alpha in cal(F)$ and $X^top$ is a quasi-closed Killing vector field, that is its conformal factor is zero.

We will associate with $X^perp$ its conformal factor $phi$ which is the same as that of $X$, we will also associate the scale function (@def-scale) $lambda$ and its derivative $Lambda$ (@prop-lambda_def). We will also denote by $psi^perp$ and $psi^top$ the associated tensor fields (@prop-psi_exact) of $X^perp$ and $X^top$ respectively.

We will also make the following assumptions
#assumptions[
+ The conformal factor $phi$ of $X^perp$ is everywhere positive.
+ The function $Lambda$ (@prop-lambda_def) is everywhere positive.
+ The function $Lambda phi^3 + X^top (phi)$ is everywhere positive.
+ The integral hypersurfaces of $X^perp$ are compact.
+ The directions $X^perp$ and $X^top$ are both of least Ricci curvature, that is for any tangent vector $Y in T_p N$ we have
  $
    1/(||Y||^2) ov(Ric)(Y,Y)
    >=
    1/(||X^perp||^2) ov(Ric)(X^perp,X^perp)
    =
    1/(||X^top||^2) ov(Ric)(X^top,X^top)
  $
]


The first condition informally means that $X^perp$ is a dilation-like vector field, because under its first order vector field flow volumes increase. \
The second condition informally means that our scale function $lambda$ is increasing in the direction of $X^perp$, so just like in Euclidean space as balls increase in radius their mean curvature decreases. \
The third and fourth conditions are technical conditions needed for convergence.
The last condition is necessary for area to decrease along the normal flow we will construct.

Our flow will consist of two steps,
+ First we will use a time dependent conformal vector field $X(t) = X^perp + X^top (1-t/T_0)$ for some constant $T_0$, we will consider the flow with velocity
  $
    f = n phi - H ip(X(t), nu),
  $<flow_def>
  we will run this flow until $t = T_0$.
+ If the flow survives after $t = T_0$ we will stop the flow, and then set $X(t) = X^perp$, we then continue with the flow
  $
    f = n phi - H ip(X, nu)
  $
  for however long the flow lasts.

Note that in this setting, $u$'s definition depends on time but we will drop this dependence in our notation and only explicitly mention it when it comes up.
Note that, if $u > 0$ when $t = T_0$, then at that point in time the surface is star-shaped with respect to just $X^perp$ so we can apply the methods of Li and Pan.

For now we will assume that the flow exists on some interval $[0,T)$ with $T <= T_0$, we will show this must be the case later, in @prop-flow_short_time. We will also assume that $u$ remains positive on $[0,T)$, this will be proven in @head-evolution_equation_u.
We will now start computing the evolution of various geometric quantities along our flow. For convenience we will define the factor 
$
  Xi(t) =(1 - t/T_0).
$
We will also define the parabolic operator
$
  L = diff_t - u Delta
$
as well as the functions
$
  u^perp = ip(X^perp, nu), quad u^top = Xi(t) ip(X^top, nu).
$
Notice $u = u^perp + u^top$.

Finally we will also use the notation
$
  pi(X^perp), pi(X^top)
$
to denote the orthogonal projection of these vector fields onto $T_p M_t$, notice that
$
  pi(X^perp) = X^perp - u^perp nu = ip(X^perp, e_i) e_i quad "and"
  \
  pi(X^top) = X^top - u^top nu = ip(X^top, e_i) e_i.
$
== Evolution Equation for $lambda$
The first result we will prove is arguably the most important result, as it will guarantee our hypersurface remains within a compact subset.
#proposition[
  The evolution equation for $lambda$ under the flow is
  $
    L lambda = - 2 Lambda n phi u^top - 2 u ip(nabla Lambda, X^perp).
  $
]
#proof[
  First we compute the time derivative of $lambda$, since it is an ambient quantity this is easy by @prop-ambient_evolution.
  We get
  $
    diff_t lambda &= (n phi - H u) ov(nabla)_nu lambda 
    = (n phi - H u) ip(nu, ov(nabla) lambda)
    = (n phi - H u) 2 Lambda (nu, X^perp)
    \ &= 2 (n phi - H u) Lambda u^perp.
  $
  For the induced Laplacian we get
  $
    Delta lambda
    &= nabla_i nabla_i lambda = nabla_i (2 Lambda ip(X^perp, e_i))
    = 2 Lambda (nabla_i ip(X^perp, e_i)) + 2 ip(X^perp, e_i) nabla_i Lambda
    \ &= 2 Lambda (ip(ov(nabla)_i X^perp, e_i) + ip(X^perp, ov(nabla)_i e_i)) + 2 ip(nabla Lambda, pi(X^perp)).
  $
  Now since the trace of a tensor is the same as the trace of its symmetrization so
  $
    ip(ov(nabla)_i X^perp, e_i) = tr(ov(nabla) X^perp) = tr(Sym(ov(nabla) X^perp))
    = tr(phi g_(i j)) = n phi.
  $
  Next by @prop-h_props we know that $ov(nabla)_i e_i = - h_(i i) nu = - H nu$. Combining these we get that
  $
    Delta lambda
    &= 2 Lambda (n phi - H ip(X^perp, nu)) + 2 ip(nabla Lambda, X^perp)
    = 2 Lambda (n phi - H u^perp) + 2 ip(nabla Lambda, X^perp).
  $

  Finally we compute
  $
    (diff_t - u Delta) lambda
    &= 2 Lambda ( (n phi - H u) u^perp - (n phi - H u^perp) u) - 2 ip(nabla Lambda, X^perp)
    \ &= 2 Lambda (- n phi u^top) - 2 ip(nabla Lambda, X^perp)
    = - 2 Lambda n phi u^top - 2 ip(nabla Lambda, X^perp)
  $
]

#corollary[
  For all $t in [0,T)$ and all $p in M_t$ we have
  $
    min_(p in M_0) lambda(p,0) <= lambda(p,t) <= max_(p in M_0) lambda(p,0)
  $
]<cor-lambda_estimate>
#proof[
  At a maximal or minimal point of $lambda$ we have by Lagrange multipliers that $ov(nabla)$ is colinear with $nu$, so we must have that $X^perp$ is colinear with $nu$ and thus $pi(X^perp) = 0$. Also since $X^top$ is orthogonal to $X^perp$ we have that at a maximal or minimal point $X^top$ is orthogonal to $nu$ and thus $u^top = 0$. Thus we get that at a maximal or minimal point $L lambda = 0$ and so by @prop-max_principle applied to $lambda$ and $-lambda$ we get
  $
    min_(x in M_0) lambda(x,0) <= lambda(x,t) <= max_(x in M_0) lambda(x,0)
  $
]

#corollary[
  Given a hypersurface $M$, there is a compact region $Gamma$ such that $M_t$ is contained in $Gamma$ for as long as it exists.
]
#proof[
  We use @cor-lambda_estimate along with @prop-compact_region.
]

== Evolution Equation for $u$
<head-evolution_equation_u>
This next evolution is nearly as important, our parabolic operator has a $u$ factor and so it ceases to be uniformly parabolic if we do not have a uniform lower bound on $u$.

#proposition[
  The evolution equation for $u$ under the flow is
  $
    L u &= n (Lambda phi^3 - Xi(t) X^top (phi)) + Xi'(t) u^top
    - 2 phi H u + |A|^2 u^2 + 2 n u nu(phi) \ &+ med u^2 ov(Ric)(nu,nu) + H ip(X,nabla u)
  $
]<prop-u_evolution>
#proof[
  This is quite the long calculation so we will split it into multiple steps, first for the time derivative
  $
    diff_t u
    &= diff_t ip(X^perp + Xi(t) X^top, nu)
    = ip(diff_t (X^perp + Xi(t) X^top), nu)
    +
    ip(X^perp + Xi(t) X^top,diff_t  nu)
    \ &= (n phi - H u)ip(ov(nabla)_nu (X^perp + Xi(t) X^top), nu) + Xi'(t) ip(X^top, nu)
    \ &+ med
    ip(X^perp + Xi(t) X^top, - nabla (n phi - H u)).
  $
  Using the fact that $X^perp + Xi(t) X^top$ is conformal with factor $phi$ we can simplify the first term and continue calculating
  $
    diff_t u
    &= phi(n phi - H u) + Xi'(t) u^perp
    +
    ip(X^perp + Xi(t) X^top, - nabla (n phi - H u))
    \ &= phi(n phi - H u) + Xi'(t) u^perp
    -
    n ip(X,nabla phi) + H ip(X,nabla u) + u ip(X, nabla H)
    \ &= phi(n phi - H u) + Xi'(t) u^perp
    -
    n ip(X,ov(nabla)phi) + n u nu (phi) + H ip(X,nabla u) + u ip(X, nabla H).
  $<u_diff_t>
  Now we switch to the Laplacian, it will be helpful to decompose $u = u^perp + u^top$.
  First we deal with $u^perp$.
  #claim[
    We have
    $
      Delta u^perp = - n nu(phi) - u^perp ov(Ric)(nu,nu) + ip(nabla H, X^perp) + phi H - |A|^2 u^perp
    $
  ]
  We start with computing from definitions
  $
    Delta u^perp
    &= nabla_i nabla_i ip(X^perp, nu)
    = nabla_i (ip(ov(nabla)_i X^perp, nu) + ip(X^perp, ov(nabla)_i nu)).
  $
  Now for the first term $e_i$ is orthogonal to $nu$ and thus it simplifies to $ip(psi^perp (e_i), nu)$, we continue computing,
  $
    Delta u^perp
    = nabla_i (ip(psi^perp (e_i), nu) + ip(X^perp, h_(i j) e_j)).
  $<u_perp_step_1>
  Let us now deal with the first term, we use @cor-psi_antisym
  $
    nabla_i (ip(psi^perp (e_i), nu))
    &=
    nabla_i ((2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat))(e_i,nu))/(phi))
    \ &=
    ((ov(nabla)_i 2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat))(e_i,nu))/(phi)
    +
    (2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat))(ov(nabla)_i e_i,nu))/(phi)
    \ &+ med
    (2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat))(e_i,ov(nabla)_i nu))/(phi)
    -
    (2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat))(e_i,nu))/(phi^2)ov(nabla)_i phi.
  $
  We notice that since $ov(nabla)_i e_i = - H nu$ the second term will have two $nu$ inputs into an anti-symmetrization, making it vanish. Similarly, since $ov(nabla)_i nu = h_(i j) e_j$ the third term will have the inputs $(e_i,e_j)$ symmetrized by $h_(i j)$ and thus will also vanish. We are thus left with
  $
    nabla_i (ip(psi^perp (e_i), nu))
    &=
    ((ov(nabla)_i 2 AntiSym(ov(nabla)phi^flat times.circle X^(perp flat)))(e_i,nu))/(phi) -
    ip(psi^perp (e_i), nu) (ov(nabla)_i phi)/phi.
  $ <u_perp_step_2>
  Now we can compute the covariant derivative of the anti-symmetrization
  $
    2 AntiSym(
      ov(nabla) phi^flat
      times.circle
      (phi e_i + psi^perp (e_i))^flat
    )
    +
    2 AntiSym(
      ov(nabla)_i ov(nabla) phi^flat
      times.circle
      X^(perp flat)
    ),
  $
  now when we plug this back into @eqn-u_perp_step_2 we get
  $
    ((ov(nabla)_i phi) ip(psi^perp (e_i), nu))/phi - ip(e_i, e_i) nu(phi)
    + ov(Hess)_phi (e_i, e_i) u^perp/phi - ov(Hess)_phi (e_i, nu) ip(X^perp,e_i)/phi
    \ - ip(psi^perp (e_i), nu) (ov(nabla)_i phi)/phi,
  $
  which simplifies into
  $
    - n nu(phi)
    + ov(Hess)_phi (e_i, e_i) u^perp/phi - (ov(Hess)_phi (pi(X^perp), nu))/phi.
  $
  Now this Hessian term is almost the ambient Laplacian of $phi$, so we can rewrite this as 
  $
    - n nu(phi) + ov(Delta) phi u^perp/phi - u^perp (ov(Hess)_phi (nu,nu))/phi - (ov(Hess)_phi (pi(X^perp), nu))/phi,
  $
  but now since $X^perp = pi(X^perp) + u^perp nu$ we further simplify this into
  $
    - n nu(phi) + ov(Delta) phi u^perp/phi - (ov(Hess)_phi (X^perp, nu))/phi.
  $
  and then we use @eqn-ric_orthogonal-phi to get
  $
    - n nu(phi) + ov(Delta) phi u^perp/phi - ip(X^perp, nu)(ov(Hess)_phi (cal(N)^perp, cal(N)^perp))/phi
    \ =
    - n nu(phi) + u^perp/phi (ov(Delta) phi - (ov(Hess)_phi (cal(N)^perp, cal(N)^perp))).
  $
  Now we use @eqn-ric_x to get
  $
    - n nu(phi) - ov(Ric)(X^perp, nu).
  $<u_perp_step_3>
  Next for the second term of @eqn-u_perp_step_1 we get
  $
    ov(nabla)_i (h_(i j) ip(X^perp, e_j))
    &=
    (ov(nabla)_i h_(i j)) ip(X^perp, e_j)
    +
    h_(i j) ip(ov(nabla)_i X^perp, e_j)
    +
    h_(i j) ip(X^perp, ov(nabla)_i e_j)
    \ & =
    (ov(nabla)_i h_(i j)) ip(X^perp, e_j)
    +
    h_(i j) (phi ip(e_i, e_j) + ip(psi^perp (e_i), e_j))
    -
    h_(i j) h_(i j) ip(X^perp, nu).
  $
  Since $h_(i j)$ is symmetric the third term here vanishes and so we are left with
  $
    ov(nabla)_i (h_(i j) ip(X^perp, e_j))
    &=
    (ov(nabla)_i h_(i j)) ip(X^perp, e_j)
    +
    phi H
    -
    |A|^2 u^perp.
  $<u_perp_step_4>
  Now plugging @eqn-u_perp_step_3 and @eqn-u_perp_step_4 into @eqn-u_perp_step_1 gives us
  $
    Delta u^perp =
    - n nu(phi) - ov(Ric) (X^perp, nu)
    +
    (ov(nabla)_i h_(i j)) ip(X^perp, e_j)
    +
    phi H
    -
    |A|^2 u^perp
  $<u_perp_step_5>
  now we can use @lemma-codazzi to get
  $
    (ov(nabla)_i h_(i j)) ip(X^perp, e_j)
    &=
    (ov(Rm)_(j i i nu) + nabla_j h_(i i))ip(X^perp, e_j)
    =
    (ov(Ric)(e_j, nu) + nabla_j H)ip(X^perp, e_j)
    \ &=
    ov(Ric)(pi(X^perp), nu) + ip(nabla H, X^perp)
    \ &=
    ov(Ric)(X^perp, nu) - u^perp ov(Ric)(nu,nu) + ip(nabla H, X^perp)
  $
  which we can plug back into @eqn-u_perp_step_5 to get
  $
    Delta u^perp =
    - n nu(phi)
    - u^perp ov(Ric)(nu,nu) + ip(nabla H, X^perp)
    +
    phi H
    -
    |A|^2 u^perp
  $

  Now we deal with $u^top$
  #claim[
    We have
    $
      Delta u^top = - u^top ov(Ric)(nu,nu) + ip(nabla H, X^top) - |A|^2 u^top
    $
  ]
  Again we compute from definitions, we will use $X^top$ instead of $Xi(t) X^top$ since that does not change any of the calculations and both are Killing vector fields.
  $
    Delta u^top
    &= nabla_i nabla_i ip(X^top, nu)
    = nabla_i (ip(ov(nabla)_i X^top, nu) + ip(X^top, ov(nabla)_i nu)).
  $
  Now for the first term $e_i$ is orthogonal to $nu$ and thus it simplifies to $ip(psi^top (e_i), nu)$, we continue computing,
  $
    Delta u^top
    = nabla_i (ip(psi^top (e_i), nu) + ip(X^top, h_(i j) e_j)).
  $<u_top_step_1>
  Let us now deal with the first term, we use @cor-psi_antisym
  $
    nabla_i (ip(psi^top (e_i), nu))
    &=
    nabla_i ((2 AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat))(e_i,nu))/(||X^top||))
    \ &=
    (ov(nabla)_i 2 AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat))(e_i,nu))/(||X^top||)
    \ &+ med
    (2 AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat))(ov(nabla)_i e_i,nu))/(||X^top||)
    \ &+ med
    (2 AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat))(e_i,ov(nabla)_i nu))/(||X^top||)
    \ &- med
    (2 AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat))(e_i,nu))/(||X^top||^2)ov(nabla)_i||X^top||.
  $
  We notice that since $ov(nabla)_i e_i = - H nu$ the second term will have two $nu$ inputs into an anti-symmetrization, making it vanish. Similarly, since $ov(nabla)_i nu = h_(i j) e_j$ the third term will have the inputs $(e_i,e_j)$ symmetrized by $h_(i j)$ and thus will also vanish. We are thus left with
  $
    nabla_i (ip(psi^top (e_i), nu))
    &=
    2 ((ov(nabla)_i AntiSym(ov(nabla)||X^top||^flat times.circle X^(top flat)))(e_i,nu))/(||X^top||) -
    ip(psi^top (e_i), nu) (ov(nabla)_i||X^top||)/(||X^top||). #h(2em)
  $ <u_top_step_2>
  Now we can compute the covariant derivative of the anti-symmetrization
  $
    2 AntiSym(
      ov(nabla)||X^top||^flat
      times.circle
      (psi^top (e_i))^flat
    )
    +
    2 AntiSym(
      ov(nabla)_i ov(nabla)||X^top||^flat
      times.circle
      X^(top flat)
    ),
  $
  now when we plug this back into @eqn-u_top_step_2 we get
  $
    ((ov(nabla)_i||X^top||) ip(psi^top (e_i), nu))/(||X^top||)
    + ov(Hess)_(||X^top||) (e_i, e_i) u^top/(||X^top||) - ov(Hess)_(||X^top||) (e_i, nu) ip(X^top,e_i)/(||X^top||)
    \ - ip(psi^top (e_i), nu) (ov(nabla)_i (||X^top||))/(||X^top||),
  $
  which simplifies into
  $
    ov(Hess)_(||X^top||) (e_i, e_i) u^top/(||X^top||) - (ov(Hess)_(||X^top||) (pi(X^top), nu))/(||X^top||).
  $
  Now this Hessian term is almost the ambient Laplacian of $||X^top||$, so we can rewrite this as 
  $
    ov(Delta)||X^top||u^top/(||X^top||) - u^top (ov(Hess)_(||X^top||) (nu,nu))/(||X^top||) - (ov(Hess)_(||X^top||) (pi(X^top), nu))/(||X^top||),
  $
  but now since $X^top = pi(X^top) + u^top nu$ we further simplify this into
  $
    ov(Delta)||X^top||u^top/(||X^top||) - (ov(Hess)_(||X^top||) (X^top, nu))/(||X^top||).
  $
  and then we use @eqn-ric_orthogonal-phi to get
  $
    ov(Delta)||X^top||u^top/(||X^top||) - ip(X^top, nu)(ov(Hess)_(||X^top||) (N^top, cal(N)^top))/(||X^top||)
    =
    - u^top/(||X^top||) (ov(Delta)||X^top|| - ov(Hess)_(||X^top||) (cal(N)^top, cal(N)^top)).
  $
  Now we use @eqn-ric_x to get
  $
    - ov(Ric)(X^top, nu).
  $<u_top_step_3>
  Next for the second term of @eqn-u_top_step_1 we get
  $
    ov(nabla)_i (h_(i j) ip(X^top, e_j))
    & =
    (ov(nabla)_i h_(i j)) ip(X^top, e_j)
    +
    h_(i j) ip(ov(nabla)_i X^top, e_j)
    +
    h_(i j) ip(X^top, ov(nabla)_i e_j)
    \ & =
    (ov(nabla)_i h_(i j)) ip(X^top, e_j)
    +
    h_(i j) (ip(psi^top (e_i), e_j))
    -
    h_(i j) h_(i j) ip(X^top, nu).
  $
  Since $h_(i j)$ is symmetric the third term here vanishes and so we are left with
  $
    ov(nabla)_i (h_(i j) ip(X^top, e_j))
    &=
    (ov(nabla)_i h_(i j)) ip(X^top, e_j)
    -
    |A|^2 u^top.
  $<u_top_step_4>
  Now plugging @eqn-u_top_step_3 and @eqn-u_top_step_4 into @eqn-u_top_step_1 gives us
  $
    Delta u^top =
    - ov(Ric) (X^top, nu)
    +
    (ov(nabla)_i h_(i j)) ip(X^top, e_j)
    -
    |A|^2 u^top
  $<u_top_step_5>
  now we can use @lemma-codazzi to get
  $
    (ov(nabla)_i h_(i j)) ip(X^top, e_j)
    &=
    (ov(Rm)_(j i i nu) + nabla_j h_(i i))ip(X^top, e_j)
    =
    (ov(Ric)(e_j, nu) + nabla_j H)ip(X^top, e_j)
    \ &=
    ov(Ric)(pi(X^top), nu) + ip(nabla H, X^top)
    \ &=
    ov(Ric)(X^top, nu) - u^top ov(Ric)(nu,nu) + ip(nabla H, X^top)
  $
  which we can plug back into @eqn-u_top_step_5 to get
  $
    Delta u^top =
    - u^top ov(Ric)(nu,nu) + ip(nabla H, X^top)
    -
    |A|^2 u^top
  $

  Combined with the previous claim we get that
  $
    Delta u = - n nu(phi) - u ov(Ric)(nu,nu) + ip(nabla H, X) + phi H - |A|^2 u
  $
  and then combining with @eqn-u_diff_t we get
  $
    L u
    &= n phi^2 + Xi'(t) u^top - n X(phi) + 2 n u nu (phi) + H ip(X,nabla u) + u^2 ov(Ric) (nu,nu)
    \ &- 2 phi u H + |A|^2 u^2
    \ &= n (phi^2 - X^perp (phi) - Xi(t) X^top (phi)) + Xi'(t) u^top  + 2 n u nu (phi) + H ip(X,nabla u) + u^2 ov(Ric) (nu,nu)
    \ &- 2 phi u H + |A|^2 u^2
    \ &= n Lambda phi^3 - n Xi(t) X^top (phi) + Xi'(t) u^top  + 2 n u nu (phi) + H ip(X,nabla u) + u^2 ov(Ric) (nu,nu)
    \ &- 2 phi u H + |A|^2 u^2.
  $
  This finishes the proof.
]

Now we can start to analyse this evolution equation to get results about $u$.
#corollary[
  There is a constant $epsilon > 0$ such that for any $t in [0,T)$
  $
    min_(p in M_t) u(p,t) >= epsilon/(1 + max_(p in M_t) |H(p,t)|)
  $
]<cor-u_inverse_bound>
#proof[
  At a minimum point of $u$ we have that $nabla u$ vanishes and so we get
  $
    L u = n (Lambda phi^3 - Xi(t) X^top (phi)) + Xi'(t) u^top + 2 n u nu(phi) + u^2(ov(Ric)(nu,nu)) - 2 phi u H + |A|^2 u^2,
  $
  now recall that all ambient objects are uniformly bounded for all time, so there exists a constant $M$ such that
  $
    L u >= n (Lambda phi^3 - Xi(t) X^top (phi)) + Xi'(t) u^top - u M - 2 phi u H + |A|^2 u^2.
  $
  By our assumptions both $Lambda phi^3$ and $Lambda phi^3 - Xi(t) X^top (phi)$ are positive, we thus have that any convex combinations of them is positive so since these are ambient quantities they must be uniformly bounded and so
  $
    n (Lambda phi^3 - Xi(t) X^top (phi)) >= epsilon_1 > 0
  $
  for some $epsilon_1$. We thus have
  $
    L u >= epsilon_1 + Xi'(t) u^top - u M - 2 phi u H + |A|^2 u^2.
  $
  Now we are free to pick $T_0$ such that $(||X^top||)/ T_0 <= epsilon_1/2$. Then we can use the Newton-Maclaurin inequality to get
  $
    L u >= epsilon_2 + Xi'(t) u^top - u M - 2 phi u H + H^2 u^2 / n.
  $
  Now assume that $u < epsilon/(1 + max |H(p, t)|)$, then
  $
    L u >= epsilon_2 + Xi'(t) u^top - epsilon M - 2 phi epsilon
  $
  so by setting $epsilon < epsilon_2/(2(M + 2 phi))$ then
  $
    L u >= epsilon_3 + Xi'(t) u^top
  $
  now we can pick $T_0$ so that $|Xi'(t)| < 1/(||X^top||)$ and we get
  $
    L u >= epsilon_4.
  $
  Thus by using @prop-max_principle we get that
  $
  u <= epsilon/(1 + max_(p in M_t) H(p,t)) quad "implies" quad min_(p in M_t) u(p,t) >= min_(p in M_0) u(p,0)
  $
  and so by choosing $epsilon$ appropriately we get the desired result.
]

Now that we can bound $u$ using $H$, we just need to show that $H$ grows sufficiently slowly, to guarantee the flow exists until $t = T_0$.
== Evolution Equation for $H$
#proposition[
  The evolution equation for $H$ is
  $
    L H &= 2 ip(nabla H, nabla u) + H ip(X, nabla H) - phi (H^2 - n |A|^2)
    + n(ov(Hess)_phi (nu,nu) - ov(Hess)_phi (cal(N)^perp,cal(N)^perp))
    \ &+ med n phi (ov(Ric)(cal(N)^perp,cal(N)^perp) - ov(Ric)(nu,nu))
  $
]
#proof[
  We use @cor-H_evolution to get
  $
    diff_t H = - Delta (n phi - H u) - (n phi - H u)(|A|^2 + ov(Ric)(nu,nu))
  $
  then simplifying this we get
  $
    L H = - n Delta phi + 2 ip(nabla H, nabla u) + H Delta u - (n phi - H u)(|A|^2 + ov(Ric)(nu,nu))
  $
  then using the results of @prop-u_evolution we get
  $
    L H
    &= - n Delta phi + 2 ip(nabla H, nabla u) - H n nu(phi) - H u ov(Ric)(nu,nu) + H ip(nabla H, X) + phi H^2
    \ & - med H|A|^2 u - (n phi - H u)(|A|^2 + ov(Ric)(nu,nu))
    \ &= - n Delta phi + 2 ip(nabla H, nabla u) - H n nu(phi) + H ip(nabla H, X) + phi H^2 - n phi(|A|^2 + ov(Ric)(nu,nu))
    \ &= - n Delta phi + 2 ip(nabla H, nabla u) - H n nu(phi) + H ip(nabla H, X) + phi (H^2 - n|A|^2) - n phi ov(Ric)(nu,nu).
  $
  Now we use @prop-h_props to get
  $
    L H
    &= - n ov(Delta) phi + n ov(Hess)_phi (nu,nu) + 2 ip(nabla H, nabla u) + H ip(nabla H, X) + phi (H^2 - n|A|^2)
    \ &- med n phi ov(Ric)(nu,nu)
  $
  but now we use @ric_x to get
  $
    L H
    &= n (phi ov(Ric)(cal(N)^perp,cal(N)^perp) - ov(Hess)_phi (cal(N)^perp, cal(N)^perp)) + n ov(Hess)_phi (nu,nu) + 2 ip(nabla H, nabla u)\ &+ H ip(nabla H, X) + phi (H^2 - n|A|^2) - med n phi ov(Ric)(nu,nu)
    \ &= 2 ip(nabla H, nabla u) + H ip(nabla H, X) + phi (H^2 - n|A|^2) + n phi (ov(Ric)(cal(N)^perp,cal(N)^perp) - ov(Ric)(nu,nu)) \ &+med n (ov(Hess)_phi (nu,nu) - ov(Hess)_phi (cal(N)^perp, cal(N)^perp))
  $
]
#corollary[
  There are constants $a,b > 0$ such that for any $t in [0,T)$
  $
    max_(p in M_t) H(p,t) <= a + b t
  $
]<cor-H_linear_bound>
#proof[
  At a maximum point of $H$ we have $nabla H = 0$, hence the evolution equation simplifies to
  $
      L H
    &= phi (H^2 - n|A|^2) + n phi (ov(Ric)(cal(N)^perp,cal(N)^perp) - ov(Ric)(nu,nu)) \ &+med n (ov(Hess)_phi (nu,nu) - ov(Hess)_phi (cal(N)^perp, cal(N)^perp)),
  $
  but then again using the Newton-Maclaurin inequality we get
  $
    L H
    <= n phi (ov(Ric)(cal(N)^perp,cal(N)^perp) - ov(Ric)(nu,nu)) + n (ov(Hess)_phi (nu,nu) - ov(Hess)_phi (cal(N)^perp, cal(N)^perp)).
  $
  Now on the right hand side these are all ambient objects and thus are uniformly bounded by some constant $M$, hence we have
  $
    L H <= M.
  $
  Hence by @prop-max_principle we get that $H <= max_(p in M_0) H(p,0) + M t$, proving the desired result.
]

With this linear bound we get an inverse linear lower bound on $u$.
#corollary[
  There exists $epsilon > 0$ such that
  $
    u(p,t) >= epsilon/(1 + T_0)
  $
  for all $t in [0,T)$ and $p in M_t$.
]
#proof[
  Combining @cor-H_linear_bound with @cor-u_inverse_bound we immediately get the desired result.
]

== Existence and Convergence
We now have everything we need to prove the flow exists until $t = T_0$.
#proposition[
  A surface $M$ which is star-shaped with respect to $X^perp + X^top$ remains star-shaped with respect to $X(t)$ for all $t in [0,T_0)$, furthermore the flow exists at $t = T_0$ and there the surface is star-shaped with respect to $X^perp$.
]
#proof[
  We have showed that $u$ is uniformly bounded for $t in [0,T_0)$, hence it is also uniformly bounded in the limit $t = T_0$.
]

We now shift out focus to rewriting this flow as a flow of functions instead of hypersurfaces, which will allow us to apply the results of @sect-PDE to it.
We want to write our hypersurface as a graph over an integral hypersurface of $X^perp$, since this is not a warped product space we need to be careful with this construction. We will fix a starting hypersurface $M$, and set
$
  lambda_0 = min_(p in M) lambda(p)
  quad
  "and"
  quad
  lambda_1 = max_(p in M) lambda(p),
$
and we want to construct nice coordinates on
$
    D := { p in N : lambda_0 <= lambda(p) <= lambda_1 }
$<domain_def>
// TODO: FIX NORMAL VECTORS TO INTEGRAL HYPERSURFACES TO USE CORRECT LETTER
We will start with proving that $D$ is compact, allowing us to lower bound important quantities uniformly.
#proposition[
  For any $lambda_1 > lambda_0 > 0$ in the image of $lambda$, the subset
  $D$ defined by @eqn-domain_def
  is compact.
]<prop-compact_region>
#proof[
  First we will show that $D$ is a fiber bundle over $[lambda_0, lambda_1]$, to see this fix $lambda in [lambda_0, lambda_1]$, then set $S_lambda = { p in N : lambda(p) = lambda }$, it is an integrable hypersurface of $X^perp$ and is compact. Then consider the flow of $X^perp$, since $S_lambda$ is compact we can pick $epsilon > 0$ such that the flow of $X^perp$ exists for $t in [-epsilon, epsilon]$ for all points $p in S_lambda$.
  Now the image of $S_lambda$ under this flow is another integrable hypersurface, this is because $X^perp$ is a conformal vector field and so under its flow, itself and orthogonality are preserved. Hence the flow of $X^perp$ fixes its orthogonal distribution $cal(D)(X^perp)$, and thus also its foliation. Hence for some $lambda' < lambda < lambda''$ we can reparametrize the flow of $X^perp$ to get the homeomorphism
  $
    cal(F) : S_lambda times [lambda', lambda ''] -> lambda^(-1)([lambda', lambda'']),
  $
  and thus $D$ is a fiber bundle.

  Now it is well known that a fiber bundle is compact if the base space and the fiber are both compact, which proves the desired result.
]

We can now use these lower bounds to construct a nice coordinate system for $D$, we will do this by flowing the surface $S_(lambda_0)$ to cover the entirety of $D$. For brevity we will shorten $S_(lambda_0)$ to $S$.
#proposition[
  For any $lambda in [lambda_0, lambda_1]$, and any point $p in S_lambda$ there exists an integral curve of $X(t)$ going through $p$ which intersects $S$ at exactly one point.
]
#proof[
  First we prove existence, consider the flow of $-X(t)$ acting on $p$, lets call this flow $cal(F)$. Notice that
  $
    diff_t lambda(cal(F)(p,t)) = - 2 Lambda < 0
  $
  and so this function is decreasing. Then at some point $lambda(cal(F)(p,t)) = lambda_0$ since otherwise $cal(F)(p,t)$ remains forever in $D$ where $- 2 Lambda < -epsilon < 0$ for some positive $epsilon$ which is a contradiction.

  To show uniqueness assume that the flow $cal(F)(p,t)$ intersects $S$ at more than one point. Then we have $lambda(cal(F)(p,t_1)) = lambda(cal(F)(p,t_2))$ and so by Rolle's theorem we have that $diff_t lambda(cal(F)(p,t_3)) = 0$ which contradicts the fact that $- 2 Lambda < 0$.
]
Using the unique intersection point we found above as a 'projection map' onto $S$ we get a diffeomorphism $F_t : D -> S times [lambda_0, lambda_1]$. Note that this diffeomorphism depends on $t$ because $X(t)$ depends on $t$.

We can now start converting our hypersurface flow into a flow of functions, we will denote by $tilde(nabla)$ the induced connection onto $S$.

#proposition[
  A hypersurface $M$ contained in $D$ is star-shaped with respect to $X(t)$ if and only if it can be identified using $F_t$ with a graph of smooth function $f: S -> [lambda_0, lambda_1]$.
]<prop-graph>
#proof[
  First assume that $M$ can be identified with the graph of $f$, then set $F : S -> S times [lambda_0, lambda_1]$ be the embedding of the graph
  $
    F : y |-> (y, f(y)).
  $
  One can easily compute that for $v in T_p S$
  $
    F_* v = hat(v) + v(f) diff_lambda
  $
  where $hat(v)$ is the extension of $v$ over the integral curve containing $p$ through the flow of $X(t)$.
  Then let $v$ be the unit vector which maximizes the length of the orthogonal projection of $X(t)$ onto $F_* v$, this length is
  $
    ip(v + v(f) diff_lambda, X(t))/(||v + v(f) diff_lambda||)
    =
    ip(v + v(f) diff_lambda, X(t))/(||v + v(f) diff_lambda||)
  $
  now orthogonally decompose $v$ as $v = a diff_lambda + b z$ where $z$ is a unit vector orthogonal to $diff_lambda$ and by extension also $X(t)$. We then have
  $
    ip(a diff_lambda + b z + v(f) diff_lambda, X(t))/(||a diff_lambda + b z + v(f) diff_lambda||)
    &=
    ip(b z + (a + v(f)) diff_lambda, X(t))/(||b z + (a + v(f)) diff_lambda||)
    \ &=
    ((a+v(f))ip(diff_lambda, X(t)))/(sqrt(b^2 + (a+v(f))^2||diff_lambda||^2))
    \ &=
    ((a+v(f)))/(sqrt(b^2/(||diff_lambda||^2) + (a+v(f))^2))||X(t)||.
  $
  Now since we are on a compact surface we have uniform bounds on $v(f)$ and $b$ is non-zero (since $v$ is not colinear with $X(t)$) we have
  $
    ((a+v(f)))/(sqrt(b^2/(||diff_lambda||^2) + (a+v(f))^2)) < 1 - epsilon
  $
  for some $epsilon > 0$. Now from this we get that the projection $pi$ of $X(t)$ onto $M$ satisfies
  $
    ||pi(X(t))||^2 < ||X(t)||^2 (1 - epsilon')
  $
  and so we have
  $
    u^2 = ||X(t)||^2 - ||pi(X(t))||^2 > ||X(t)||^2epsilon'
  $
  and so up to a change of orientation our surface is star-shaped.

  On the other hand assume that a surface is star-shaped, then first we prove that it intersects every integral curve of $X(t)$ at most once, to see this note that if it were to intersect it twice, then we would have $ip(nu,X(t_1))$ be positive and $ip(nu,X(t_2))$ be negative or vice versa, where $t_1, t_2$ are the intersection times. But this directly contradicts the fact that it is star-shaped. We thus have an injective map $pi : M -> S$ since the all the integral curves intersect $S$ at exactly one point.

  It will be enough to show that $pi$ is also a diffeomorphism, as then its inverse will exactly be the embedding of the graph of a function. It in fact suffices just to show it is a local diffeomorphism, since then it is a bijection onto its image and thus a diffeomorphism onto its image. Now we check that this is indeed the case, fix a point $p in M$ and take an orthonormal frame $e_1,...,e_n$ of $S$ centered at $f(p)$ and extend it to $n$ vector fields $hat(e)_1,...,hat(e)_n,hat(nu)$ of $D$ through the flow of $X(t)$. Now at the point $p$ consider the projection $P : T_p N -> span(hat(e)_1,...,hat(e)_n)$ induced by the frame $hat(e)_1,...,hat(e)_n,X(t)$ (i.e. the projection with kernel $span(X(t))$). If we restrict this map to $T_p N$ the projection kernel of this linear map is zero since anything in the kernel must be colinear with $X(t)$ and thus cannot be in $T_p M$ since that would mean $ip(X(t), nu) = 0$ which contradicts star-shapedness.

  Now we see that the projection is precisely the differential of $pi$ and it is a linear isomorphism and thus $pi$ is a local diffeomorphism.
]

In fact, by the first argument in the proof above we get that lower bounds on $u$ are equivalent to upper bounds on $||tilde(nabla) f||$.
#corollary[
  There are functions $M(epsilon)$ and $epsilon(M)$ such that
  $
    sup_(S) ||tilde(nabla) f|| < M => inf_S u > epsilon(M) quad "and" \
    inf_(S) u > epsilon => sup_(S) ||tilde(nabla) f|| < M(epsilon)
  $
]

We will now construct the flow in the following way, first we use @prop-graph to identify our initial surface $M_0$ with a graph of the function $lambda$ over $S$. Then $M_t$ solving @eqn-flow_def is equivalent to it being the graph of a function $lambda$ solving
$
  cases(L lambda = - 2 Lambda n phi u^top - 2 u ip(nabla Lambda, X^perp)\,,
    lambda(x,0) = lambda(x)\,,
  )
$<pde_formulation>
up to an appropriate diffeomorphism that handles points changing which integral curve they are on (this is alright as all normal flows are diffeomorphism invariant). This identification is through $G : (x,t,lambda) |-> F_t (x, lambda)$.

Next we solve this @pde_formulation purely in function space. We then apply appropriate diffeomorphisms to convert this solution to a solution of our normal flow.

#proposition("Short Time Existence")[
  For any star-shaped hypersurface $M_0$, the normal flow with velocity $n phi - H u$ with initial condition $M_0$ exists for some time interval $[0,T)$.
]<prop-flow_short_time>
#proof[
  By the processed described above it is enough to show that @pde_formulation has a solution for some time interval $[0,T)$. To see this we need to rewrite all geometric objects of the PDE in terms of $w$ and its derivatives. We will work with in normal coordinates $x^1,...,x^n$ on $S$, in which the induced metric is given by
  $
    g_(i j) = ip(F_* e_i, F_* e_j)
    = ip(hat(e)_i, hat(e)_j) + diff_j f ip(hat(e)_i, diff_lambda) + diff_i f ip(hat(e)_j, diff_lambda) + (diff_i f) (diff_j f) ip(diff_lambda, diff_lambda).
  $
  Notice that all 4 inner products in the expression are smooth functions of $(x,lambda)$ and so the coefficients are smooth functions of $x,lambda, D lambda$. We then immediately get that
  $
    g^(i j)(x, lambda, D lambda), quad det(g)(x, lambda, D lambda)
  $
  are both also smooth functions of their inputs. Now by the Gram-Schmidt method we get that the normal vector to the graph can be given by
  $
    nu = X(t) - sum_i ip(hat(e)_i + diff_i f diff_lambda, X(t))/ip(hat(e)_i + diff_i f diff_lambda, hat(e)_i + diff_i f diff_lambda) (hat(e)_i + diff_i f diff_lambda)
  $
  appropriately normalized, which is once again a smooth function of $x,lambda, D lambda$, hence $u^top$ and $u$ are also smooth functions of $x, lambda, D lambda$. Finally all ambient objects like $X^perp, Lambda, phi$ are all smooth functions of $x,lambda$. Finally we use the standard coordinate form of a Laplacian (see @leeIntroductionRiemannianManifolds2018a[p.~32] Proposition 2.46) to get
  $
    u Delta lambda = u/sqrt(det g)(x,lambda, D lambda) dot diff_i ((g^(i j) sqrt(det g) (x, lambda, D lambda)) diff_j lambda),
  $
  where importantly $u/sqrt(det g)(x,lambda, D lambda)$ is uniformly bounded from below for some short time by our uniform lower bounds on $u$.
  Hence we can rewrite @pde_formulation as
  $
    diff_t lambda - A(x, lambda, D lambda) dot diff_i (B^(i)(x, lambda, D lambda))
    =
    C(x,lambda, D lambda),
  $
  where $A$ is uniformly bounded from below by a positive $epsilon$. Now let us write $B^(i)$ with arbitrary inputs as $B^(i j) (y, z, p)$, we can then rewrite the equation as
  $
    diff_t lambda - A(x, lambda, D lambda) ((diff_(y^i) B^(i))(x, lambda, D lambda)\ + (diff_(z) B^(i))(x, lambda, D lambda)(diff_i lambda) + (diff_(p^j) B^(i))(x, lambda, D lambda)(diff_i diff_j lambda))
     =
    C(x,lambda, D lambda).
  $
  It then remains to show that $diff_(p^j) B^i$ is uniformly positive definite which will allow us to apply our PDE results.

  Recall that $B^i = g^(i k)(x, lambda, D lambda) sqrt(det g(x, lambda, D lambda)) diff_k lambda$, we thus need to get an explicit form for this expression, this will take several steps. First we can compute this expression assuming that $lambda = lambda_0$, since $lambda$ uniformly scales all geometric properties through the flow of $(t)$. Then at $lambda = lambda_0$ we get
  $
    g = tilde(g) + dif f times.circle pi(diff_lambda) + pi(diff_lambda) times.circle dif f + ||diff_lambda||^2 dif f times.circle dif f
  $
  where $tilde(g)$ is the metric on $S$, and $pi(diff_lambda)$ is the orthogonal projection of $diff_lambda$ onto $S$ identified with its dual one form $ip(pi(diff_lambda), dot)$. We start by calculating the determinant.
  #lemma[
    The determinant $det g$ is given in normal coordinates on $S$ as
    $
      det g = (1 + dif f(pi(diff_lambda)))^2 + ||diff_lambda^perp||^2||dif f||^2
    $
    where $diff_lambda^perp$ is the component of $diff_lambda$ orthogonal to $S$ and all norms are taken with respect to the ambient metric $g$.
  ]
  #proof[
    We can rotate the orthonormal coordinates so that $diff_i f = 0$ for $i >= 2$ and $ip(pi(diff_lambda), e_i) = 0$ for $i >= 3$, then our metric in these coordinates has the following block form
    $
      mat(1 + 2||dif f||ip(pi(diff_lambda), e_1) + ||diff_lambda||^2||dif f||^2, ||dif f||ip(pi(diff_lambda), e_2), 0; ||dif f||ip(pi(diff_lambda), e_2), 1, 0; 0,0,I_(n-2 times n-2); augment: #(hline: (1,2), vline: (1,2))).
    $
    In these coordinates the determinant is easily computed as
    $
      &1 + 2||dif f||ip(pi(diff_lambda), e_1) + ||diff_lambda||^2||dif f||^2 - ||dif f||^2ip(pi(diff_lambda), e_2)^2
      \ = &1 + 2||dif f||ip(pi(diff_lambda), e_1) + ||diff_lambda^perp||^2||dif f||^2 + ||dif f||^2 ip(pi(diff_lambda), e_1)^2
      \ = &(1 + ||dif f||ip(pi(diff_lambda), e_1))^2 + ||diff_lambda^perp||^2||dif f||^2
      = (1 + dif f((pi(diff_lambda)))^2 + ||diff_lambda^perp||^2||dif f||^2
    $
    and so since this equality is tensorial and does not involve coordinates, it is coordinate independent and thus is always true.
  ]

  Next we need to calculate the inverse matrix
  #lemma[
    The inverse matrix for the metric in normal coordinates on $S$ is given by
    $
      g^(i j)
      =&
      1/det(g) ((1 + 2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j) - (pi(diff_lambda) times.circle dif f)^(i j)\ &- (dif f times.circle pi(diff_lambda))^(i j) - (||diff_lambda^perp||^2+2dif f(pi(diff_lambda))) (dif f times.circle dif f)^(i j)\ &+ ||dif f||^2(pi(diff_lambda) times.circle pi(diff_lambda)))
    $
  ]
  #proof[
    We verify by computing the product
    $
      &det(g) g_(i k) g^(k j)
      \ =&
      (1 + 2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j)
      \ &+med(1 + 2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) ((pi(diff_lambda) times.circle dif f)^(i j) + (dif f times.circle pi(diff_lambda))^(i j))
      \ &-med((pi(diff_lambda) times.circle dif f)^(i j) + (dif f times.circle pi(diff_lambda))^(i j))
      \ &+med(1 + 2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2)||diff_lambda||^2 (dif f times.circle dif f)^(i j) - ||diff_lambda||^2 (dif f times.circle dif f)^(i j)
      \ &-med((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ &-med ((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))||diff_lambda||^2(dif f times.circle dif f)^(k j)
      \ &-med ||diff_lambda||^2(dif f times.circle dif f)^(i k)((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ &-med||dif f||^2||diff_lambda||^4 (dif f times.circle dif f)^(i j)
      \ =&
      (1 + 2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j)
      \ &+med(2dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) ((pi(diff_lambda) times.circle dif f)^(i j) + (dif f times.circle pi(diff_lambda))^(i j))
      \ &+med 2dif f(pi(diff_lambda))||diff_lambda||^2 (dif f times.circle dif f)^(i j)
      \ &-med((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ &-med ((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))||diff_lambda||^2(dif f times.circle dif f)^(k j)
      \ &-med ||diff_lambda||^2(dif f times.circle dif f)^(i k)((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ =&
      (1 + dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j)
      \ &+med 2dif f(pi(diff_lambda)) ((pi(diff_lambda) times.circle dif f)^(i j) + (dif f times.circle pi(diff_lambda))^(i j))
      \ &+med 2dif f(pi(diff_lambda))||diff_lambda||^2 (dif f times.circle dif f)^(i j)
      \ &-med((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ &-med ((dif f times.circle pi(diff_lambda))^(i k))||diff_lambda||^2(dif f times.circle dif f)^(k j)- ||diff_lambda||^2(dif f times.circle dif f)^(i k)((pi(diff_lambda) times.circle dif f)^(k j))
    $
    $
      =&
      (1 + dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j)
      \ &+med 2dif f(pi(diff_lambda)) ((pi(diff_lambda) times.circle dif f)^(i j) + (dif f times.circle pi(diff_lambda))^(i j))
      \ &-med((pi(diff_lambda) times.circle dif f)^(i k) + (dif f times.circle pi(diff_lambda))^(i k))((pi(diff_lambda) times.circle dif f)^(k j) + (dif f times.circle pi(diff_lambda))^(k j))
      \ =&
      (1 + dif f(pi(diff_lambda)) + ||dif f||^2||diff_lambda||^2) delta^(i j)
      \ &+med((pi(diff_lambda) times.circle dif f)^(i k) - (dif f times.circle pi(diff_lambda))^(i k))((pi(diff_lambda) times.circle dif f)^(k j) - (dif f times.circle pi(diff_lambda))^(k j))
    $
  ]
]


#pagebreak(weak: true)

#bibliography("Thesis.bib", style: "springer-mathphys")


// TODO: CHECK ALL INNER PRODUCTS
