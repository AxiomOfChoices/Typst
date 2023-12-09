#import "../../../Templates/generic.typ": generic
#import "../../../Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#show: doc => generic(title: "Talk notes", name: "Jacob Reznikov", doc)
#show: doc => chapter_heading(doc)
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}

= Introduction
Historically one of the first methods used to attack the Isoperimetric inequality is the method of symmetrization which, as the name suggests, exploits the symmetries of the ambient space. I will be presenting the modern version of this argument in the most symmetric spaces that exist in Riemannian geometry, space forms.

#definition[
  A _Space form_ is a Riemannian $n$-manifold which is simply connected, complete and has constant sectional curvature $kappa$.
]

#proposition[
  There are exactly three space forms up to rescaling and isometries. These are $S^n, RR^n, HH^n$ with sectional curvatures $kappa = 1,0,-1$ respectively.
]

Space forms enjoy a number of strong symmetry properties but we will only use $2$ for what follows.

#proposition("Frame homogeneity")[
  Let $M$ be a space form, for any two points $p,q in M $ and any orthonormal basis $e_i$ for $p$ and $e_i'$ for $q$ we have an isometry $f$ such that $f(p) = q$ and $f_*(e_i) = e_j$.
] <prop:homog>

#proposition("Decomposition")[
  Let $M = S^n, RR^n, HH^N$ be a space form, $p in M$ and unit tangent vector $xi in T_p M$, we have a decomposition of $M$ into leaves $M_t$ enjoying the following properties.
  + Each leaf $M_t$ is isometric to a rescaling of $M^(n-1)$ where $M^(n-1)$ is the lower dimensional version of $M$. Each leaf has sectional curvature $1 + tan^2(t), 0, -1 + tanh^2(t)$ respectively.
  + The slice $M_t$ goes through $gamma(t)$ and is orthogonal to $gamma'(t)$ where $gamma$ is the geodesic with $gamma(0) = p$ and $gamma'(0) = xi$.
  + The geodesics orthogonal to $M_t$ allow us to identify points on different leaves. The distance between a point $q in M_t$ and its identification $q' in M_(t')$ is $|t - t'|$.
  + We have a family of global maps $lambda_s$ sending each point $q in M_t$ to its identified point $q' in M_(t+s)$.
  + The Riemannian measure $dif V$ decomposes as $dif V = f(t) dif t dif A$ where $dif A$ is the Riemannian measure on $M^(n-1)$ and $f$ is some function.
] <prop:decomposition>
#pb()

= Balls are the optimal shape
For the rest of the talk we will fix $M = S^n, RR^n, HH^n$.

The isoperimetric inequality states that for any compact subset $X seq M$ with smooth boundary $diff X$ we have 
$
  A(diff X) >= A(diff B)
$
where $B$ is the ball in $M$ with $V(B) = V(X)$. We will first use a small generalization of area which will allow us to reason about area through volume. 

We will denote by $[X]_ve$ the $ve$ ball around a subset $X in M$ (recalling that the Riemannian metric gives us a standard metric), and by $frak(X)$ the set of compact subsets of $M$

#definition[
  Let $X$ be a compact subset of $M$ (not necessarily smooth). We define its _Minkowski area_ to be 
  $
    Mink(X) = liminf_(h arrow.b 0) (V([X]_ve) - V(X))/ve
  $
]

This new concept of area is indeed a generalization of our old concept of area since

#proposition[
  If $diff X$ is compact then $Mink(X) = A(X)$.
]

We need one last definition before we can start the proof.
#definition[
  Let $X$ be a compact subset, we define the _undercut set_ $fu(X)$ to be 
  $ fu(X) = { Y in frak(X) | V(Y) = V(X), V([Y]_ve) <= V([X]_ve), forall ve > 0 } $
]
Because of the above proposition to show the Isoperimetric inequality it is sufficient to show that 
#theorem[
  Let $X$ be a compact subset of $M$ there exists a ball $B seq M$ with $B in fu(X)$.
]
We will prove this by induction on $n$, so for the rest of the chapter we will assume that this holds for $M^(n-1)$.

