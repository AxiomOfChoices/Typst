#import "@preview/commute:0.2.0": node, arr, commutative-diagram
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
*Sources consulted* \
Texts: Class Notes, Wikipedia page for simplicial sets.

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
+ Now since $F$ and $B$ have the same simplicial maps, $d F = d B$ so we have $d (F - B) = 0$ and thus we have non-zero kernel for $d : S_2 (X) -> S_1 (X)$. But the image of $d : S_3 (X) -> S_2 (X)$ is trivial because $S_3 (X)$ is trivial so $H_3 (X) = Z_3 (X)$ is non-zero.
= Question
== Statement
Let $X$ be a semisimplicial set. For each $n >= 1$, prove that the composite of the group homomorphisms $d : S_n (X) -> S_(n-1) (X)$ and $d : S_(n-1) (X) -> S_(n-2) (X)$ is the zero homomorphism. Conclude that $B_(n-1) (X)$ is a subgroup of $Z_(n-1) (X)$.
== Solution
We can directly compute, for some element $sigma in X_n$,
$
d d sigma & = d sum_(i=0)^n (-1)^i d_i sigma
= sum_(i=0)^n (-1)^i d (d_i sigma)
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
= Question
== Statement
Suppose $X$ is a topological space. We use $pi_0 (X)$ to refer to the set of path components in $X$. Construct an isomorphism of abelian groups $H_0 (X) -> ZZ pi_0 X$.
== Solution
Consider a chain $sigma in H_0 (X) = Z_0 (X) quo B_0 (X)$, we can write a representative of its equivalence class as some formal sum $sigma = sum_(i=1)^n a_i x_i$ where $a_i$ are coefficients in $ZZ$ and $x_i$ are points are maps $Delta_0 -> X$ which we can identify with points of $X$. Now let $phi$ be the map that takes a point in $X$ and takes it to the path component in $pi_0 (X)$ which it is a part of. We now define the image of $sigma$ to be
$
f(sigma) = sum_(i=1)^n a_i phi(sigma).
$
First let us check that this is a well defined group homomorphism, namely that $f(sigma) = 0$ if $sigma in B_0 (X)$. We will show this by showing that $f compose d = 0$. To see this let $rho$ be a map $Delta_1 -> X$, which is just a path, and name its endpoints $d_0(rho) = a, d_1(rho) = b$. Since it is a path, by definition $a$ and $b$ are in the same path component of $X$, so we have $phi (a) = phi (b)$. We thus have
$
f compose d (rho) = f (a - b) = phi(a) - phi(b) = 0,
$
by the fact that $f compose d$ is a group homomorphism we get that it is identically zero.

Now let us check that $f$, is an isomorphism. We will do this by constructing an inverse map $g : ZZ pi_0 X -> H_0 (X)$. To do this we will choose a point $x_i$ for each path component $K_i in pi_0 (X)$ such that $x_i in K_i$ (this might require axiom of choice). Then we define for each $K_i in pi_0 X$,
$
g(K_i) = x_i
$
and extend the map through group generation to $ZZ pi_0 X$.

Currently this is just a map $g : ZZ pi_0 X -> S_0 (X)$, but since $d$ is identically zero on $S_0 (X)$ then all of $S_0 (X)$ is in the kernel and thus in $Z_0 (X)$, and so we can then also just compose this map with the quotient map $Z_0 (X) -> Z_0 (X) quo B_0 (X)$. Finally we check that $f$ and $g$ are inverses for each other. For each $K_i$, since $g(K_i) in K_i$ we have that $f(g(K_i)) = K_i$. On the other hand, we have for any point $x in K_i$, $g(f(x)) = g(K_i) = x_i$. This is not equal to $x$, but they are in the same equivalence class since any path from $x$ to $x_i$ is witness to the fact that $x - x_i in B_0 (X)$. Thus $f$ and $g$ are inverses to each other and thus isomorphisms.

= Question
== Statement
Suppose that $X$ and $Y$ are two topological spaces, and let $X product.co Y$ denote the disjoint union of $X$ and $Y$. Prove that, for each non-negative integer $n$, $H_n (X product.co Y)$ is isomorphic to $H_n (X) plus.circle H_n (Y)$.
== Solution
First note that each $Delta_n$ is connected, thus its image by a continuous map is always connected. This means that if $Delta_n -> X product.co Y$ is a continuous map, its image is completely contained within either $X$ or $Y$.

Due to this we can construct a map $f : S_n (X product.co Y) -> S_n (X) plus.circle S_n (Y)$, for each basis map $sigma : Delta_n -> X product.co Y$ its either a map $Delta_n -> X$ or $Delta_n -> Y$ so we just map it to either $S_n (X)$ or $S_n (Y)$. Now restricting this map to $Z_n (X product.co Y)$ makes the image also $Z_n (X) plus.circle Z_n (Y)$, this is because the boundary operation will give the same result whether in the union or not.

Next we check that this map descends to the homology, if an element $sigma$ is a boundary in $X product.co Y$ then $sigma = d (rho)$. Now write
$
rho = sum_(i=1)^n a_i rho_i
$
now each $rho_i$ is contained in either $X$ or $Y$, so set $A$ to be the set of indices for which $rho_i$ is contained in $X$ and $B$ the set containing the rest, we can then write
$
rho = sum_(i in A) a_i rho_i + sum_(i in B) a_i rho_i =: a + b.
$
Now we know that $d rho = d a + d b$, and so we have $f(sigma) = (d a, d b)$ which is clearly in $B_n (X) plus.circle B_n (Y)$. We thus know that $f$ descends to a map $f : H_n (X product.co Y) -> H_n (X) plus.circle H_n (Y)$.

