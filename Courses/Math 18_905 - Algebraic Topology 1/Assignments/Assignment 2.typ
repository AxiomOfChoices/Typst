#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/cetz:0.2.2"
#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 2", name: "Jacob Reznikov", doc)
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
Students: Jiahui Yu, Nick \
Texts: Class Notes.

= Question
== Statement
+ Suppose $0 -> ZZ -> A -> ZZ -> 0$ is a short exact sequence (of abelian groups). Prove that $A$ is isomorphic to $ZZ plus.circle ZZ$.
+ We use $ZZ quo 2 ZZ$ to denote the group with two elements. Write down two short exact sequences
  $
    0 -> ZZ quo 2 ZZ -> A -> ZZ quo 2 ZZ -> 0 \
    0 -> ZZ quo 2 ZZ -> B -> ZZ quo 2 ZZ -> 0
  $
  such that $A$ is not isomorphic to $B$.
== Solution
+ #v(-3pt) Let us name the morphisms $ZZ ->^f A ->^g ZZ$, then let $x$ be any element of $A$ which maps to $1$ under $g$. We have that $x$ must generate an infinite order subgroup of $A$, as otherwise it would contradict the existence of $g$ since we would have $g(0) = g(n x) = n$. Now we consider the map $ZZ plus.circle ZZ -> A$ given by $h : (a,b) |-> f(a) + b x$. This is clearly a homomorphism, it is injective because $gen(x)$ and $im f$ have zero intersection by construction. To see it is surjective, fix $y in A$, set $m = g(y)$ and consider the element $m x$. We have $g(y - m x) = g(y) - g(m x) = m - m = 0$ so by exactness $y - m x in im f$. Then we for some $a in ZZ$, $y = m x + f(a)$ so $y$ is in the image of $h$.
+ Consider $A = (ZZ quo 2 ZZ)^2$ and $B = ZZ quo 4 ZZ$. We clearly have these as short exact sequences since the maps $f_1 (x) = (x,0), g_1 (x,y) = y$ and the maps $f_2 (x) = 2 x, g_2 (x) = x mod 2$ make them short exact sequences. It is also clear that $(ZZ quo 2 ZZ)^2 iso.not ZZ quo 4 ZZ$, since $ZZ quo 4 ZZ$ contains an element of order $4$ and $(ZZ quo 2 ZZ)^2$ does not.

= Question
== Statement
+ Consider the first $6$ letters in standard LaTeX font: A, B, C, D, E, and F. Viewed as subsets of $RR^2$, which of these letters are homotopy equivalent? No proofs are required.
+ Prove that if a space $A$ is homotopy equivalent to another space $B$, and $C$ is homotopy equivalent to $D$, then the product spaces $A times C$ and $B times D$ are homotopy equivalent.
== Solution
+ The three homotopy equivalence classes are ${A,D}$, ${C,E,F}$ and ${B}$.
+ Let $f_1,g_1$ be a homotopy equivalence of $A$ and $B$, in the sense that $f_1 compose g_1 tilde.eq id_B$ and $g_1 compose f_1 tilde.eq id_A$. Similarly let $f_2,g_2$ are a homotopy equivalence of $C$ and $D$. We then have a map $h : A times [0,1] -> A$ with $h(x,0) = g_1 compose f_1$ and $h(x,1) = id_A$, and similarly $p(x,0) = g_2 compose f_2$, $p(x,0) = id_C$.
  We now define the homotopy $rho : A times C times [0,1] -> A times C$ given by
  $
    rho(x,y,t) = (h(x,t), p(y,t)),
  $
  we have that 
  $
  rho(x,y,0) = (h(x,0), p(y,0)) = (g_1 compose f_1 (x), g_2 compose f_2 (y)) = (g_1 times g_2) compose (f_1 times f_2) (x,y)
  $
  as well as
  $
    rho(x,y,1)
    = (h(x,1), p(y,1))
    = (id_A (x), id_C (y))
    = id_(A times C) (x,y)
  $
  so $rho$ is a homotopy from $g_1 times g_2 compose f_1 times f_2$ to $id_(A times C)$. We can similarly get a homotopy from $f_1 times f_2 compose g_1 times g_2$ to $id_(B times D)$ and so $A times C$ and $B times D$ are homotopy equivalent.

