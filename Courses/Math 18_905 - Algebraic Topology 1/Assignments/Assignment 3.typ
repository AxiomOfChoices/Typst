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
    content("diagonal.mid", anchor: "north-west", padding: .1, [$C$])
  })
]