Now luckily the inverse is easier to construct, we have topological injections
$
i_X : X -> X product.co Y, i_Y : Y -> X product.co Y,
$
so since the homology operator is a functor we have that these become maps
$
i'_X : H_n (X) -> H_n (X product.co Y), i'_Y : H_n (Y) -> H_n (X product.co Y).
$

One can easily check that these are inverses of each other, and so they are isomorphisms.

= Question
== Statement
Let $cal(C)$ denote a category and suppose $c_1$ and $c_2$ are two objects of $cal(C)$. Consider a triple consisting of an object $p in op("Ob")(cal(C))$, a morphism $p_1 : p -> c_1$, and a morphism $p_2 : p -> c_2$. Such a triple is called a _product_ of $c_1$ and $c_2$ if, for any other triple $(z, f_1 : z -> c_1, f_2 : z -> c_2)$, there is a unique morphism $g : z -> p$ such that $p_1 compose g = f_1$ and $p_2 compose g = f_2$.
+ Prove that if $(z,z -> c_1, z -> c_2)$ and $(z', z' -> c_1, z' -> c_2)$ are two products of $c_1$ and $c_2$, then $z$ and $z'$ are isomorphic objects of $cal(C)$.
+ Describe the construction of a product of any two objects $c_1, c_2$ in the category of sets. Do the same for the category of topological spaces, and then for the category of abelian groups. Prove that your constructions are products.
+ Construct an example of a category $cal(C)$ and two objects $c_1$ and $c_2$ for which no product of $c_1$ and $c_2$ exists.
== Solution
+ Assume we have two products as given in the question, we will put them in a commutative diagram like so,
  #align(center)[#commutative-diagram(
      node((0, 3), $c_1$),
      node((2, 3), $c_2$),
      node((1, 2), $z$, "z"),
      node((1, 1), $z'$),
      node((1, 0), $z$, "zz"),
      arr("z", $c_1$, $p_1$),
      arr("z", $c_2$, $p_2$),
      arr($z'$, $c_1$, $p'_1$, curve: 10deg),
      arr($z'$, $c_2$, $p'_2$, curve: -10deg),
      arr("zz", $c_1$, $p_1$, curve: 20deg),
      arr("zz", $c_2$, $p_2$, curve: -20deg),
      arr("zz", $z'$, $f$, "dashed"),
      arr($z'$, "z", $g$, "dashed"),
      node-padding: (50pt, 50pt),
    )]
  Here the existence of the triplet for $z$, and the fact that $z'$ is a product, gives us the unique morphism $g$. Similarly the triplet for $z'$ and the fact that $z$ is a product gives the unique morphism $f$. I now clam that $f$ and $g$ are inverses to each other. To see this simply note that $g compose f$ satisfies $p_1 compose g compose f = p_1' compose f = p_1$ and similarly for $p_2$. But then $g compose f$ is a morphism through which the triplet $(z, p_1, p_2)$ factors over itself. But $id_z$ is also such a morphism, and so since these morphisms must be unique $g compose f = id_z$. A similar construction shows that $g compose f = id_(z')$, so $f$ and $g$ are inverses to each other and thus are the unique isomorphisms between $z$ and $z'$.
+ The product in the category of sets, topological spaces and abelian groups are the Cartesian products $c_1 times c_2$ along with the projection maps onto their respective components. In the topological case the product is given the product topology, and in the abelian group case it is given the structure of a direct product.
  
  Now to see these are indeed products assume that in any of the categories $(z', f : z' -> c_1, g : z' -> c_2)$ is another triplet, then define the map $h : z' -> c_1 times c_2$ given by $h(x) = (f(x), g(x))$ for each $x in z'$. It is clearly a working map in the set case, and it is also continuous in the topological case and is a group homomorphism in the abelian group case.
+ Consider the category with objects ${c_1,c_2}$ and no morphisms. Since a triplet cannot exist, there can be no product in this category.
= Question
== Statement
Write down explicitly what it would mean for the isomorphism you constructed in Problem 3 to be natural. Prove that the isomorphism you constructed is natural (if it is not, modify your solution to the previous problem until it is).
== Solution
Note that $H_0 (dot)$ and $ZZ pi_0 (dot)$ are both functors from $Top$ to $Ab$ so a natural isomorphism between them would mean a collection of isomorphisms $h_X : H_0 (X) -> ZZ pi_0 (X)$ such that for every continuous map $f : X -> Y$ the following diagram commutes
#align(center)[#commutative-diagram(
    node((0, 0), $H_0 (X)$),
    node((0, 1), $H_0 (Y)$),
    node((1, 0), $ZZ pi_0 (X)$),
    node((1, 1), $ZZ pi_0 (Y)$),
    arr($H_0 (X)$, $H_0 (Y)$, $f_*$),
    arr($ZZ pi_0 (X)$, $ZZ pi_0 (Y)$, $f^*$),
    arr($H_0 (X)$, $ZZ pi_0 (X)$, $h_X$),
    arr($H_0 (Y)$, $ZZ pi_0 (Y)$, $h_Y$),
  )]
where $f_*$ is the induced map on homologies and $f^*$ is the induced map on path components given by mapping a path component in $X$ to the path component in which its image is contained in $Y$.

My map is indeed a natural isomorphism, to see this consider a point $x in H_0 (X)$. If we compute $f^* compose h_X (x)$ we first map $x$ to its path component $K_x$ and then $f^*$ maps that path component to some other path component $ov(K)_x$ of $Y$ where $f(K_x) seq ov(K)_x$. On the other hand if we first map $x$ through $f_*$, then we will get the point $f(x) in Y$ representing the class $f_* (x)$. But we know $f(x) in f(K_x) seq ov(K)_x$ so $h_Y (f_* (x)) = ov(K)_x$ and thus indeed the diagram always commutes.
