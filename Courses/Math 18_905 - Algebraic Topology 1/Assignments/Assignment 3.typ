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
Suppose that $cal(C)$ is a category and that
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
== Solution
Let us consider the following commutative diagram
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
