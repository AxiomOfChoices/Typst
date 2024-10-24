#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/cetz:0.2.2"
#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 3", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#let bar(el) = $overline(#el)$
#set enum(numbering: "(a)")
*Sources consulted* \
Students: \
Texts: Class Notes. 

= Question
== Statement
+ Suppose that $cal(C)$ is a category and that
  #align(center)[
  #commutative-diagram(
    node((0, 0), $A$),
    node((0, 1), $B$),
    node((1, 0), $C$),
    node((1, 1), $P$),
    arr($A$, $B$, $f$),
    arr($A$, $C$, $g$),
    arr($B$, $P$, $p_B$),
    arr($C$, $P$, $p_C$),
    node-padding: (50pt, 50pt),
  )
  #commutative-diagram(
    node((0, 0), $A$),
    node((0, 1), $B$),
    node((1, 0), $C$),
    node((1, 1), $P'$),
    arr($A$, $B$, $f$),
    arr($A$, $C$, $g$),
    arr($B$, $P'$, $p'_B$),
    arr($C$, $P'$, $p'_C$),
    node-padding: (50pt, 50pt),
  )
  ]
  are two pushout squares in $cal(C)$. Prove that $P$ is isomorphic to $P'$.
+ Describe, with proof, the pushout in $Ab$ of a diagram of abelian groups.
== Solution
+ Let us consider the following commutative diagram
  #align(center)[
    #commutative-diagram(
    node((0, 0), $A$),
    node((0, 2), $B$),
    node((2, 0), $C$),
    node((2, 2), $P$, "p1"),
    node((3, 3), $P'$, "p2"),
    node((4, 4), $P$, "p3"),
    arr($A$, $B$, $f$),
    arr($A$, $C$, $g$),
    arr($B$, "p1", $p_B$),
    arr($C$, "p1", $p_C$),
    arr($B$, "p2", $p'_B$, curve: 20deg),
    arr($C$, "p2", $p'_C$, curve: -20deg),
    arr($B$, "p3", $p_B$, curve: 30deg),
    arr($C$, "p3", $p_C$, curve: -30deg),
    arr("p1", "p2", $f$, "dashed"),
    arr("p2", "p3", $g$, "dashed"),
    node-padding: (25pt, 25pt),
  )
  ]
  the fact that $P$ is a pushout guarantees the existence of the unique dashed map $f$, and the fact that $P'$ is a pushout guarantees the existence of the unique dashed map $g$, both of which make the diagram above commute. Now this diagram clearly shows that the map $g compose f$ satisfies the pushout property for $P$ on itself, but also clearly $id_P$ also satisfies that property. By uniqueness, we then must have $g compose f = id_P$. An identical and symmetric argument shows that $f compose g = id_(P')$.