= Question
== Statement
Prove the second half of Proposition 9.5 in Haynes Miller's notes. Specifically, consider the following commutative diagram of abelian groups in which both rows are exact:
#align(center)[#commutative-diagram(
  node((0, 0), $A_4$),
  node((0, 1), $A_3$),
  node((0, 2), $A_2$),
  node((0, 3), $A_1$),
  node((0, 4), $A_0$),
  node((1, 0), $B_4$),
  node((1, 1), $B_3$),
  node((1, 2), $B_2$),
  node((1, 3), $B_1$),
  node((1, 4), $B_0$),
  arr($A_4$, $A_3$, $d$),
  arr($A_3$, $A_2$, $d$),
  arr($A_2$, $A_1$, $d$),
  arr($A_1$, $A_0$, $d$),
  arr($B_4$, $B_3$, $d$),
  arr($B_3$, $B_2$, $d$),
  arr($B_2$, $B_1$, $d$),
  arr($B_1$, $B_0$, $d$),
  arr($A_4$, $B_4$, $f_4$),
  arr($A_3$, $B_3$, $f_3$),
  arr($A_2$, $B_2$, $f_2$),
  arr($A_1$, $B_1$, $f_1$),
  arr($A_0$, $B_0$, $f_0$),
  node-padding: (50pt, 50pt),
)]
Prove that if $f_4$ is surjective and $f_3$ and $f_1$ are injective, then $f_2$ is injective.
== Solution
Let $a in A_2$ be such that $f_2 (a) = 0$, then we have by commutativity $(f_1 compose d) (a) = 0$ and so since $f_1$ is injective then $d a = 0$. Thus by exactness we have that $a$ is in the image of $d$ so there is some $b in A_3$ such that $d b = a$. Then we have by commutativity $(d compose f_3) b = 0$.

Now we have that $f_3 (b)$ is in the kernel of $d$ so it is also in the image of $d$ so there is some $c in B_4$ such that $d c = f_3 (b)$. Then by surjectivity there is some $x$ such that $f_4 (x) = c$, but since
$
  f_3 (d x - b) = f_3 (b) - f_3 (b) = 0
$
and so injectivity of $f_3$ gives us that $b = d x$. Finally since $b = d x$ and $a = d b$, so $a = d d x = 0$.

= Question
== Statement
Suppose $X$ is a topological space.
+ Using problem $2(b)$, explain why $H_m (X times [0,1]) iso H_m (X)$ for all $m in ZZ$.
+ The cone on $X$, sometimes denoted $C X$, is the quotient of the space $X times [0,1]$ by the subspace $X times {0}$. Prove that $C X$ is homotopy equivalent to a point.
+ The suspension of $X$, sometimes denoted $S X$, is the quotient of $C X$ by the subspace $X times {1}$. Using the long exact sequence of the pair $(C X, X times {1})$, compute the homology groups of $S X$ in terms of the homology groups of $X$.
+ Prove, for each $q >= 0$, that the suspension of the $q$-dimensional sphere $S^q$ is homeomorphic to the $(q + 1)$-dimensional sphere $S^(q + 1)$. Here, $S^q$ is the subspace of points in $RR^(q+1)$ that are distance $1$ from the origin, so for example $S^0$ is the disjoint union of two points.
== Solution
+ First note that $[0,1]$ is clearly contractible because its star-shaped. So we have that $[0,1]$ is homotopy equivalent to ${0}$. But then we know that by question $2(b)$, $X times [0,1] iso X times {0} iso X$ and so they have isomorphic homology groups.
+ Let $f$ be the deformation retraction of $[0,1]$ to ${0}$, then $id_X times f$ is a deformation retraction of $X times [0,1]$ to $X times {0}$. Since this deformation retraction fixes $X times {0}$, we have that $id_X times f$ passes to the quotient $C X$ and so it is a deformation retraction from $C X$ to the image of $X times {0}$ which is a point.
+ We have the long exact sequence
  $
  ... -> H_(n+1)(C X) -> H_(n+1) (C X, X times {1}) -> H_n (X times {1}) -> H_n (C X) -> ...
  $
  then for $n >= 1$ we have
  $
  0 -> H_(n+1) (C X, X times {1}) -> H_n (X times {1}) -> 0.
  $
  and so because this is exact we have
  $
  H_(n+1) (C X, X times {1}) iso H_n (X)
  $
  for $n = 0$ we have
  $
  0 -> H_(1) (C X, X times {1}) -> H_0 (X times {1}) -> H_(0) (C X) -> 0
  $
  now the map $H_0 (X times {1}) -> H_0 (C X)$ is clearly surjective so we have $H_1 (C X, X times {1}) iso ZZ^(n) quo ZZ$ where $n$ is the number of connected components of $X$.

  Finally we show that $H_n (C X, X times {1}) iso H_n (S X)$, this is true because we have a neighborhood $X times (1/2,1] seq C X$ which clearly deformation retracts to $X times {1}$, this finishes the proof.