#pb()
We will now outline the method of proof for this theorem
+ Define a total ordering $<=_r$ on $fu(X)$ and prove that a $<=_r$ minimal element exists in $fu(X)$.
+ Prove that for any non-ball element $Y in fu(X)$ there exists an element $S(Y) in fu(X)$ with $S(Y) <_r Y$ and thus $Y$ cannot be $<=_r$ minimal.

== Circumradius
#definition[
  The circumradius $r(X)$ of a bounded subset $X$ is defined to be 
  $
    r(X) := inf { r | exists x_0 in M "with" X seq overline(B(x_0,r))}
  $
]

#proposition[
  $r(X)$ is always achieved by a ball $B(x_0,r(X))$ called the minimal ball.
]
#proof[
  Take a sequence of balls $overline(B(x_n, r_n))$ containing $X$ with $r_n arrow.b r(X)$, then all $x_n$ are contained within the compact subset $overline(B(X,r_1))$ and thus they have a converging subsequence $x_(n_k) -> x_infinity$, then it is easy to see that $B(x_infinity, r(X))$ contains $X$
]

We will definte our ordering on $fu(X)$ to be $X <=_r Y <=> r(X) <= r(Y)$

#definition[
  The Hausdorff metric on $frak(X)$ is given by 
  $ d(X,Y) = min {r | X seq [Y]_r and Y seq [X]_r } $
]

#proposition[
  $V: frak(X) -> RR$ is upper-semicontinuous on $frak(X)$ 
] <prop:upper>
#proof[
  Consider the open sets $U_k = B(Y, 1 / k)$, since $Y$ is compact we have $Y = sect.big_k U_k$ and so by continuity of measure $V(U_k) arrow.b V(Y)$.

  Let $Y_n$ be a sequence of subsets with $Y_n -> Y$ then for any $k$ we will eventually have $Y_n seq U_k$ and so $V(Y_n) <= V(U_k) arrow.b V(Y)$ and so $lim sup V(Y_n) <= V(Y)$
] 

#lemma[
  For any compact set $X$, $fu(X)$ contains an $<=_r$ minimal element.
]
#proof[
  By @prop:homog[Prop.] we can translate the elements of $fu(X)$ so that their minimal ball is concentring with the minimal ball of $X$. We can also restrict ourselves to the elements $Y in fu(X)$ with $r(Y) <= r(X)$. Set $r = inf{r(Y), Y in fu(X)}$.

  Take a sequence of such elements $Y_n$ with $r(Y_n) arrow.b r$, since $r(Y) <= r(X)$ we have that $Y_n seq overline(B(x_0,r(X)))$ for all $n$ and so there exists a subsequence $Y_(n_k)$ that converges in the Hausdorff metric to an compact subset $Y seq overline(B(x_0,r(X)))$.

  Now since this convergence is in the Hausdorff metric we know that for any $ve >= 0$ we have $[Y]_ve seq [Y_n]_(ve + eta_n)$ for some $eta_n arrow.b 0$ and so we have 
  $ V([Y]_ve) <= V([Y_n]_(ve + eta_n)) <= V([X]_(ve + eta_n)) $
  and so by taking $n -> infinity$ we get $V([Y]_ve) <= V([X]_ve)$.

  By taking $ve = 0$ above we get that $V(Y) <= V(X)$ and by @prop:upper[Prop.] we get $V(Y) >= limsup_n V(Y_n) = V(X)$.
  
  Thus $Y in fu(X)$ and has $r(Y) = r$
]

== Symmetrization
Now that we know a minimal element exists we want to take a non-disk element of $fu(X)$ and 'symmetrize' it to decrease its circumradius.

#definition[
  Take a compact subset $X seq M$ along with a point $p$, and a unit tangent vector $xi in T_p M$. By @prop:decomposition[Prop.] we get a decomposition of $M$ into leaves $M_t$. We denote by $[X]^t$ the intersection $X sect M_t$. 

  The symmetrization $S_xi (X)$ is defined as 
  $
    union.big_(t in RR) B_(M_t)(gamma(t),r_t)
  $
  where $r_t$ is chosen so that $A(B_(M_t)(gamma(t), r_t)) = A([X]^t)$.

  In other words we are taking each slice $[X]^t$ and replacing it with a ball of equal centered at $gamma(t)$.
] 

