#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#let lecture = counter("lecture")
#lecture.step()
#let update_lecture = () => {
  lecture.step()
  counter(heading).update(0)
}
#let bonus_problem = {
  pagebreak()
  block(text([*Bonus Exercise*], size: 17pt))
}
#show: latex
#let NumberingAfter(doc) = {
  let level = 1
  set heading(
    numbering: (..numbers) => if numbers.pos().len() <= level {
      return context numbering(
        "1.1",
        lecture.get().first(),
        ..numbers,
      )
    },
    supplement: "Exercise",
  )
  show heading: it => {
    if (it.numbering == none) {
      return it
    }
    if (it.level > 1) {
      return text(it, size: 14pt)
    }
    let numbers = counter(heading).at(it.location())
    let display-number = numbering(it.numbering, ..numbers)
    let body = it.body
    // if (numbers.last() > 1) {
    pagebreak(weak: true)
    // }
    block(text([*#body #display-number*], size: 17pt))
  }
  doc
};
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let bar(el) = $overline(#el)$
#show: NumberingAfter
#set enum(numbering: "(a)")

*Sources consulted* \
Classmates: Julia Meng. \
Texts: Class Notes.
= Exercise
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
  & col(a (b c), #red) - col(a (c b),#purple) - col((b c) a, #green) + col((c b) a, #green) + col(b (c a), #green) - col(b (a c), #red)
  \ &- col((c a) b, #purple) + col((a c) b, #purple) + col(c (a b), #purple)
  - col(c (b a), #green) - col((a b) c, #red) + col((b a) c, #red).
  $
  The #text(fill: red)[red] terms give us
  $
  (a(b c) - (a b) c) - (b(a c) - (b a) c)
  $
  which vanishes because of our identity. Similarly the #text(fill: green)[green] terms give
  $
  (b(c a) - (b c) a) - (c (b a) - (c b) a)
  $
  which similarly vanishes. Finally the #text(fill: purple)[purple] terms give us
  $
  (c(a b) - (c a)b) - (a(c b) - (a c)b)
  $
  which also vanishes.
+ In the last case we rewrite the identity a bit differently,
  $
  &[a,[b,c]] + [b,[c,a]] + [c,[a,b]] \
  = & [a,b c - c b] + [b, c a - a c] + [c, a b - b a] \
  = & [a,b c] - [a, c b] + [b, c a] - [b, a c] + [c, a b] - [c, b a] \
  = & col([a,b c],#red) - col([a, c b],#green) + col([b, c a],#red) - col([b, a c],#green) + col([c, a b], #red) - col([c, b a],#green) \
  $
  and again due to the identity we have the #text(fill: red)[red] and #text(fill: green)[green] terms group up together and vanish.

= Exercise
== Statement
Prove that $sl_n$, the subspace of $gl_n$ consisting of matrices with zero trace, is a Lie subalgebra.
== Solution
It is enough to show that for any two matrices $a,b in gl_n$ we have $tr([a,b]) = 0$. To see this we recall the formulas for matrix multiplication and trace.
$
(a b)_(i j) = sum_(k=1)^n a_(i k) b_(k j) wide wide tr(a) = sum_(i=1)^n a_(i i).
$
Combining the two we get
$
tr(a b - b a) = sum_(i = 1)^n (a b - b a)_(i i)
= sum_(i = 1)^n (a b)_(i i) - sum_(i=1)^n (b a)_(i i)
= sum_(i = 1)^n sum_(k=1)^n a_(i k) b_(k i) - sum_(i=1)^n sum_(k=1)^n b_(i k) a_(k i)
$
and since the two sums are the same up to renaming of indices, this expression must be equal to zero.

= Exercise
== Statement
Let $B$ be any bilinear form, show that,
$
o_(V,B) = {a in gl_V | B(a(v), w) + B(v, a(w)) = 0, forall v,w in V},
$
is a Lie subalgebra of $gl_V$.
== Solution
Let us take two matrices $a,b in o_(V,B)$ and consider their commutator $[a,b]$. We can compute
$
B([a,b]v, w) + B(v,[a,b]w)
=
B(a b v, w) - B(b a v, w) + B(v, a b w) - B(v, b a w)
$
since both $a$ and $b$ are in $o_(V,B)$ we can move them around to get the following
$
-B(b v, a w) + B(a v, b w) - B(a v, b w) + B(b v, a w).
$
Now the inner and outer terms cancel as pairs and we get $0$. Thus we have
$
B([a,b]v,w) + B(v,[a,b]w) = 0
$
and so $[a,b] in o_(V,B)$ and so $o_(V,B)$ is closed under the Lie bracket.

= Exercise
== Statement
Consider some bilinear form on $FF^n$ represented in the standard basis by the matrix $B$. Show that
$
o_(FF^n, B) = {a in gl_n | a^T B + B a = 0},
$
where $a^T$ is the transpose of the matrix $a$.
== Solution
First recall that in the standard basis the matrix $B$ is defined by
$
B_(i j) = B(e_i, e_j)
$
where $e_i,e_j$ are any basis vectors. Similarly any matrix $a in gl_n$ is defined by
$
a(e_i) = sum_(k=1)^n a_(k i) e_k
$
We compute
$
(a^T B + B a)_(i j) &= sum_(k=1)^n a_(k i) B_(k j) + B_(i k) a_(k j)
= sum_(k=1)^n a_(k i) B(e_k, e_j) + B(e_i, e_k) a_(k j)
\ &= sum_(k=1)^n B(a_(k i) e_k, e_j) + B(e_i, a_(k j) e_k)
\ &= B(a (e_i), e_j) + B(e_i, a(e_j)).
$
We thus know that the expression $a^T B + B a = 0$ is equivalent to $B(a(e_i), e_j) + B(e_i, a(e_j)) = 0$ for all basis vectors, which is then equivalent to $B(a(v), w) + B(v,a(w)) = 0$ for all vectors in $FF^n$.

= Exercise
== Statement
Let $f : Mat_n (FF) -> FF$ be a linear function satisfying $f([a,b]) = 0$ for all $a,b in Mat_n (FF)$. Show that $f = lambda tr$ for some constant $lambda in FF$.
== Solution
Consider a linear basis for $Mat_n (FF)$ consisting of single entry matrices
$
e^((ell k))_(i j) = cases(1 : i = ell \, j = k, 0 : "otherwise")
$
We note here that $e^((i j)) e^((k ell))$ is non-zero only if $j = k$ in which case we have $e^((i k)) e^((k ell)) = e^((i ell))$.

Since $f$ is linear we can write for each matrix $a$
$
f(a) = f(sum_(i,j) a_(i j) e^((i j)))
= sum_(i,j) a_(i j) f(e^((i j))),
$
from this we get that it is enough to show that
$
f(e^((i j))) = cases(lambda : i = j, 0 : "otherwise")
$
for some $lambda$.

Now we compute for $i != j$,
$
[e^((i i)), e^((i j))]
=
e^((i i)) e^((i j)) - e^((i j)) e^((i i))
=
e^((i j)) - 0
= e^((i j))
$
so $f(e^((i j))) = 0$ for $i != j$. Next, also for $i != j$ we have
$
[e^((i j)), e^((j i))]
=
e^((i j)) e^((j i))
-
e^((j i)) e^((i j))
= e^((i i)) - e^((j j))
$
and thus $f(e^((i i)) - e^((j j))) = 0$ and $f(e^((i i))) = f(e^((j j)))$. Now we fix $lambda = f(e^((1 1)))$ and immediately get $lambda = f(e^((i i)))$ for all $i$ as well as $0 = f(e^((i j)))$ for $i != j$, which finishes the proof.

#update_lecture()
= Exercise
== Statement
For any algebra $A$ over a field $FF$, a derivation of $A$ is an $FF$-vector space endomorphism $D$ of $A$ satisfying $D(a b) = D(a) b + a D(b)$. Prove that the space of derivations $op("Der") A$ is a Lie subalgebra of $gl_A$.
== Solution
Let $D,F$ be two derivations of $A$, we want to show that $[D,F]$ is also a derivation. There is really only one way to do that, we compute
$
[D,F](a b)
&= D F (a b) - F D (a b)
= D(F (a) b + a F(b))
+ F(D (a) b + a D(b))
\ &= D F (a) b + col(F(a) D(b), #red) + col(D (a) F(b), #green) + a D F (b)
\ &- F D (a) b - col(D(a) F(b), #green) - col(F(a) D(b), #red) - a F D (b)
\ &= D F (a) b + a D F (b)
- F D (a) b - a F D (b)
\ &= (D F - F D) (a) b + a (D F - F D) (b)
\ [D,F] (a b) &= [D, F] (a) b + a [D, F](b).
$
And so we exactly get the definition of a derivation. Hence $op("Der") A$ is closed under the Lie bracket and thus a Lie subalgebra.

#bonus_problem
== Statement
Consider the vector space $V$ with basis ${ L_m : m in ZZ } union {C}$ with product given by
$
[L_m, L_n] = (m-n) L_(m+n) + (m^3 - m) / 12 delta_(m, -n) C\
[C,L_m] = 0, m in ZZ.
$
Show that the bracket gives a Lie Algebra structure on $V$.
== Solution
First let us check anti-commutativity
$
[L_m,L_n]
&= (m - n) L_(m+n) + (m^3 - m) / 12 delta_(m,-n) C
\ &= -(n - m) L_(m+n) + ((-n)^3 - (-n)) / 12 delta_(-m,n) C
\ &= -(n - m) L_(m+n) - (n^3 - n) / 12 delta_(-m,n) C
\ &= [L_n,L_m]
$
and anti-commutativity with $C$ is clear. We now have to check the Jacobi identity, if any of the arguments is $C$ then the whole expression vanishes so we can ignore that case and assume that all the arguments are $L_n$ for some $n$.
$
& [L_n,[L_m, L_p]] + [L_m, [L_p, L_n]] + [L_p, [L_n, L_m]]
\ = & [L_n,(m-p)L_(m+p) + (m^3-m) / 12 delta_(m,-p) C]
\ + & [L_m,(p-n)L_(p+n) + (p^3-p) / 12 delta_(p,-n) C]
\ + & [L_p,(n-m)L_(n+m) + (n^3-n) / 12 delta_(n,-m) C]
$
Now since $C$ is central we can cancel it from every bracket
$
&[L_n,(m-p)L_(m+p)] + [L_m,(p-n) L_(p+n)] + [L_p,(n-m) L_(n+m)]
\ = &(m-p) [L_n,L_(m+p)] + (p-n)[L_m,L_(p+n)] + (n-m)[L_p,L_(n+m)]
\ = &(m-p) (n - m - p) L_(n+m+p) + (m-p)(n^3-n) / 12 delta_(n,-m-p) C
\ + &(p-n) (m - p - n) L_(n+m+p) + (p-n)(m^3-m) / 12 delta_(m,-p-n) C
\ + &(n-m) (p - n - m) L_(n+m+p) + (n-m)(p^3-p) / 12 delta_(p,-n-m) C
$
Collecting like terms we get
$
((m-p)(n-m-p)+(p-n)(m-p-n)+(n-m)(p-n-m)) L_(n+m+p)
\ +(((m-p)(n^3-n)+(p-n) (m^3-m)+(n-m)(p^3-p)) / 12) delta_(n+m+p,0) C.
$
Now we first deal with the first coefficient
$
&col(m n, #red) - col(m^2, #green) - col(m p, #blue) - col(p n, #yellow) + col(p m, #blue) + col(p^2, #purple)
\ + &col(p m, #blue) - col(p^2, #purple) - col(p n, #yellow) - col(n m, #red) + col(n p, #yellow) + col(n^2, #orange)
\ + &col(n p, #yellow) - col(n^2, #orange) - col(n m, #red) - col(m p,#blue) + col(m n, #red) + col(m^2, #green)
$
As we can see by the highlighted groups everything cancels out and we get exactly $0$.

For the second coefficient it can only possibly be non-zero if $delta_(n+m+p,0) = 1$ that is if $n + m + p = 0$. With that in mind we compute
$
((m-p)(n^3-n)+(p-n) (m^3-m)+(n-m)(p^3-p))
\ = m n^3 - col(m n, #red) - p n^3 + col(p n, #green) + p m^3 - col(p m, #blue) - n m^3 + col(n m, #red) + n p^3 - col(n p, #green) - m p^3 + col(m p, #blue)
\ = m n^3 - p n^3 + p m^3 - n m^3 + n p^3 - m p^3
$
we can now replace $n$ with $- m - p$ and we get
$
&m (-m-n)^3 - p (-m - p)^3 + p m^3 - (-m-p) m^3 + (-m-p)p^3 - m p^3
\ = &- m (col(m^3,#red)+3m^2p+3m p^2+p^3)
+ p (m^3 + 3m^2p+3m p^2 +col(p^3,#green))
\ + & p m^3 + col(m^4,#red) + p m^3 - m p^3 - col(p^4,#green) - m p^3
\ = &- col(3m^3 p,#green) - col(3m^2 p^2,#red) - col(m p^3, #blue) + col(p m^3,#green) + col(3m^2p^2,#red) + col(3m p^3, #blue) + col(p m^3,#green) + col(p m^3, #green) - col(m p^3, #blue) - col(m p^3, #blue)
\ =&0
$
So all together our final result is $0$ so the Jacobi identity holds and thus this is indeed a Lie algebra.

= Exercise
== Statement
Let ${x_i, x_j} in A$ be choices of elements of $A$, the algebra of smooth functions in the variables $x_1,...,x_n.$ Now define the bracket operation
$
{f,g} = sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) {x_i, x_j}.
$
Show that this bracket gives $A$ the structure of a Lie algebra if and only it is anti-commutative and satisfies the Jacobi identity for any triplet $x_i,x_j,x_k$.
== Solution
// We compute
// $
// {f,g} + {g,f}
// &= sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) {x_i,x_j}
// + sum_(i,j=1)^n (diff g) / (diff x_i) (diff f) / (diff x_j) {x_i,x_j}
// $
// then after swapping indices in the second sum we get
// $
// sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) {x_i,x_j}
// + sum_(j,i=1)^n (diff g) / (diff x_j) (diff f) / (diff x_i) {x_j,x_i}
// = sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) (
//   {x_i,x_j} + {x_j,x_i}
// ).
// $
// So ${dot,dot}$ is anti-symmetric iff it is anti-symmetric on $x_i,x_j$ for all $i,j$.
//
// Next we check the Jacobi identities, for brevity we will denote $(diff f)/(diff x_i)$ as $f_i$
// $
// {f,{g,h}} + {g,{f,h}} + {h,{f,g}}
// \ = sum_(i,j=1)^n (
//   {f, g_i h_j {x_i,x_j}}
//   + {g, h_i f_j {x_i,x_j}}
//   + {h, f_i g_j {x_i,x_j}}
// )
// \ = sum_(i,j=1)^n sum_(k,ell=1)^n (
//   f_k (
//     g_(i ell) h_j {x_i,x_j}
//     + g_i h_(j ell) {x_i,x_j}
//     + g_i h_j {x_i,x_j}_ell
//   ){x_k,x_ell}
//   \ + g_k (
//     h_(i ell) f_j {x_i,x_j}
//     + h_i f_(j ell) {x_i,x_j}
//     + h_i f_j {x_i,x_j}_ell
//   ){x_k,x_ell}
//   \ + h_k (
//     f_(i ell) g_j {x_i,x_j}
//     + f_i g_(j ell) {x_i,x_j}
//     + f_i g_j {x_i,x_j}_ell
//   ){x_k,x_ell}
// )
// $

If the Poisson bracket defines a Lie algebra structure for some choice of values $lr({x_i , x_j})$, then in particular, the axioms of a Lie algebra must be satisfied for brackets of terms $x_i$. The interesting question is whether the converse holds. We suppose then that the $lr({x_i , x_j})$ are chosen so that $lr({x_i , x_j}) = - lr({x_j , x_i})$, and so that the Jacobi identity is satisfied for triples $x_i , x_j , x_k$.

The bilinearity of the bracket follows from the linearity of differentiation, and the skew-symmetry follows from the assumption of the skew symmetry on the $x_i$.

At this point we introduce some shorthands to simplify what follows. If $f$ is any function, we write $f_i$ for the derivative of $f$ with respect to $x_i$. When we are discussing an expression $e$ in terms of three functions $f , g$, h, we will write $op("CS") lr((e))$ for the ’cyclic summation’ of $e$, the expression formed by summing those obtained from $e$ by permuting the $f , g , h$ cyclically. In particular, the Jacobi identity will be $op("CS") lr(({ f , { g , h } })) = 0$.

First we calculate the iterated bracket of monomials $x_i$ :

$
lr({x_i , lr({x_j , x_k})}) = sum_l lr({x_j , x_k})_l lr({x_i , x_l}) upright(" (an example of the shorthands described). ")
$

Now the iterated bracket of any three polynomials (or functions) $f , g$ and $h$ is:

$
{
  h , {f , g}
} = sum_(i , j , k , l) lr([f_(i l) g_j h_k + g_(j l) f_i h_k]) lr({x_i , x_j}) lr({x_k , x_l}) + sum_(i , j , k , l) f_i g_j h_k lr({x_i , x_j})_l lr({x_k , x_l})
$

By the assumption that the Jacobi identity holds on the $x_i$, we have (for any $i , j , k$):
$ sum_l op("CS") lr((f_i g_j h_k)) lr({x_i , x_j})_l lr({x_k , x_l}) = 0 $
for cyclicly permuting the $f , g , h$ corresponds to cyclicly permuting the $i , j , k$ (in the opposite order). Thus we have:

$
op("CS") lr(({ h , { f , g } })) = sum_(i , j , k , l) op("CS") lr((f_(i l) g_j h_k + g_(j l) f_i h_k)) lr({x_i , x_j}) lr({x_k , x_l})
$

The remaining task can be viewed as finding the $lr({x_alpha , x_beta}) lr({x_gamma , x_delta})$ coefficient in this expression, where we substitute all appearances of $lr({x_beta , x_alpha})$ for $- lr({x_alpha , x_beta})$, and so on. To do so, we tabulate all the appearances of terms which are multiples of $lr({x_alpha , x_beta}) lr({x_gamma , x_delta})$. We may as well assume here that $alpha < beta$ and $gamma < delta$.

#figure(
  align(center)[#table(
      columns: 7,
      align: (col, row) => (
        center,
        center,
        center,
        center,
        center,
        center,
        center,
        center,
        center,
        center,
      ).at(col),
      stroke: none,
      inset: 6pt,
      [order],
      [$i$],
      [$j$],
      [$k$],
      [$l$],
      table.vline(),
      [multiple of $lr({x_alpha , x_beta}) lr({x_gamma , x_delta})$],
      table.vline(),
      [group],
      table.hline(),
      table.cell(rowspan: 8)[$f,g,h$],
      [$alpha$],
      [$beta$],
      [$gamma$],
      [$delta$],
      [$+ f_(alpha delta) g_beta h_gamma + g_(beta delta) f_alpha h_gamma$],
      [#col(1, green)],
      [$gamma$],
      [$delta$],
      [$alpha$],
      [$beta$],
      [$+ f_(gamma beta) g_delta h_alpha + g_(delta beta) f_gamma h_alpha$],
      [#col(1, red)],
      [$beta$],
      [$alpha$],
      [$gamma$],
      [$delta$],
      [$- f_(beta delta) g_alpha h_gamma - g_(alpha delta) f_beta h_gamma$],
      [#col(10, red)],
      [$delta$],
      [$gamma$],
      [$alpha$],
      [$beta$],
      [$- f_(delta beta) g_gamma h_alpha - g_(gamma beta) f_delta h_alpha$],
      [#col(10, green)],
      [$alpha$],
      [$beta$],
      [$delta$],
      [$gamma$],
      [$- f_(alpha gamma) g_beta h_delta - g_(beta gamma) f_alpha h_delta$],
      [#col(4, red)],
      [$gamma$],
      [$delta$],
      [$beta$],
      [$alpha$],
      [$- f_(gamma alpha) g_delta h_beta - g_(delta alpha) f_gamma h_beta$],
      [#col(4, green)],
      [$beta$],
      [$alpha$],
      [$delta$],
      [$gamma$],
      [$+ f_(beta gamma) g_alpha h_delta + g_(alpha gamma) f_beta h_delta$],
      [#col(7, green)],
      [$delta$],
      [$gamma$],
      [$beta$],
      [$alpha$],
      [$+ f_(delta alpha) g_gamma h_beta + g_(gamma alpha) f_delta h_beta$],
      [#col(7, red)],
      table.hline(),
      table.cell(rowspan: 8)[$g,h,f$],
      [$alpha$],
      [$beta$],
      [$gamma$],
      [$delta$],
      [$+ g_(alpha delta) h_beta f_gamma + h_(beta delta) g_alpha f_gamma$],
      [#col(5, green)],
      [$gamma$],
      [$delta$],
      [$alpha$],
      [$beta$],
      [$+ g_(gamma beta) h_delta f_alpha + h_(delta beta) g_gamma f_alpha$],
      [#col(5, red)],
      [$beta$],
      [$alpha$],
      [$gamma$],
      [$delta$],
      [$- g_(beta delta) h_alpha f_gamma - h_(alpha delta) g_beta f_gamma$],
      [#col(2, red)],
      [$delta$],
      [$gamma$],
      [$alpha$],
      [$beta$],
      [$- g_(delta beta) h_gamma f_alpha - h_(gamma beta) g_delta f_alpha$],
      [#col(2, green)],
      [$alpha$],
      [$beta$],
      [$delta$],
      [$gamma$],
      [$- g_(alpha gamma) h_beta f_delta - h_(beta gamma) g_alpha f_delta$],
      [#col(8, red)],
      [$gamma$],
      [$delta$],
      [$beta$],
      [$alpha$],
      [$- g_(gamma alpha) h_delta f_beta - h_(delta alpha) g_gamma f_beta$],
      [#col(8, green)],
      [$beta$],
      [$alpha$],
      [$delta$],
      [$gamma$],
      [$+ g_(beta gamma) h_alpha f_delta + h_(alpha gamma) g_beta f_delta$],
      [#col(11, green)],
      [$delta$],
      [$gamma$],
      [$beta$],
      [$alpha$],
      [$+ g_(delta alpha) h_gamma f_beta + h_(gamma alpha) g_delta f_beta$],
      [#col(11, red)],
      table.hline(),
      table.cell(rowspan: 8)[$h,f,g$],
      [$alpha$],
      [$beta$],
      [$gamma$],
      [$delta$],
      [$+ h_(alpha delta) f_beta g_gamma + f_(beta delta) h_alpha g_gamma$],
      [#col(9, green)],
      [$gamma$],
      [$delta$],
      [$alpha$],
      [$beta$],
      [$+ h_(gamma beta) f_delta g_alpha + f_(delta beta) h_gamma g_alpha$],
      [#col(9, red)],
      [$beta$],
      [$alpha$],
      [$gamma$],
      [$delta$],
      [$- h_(beta delta) f_alpha g_gamma - f_(alpha delta) h_beta g_gamma$],
      [#col(6, red)],
      [$delta$],
      [$gamma$],
      [$alpha$],
      [$beta$],
      [$- h_(delta beta) f_gamma g_alpha - f_(gamma beta) h_delta g_alpha$],
      [#col(6, green)],
      [$alpha$],
      [$beta$],
      [$delta$],
      [$gamma$],
      [$- h_(alpha gamma) f_beta g_delta - f_(beta gamma) h_alpha g_delta$],
      [#col(12, red)],
      [$gamma$],
      [$delta$],
      [$beta$],
      [$alpha$],
      [$- h_(gamma alpha) f_delta g_beta - f_(delta alpha) h_gamma g_beta$],
      [#col(12, green)],
      [$beta$],
      [$alpha$],
      [$delta$],
      [$gamma$],
      [$+ h_(beta gamma) f_alpha g_delta + f_(alpha gamma) h_beta g_delta$],
      [#col(3, green)],
      [$delta$],
      [$gamma$],
      [$beta$],
      [$alpha$],
      [$+ h_(delta alpha) f_gamma g_beta + f_(gamma alpha) h_delta g_beta$],
      [#col(3, red)],
    )],
)
The table describes how to cancel out these terms, we group them into to groups, as dictated by the color, then the number dictate an ordering on the groups such that for two adjacent number they cancel out exactly two terms.

= Exercise
== Statement
Let $phi : frak(g)_1 -> frak(g)_2$ be a homomorphism. Then:
+ $ker phi$ is an ideal of $frak(g)_1$.
+ $im phi$ is a subalgebra of $frak(g)_2$.
+ $im phi iso frak(g)_1 quo ker phi$.
== Solution
+ Clearly $ker phi$ is a subspace, then for any $x in frak(g)_1, y in ker phi$ we have
  $
  phi([x,y]) = [phi(x),phi(y)] = [phi(x), 0] = 0.
  $
  so $[x,y] in ker phi$.
+ Let $phi(x), phi(y) in im phi$, then we have
  $
  [phi(x), phi(y)] = phi([x,y])
  $
  which is also in the image of $phi$
+ We define an isomorphism $psi : frak(g)_1 quo ker phi -> im phi$ by $psi([x]) = phi(x)$, this is well defined because for any $z_1,z_2 in ker phi$
  $
  phi([x+z_1,y+z_2])
  =
  phi([x,y]+[x,z_2]+[z_1,y]+[z_1,z_2])
  =
  phi([x,y])
  $
  because the kernel is an ideal.
  This is by definition surjective, and it is injective since if $psi([x]) = 0$ then $phi(x) = 0$ so $x in ker phi$.

= Exercise
== Statement
Given $B in Mat_n (FF)$, let $O_(n,B) (A) = { g in Gl_n (A) : g^T B g = B }$. Show that this family of groups is a family of algebraic groups.
== Solution
For $g,h in O_(n,B) (A)$ we have
$
(g h)^T B (g h) = h^T g^T B g h = h^T (g^T B g) h = h^T B h = B,
$
so $g h in O_(n, B) (A)$ and thus $O_(n, B) (A)$ is a group.

Now note the fact that
$
g^T B g
$
is a matrix with polynomial entries with the variables being the entries of $g$. Hence $g^T B g = B$ is a polynomial equation in the entries of $g$. Thus $O_(n, B) (A)$ is an algebraic group.

= Exercise
== Statement
Prove that $Lie Sl_n = sl_n (FF)$ and $Lie O_(n,B) = o_(FF^n, B)$.
== Solution
We check first for $Sl_n$, it is defined by $det(g) = 1$ so we have
$
det(I+epsilon X)
= sum_(sigma in S_n) product_(i=1)^n (I+epsilon X)_(i sigma(i))
= sum_(sigma in S_n) product_(i=1)^n
(delta_(i sigma(i)) + epsilon X_(i sigma(i)))
$
now if $sigma$ is any non-trivial permutation then it has at least two non-fixed points. Thus the product at least two factors of $epsilon$, so it vanishes in the sum. Thus we are left with
$
det(I+epsilon X) = product_(i=1)^n (delta_(i i) + epsilon X_(i i))
$
now expanding this, since only terms with one or less $epsilon$'s survive we get
$
det(I + epsilon X) = 1 + epsilon sum_(i=1)^n X_(i i)
$
so we must have $sum_i^n X_(i i) = tr(X) = 0$ which is precisely the definition for $sl_n (FF)$.

Next for $O_(n, B)$, it is defined by $g^T B g = B$ so we have
$
(I + epsilon X)^T B (I + epsilon X) =
B + epsilon X^T B + B epsilon X + epsilon X^T B epsilon X =
B + epsilon (X^T B + B X)
$
we thus have $I + epsilon X in O_(n, B)$ if and only if $X^T B + B X = 0$ which is also precisely the definition of $o_(FF^n, B)$.

#update_lecture()
= Exercise
== Statement
Show that $Z(gl_n (FF)) = FF I_n$ where $Z$ is the center of a Lie algebra.
Show that $Z(sl_n (FF)) = 0$ if $op("char") FF divides.not n$ and $FF I_n$ otherwise.
== Solution
Let $A$ be a matrix in $Z(gl_n (FF))$ then $A$ commutes with all other matrices in $gl_n (FF)$. Now using the Jordan normal theorem, since conjugation does not change commutativity, we may assume that $A$ is in its Jordan normal form. Further more, assume that $A$ is not in $FF I_n$, then it either has a Jordan block of size 2 or more, two Jordan blocks with different eigenvalues.

Thus we have that $A = mat(B, 0; 0, *)$ where we either have $B = mat(lambda, 0; 0, rho)$ or $B = mat(lambda, 1;0,lambda)$. In the first case we set
$
C := mat(0, 1;1,0)
$
making
$
[B,C]
= mat(0, lambda;rho, 0) - mat(0, rho;lambda,0)
= mat(0, lambda - rho;rho-lambda, 0)
$
which is non-zero. In the second case we get
$
[B,C] = mat(1, lambda;lambda, 0) - mat(0, lambda;lambda, 1) = mat(1,0;0,-1)
$
Then we have
$
[mat(B,0;0,*),mat(C,0;0,0)] != 0
$
in either case so if $A$ is not in $FF I_n$ it cannot commute with everything. On the other hand if $A$ is in $FF I_n$ then it clearly commutes with everything so we are done.

Since the matrix $mat(C,0;0,0)$ we constructed is in $sl_n (FF)$ the argument in $sl_n$ is identical, the only difference is that we replace $FF I_n$ with $FF I_n sect sl_n (FF)$ which is empty if $I in.not sl_n (FF)$, which happens precisely when $tr(I) = n != 0$ in $FF$, i.e. when $op("char") F divides.not n$.

= Exercise
== Statement
Let $n = dim frak(g)$, show that $dim Z(frak(g)) != n-1$.
== Solution
Assume this is the case, then let $e_1, ..., e_(n-1)$ be a basis of $Z(frak(g))$ and $e_n$ be any vector not in $Z (frak(g))$ making $e_1,...,e_n$ a basis for $frak(g)$. We know that $[e_n, e_i] = 0$ for all $i <= n-1$ and we also know that $[e_n, e_n] = 0$ so we get that $e_n in Z(frak(g))$, contradicting the choice of $e_n$.

= Exercise
== Statement
Prove that any $n$-dimensional Lie algebra with $dim Z(frak(g)) = n - 2$ is isomorphic to either $op("ab")_(n-3) plus.circle op("heis")_3$ or $op("ab")_(n-2) plus.circle eta$ where $eta$ is the canonical non-abelian Lie algebra of dimension 2.
== Solution
Write $frak(g) = Z(frak(g)) plus.circle V$ where this is a vector space direct sum, let $v_1,v_2$ be a basis of $V$. Now we consider $[v_1,v_2]$, first assume that $[v_1,v_2] in Z(frak(g))$, then find a basis $e_1,...,e_(n-2)$ for $Z(frak(g))$ that includes $[v_1,v_2]$ as a basic vector, we then have
$
v_1,v_2,[v_1,v_2]=e_1,e_2,e_3,...,e_(n-2)
$
is a basis for $frak(g)$ so since clearly $span(v_1,v_2,[v_1,v_2]) iso op("heis")_3$ then we get exactly the decomposition as Lie algebras $frak(g) = op("heis")_3 plus.circle op("ab")_(n-3)$.

On the other hand if $[v_1,v_2] in.not Z(frak(g))$ then
$
[v_1,v_2] = a v_1 + b v_2 + z
$
for some vector $z in Z(frak(g))$. Now either $a$ or $b$ are non-zero, assume WLOG that $a != 0$, we then have
$
[v_1 + b / a v_2 + 1 / a z, 1 / a v_2] = 1 / a [v_1, v_2] + b / a^2 [
  v_2,v_2
] + 1 / a [z,v_2] = v_1 + b / a v_2 + 1 / a z
$
so if we define $v'_1 := v_1 + b/a v_2 + 1/a z, v'_2 = 1/a v_2$ then $[v'_1,v'_2] = v'_1$ and so $span(v'_1,v'_2) iso eta$ as a Lie algebra and thus we get the decomposition $frak(g) = eta plus.circle op("ab")_(n-2)$.

= Exercise
== Statement
Show that if $dim V <= infinity$, then $A$ is a nilpotent operator on $V$ if and only if all its eigenvalues are $0$.
== Solution
Clearly if $A$ is nilpotent then the minimal polynomial for $A$ is of the form $p(x) = x^n$ for some $n$, so since the eigenvalues of $A$ are roots of the minimal polynomial in $FF$ then they must all be zero.

On the other hand if the eigenvalues of $A$ are all 0, then the minimal polynomial only has $0$ as a root, so it is of the form $x^n$ for some $n$ so we know that $A^n = 0$ and so it is nilpotent.

= Exercise
== Statement
Construct in $sl_3 (FF)$ a 2-dimensional subspace, consisting of nilpotent matrices, which do not share a common eigenvector.
== Solution
Consider the matrices
$
A = mat(0,1,0;0,0,1;0,0,0),
quad
B = mat(0,0,0;-1,0,0;0,1,0)
$
they span a $2$ dimensional subspace, and we have
$
mat(0,a,0;-b,0,a;0,b,0)^3
&=
mat(0,a,0;-b,0,a;0,b,0)
mat(0,a,0;-b,0,a;0,b,0)
mat(0,a,0;-b,0,a;0,b,0)
=
mat(-a b,0,a^2;0,0,0;-b^2,0,a b)
mat(0,a,0;-b,0,a;0,b,0)
\ &=
mat(0,0,0;0,0,0;0,0,0)
$
so all the matrices in this subspace are nilpotent. However, they do not all share a common eigenvector, for assume this is the case for a vector $v = vec(a,b,c)$ then we have
$
0 = A vec(a,b,c) = vec(b,c,0)
$
so $b= c = 0$. But then
$
0 = B vec(a,0,0) = vec(0,-a,0)
$
so $a = 0$ and thus $v = 0$.