+ I claim that the pushout is given by $P = B times C quo gen((f(x),-g(x))\, x in A)$, we clearly have maps
  $
    p_B : B &-> P wide &wide
    p_C : C &-> P\
    x &|-> [(x, 0)]&
    y &|-> [(0, y)]
  $
  and to check the pushout square commutes we have
  $
    (p_B compose f) (x) = p_B (f(x)) = [(f(x),0)] 
    =
    [(0, g(x))]
    =
    p_C (g(x))
    =
    (p_C compose g) (x).
  $
  Now to show that it is indeed a pushout, for another object $P'$ and morphisms $p'_B, p'_C$ we have have that they factor as
  #align(center)[
    #commutative-diagram(
      node((0,0), $B$),
      node((2,0), $C$),
      node((1,1), $B times C$),
      node((1,3), $P'$),
      arr($B$, $B times C$, $iota_B$),
      arr($C$, $B times C$, $iota_C$),
      arr($B times C$, $P'$, $p'$),
      node-padding: (25pt, 25pt),
    )
  ]
  where $p'$ is given by $p'(x,y) = p'_B (x) + p'_C (y)$. Now since we assume $P'$ made the diagram commute we have
  $
    p'_B (f(x)) = p'_C (g(x)) \
    p'(f(x), 0) = p'(0, g(x)) \
    p'(f(x), -g(x)) = 0\
  $ 
  so then the kernel of $p'$ contains as a subgroup $gen((f(x), - g(x))\, x in A)$, so by isomorphism theorem, $p'$ factors through the quotient, that is
  #align(center)[
    #commutative-diagram(
      node((0,0), $B$),
      node((2,0), $C$),
      node((1,1), $B times C$),
      node((1,3), $P$),
      node((1,5), $P'$),
      arr($B$, $B times C$, $iota_B$),
      arr($C$, $B times C$, $iota_C$),
      arr($B times C$, $P$, ""),
      arr($P$, $P'$, $tilde(p)'$),
      node-padding: (25pt, 25pt),
    )
  ]
  for some unique map $p'$. But then that map is exactly the map that makes the following diagram commute
  #align(center)[
    #commutative-diagram(
    node((0, 0), $A$),
    node((0, 2), $B$),
    node((2, 0), $C$),
    node((2, 2), $P$, "p1"),
    node((3, 3), $P'$, "p2"),
    arr($A$, $B$, $f$),
    arr($A$, $C$, $g$),
    arr($B$, "p1", $p_B$),
    arr($C$, "p1", $p_C$),
    arr($B$, "p2", $p'_B$, curve: 20deg),
    arr($C$, "p2", $p'_C$, curve: -20deg),
    arr("p1", "p2", $p'$, "dashed"),
    node-padding: (25pt, 25pt),
  )
  ]
  which proves that $P$ is indeed the pushout.
= Question
== Statement
We attach a 1-cell to $S^2$ by considering the pushout $P$ of the diagram
#align(center)[
  #commutative-diagram(
    node((0, 0), $S^0$),
    node((0, 2), $S^2$),
    node((2, 0), $D^1$),
    node((2, 2), $P$),
    arr($S^0$, $S^2$, $f$),
    arr($S^0$, $D^1$, $g$),
    arr($D^1$, $P$, $p_B$),
    arr($S^2$, $P$, $p_C$),
    node-padding: (25pt, 25pt),
  )
]
Here the map $f$ from $S^0$ to $S^2$ takes one point to the north pole of $S^2$ and the other point to the south pole.
+ Describe in words or draw a picture of the pushout $P$.
+ Use the Mayer-Vietoris sequence to calculate the homology groups of $P$. To apply the Mayer-Vietoris sequence, the first step must be to describe open sets $A$ and $B$ covering $P$. You will then need to compute the homology groups of $A$, $B$ and $A sect B$.
== Solution
+ This pushout consists of a sphere $S^2$ glued to the 'handle' $D^1$ at the north and south pole.
+ We pick the following cover, $A$ will be $D^1$ along with two small neighborhoods of its endpoints on $S^2$, $B$ will be all of $S^2$ along with a small neighborhood of the endpoints of $D^1$ in $D^1$. If we imagine the sphere as embedding in 3d, with the induced metric we can say $A = B_epsilon (D^1), B = B_epsilon (S^2)$ for sufficiently small $epsilon$. In this case we get that $A sect B = B_epsilon (S^0)$ where we identify $S^0$ with the north and south pole. We note here that its easy to see that $A$ is homotopy equivalent to $D^1$ and hence to a point, and that $B$ is homotopy equivalent to $S^2$.
  We now have the Mayer-Vietoris sequence, which gives us
  $
    ... -> H_(n) (A sect B) -> H_n (A) plus.circle H_n (B) -> H_n (P) -> H_(n - 1) (A sect B) -> ...
  $
  then using homotopy equivalence we can get
  $
    ... -> H_(n) (S^0) -> H_n (D^1) plus.circle H_n (S^2) -> H_n (P) -> H_(n - 1) (S^0) -> ...
  $
  now assume $n >= 2$, then we have $H_n (S^0) iso H_(n-1) (S^0) iso 0$, and clearly we have $H_n (D^1) iso 0$ so all together we get
  $
    0 -> H_n (S^2) -> H_n (P) -> 0
  $
  so we get an isomorphism and thus $H_n (P) = ZZ$ if $n = 2$ and $0$ for $n > 2$.

  For $n = 1$ we take the exact sequence
  $
    ... -> H_1 (D^1) plus.circle H_1 (S^2) -> H_1 (P) -> H_0 (S^0) -> H_0 (D^1) plus.circle H_0 (S^2)  -> ...
  $
  and we again get
  $
    0 -> H_1 (P) -> ZZ times ZZ ->^f ZZ times ZZ -> ...
  $
  here the map $f$ is given by $(x,y) -> (x+y, -x-y)$ which has kernel $ZZ$ so $H_1 (P) iso ZZ$. Finally $H_0 (P) = ZZ$ because $P$ has one connected component.