#lemma("Symmetrizaiton undercuts")[
  For any compact $X$, any point $p in M$ and any unit tangent vector $xi in T_p M$ we have $S_xi (X) in fu(X)$.
]
#proof[
  It is immediate from the decomposition of the Riemannian measure that 
  $
    V(X) = integral_(-oo)^(oo) A([X]^t) dif t
  $
  and so $V(X) = V(S_xi (X))$.
  
  We will write $W = S_xi (X)$ for brevity. We want to show now that $V([W]_ve) <= V([X]_ve)$ for all $ve > 0$. We will prove this by showing it is true for each slice. First consider the slice $Z = [B(X, ve)]^t$ of the inflation of $X$, what preinflated slices of $X$ contribute to $Z$? We can easily see that only the slices $X^s$ with $s in [t - ve, t + ve]$ contribute to $Z$ since any other slices are too far away. Now fix $s in [t - ve, t + ve]$, how does the slice $[X]^s$ contribute to $Z$? We by the rotational symmetry (@prop:homog) of the space we get that for any point $x in M_s$ the ball $B(x, ve)$ will intersect with $M_t$ in a circle $B_(M_t)(lambda_(t - s) x, h(t,s,ve))$ where $h$ does not depend on $x$. We can rewrite this as $lambda_t B_(M_0)(lambda_(-s) x, h(t,s,ve))$. We thus get that $ [B([X]^s, ve)]^t = lambda_t B_(M_0)(lambda_(-s) [X]^s, h(t,s,ve)) $
  and thus so by unioning the contributions from all slices we get 
  $ [B(X, ve)]^t = union.big_(s in [t - ve, t + ve]) lambda_t B_(M_0)(lambda_(-s) [X]^s, h(t,s,ve)) $
  Using this form we can get 
  $
    A([B(X,ve)]^t) 
    &= 
    A(union.big_(s in [t - ve, t + ve]) lambda_t B_(M_0)(lambda_(-s) [X]^s, h(t,s,ve)))
    \ &>=
    sup_(s in [t - ve, t + ve]) A(lambda_t B_(M_0)(lambda_(-s) [X]^s, h(t,s,ve)))
  $

  Now for $W$ the exact same logic holds, but in the last step we will get a union of concentric circles and so its area will be equal to that of the largest circle. We thus have 
  $
    A([B(W,ve)]^t) 
    =
    sup_(s in [t - ve, t + ve]) A(lambda_t B_(M_0)(lambda_(-s) [W]^s, h(t,s,ve)))
  $
  Now by the inductive hypothesis we have that 
  $
    A(lambda_t B_(M_0)(lambda_(-s) [W]^s, h(t,s,ve)))
    <=
    A(lambda_t B_(M_0)(lambda_(-s) [X]^s, h(t,s,ve)))
  $
  for all $s,t$ and so we get 
  $ A([B(W,ve)]^t) <= A([B(X,ve)]^t) $
  for all $t$ which gives us $V([W]_ve) <= V([X]_ve)$.

  This proves that $W in fu(X)$.
]

#lemma("Symmetrization decreases circumradius")[
  For any compact $X$ which is not a ball, there exists a point $p$ and tangent vectors $xi_1,...,xi_n in T_p M$ such that 
  $ r(S_(xi_n) ( S_(xi_(n-1))(...(S_(xi_1)(X))...))) < r(X) $
]
#proof[
  Let $r = r(X)$ and let $B(x_0,r)$ be the minimal ball of $X$ then since $X$ is not a ball the set $diff B(x_0,r) without X$ is nonempty and open, now note that if $x in diff B(x_0,r) without X$ then we also have $x in diff B(x_0,r) without S_xi (X)$ for any $xi$. Our job then will be to make this set larger and larger until it is the entire boundary, then if $X$ does not intersect the boundary, then since it is compact then we can shrink the ball by some positive amount, provin the resulting symmetrization has smaller circumradius.

  To achieve this consider the largest circle contained in $diff B(x_0,r) without S_xi (X)$, if this circle contains a hemisphere of $diff B(x_0,r)$ then it contains two antipodal points and so symmetrization along the axis going through the two points will be sufficient to make the intersection empty. Otherwise take an axis aligned with the boundary of this circle after symmetrization this circle's radius doubles. Continuing this gives us the desired result.
]