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
  + If $f$ is a function $N -> RR$, then $ov(Delta) f = Delta f + Hess_f (nu,nu) + H nu(f)$ <prop-h_laplac>
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

#remark[
    We will also adapt two important coordinate systems, we will be working in normal coordinates around a point $p in M$ which will call these coordinates $x^i$, we will denote their partial derivatives $diff_i$ and the covariant derivatives with respect to the induced metric $nabla_i$. Secondly we will also have normal coordinates at $F(p) in N$, we will call these coordinates $y^i$, their partials $diff_y_i$ and the covariant derivatives $ov(nabla)_i$. Note that we can rotate the normal coordinates $y^i$ so that they align with $x^i$, in the sense that _at the point $p$_
  $
    diff_i F = diff_y_i, forall i <= n quad "and" quad nu = diff_y_(n+1)
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
    ip(diff_t (diff_j diff_i F + ov(Gamma)_(rho sigma)^k diff_i F^rho diff_j F^sigma diff_(y_k)), nu)
    + ip(diff_j diff_i F, diff_t nu)
    \ &=
    ip(diff_j diff_i (f nu) + (diff_t ov(Gamma)_(rho sigma)^k) (diff_i F^rho diff_j F^sigma) diff_(y_k) + ov(Gamma)_(rho sigma)^k diff_t (diff_i F^rho diff_j F^sigma diff_(y_k)), nu)
    \ &- med ip(diff_j diff_i F, nabla f)
  $
  now the Christoffel symbols vanish at $p$, so we get
  $
    -diff_t h_(i j) &= ip(diff_j (nu diff_i f + f diff_i nu) + (f diff_nu ov(Gamma)_(rho sigma)^k) (diff_i F^rho diff_j F^sigma) diff_(y_k), nu)
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
    f ip(diff_j (nabla_i nu - ov(Gamma)_(rho sigma)^k diff_i F^rho nu^sigma diff_y_k), nu)
    + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &=
    diff_i diff_j f
    +
    f ip(diff_j (h_(i k) diff_k F - ov(Gamma)_(rho sigma)^k diff_i F^rho nu^sigma diff_y_k), nu)
    + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &=
    diff_i diff_j f + f (diff_nu ov(Gamma)^nu_(rho sigma)) diff_i F^rho diff_j F^sigma
    \ &+ med
    f ip(h_(i k) diff_j diff_k F + (diff_j h_(i k)) (diff_k F) - (diff_j ov(Gamma)_(rho sigma)^k) diff_i F^rho nu^sigma diff_y_k - ov(Gamma)_(rho sigma)^k diff_j (diff_i F^rho v^sigma), nu)
  $
  but now again the Christoffel symbols vanish and since $nu$ is orthogonal to all tangent vectors, we can simplify the second term to get
  $
    f ip(h_(i k) diff_j diff_k F - (diff_j ov(Gamma)_(rho sigma)^k) diff_i F^rho nu^sigma diff_y_k, nu)
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
]<prop-H_evolution>
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

First let us declare some useful conditions that we will need, let $N$ be the complete ambient manifold which admits a conformal vector field $X$ on some open subset $U$ with conformal factor $phi$ which does not vanish on $U$. Consider the two conditions
+ The distribution $cal(D)(X) seq T U$ defined by $cal(D)(X)|_p = { v in T_p N | ip(v,X) = 0 }$ is integrable on the set $U$.
+ The integral surfaces of $cal(D)(X)$ are level sets of $(||X||)/phi$ wherever it is defined.

These conditions are key to this method, they are vital to many of the identities that Li and Pan derived and used to get a handle on the normal flow they construct.

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
The rest of this section will be devoted to properties of quasi-closed conformal vector fields, for the rest of this section we will fix a quasi-closed conformal vector field $X$ with conformal factor $phi$ and associated tensor field $psi$. We will also refer to $cal(D)(X),U(X)$ as $cal(D),U$ for brevity. We will start with a key property regarding the integral surfaces of $cal(D)$.
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
    h_(i j) = ip(ov(nabla)_i nu, e_j) = ip(ov(nabla)_i X/(||X||), e_j)
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
]
Since we know $lambda$ is constant on integral surfaces, its gradient must be colinear with $X$, that is $ov(nabla) lambda = 2 Lambda X$ for some function $Lambda$. We note a convenient expression for $Lambda$.
#proposition[
  Where $lambda$ is defined, we have
  $
    ov(nabla) lambda = 2 (phi^2 - X(phi))/phi^3 X
  $
]
#proof[
  We see that
  $
    ov(nabla) lambda &= ip(ov(nabla) lambda, X/(||X||)) X/(||X||)
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
  We have for any $p in U$ and any $Y in T_p M$
  $
    psi(Y) = (ip(Y, ov(nabla)||X||) X - ip(Y, X) ov(nabla)||X||)/(||X||).
  $
  Furthermore if $X$ satisfies condition 2, wherever $phi != 0$ we have
  $
    psi(Y) = (ip(Y, ov(nabla)phi) X - ip(Y, X) ov(nabla)phi)/(phi).
  $
]
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




#pagebreak(weak: true)

#bibliography("Thesis.bib")