= Question
== Statement
Calculate the homology groups of the Klein bottle.
== Solution
We can give the Klein bottle the following CW structure
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    rect((0,0), (2,2), fill: gray)
    line((2, 0), (0, 0),
    stroke: red,
    name: "bottom")
    line((0, 2), (2, 2),
    stroke: red,
    name: "top")
    line((0, 2), (0, 0),
    stroke: blue,
    name: "left")
    line((2, 2), (2, 0),
    stroke: blue,
    name: "right")
    line((2, 2), (0, 0),
    stroke: yellow,
    name: "diagonal")
    mark("bottom.mid", "bottom.end", anchor: "center", symbol:">", offset: 0.85, fill: red, stroke: red)
    mark("top.mid", "top.end", anchor: "center", symbol:">", offset: 0.85, fill: red, stroke: red)
    mark("left.mid", "left.end", anchor: "center", symbol:">", offset: 0.85, fill: blue, stroke: blue)
    mark("right.mid", "right.end", anchor: "center", symbol:">", offset: 0.85, fill: blue, stroke: blue)
    mark("diagonal.mid", "diagonal.end", anchor: "center", symbol:">", offset: 1.2, fill: yellow, stroke: yellow)
    content("top.mid", anchor: "south", padding: .2, [$A$])
    content("bottom.mid", anchor: "north", padding: .2, [$A$])
    content("left.mid", anchor: "east", padding: .16, [$B$])
    content("right.mid", anchor: "west", padding: .1, [$B$])
    content(("diagonal.start", 70%, "diagonal.end"), anchor: "north-west", [$C$])
    content((0.5,1.5), $X$)
    content((1.5,0.5), $Y$)
    content((0,0), $e_0$, anchor: "north-east")
    content((2,0), $e_0$, anchor: "north-west")
    content((2,2), $e_0$, anchor: "south-west", padding: .05)
    content((0,2), $e_0$, anchor: "south-east", padding: .05)
  })
]
From there we already know that $H_n (K) = 0$ for $n >= 3$ since we have no 3-cells, next we have two 2-cells, $X$ and $Y$, and we have
$
  d X = C - B + A, wide
  d Y = A - C + B
$
so the kernel of $d$ in $S_2 (K)$ is empty since these are linearly independent over $ZZ$, we hence have $H_2 (K) = 0$. Now we have for the 1-cells $A,B,C$
$
  diff A = diff B = diff C = e_0 - e_0 = 0