+ We consider the maps $f: S^q times [0,1] -> S^(q+1)$ and $g : S^(q+1) -> S S^q$ which are given by
  $
    f(x, t) = (2 x dot sqrt(t - t^2),2t-1)
    wide
    g(x, x_(q+1)) = cases((x/norm(x),(x_(q+1)+1)/2): x != 0, (y, (x_(q+1)+1)/2): x = 0)
  $
  for any fixed $y in S^q$. It is clear that $f(x,t)$ is continuous, and since $f(x,0) = (0,-1)$ and $f(x,1) = (0,1)$ for all $x$ we have that this map factors as $tilde(f) : S S^q -> S^(q+1)$.
  For $g$ we trivially have continuity when $x != 0$, but at $x = 0$ we have that $x_(q+1) = plus.minus 1$ so assume WLOG that we have a sequence of points $(x(n), x_(q+1)(n))$ such that $x(n) -> 0$ and $x_(q+1) (n) -> 1$. Then we have $g(0,1) = (y,1)$ and $g(x(n), x_(q+1)(n)) -> (y,1)$ because $x_(q+1)(n) -> 1$ and any such sequence in $S S^q$ converges to $(y,1)$. Thus $g$ is continuous at $(0,1)$ and also trivially at $(0,-1)$. It is also clear that $tilde(f) compose g = id_(S^(q+1))$ and that $g compose tilde(f) = id_(S S^q)$ so the two spaces are homeomorphic.

= Question
== Statement
Consider Theorem 9.1 in Haynes Miller's notes. Miller writes part of the proof of this theorem by constructing a map $diff : H_n (C) -> H_(n-1) (A)$. Prove, using Miller's definition of this map, that the sequence 
$
  H_n (B) ->^(g_n) H_n (C) ->^(diff) H_(n-1) (A) ->^(f_(n-1)) H_(n-1) (B)
$ is exact.

== Solution
Using Miller's argument we can essentially write
$
  diff c = f_(n-1)^(-1) compose d compose g_n^(-1) c
$
where $g_n^(-1)$ makes sense because the result is independent of choice of pre-image and $f_(n-1)^(-1)$ makes sense because $d compose g_n^(-1) c$ lands in its image. Using this we have that
$
  diff compose g_n = (f_(n-1)^(-1) compose d compose g_(n)^(-1) compose g) = f_(n-1)^(-1) compose d
$
but all the elements of $H_(n) (B)$ are classes of cycles so $f_(n-1)^(-1) compose d$ is equal to zero on $H_n (B)$ since $f_(n-1)$ is injective. On the other hand if $diff [x] = 0$ then since $f_(n-1)$ is injective we must have that $d compose g_(n)^(-1) x = 0$, but then we must have that $g_(n)^(-1) x in Z(B_n)$ and thus we have $[g_(n)^(-1) x] in H(B_n)$ which combined with the fact that $g_n ([g_(n)^(-1) x]) = [x]$ gives us $x in im g_n$.

Next we have
$
  f_(n-1) compose diff
  =
  f_(n-1) compose (f_(n-1)^(-1) compose d compose g_(n)^(-1))
  =
  d compose g_(n)^(-1)
$
which is now $0$ on $H_(n) (A)$ because $g_(n)^(-1) x in Z(B_n)$ for all $x in Z(C_n)$. Next assume that $[y] in ker f_(n-1)$ then by injectivity $[y] = 0$ so $y in B(B_n)$. But then there exists some $[x]$ such that $d [x] = y$, so we have $y = (d compose g_n^(-1)) g_n ([x])$ and so $y in im diff$.

= Question
== Statement
In this exercise, we will define for each topological space $X$ a natural map $k_X : S_n (X) -> S_(n+1) (X times [0,1])$. We will use this natural map to prove that any homotopic maps $f,g : X -> Y$ induce the same map on homology groups. It may help to look at the proof and discussion after Theorem 6.2 in Miller's notes, but keep in mind that he proves something much more general there and our task in this problem will be easier.
+ Write down explicitly what it means for $k_X$ to be natural.
+ Using naturality, explain why the element #h(1fr)
  $
    k_(Delta^n) (1_(Delta^n)) in S_(n+1) (Delta^n times [0,1])
  $
  determines the value of $k_X (sigma)$ for any topological space $X$ and any $n$-simplex $sigma : Delta^n -> X$.
