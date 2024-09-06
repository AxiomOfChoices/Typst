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
Let $A$ be an algebra, and $A\_$ be the algebra with the commutator bracket $[a,b] = a b - b a$. For each of the following conditions on $A$ prove that $A\_$ carries the structure of a Lie Algebra.
+ $A$ satisfies $a(b c) = (a b) c$ for all $a,b,c in A$.
+ $A$ satisfies $a(b c) + b(c a) + c(a b) = (a b)c + (b c)a + (c a)b = 0$ for all $a,b,c in A$.
+ $A$ satisfies $a(b c) - (a b) c = b (a c) - (b a) c = a (c b) - (a c)b$ for all $a,b,c in A$.
+ $A$ satisfies $[a, b c] + [b, c a] + [c, a b] = 0$ for all $a,b,c in A$.
== Solution
First it is clear that $[a,a] = a a - a a = 0$ and thus the bracket is always alternating, it is also easy to see that it is bilinear, it is thus enough to check that it satisfies the Jacobi condition in each case. We can start by simplifying
$
&[a,[b,c]] + [b,[c,a]] + [c,[a,b]] \
&= a(b c) - a(c b) - (b c) a + (c b) a + b (c a) - b (a c)
\ &- (c a) b + (a c) b + c (a b) - c (b a) - (a b) c + (b a) c,
$
We need to prove that this expression is always zero for any $a,b,c in A$ in each of the required cases.
+ In this case we throw away the brackets and pair up the terms as is colored
  $
  & col(a b c, #red) - col(a c b,#green) - col(b c a, #blue) + col(c b a, #yellow) + col(b c a, #blue) - col(b a c, #purple)
  \ &- col(c a b, #orange) + col(a c b, #green) + col(c a b, #orange)
  - col(c b a, #yellow) - col(a b c, #red) + col(b a c, #purple).
  $
  Since each color has a pair of positive and negative terms they cancel out giving us zero.
+ In this case we can group up the terms like so
  $
  & col(a (b c), #red) - col(a (c b),#green) - col((b c) a, #blue) + col((c b) a, #purple) + col(b (c a), #red) - col(b (a c), #green)
  \ &- col((c a) b, #blue) + col((a c) b, #purple) + col(c (a b), #red)
  - col(c (b a), #green) - col((a b) c, #blue) + col((b a) c, #purple).
  $
  The #text(fill: red)[red] terms give us
  $
  a(b c) + b(c a) + c(b a)
  $
  which cancel out according to our rule. Similarly the #text(fill: green)[green] terms give us
  $
  -a (c b) - b(a c) - c (b a)
  $
  which also cancel out. The blue terms give
  $
  -(a b) c - (b c) a - (c a) b.
  $
  And the purple terms give
  $
  (a c) b + (c b) a + (b a) c.
  $
  Each color cancels out due to our identity and thus the whole expression is equal to zero.
+ In this case we group up the terms like
  $
  & col(a (b c), #red) - col(a (c b),#green) - col((b c) a, #green) + col((c b) a, #purple) + col(b (c a), #green) - col(b (a c), #red)
  \ &- col((c a) b, #purple) + col((a c) b, #green) + col(c (a b), #red)
  - col(c (b a), #green) - col((a b) c, #red) + col((b a) c, #red).
  $