$ 
so $ker d = S_1 (K) iso ZZ^3$, we hence have
$
  H_1 (K) iso ZZ^3 quo (gen((1,-1,1)\, (1,1,-1)).
$
But let us analyze this quotient space, we define the map
$
  f : ZZ^3 quo gen((1,-1,1)\, (1,1,-1)) &-> ZZ_2 times ZZ\
  [(x,y,z)] &|-> (x+y mod 2, y+z)
$
and I now claim that this is an isomorphism, first we check that it is well defined, this is simple since 
$
  [(1,-1,1)] |-> (0, 0) wide [(1,1,-1)] |-> (0,0)
$
then we also see that it is surjective since
$
  [(x,0,y)] |-> (x mod 2, y).
$
Finally to check injectivity, let us assume that $f([(x,y,z)]) = 0$, then we must have that $x - y = 0 mod 2$ as well as $y + z = 0$. This then allows us to get the following decomposition
$
  (x,y,z) = (x,y,-y) = (x - y, 0, 0) + y (1,1,-1)
$
but since $x - y = 0 mod 2$ we know that $x - y = 2 k$ for some integer $k$ so
$
  (x, y, z) = k (2, 0, 0) + y (1, 1, -1) = k ((1,-1,1) + (1,1,-1)) + y (1, 1, -1).
$
and hence $(x,y,z) in gen((1,-1,1)\, (1,1,-1))$ and so $f$ is injective. We thus have $H_1 (K) iso ZZ_2 times ZZ$. Finally, $K$ has only one connected component so clearly $H_0 (K) iso ZZ$.

= Question
== Statement
+ Suppose that $f: S^n -> S^n$ is a continuous map that is not surjective. Prove that the degree of $f$ is $0$.
+ Suppose that a function $f : S^n -> S^n$ has no fixed points. Prove that $f$ is homotopic to the antipodal map, and hence has degree $(-1)^(n+1)$.
+ Suppose that a group $G$ acts continuously and freely on an even-dimensional sphere $S^(2n)$. Use part $(b)$ to construct an injective group homomorphism from $G$ to ${-1,+1}$, deduce that the order of $G$ is either $1$ or $2$.
+ Write down a continuous and free action of the group of order $2$ on $S^2$.
== Solution
+ If $f$ is not surjecitve, let $x$ not be in the image and consider the factorization of $f$
  $
    S^n ->^(tilde(f)) S^n - {x} ->^iota S^n.
  $
  This factorization gets functorially mapped to the factorization of $f_*$
  $
    H_n (S^n) ->^(tilde(f)_*) H_n (S^n - {x}) ->^(iota_*) H_n (S^n).
  $
  Clearly $S^n - {x}$ is homeomorphic to $RR^n$ by stereographic projection, so it has $H_n (S^n - {x}) = 0$ and so $tilde(f)_* = 0$. But then since $f_* = iota_* compose tilde(f)_*$ then we clearly have $f_* = 0$ and so the degree of $f_*$ is $0$.
+ We consider the homotopy
  $
    h(x,t)
    = ((1 - t)f(x) - t x)/abs((1-t)f(x) - t x).
  $
  This is well defined and continuous as long as $(1-t) f(x) - t x$ is never zero, but we can compute this is equivalent
  $(1-t) f(x) = t x$
  but both $t$ and $1-t$ are positive on $[0,1]$ and both $x$ and $f(x)$ are of equal magnitude, so this can only happen if $x = f(x)$, which we assumed was not the case. We now just notice that at the endpoints we have
  $
    h(x,0) 
    = (f(x))/abs(f(x)) = f(x)
    wide
    h(x,1) 
    = (-x)/abs(-x) = -x
  $
  so this is indeed a homotopy from $f(x)$ to the antipodal map $-x$. The degree of this map is the same as that of the antipodal map, now note that it is the composition of $n+1$ reflections, so it is enough to show that each reflection on the sphere has degree $-1$. Now by symmetry we may assume that the reflection map $g$ is the map taking $(x_1,...)$ to $(-x_1,...)$, we now give $S^n$ the CW structure where 
+ Since $G$ acts freely, every non-identity element of $G$ acts by a map with degree $(-1)^(n+1)$ which is just $-1$ because $n$ is even, so we have a map $G -> {-1,+1}$ given by taking the degree of the action. Now the kernel of this map consists of those actions with degree $+1$, but since the action is free and $n$ is even only the identity in $G$ has degree $+1$ so the kernel is trivial and hence this map is injective. We thus have that $G$ can be identified with a subgroup of ${-1,+1}$ and hence has order $1$ or $2$.
+ A continuous and free action of ${-1,+1}$ on $S^2$ is given by $1 |-> (x -> x)$ and $-1 |-> (x -> -x)$.

= Question
== Statement
A normalized non-zero vector field on $S^n$ is a continuous function $f: S^n -> S^n$ such that the dot product of $x$ with $f(x)$ is always 0.
+ Suppose that $f$ is a non-zero vector field on $S^n$. Does $f$ have any fixed points?
+ Suppose that $f$ is a non-zero vector field on $S^n$. Consider the function
  $
    h(x,t) = cos((pi t)/2) x + sin((pi t)/2) f(x)
  $
  prove that $h$ provides a homotopy between $1_(S^n)$ and $f$.
+ Prove that non non-zero vector field can exist on an even-dimensional sphere.
== Solution
+ Clearly $f$ cannot have any fixed points, since if it did then $f(x) = x$ for some $x$ but then $f(x) dot x = x dot x = norm(x)^2 = 1$ which contradicts the fact that $f(x) dot x = 0$.
+ First let us check that $h(x,t)$ is indeed a map $h : S^n times I -> S^n$,
  $
    norm(h(x,t)) 
    &= ip(cos((pi t)/2) x + sin((pi t)/2) f(x), cos((pi t)/2) x + sin((pi t)/2) f(x))
    \ &= cos((pi t)/2)^2 ip(x,x) + 2 cos((pi t)/2) sin((pi t)/2) cancel(ip(x, f(x))) + sin((pi t)/2)^2 ip(f(x),f(x))
    \ &= cos((pi t)/2)^2 ip(x,x) + sin((pi t)/2)^2 ip(f(x),f(x))
  $
  now since $x in S^n$ and $f(x) in S^n$ we have 
  $
    norm(h(x,t)) &= cos((pi t)/2)^2  + sin((pi t)/2)^2 = 1
  $
  so indeed $h(x,t)$ lands inside $S^n$. Next we see that it is clearly continuous, so it remains to check that
  $
    h(x,0) = cos(0) x + sin(0) f(x) = x\
    h(x,1) = cos(pi/2) x + sin(pi/2) f(x) = f(x)
  $
  so indeed $h$ is a homotopy from $1_(S^n)$ and $f(x)$.
+ Assume such a vector field $f$ existed, using question 4 part $(b)$ we know that since $f$ has no fixed points it has degree $(-1)^(n+1) = -1$, but then by part $(b)$ of this question it is homotopic to the identity map, which has degree $1$. This is a contradiction since degree is homotopy equivalent, so such a vector field cannot exist.

= Question
== Statement
+ If $V$ is a vector space over a field $k$, we use $dim(V)$ to refer to the dimension of $V$. Suppose that
  $
    0 -> A -> B -> C -> 0
  $
  is an exact sequence of finite dimensional vector spaces over some field $k$. Prove that $dim(B) = dim(A) + dim (C)$.
+ Suppose that $X$ is a finite CW complex. Prove that, for any field $k$, the Euler characteristic $chi(X)$ can be calculated as $chi(X) = sum_(n) (-1)^n dim(H_n (X; k))$.
== Solution
+ We simply use rank nullity theorem, we have by definition a map $f : B -> C$ with $A iso ker f$ so we have by rank nullity theorem
  $
    dim(A) + dim(C) = dim(ker f) + dim(im f) = dim (B)
  $
+ First note that we have the short exact sequences
  $
  0 -> B_n (X; k) -> Z_n (X; k) -> H_n (X; k) -> 0
  $
  which give us that $dim(H_n (X; k)) = dim (Z_n (X; k)) - dim (B_n (X; k))$. Next we also have the SES
  $
  0 -> Z_n (X; k) -> C_n (X; k) -> B_(n-1) (X; k) -> 0
  $ 
  which gives us $dim (C_n (X; k)) = dim(Z_n (X; k)) + dim(B_(n-1) (X; k))$. Using the two together we get 
  $
    chi(X) 
    &= sum_(n) (-1)^n dim(H_n (X; k))
    \ &= sum_(n) (-1)^n dim(Z_n (X; k) quo B_n (X; k))
    \ &= sum_(n) (-1)^n (dim(Z_n (X; k)) - dim (B_n (X; k)))
    \ &= sum_(n) (-1)^n dim(Z_n (X; k)) - sum_(n) (-1)^(n) dim (B_n (X; k))
    \ &= sum_(n) (-1)^n dim(Z_n (X; k)) - sum_(n) (-1)^(n-1) dim (B_(n-1) (X; k))
    \ &= sum_(n) (-1)^n (dim(Z_n (X; k)) + dim (B_(n-1) (X; k)))
    \ &= sum_(n) (-1)^n dim(C_n (X; k)) = sum_n (-1)^(n) a_k
  $
  which is exactly the Euler characteristic.
