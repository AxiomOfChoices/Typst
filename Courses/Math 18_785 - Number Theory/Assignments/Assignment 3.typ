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
#set page(numbering: "1")
#let bar(el) = $overline(#el)$
#set enum(numbering: "(a)")
// #show math.equation: set text(font: "Latin Modern Math")

*Sources consulted* \
Classmates: Frank Wang, Michael Panner, Julia Meng. We discussed essentially every single problem together.\
Texts: Class Notes, Algebraic Number Theory by Milne, Elementry and Analytic Theory of Algebraic Numbers by Narkiewicz, Number Fields by Marcus.

= Question
== Statement
Follow the following steps to show Lagrange's four-square theorem: Every positive integer is a sum of four squares.
+ For any positive odd integer $m$, show that there exists $a,b in ZZ$ such that
  $
    a^2 + b^2 + 1 equiv 0 quad (mod m)
  $
+ Let $m$ be a positive odd integer and $a,b$ satisfy the congruence above. Consider
  $
    X &= & m x & & + & a z & + & b w \
    Y &= & & m y & - & b z & + & a w \
    Z &= & & & & z & & \
    W &= & & & & & & w.
  $
  Show that the domain $Omega$ defined by
  $
    abs(X)^2 + abs(Y)^2 + abs(Z)^2 + abs(W)^2 < 2m
  $
  contains a point $(x,y,z,w) in ZZ^4 - {0}$. Show that $m$ is a sum of four squares.
+ Show that every even integer $m > 0$ is also a sum of four squares (in fact, show that if both $m,n$ are sums of four squares, so is $m n$).
== Solution
+ First we prove this for odd primes, in $ZZ_p$ we know that we have exactly $(p+1)/2$ quadratic residues, so the sets ${a^2 : a in ZZ_p}$ and ${-b^2-1 : b in ZZ_p}$ both have $(p+1)/2$ elements and thus have some non-trivial intersection. That intersection corresponds to a solution of $a^2 + b^2 + 1 = 0 mod p$. Now if instead $m = p^n$, then we can show by induction that such a pair exists, assume it exists for $m = p^(n-1)$, then we have $a^2 + b^2 + 1 = c dot p^(n-1)$ for some integer $c < p$ and integers $a,b <= p^(n-1)$. But we also have
  $
  (a + m p^(n-1))^2 + (b + n p^(n-1))^2 + 1
  &= a^2 + b^2 + 2a m p^(n-1) + m^2 p^(2n-2)\
  &+ med b^2 + 2 n b p^(n-1) + n^2 p^(2n-2) + 1\
  &equiv (c + 2 a m + 2 b n) dot p^(n-1)
  $
  so it is enough to find $m,n$ such that $c + 2a m + 2b n = 0 mod p$ and we know this is possible because at least one of $a,b$ are invertible $mod p$ since if both were divisible by $p$ then $a^2 + b^2 = 0 mod p$ and yet we know $a^2 + b^2 = 1 mod p$. Hence, since $2$ is also invertible (because $p$ is odd) then either $2 a$ or $2 b$ is invertible $mod p$ so we can find such elements $m,n$.
  Finally if $m$ is a generic product of odd primes, then using Chinese remainder theorem we can reduce to the case of just prime powers.
+ This domain in $X,Y,W,Z$ coordinate system corresponds to a sphere of radius $sqrt(2 m)$ and so it has volume $pi^2/2 4 m^2 = 2 pi^2 m^2$. The change of basis matrix to the region in coordinates $(x,y,z,w)$ has determinant $m^2$ clearly so the region has volume $2 pi^2 > 16$. So by the Minkowski bound we know that in these coordinates this convex region intersects the integer lattice, which gives us precisely the desired point $(x,y,w,z)$. For such a point we have
  $
  |X|^2 + |Y|^2 + |Z|^2 + |W|^2 
  &= m(m x^2 + 2a x z + 2 b x w + m y^2 - 2 b y z + 2 a y w)
  \ &+ med a^2 z^2 + 2 a z b w + b^2 w^2 + b^2 z^2 - 2 a b z w + a^2 w^2 + z^2 + w^2
  \ &equiv (a^2 + b^2 + 1) (z^2 + w^2) mod m equiv 0 mod m
  $
  So since this is clearly a positive expression which is smaller than $2 m$ and divisible by $m$, it must be equal to $m$. Hence $m$ is the sum of 4 squares.
+ Set $m = x_1^2 + y_1^2 + z_1^2 + w_1^2$ and $n = x_2^2 + y_2^2 + z_2^2 + w_2^2$ then we have
  $
    & (x_1 x_2 - y_1 y_2 - z_1 z_2 - w_1 w_2)^2 \
    +& (x_1 y_2 + x_2 y_1 + z_1 w_2 - z_2 w_1)^2 \
    +& (x_1 z_2 + x_2 z_1 - y_1 w_2 + y_2 w_1)^2 \
    +& (x_1 w_2 + x_2 w_1 + y_1 z_2 - y_2 z_1)^2 \
    = m n
  $
  so since $m = 2 = 1^2 + 1^2 + 0 + 0$ then all even integers are the sums of 4 squares. 