+ Miller's notes explain how to define $k_(Delta^n) (1_(Delta^n))$ in general, but we'll focus on the cases $n = 0$ and $n = 1$ in this problem.

  Since $Delta^0$ is a point, note that $k_(Delta^0) (1_(Delta^0))$ is just an element of $S_1 ([0,1])$. We can choose this to be our favorite homeomorphism $Delta^1 -> [0,1]$, which sends $e_0$ to $0$ and $e_1$ to $1$.

  Consider the case $n = 1$. We seek to define a class $k_(Delta^1) (1_(Delta^1)) in S_2 (Delta^1 times [0,1])$. Recall that $Delta^1$ is homeomorphic to $[0,1]$, so $Delta^1 times [0,1]$ is just the square $[0,1] times [0,1]$. Write down an explicit element in $S_2 ([0,1] times [0,1])$ with boundary the perimeter of the square. You don't need to prove anything about your element in this part, but you should choose it so that it works in part $(d)$. Remember that $S_2 ([0,1] times [0,1])$ is the free abelian group generated by $op("Sing")_2 ([0,1] times [0,1])$-your element in $S_2 ([0,1] times [0,1])$ will not be a generator, but rather a formal sum of generators.
+ Suppose that $f,g : X -> Y$ are two homotopic maps, connected by a homotopy
  $
    h : X times [0,1] -> Y.
  $
  We seek to define a chain homotopy between $S_* (f)$ and $S_* (g)$, which should be given by some maps $h_n : S_n (X) -> S_(n+1) (Y)$. The map $h$ induces a map
  $
    S_(n+1) (h) : S_(n+1) (X times [0,1]) -> S_(n+1) (Y),
  $ 
  and we may compose this with $k_X$ to give a map $h_n : S_n (X) -> S_(n+1) (Y)$. Your answer to the previous problem defines $h_1 : S_1 (X) -> S_2 (Y)$. Use naturality to prove the chain homotopy relation
  $
    diff h_1 + h_0 diff = S_1 (f) - S_1 (g).
  $
#pb()
== Solution
+ Note that $S_n (X)$ and $S_(n+1)(X times [0,1])$ are both functors from $Top$ to $Ab$, with $S_(n+1) (X times [0,1])$ mapping morphisms $f : X -> Y$ to the morphism $(f times id_[0,1])_*$.
  In that context naturality would mean that for every topological space $X$ we have a map $S_n (X) -> S_(n+1) (X times [0,1])$ such that for every continuous map $f : X -> Y$ we have that the following diagram commutes
 #align(center)[#commutative-diagram(
  node((0, 0), $S_(n)(X)$, "a"),
  node((0, 1), $S_(n+1)(X times [0,1])$, "b"),
  node((1, 0), $S_(n)(Y)$, "c"),
  node((1, 1), $S_(n+1)(Y times [0,1])$, "d"),
  arr("a", "b", $k_X$),
  arr("a", "c", $f_*$),
  arr("c", "d", $k_Y$),
  arr("b", "d", $(f times id_[0,1])_*$),
  node-padding: (50pt, 50pt),
)] 
  where $tilde(f)_*$ is the 
+ Using the naturality diagram, setting $X = Delta^n, Y = X, f = sigma$, we have
 #align(center)[#commutative-diagram(
  node((0, 0), $S_(n)(Delta^n)$, "a"),
  node((0, 1), $S_(n+1)(Delta^n times [0,1])$, "b"),
  node((1, 0), $S_(n)(X)$, "c"),
  node((1, 1), $S_(n+1)(X times [0,1])$, "d"),
  arr("a", "b", $k_(Delta^n)$),
  arr("a", "c", $sigma_*$),
  arr("c", "d", $k_X$),
  arr("b", "d", $(sigma times id_[0,1])_*$),
  node-padding: (50pt, 50pt),
)]
  Now clearly we have that $sigma_* (1_(Delta^n))$ is in fact equal to $sigma$ as an element of $S_n (X)$. We thus have, since the diagram commutes,
  $
    k_X (sigma) = (sigma times id_[0,1])_* (k_(Delta^n) (1_(Delta^n)))
  $
  Hence $k_X (sigma)$ is fully determined by $k_(Delta^n) (1_(Delta^n))$.
