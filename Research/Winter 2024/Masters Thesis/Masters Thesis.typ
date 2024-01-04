// cSpell:ignore frontpage toptitle linebreak middletitle bottomtitle datetime thmrules pagebreak ctheorems
#import "../../../Templates/monograph.typ": style, frontpage, outline_style, chapter_headings, start_outline
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#show: style
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


== Concepts and notation
This document assumes general knowledge of differential and Riemannian geometry, see @leeIntroductionSmoothManifolds2012 and @leeIntroductionRiemannianManifolds2018a for great introductions, respectively.

For the rest of this document we will use the following notation, $N$ is an $n+1$ dimensional Riemannian manifold with metric $ov(g)$ within which we have a compact domain $Omega$ with boundary $diff Omega = M$ such that $F : M -> N$ is an embedding making $M$ a Riemannian hypersurface. We then set $g := F^* ov(g)$ to be the induced metric on $M$. We will in general identify $M$ with its image $F(M)$ and use the two interchangeably. We will call $frak(X)(N)$ the set of surfaces that can be defined as above.

In general, tensorial constructions defined on $N$ will be written with an overline and their versions on $M$ will be written normally. We will write the covariant derivatives on $M$ and $N$ as $nabla$ and $ov(nabla)$ respectively. We will write the laplacian on $N$ and $M$ as $Delta$ and $ov(Delta)$ respectively. We will use Einstein summation notation for all tensor equations.

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

== Extrinsic Riemannian geometry
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
This second fundamental form encodes within itself how the manifold $M$ lies inside $N$, it also carries with it a number of useful properties, the most important of which is that it is symmetric, see @leeIntroductionRiemannianManifolds2018a[p.~227] for details. Of much importance is the trace of this form, taken with respect to the metric $H = h_(i i)$ called the _mean curvature_.

Let us write up some properties of the second fundamental form.
#proposition[
Let $e_i$ be an orthonormal frame at $p$, the following are true:
#block(width: 100%, inset: (x: 2em))[
  + $h$ can be written in coordinates as $h_(i j) = ip(e_i, ov(nabla)_(e_j) nu)$. <prop:h_coords>
  + $ov(nabla)_i nu = h_(i j) e_j$. <prop:h_applied>
  + $ov(nabla)_i e_j = - h_(i j) nu$. <prop:h_neg>
  + If $f$ is a function $N -> RR$, then $ov(Delta) f = Delta f + Hess_f (nu,nu) + H nu(f)$ <prop:h_laplac>
  ]
]
#proof[
#link(<prop:h_coords>)[(a)] is directly from definition, to see #link(<prop:h_applied>)[(b)] note that ${ e_1, ..., e_n } union { nu }$ form a basis for the tangent space $T_p M$ and thus we have 
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

Now for #link(<prop:h_neg>)[(c)] we note first that $nabla_X Y = ( ov(nabla)_Y X)^top$ for $X,Y in T_p M$, see, for instance, @jostRiemannianGeometryGeometric2011[p.~223]. This will mean that since $e_i$ are orthonormal then 
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

Finally we have for #link(<prop:h_laplac>)[(d)], we have
$
  ov(Delta) f 
  & = ip(ov(nabla)_i ov(nabla) f, e_i) + ip(ov(nabla)_nu ov(nabla), nu)
  = ov(nabla)_i ip(ov(nabla) f, e_i) - ip(ov(nabla) f, ov(nabla)_i e_i) + ip(ov(nabla)_nu ov(nabla), nu)
  \ & = nabla_i ip(nabla f, e_i) - ip(ov(nabla) f, -H nu) + ip(ov(nabla)_nu ov(nabla), nu)
$
]

#pagebreak(weak: true)

#bibliography("Thesis.bib")



