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
We compute
$
{f,g} + {g,f}
&= sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) {x_i,x_j}
+ sum_(i,j=1)^n (diff g) / (diff x_i) (diff f) / (diff x_j) {x_i,x_j}
$
then after swapping indices in the second sum we get
$
sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) {x_i,x_j}
+ sum_(j,i=1)^n (diff g) / (diff x_j) (diff f) / (diff x_i) {x_j,x_i}
= sum_(i,j=1)^n (diff f) / (diff x_i) (diff g) / (diff x_j) (
  {x_i,x_j} + {x_j,x_i}
).
$
So ${dot,dot}$ is anti-symmetric iff it is anti-symmetric on $x_i,x_j$ for all $i,j$.

Next we check the Jacobi identities, for brevity we will denote $(diff f)/(diff x_i)$ as $f_i$
$
{f,{g,h}} + {g,{f,h}} + {h,{f,g}}
\ = sum_(i,j=1)^n (
  {f, g_i h_j {x_i,x_j}}
  + {g, h_i f_j {x_i,x_j}}
  + {h, f_i g_j {x_i,x_j}}
)
\ = sum_(i,j=1)^n sum_(k,ell=1)^n (
  f_k (
    g_(i ell) h_j {x_i,x_j}
    + g_i h_(j ell) {x_i,x_j}
    + g_i h_j {x_i,x_j}_ell
  ){x_k,x_ell}
  \ + g_k (
    h_(i ell) f_j {x_i,x_j}
    + h_i f_(j ell) {x_i,x_j}
    + h_i f_j {x_i,x_j}_ell
  ){x_k,x_ell}
  \ + h_k (
    f_(i ell) g_j {x_i,x_j}
    + f_i g_(j ell) {x_i,x_j}
    + f_i g_j {x_i,x_j}_ell
  ){x_k,x_ell}
)
$