= Question
== Statement
Let $K = QQ(2^(1 slash 3))$. Is $cal(O)_K$ a PID? Justify your answer.
== Solution
$cal(O)_K$ is indeed a PID. We saw in a previous assignment that the discriminant of $K$ is $-108$ so since $2^(1 slash 3)$ has exactly 2 complex embeddings the Minkowski bound gives us that any class of $K$ has a representative ideal $frak(a)$ with 
$
NN frak(a) <= sqrt(108) (4/pi)^(1) 3!/3^3 < 3
$
so we have $NN frak(a) <= 2$. Assuming this we get that $cal(O)_k quo frak(a)$ is a $2$ element ring and thus is $FF_2$. Now clearly this means that $frak(a)$ is maximal, next we recall that in this case $cal(O)_k$ is monogenic and is equal to $ZZ[2^(1 slash 3)] = ZZ[x] quo (x^3 - 2)$ so now we can take $mod 2$ to get that
$
  frak(a) subset ZZ[x] quo (x^3 - 2) => frak(a) quo (2) subset ZZ[x] quo (x^3 - 2, 2) iso ZZ[x] quo (x^3,2) iso FF_2 [x] quo (x^3)
$
so $frak(a) quo 2$ is an index 2 subring of $FF_2 [x] quo (x^3)$. But now the only subring of $FF_2 [x] quo (x^3)$ with degree $2$ is $(x)$ so we have that $frak(a)$ is the image of the ideal $(2^(1 slash 3))$ in $cal(O)_K$. But this ideal is clearly principle so the class group of $cal(O)_K$ is trivial so it is a PID.

= Question
== Statement
Let $K$ be a number field. Show that there exists a finite extension $L$ of $K$ such that all the ideals of $K$ become principal ideals in $L$.
== Solution
Let $frak(a)$ be an ideal of $K$, then some power of $frak(a)$ is principal since it represents a finite order element of the class group. Assume that $frak(a)^m = (a)$ for some minimal $m$, we then have 
$
  (frak(a) K(#h(-3pt) root(m, a)))^m
  =
  frak(a^m) K(#h(-3pt) root(m, a))
  =
  (a) K(#h(-3pt) root(m, a))
  =
  ((#h(-3pt) root(m, a)) K(#h(-3pt) root(m, a)))^m
$
so since in a number ring prime factorization is unique we get that
$
  frak(a) K(#h(-3pt) root(m, a))
  =
  (#h(-3pt) root(m, a)) K(#h(-3pt) root(m, a))
$
so $frak(a)$ becomes principal in $L = K(#h(-3pt) root(m, a))$, we then repeat this for every non-trivial class in the class group of $K$.

#counter(heading).step()
= Question
== Statement
Let $n in ZZ_(> 0)$ and assume $n^2 - 1$ is square free. Prove that $n + sqrt(n^2 - 1)$ is the fundamental unit of $K = QQ(sqrt(n^2 - 1))$.
== Solution
Since $n^2 - 1$ is square free then $n^2 - 1 = 3 mod 4$ so $cal(O)_K = ZZ[sqrt(n^2 - 1)]$. Now assume that an element $a + b sqrt(n^2 - 1)$ is the fundamental unit, by negation and conjugation we may assume that $a > 0$ and $b > 0$. The norm of this element is given by $abs(a^2 - (n^2 - 1)b^2)$ which we assume is equal to $1$. Now it is clear that under taking higher powers of this unit, $a$ will only increase in size because if $a,b,c,d > 0$ then
$
  (a + b sqrt(n^2 - 1))(c + d sqrt(n^2 - 1)) = (a c + (n^2 - 1) b d) + (a d + b c) sqrt(n^2 - 1)
$
and $a c + (n^2 - 1) b d > a$.
So the fundamental unit must be one for which $a$ is minimal, but $n + sqrt(n^2 - 1)$ has $a = 1$ so it must be minimal, it is thus the fundamental unit.

#counter(heading).step()
= Question
== Statement
Let $m > 2$ be an integer and $zeta = zeta_m$ be a primitive $m$-th root of unity. Denote $K = QQ(zeta)$.
+ Show that $(zeta^k - 1)/(zeta - 1)$ is a unit in $cal(O)_K$ if $(k,m) = 1$.
+ Show that if $m$ has at least two distinct prime factors, then $1 - zeta$ is a unit in $cal(O)_K$.
== Solution
+ Clearly $(zeta^k - 1)/(zeta - 1)$ is an element of $cal(O)_K$ since #h(1fr)
  $
    (zeta^k - 1)/(zeta - 1) = 1 + zeta + zeta^2 + ... + zeta^(k - 1).
  $
  Now since $(k,m) = 1$ we know that $k$ has a multiplicative inverse $mod m$ so let $ell$ be that inverse, we now have
  $
    1 + zeta^k + zeta^(2 k) + ... + zeta^((ell - 1) k) = (zeta^(ell k) - 1)/(zeta^k - 1) = (zeta - 1)/(zeta^k - 1)
  $
  is an element of $cal(O)_K$ and clearly the inverse of $(zeta^k - 1)/(zeta - 1)$.
+ We consider the polynomial
  $
    1 + x + ... + x^(m-1) = (x^m - 1)/(x - 1) = product_(i = 1)^(m - 1) (x - zeta^i)
  $
  plugging in $x = 1$ gives us
  $
    m = product_(i = 1)^(m - 1) (1 - zeta^i).
  $
  Now write $m = p_1^(r_1) p_2^(r_2) dots.c p_n^(r_n)$ and note that for each $p_j$ we also have
  $
    p_j^(r_j) = product_(i=1)^(p_j^(r_j) - 1) (1 - zeta_(p_j^(r_j))^i)
  $
  so dividing both sides by this expression for every $p_j$ gives us
  $
    1 = product_(i in S) (1 - zeta^i)
  $
  where $S$ is the set ${i : 1 <= i <= m - 1, gcd(i,n) = 1}$ because these elements are not the powers of any prime power root of unity. Since $gcd(1,n) = 1$ then we can write
  $
    1 = (1 - zeta) product_(i in S backslash {1}) (1 - zeta^i)
  $
  and hence $1 - zeta$ is a unit.



