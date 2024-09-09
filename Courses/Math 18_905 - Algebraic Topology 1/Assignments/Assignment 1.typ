
#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#let bar(el) = $overline(#el)$
= Question
== Statement
Write down a semisimplicial set $X$, with $X_3 = nothing, X_4 = nothing, ...$ which has non-zero second homology group $H_2 (X)$. You should
#set enum(numbering: "(a)")
+ Write down sets $X_2,X_1,X_0$.
+ Write down face maps $d_0,d_1,d_2 : X_2 -> X_1$.
+ Write down face maps $d_0,d_1 : X_1 -> X_0$.
+ Check that your face maps satisfy the simplicial identities.
+ Calculate, with proof, the second homology group $H_2 (X)$ and check that it is non-zero.

If you can, sketch or describe in words a picture of your semisimplicial set.
== Solution
We will try to create a semisimplicial set which is the triangulation of a sphere. We will do this by gluing two triangles along their boundaries.
+ We will have $X_2 = {F,B}, X_1 = {d,e,f}, X_0 = {a,b,c}$.
+ The face maps $2 -> 1$ will be #h(1fr)
  $
  d_0(F) = d_0(B) = e, quad d_1(F) = d_1(B) = f, quad d_2(F) = d_2(B) = d.
  $
+ The face maps $1 -> 0$ will be #h(1fr)
  $
  d_0(d) = d_1(e) = b, quad d_1(d) = d_1(f) = a, quad d_0(e) = d_0(f) = c.
  $
+ We check all possibilities
  $
  d_0 d_1 (F) = d_0 (f) = c = d_0 (e) = d_0 d_0 (F)
  \ d_0 d_2 (F) = d_0 (d) = b = d_1 (e) = d_1 d_0 (F)
  \ d_1 d_2 (F) = d_1 (d) = a = d_1 (f) = d_1 d_1 (F)
  \ d_0 d_1 (B) = d_0 (f) = c = d_0 (e) = d_0 d_0 (B)
  \ d_0 d_2 (B) = d_0 (d) = b = d_1 (e) = d_1 d_0 (B)
  \ d_1 d_2 (B) = d_1 (d) = a = d_1 (f) = d_1 d_1 (B)
  $
  and so indeed the simplicial identities are satisfied.
+ Now since $F$ and $B$ have the same simplicial maps, $partial F = partial B$ so we have $partial (F - B) = 0$ and thus we have non-zero kernel for $partial : S_2 (X) -> S_1 (X)$. But the image of $partial : S_3 (X) -> S_2 (X)$ is trivial because $S_3 (X)$ is trivial so $H_3 (X) = Z_3 (X)$ is non-zero.
= Question
== Statement
Let $X$ be a semisimplicial set. For each $n >= 1$, prove that the composite of the group homomorphisms $partial : S_n (X) -> S_(n-1) (X)$ and $partial : S_(n-1) (X) -> S_(n-2) (X)$ is the zero homomorphism. Conclude that $B_(n-1) (X)$ is a subgroup of $Z_(n-1) (X)$.
== Solution
We can directly compute, for some element $sigma in X_n$,
$
partial partial sigma & = partial sum_(i=0)^n (-1)^i d_i sigma
= sum_(i=0)^n (-1)^i partial (d_i sigma)
= sum_(i=0)^n (-1)^i sum_(j=0)^(n-1) (-1)^(j) d_j d_i sigma
\ &= sum_(i=0)^n (-1)^i sum_(j=0)^(n-1) (-1)^(j) d_j d_i sigma
= sum_(0<=j<i<=n) (-1)^(j+i) d_j d_i sigma
+
sum_(0<=i<=j<=n-1) (-1)^(j+i) d_j d_i sigma
\ &= sum_(0<=j<i<=n) (-1)^(j+i) d_(i-1) d_j sigma
+
sum_(0<=i<=j<=n-1) (-1)^(j+i) d_j d_i sigma
\ &= sum_(0<=i<=j<=n-1) (-1)^(j+i+1) d_(j) d_i sigma
+
sum_(0<=i<=j<=n-1) (-1)^(j+i) d_j d_i sigma
=
0
$
Where at the last step we re-indexed the left sum.