+ We will set $k_(Delta^1) (1_(Delta^1))$ to be the element $a - b in S_2 (Delta^1 times [0,1])$ described in the following diagram.
  #align(center)[#cetz.canvas({
    import cetz.draw: *
    merge-path(fill: rgb("#ff413640"), {
      line((3,0), (0,0), name: "wx")
      line((0,0), (3,3), name: "xz")
      line((3,3), (3,0), name: "wz")
    })
    merge-path(fill: rgb("#2ecc4040"), {
      line((0,0), (3,3), name: "xz")
      line((0,0), (0,3), name: "yx")
      line((0,3), (3,3), name: "yz")
    })
    arc((1.1,1.9), start: -45deg, delta: -270deg, radius: 0.3, mark: (end: ">"), name:"a")
    arc((1.9,1.1), start: 135deg, delta: 270deg, radius: 0.3, mark: (end: ">"), name:"b")
    content("a.origin", $a$)
    content("b.origin", $b$)

    mark((0,0), (1.5,0), symbol: ">", fill:black)
    mark((0,0), (0,1.5), symbol: ">", fill:black)
    mark((0,3), (1.5,3), symbol: ">", fill:black)
    mark((3,0), (3,1.5), symbol: ">", fill:black)
    mark((0,0), (1.5,1.5), symbol: ">", fill:black)
    
    content((1.5,0), $Delta$, anchor: "north", padding: .1)
    content((1.5,3), $Delta$, anchor: "south", padding: .1)
    content((0,1.5), $[0,1]$, anchor: "east", padding: .1)
    content((3,1.5), $[0,1]$, anchor: "west", padding: .1)
    content((0,0), $x$, anchor: "north-east", padding: .1)
    content((0,3), $y$, anchor: "south-east", padding: .1)
    content((3,3), $z$, anchor: "south-west", padding: .1)
    content((3,0), $w$, anchor: "north-west", padding: .1)
  })]
  We record here that $d a = arrow(y z) - arrow(x z) + arrow(x y)$ and $d b = arrow(w z) - arrow(x z) + arrow(x w)$.
+ We check now that $diff h_1 + h_0 diff = S_1 (f) - S_1 (g)$, applying this to a specific element $sigma in S_1 (X)$ gives us
  $
    diff h_1 sigma + h_0 diff sigma &= f_* sigma - g_* sigma
    \ diff (h_* (k_X sigma)) + h_* (k_X diff sigma) &= f_* sigma - g_* sigma
  $
  now analyzing the first term on its own, we have
  $
    diff (h_* (k_X sigma)) 
    &= h_* (diff (sigma times id_[0,1])_* (k_(Delta^1) (1_(Delta^n))))
    = h_* ((sigma times id_[0,1])_* (diff (a - b))) \
    &= h_* (sigma times id_[0,1])_* (arrow(y z) + arrow(x y) - arrow(w z) - arrow(x w)).
  $
  For the second term we have
  $
    h_* (k_X (diff sigma))
    &=
    h_* (k_X (d_1 sigma - d_0 sigma))
    \ &=
    h_* ((d_1 sigma times id_[0,1])_* (k_(Delta^0) (1_(Delta^0))) - (d_0 sigma times id_[0,1])_* (k_(Delta^0) (1_(Delta^0))))
  $
  Now by identifying $d_0 sigma times id_[0,1]$ with $arrow(x y)$ and $d_1 sigma times id_[0,1]$ with $arrow(w z)$, we get
  $
    h_* (k_X (diff sigma))
    &= h_* (sigma times id_[0,1])_* (-arrow(x y) + arrow(w z)).
  $
  Now we get
  $
    diff h_1 sigma + h_0 diff sigma = h_* (sigma times id_[0,1])_* (arrow(y z) - arrow(x w))
  $
  Finally we have that $f_* sigma = h_* (iota_1)_* sigma$ where $iota_1$ is the inclusion of $Delta^1$ along $arrow(w x)$, and $g_* sigma = h_* (iota_1)_* sigma$ where $iota_1$ is the inclusion along $- arrow(y z)$.
  Together we get
  $
    f_* sigma = h_* (sigma times id_[0,1])_* (arrow(w x) + arrow(y z))
  $
  which is exactly what we wanted.
