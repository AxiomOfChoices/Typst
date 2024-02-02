#import "/Templates/monograph.typ": style, frontpage, outline_style, chapter_headings, start_outline
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#show: style
#show: equation_references
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
#let ve = $epsilon$
#let ip(x,y) = $lr(angle.l #x, #y angle.r)$
#let seq = $subset.eq$
#let ov(el) = $overline(#el)$
#let Area = math.op("Area")
#let Volume = math.op("Volume")
#let Hess = math.op("Hess")
#let Rm = math.op("Rm")
#let Ric = math.op("Ric")
#let lie = $cal(L)$
#let Sym = math.op("Sym")
#let div = math.op("div")
#show: outline_style


#pagebreak(weak:true)
#show: start_outline
#pagebreak(weak:true)
= Abstract
This thesis aims to loosely cover the subject of geometric flows, and more specifically a variant of the mean curvature flow.
The subject of geometric flows uses results in PDE theory theory, more specifically parabolic PDEs, to gain new insight about Riemannian geometry.

One of the biggest problems often tackled by mean curvature flows is the Isoperimetric problem. The Isoperimetric problem asks us to classify the spaces that minimize perimeter for a given volume (hence the name), the first use of mean curvature flows to attack this problem was due to Huisken in 1984 #cite(<huiskenFlowMeanCurvature1984>) who proved it in case of boundaries of convex domains in Euclidean, and since then there have been attempts to push his methods further. More recently, in 2013, Guan and Li #cite(<guanMeanCurvatureType2013a>) constructed a new normalized flow which allows them to prove the inequality in the case of boundaries of star-shaped domains in Space forms. Shortly after, in 2018, Guan, Li and Wang pushed this flow even further which allowed them to prove the result in a certain class of warped product spaces #cite(<guanVolumePreservingFlow2018>).

This thesis continues the effort to use such flows, together with my collaborator Joshua Flynn we pushed the flow even further, allowing us to prove the result for far larger class of domains in an even wider class of spaces.


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

In general, tensorial constructions defined on $N$ will be written with an overline and their versions on $M$ will be written normally. We will write the covariant derivatives on $M$ and $N$ as $nabla$ and $ov(nabla)$ respectively. We will write the laplacian on $N$ and $M$ as $Delta$ and $ov(Delta)$ respectively. We will use Einstein summation notation for all tensor equations.

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
We will almost always be working in orthonormal coordinates on $M$, that is, at any point $p$ there are coordinates $x^1,...,x^n$ such that the vector fields 
$
  e_i = diff/(diff x^i)
$
form an orthonormal basis _at the point $p$_, we cannot, in general, assume that they form an orthonormal basis in any neighborhood of $p$. We will also call $e_i$ an orthonormal frame at $p$.

Recall that since $M$ is the boundary of a manifold it must be orientable,
it thus has a canonical 'outward' pointing unit normal vector field, which we will call $nu$.
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
  + If $f$ is a function $N -> RR$, then $ov(Delta) f = Delta f + Hess_f (nu,nu) + H nu(f)$ <prop-h_laplac>
  ]
]
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

Finally for #link(<prop-h_laplac>)[(d)], we have
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
This endomorphism is then called the _associate tensor field_ of $X$, and with it we can rewrite the above equation as
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
]

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

== Partial Differential Equations
The Partial Differential Equations (PDEs) we will be dealing with most in this document are parabolic PDEs, so we will go over their properties first.



Let $T in (0,infinity]$ and $U seq M$ a smooth open domain, a function $u_t : [0,T] times U$ is said to solve a *quasi-linear parabolic PDE* if it satisfies a differential equation of the form 
#math.equation(block: true, numbering: "(1)",
  $ u_t (x,t) = a^(i j)(x,t,u,nabla u) nabla_i nabla_j u + G(x,t,u,nabla u) $
)
<eqn-parabolic_pde>
where $a$ is symmetric positive definite matrix.

We say that the PDE in @eqn-parabolic_pde is _uniformly parabolic_ if there exist constants $A,B$ such that
$
  A|v|^2 <= a^(i j) v_i v_j <= B|v|^2
$
for all $v in T_p M$ everywhere.

The most important tool in the analysis of parabolic PDEs is the maximum principle, a form of which we will now prove.

#proposition[
  Assume $u$ solves @eqn-parabolic_pde and that at a maximum of $u$ we the inequality $G(x,t,u,nabla u) < f(t)$ holds, then we have for all $t in [0,T]$
  #math.equation(block: true, numbering: "(1)",
    $ sup_(x in U) u(x,t) <= sup_(x in U) u(x,0) + integral_0^t f(s) dif s $
  )<eqn-max_priniciple_linear>
  if instead we have $G(x,t,u,nabla u) < B u(x,t)$ for some constant $B in RR$ then we have
  #math.equation(block: true, numbering: "(1)", 
    $ sup_(x in U) u(x,t) <= (sup_(x in U) u(x,0)) e^(B t) $
  )<eqn-max_priniciple_exp>
]
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

== Evolving Hypersurfaces

Now that we are familiar with geometry and PDEs we can start to use them together to attack the Isoperimetric problem.
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


As a manifold flows it's various properties, both local and global, will change, the equations governing these changes are called _evolution equations_. We will now derive some of these evolution equations, we will first start with the most important evolving tensor, the metric.

#proposition[
  The evolution equation for the metric is
  $
    diff_t g = 2 f h
  $
]<prop-metric_evoluion>
#proof[
  Recall that for some vectors $X,Y in T_p M_t$ we can define $g(X,Y)$ to be
  $
    g(X,Y) = ov(g) (D F_t (X), D F_t (Y))
  $
  and so we can differentiate
  $
    diff_t g(X,Y) = diff_t ov(g) (D F_(X))
  $
]

#proposition[
  Let $F_t$ be a normal flow with velocity $f$, we have the following evolution equations for $V(M_t)$ and $A(M_t)$,
  $
    diff_t V(M_t) = integral_M f dif S, quad 
    diff_t A(M_t) = integral_M H f dif S
  $
]
#proof[
  
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
Now it turns out that these closed conformal vector fields characterize warped products of the form above, namely, if a manifold admits a closed conformal then it can be written in the form $RR_+ times_f N$ for some manifolds $N$ and function $f$.



#pagebreak(weak: true)

#bibliography("Thesis.bib")



