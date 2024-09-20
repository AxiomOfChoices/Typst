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
Classmates: Michael Panner, Julia Meng.\
Texts: Class Notes, Algebraic Number Theory by Milne, Elementry and Analytic Theory of Algebraic Numbers by Narkiewicz, Number Fields by Marcus.

= Question
== Statement
Let $cal(O)_K$ be the ring of integers of an imaginary quadratic field $K$ and let $c$ be a positive integer.
+ Prove that $cal(O) := ZZ + c cal(O)_K$ is an order, and that $c cal(O)_K$ is the conductor and $c = [cal(O)_K, cal(O)]$.
+ These exhaust all orders of $cal(O)_K$.
== Solution
+ Clearly $ZZ + c cal(O)_K$ is a subring, but its fractional field must be the same as that of $cal(O)_K$ since we can simply divide by $c$ to get back any element of $cal(O)_K$. Now clearly $c cal(O)_K$ is an ideal, but using second isomorphism theorem $cal(O) quo c cal(O)_K iso ZZ quo (c) = ZZ_(c)$, the subrings of which are all of the form $(m)$ for $m divides c$. These are in bijection then to ideals of $cal(O)$ containing $c cal(O)_K$.
  
  But now these ideals are all of the form $(m) + c cal(O)_K$ so they are not ideals of $cal(O)_k$ since they do not contain elements in $c cal(O)_K backslash m cal(O)_K$. Since an ideal of $cal(O)_K$ contained in $cal(O)$ would also be ideals of $cal(O)$ this exhausts all such ideals and thus $c cal(O)_K$ is indeed the conductor. Finally the cosets of $cal(O)$ are of the form $cal(O) + m cal(O)_K$ for integers $m$ with $0 <= m < c$ so the index is exactly $c$.
+ Let $cal(O)$ be an arbitrary order of $cal(O)_K$. Set $c = [cal(O)_K:cal(O)]$, then we have $c cal(O)_K seq cal(O)$ and thus we also have $ZZ + c cal(O)_K seq cal(O)$. But we know that $[cal(O)_K : ZZ + c cal(O)_K] = c$ so we have $cal(O) = ZZ + c cal(O)_K$.

= Question
== Statement
+ Show that $f(X) = X^3 + X^2 - 2X + 8$ is irreducible in $QQ[X]$. Let $theta$ be a root of $f(X)$ and $K = QQ(theta)$.
+ Show that $theta' = 4 slash theta$ is integral.
+ Show that ${1, theta, theta'}$ is an integral basis of $cal(O)_K$ and the discriminant $Delta_K = -503$.
+ Show that for every $alpha in cal(O)_K$, ${1, alpha, alpha^2}$ cannot be an integral basis.
== Solution
+ Consider $ov(f)(X)$ which is the polynomial $f$ reduced $mod 3$ to $FF_3$. It is equal to $X^3 + X^2 - 2X + 2$, plugging in values we get
  $
  ov(f)(0) = 2\
  ov(f)(1) = 1 + 1 - 2 + 2 = 2\
  ov(f)(1) = 2 + 1 - 1 + 2 = 1\
  $
  so this polynomial has no root in $FF_3$. But a reducible polynomial with degree at most $3$ must have a root so this polynomial is not reducible.
+ The minimal polynomial for $theta'$ is
  $
  X^3 - X^2 + 2X + 8 = 0
  $
  we can check this
  $
  64 / theta^3 - 16 / theta^2 + 8 / theta + 8
  =
  (64 - 16 theta + 8 theta^2 + 8theta^3) / theta^3
  =
  0
  $
+ We can calculate the minimal polynomials of $theta^2,(theta')^2$,
  $
  theta^4 = 3 theta^2 - 10 theta + 8\
  theta^6 = 27 theta^2 - 50 theta + 104
  $
  so we have
  $
  (theta^2)^3 - 5 (theta^2)^2 - 12 (theta^2) - 64 = 0
  $
  and $tr(theta^2) = 5$. Similarly for $(theta')^2$ we have
  $
  (theta'^2)^3 + 3 (theta'^2)^2 - 12 (theta'^2) - 64 = 0
  $
  so $tr(theta'^2) = - 3$. The polynomial we already know give us $tr(theta) = -1$ and $tr(theta') = 1$.
  Calculating the discriminant matrix gives us
  $
  mat(3, -1, 1; -1, 5, 12; 1, 12, -3)
  $
  who's determinant is $Delta_K = -503$ which is square free, making $1, theta, theta'$ an integral basis.
+ Let $alpha = a + b theta + c theta'$ be such that $1, alpha, alpha^2$ is an integral basis. Then $alpha' = b theta + c theta'$ also forms a basis, so we may assume that $a = 0$. Now we compute the trace of powers of $alpha$ but in $FF_2$
  $
  tr(b theta + c theta') mod 2 = b tr(theta) + c tr(theta') mod 2 = b + c mod 2
  $
  $
  tr((b theta + c theta')^2) mod 2
  = tr(b^2 theta + 2 b c (theta theta') + c^2 theta'^2) mod 2
  = b^2 + c^2 mod 2 = b + c
  $
  
  $
  tr((b theta + c theta')^3) mod 2
  &= tr(b^3 theta^3 + 3 b^2 c (theta^2 theta') + 3 b c^2 (theta theta'^2) + c^3 theta'^3) mod 2
  \ &= b tr(-theta^2 + 2theta -8) + 4 tr(3 b^2 c theta + 3 b c^2 theta') + c tr(theta'^2 - 2 theta' - 8) mod 2
  \ &= b + c mod 2
  $
  
  $
  tr((b theta + c theta')^4) mod 2
  &=
  tr(b^4 theta^4 + 4 b^3 c (theta^3 theta') + 6 b^2 c^2 (theta^2 theta'^2) + 4 b c (theta theta'^3) + c^4 theta'^4) mod 2
  \ &=
  tr(b^4 theta^4 + c^4 theta'^4) mod 2
  =
  b^4 tr(theta^4) + c^4 tr(theta'^4) mod 2
  \ &=
  b^4 tr(theta (-theta^2 + 2 theta - 8)) + c^4 tr(theta'(theta'^2 - 2 theta' - 8)) mod 2
  \ &=
  b^4 tr(theta (theta^2)) + c^4 tr(theta'(theta'^2)) mod 2
  \ &=
  b^4 tr(- theta^2 + 2 theta - 8) + c^4 tr(theta'^2 - 2 theta' - 8) mod 2
  \ &=
  b^4 tr(theta^2) + c^4 tr(theta'^2) mod 2
  = b^4 + c^4 mod 2 = b + c mod 2
  $
  so the matrix for $Delta(1,alpha, alpha^2) mod 2$ looks like
  $
  mat(1, a + b, a+b; a+ b, a + b, a + b; a + b, a + b, a + b) = 0.
  $

= Question
== Statement
Show that $f(X) = X^5 - X + 1$ is irreducible in $QQ[X]$. Let $theta$ be a root of $f(X)$ and $K = QQ(theta)$. Find an integral basis of $cal(O)_K$ and calculate the discriminant $Delta_K$.
== Solution
We consider $f(X)$ again modulo 3, we get $ov(f)(X) = X^5 + 2X + 1$. Now clearly $ov(f)$ has no roots in $FF_3$, so if it were reducible it would necessarily have an irreducible factor of degree $2$. That irreducible factor will split in $FF_9$ and thus would be a factor of $X^9 - X$, so let us check the $gcd(X^9 - X, X^5 + 2X + 1)$. We can compute
$
X^9 - X - (X^4 + 1) (X^5 + 2X + 1)
=
X^9 - X - X^9 - X^5 - 2 X^5 - 2X - X^4 - 1
\ =
2X^4 + 2.
$
Then
$
X^5 + 2X + 1 + X(2X^4 + 2)
= X + 1
$
But this clearly has no shared factor with $ov(f)$ since $X = 2$ is not a root of $ov(f)$. Thus $gcd(X^9 - X, X^5 + 2X + 1) = 1$ which contradicts the assumption that $X^5 + 2X + 1$ is reducible.

Let us now consider $K = QQ(theta)$, we are going to guess that the integer ring $cal(O)_K$ is monogenic and compute the discriminant $Delta(f)$. We compute the trace over the basis $(1, theta,theta^2, theta^3,theta^4)$.
$
theta (1, theta,theta^2, theta^3,theta^4)
=
(theta,theta^2, theta^3,theta^4, theta - 1)
$
so $tr(theta) = 0$. We continue like this
$
theta^2 (1, theta,theta^2, theta^3,theta^4)
=
(theta^2, theta^3,theta^4, theta-1, theta^2 - theta)
\
theta^3 (1, theta,theta^2, theta^3,theta^4)
=
(theta^3,theta^4, theta-1, theta^2 - theta, theta^3 - theta^2)
\
theta^4 (1, theta,theta^2, theta^3,theta^4)
=
(theta^4, theta-1, theta^2 - theta, theta^3 - theta^2, theta^4 - theta^3)
\
theta^5 (1, theta,theta^2, theta^3,theta^4)
=
(
  theta-1, theta^2 - theta, theta^3 - theta^2, theta^4 - theta^3, - theta^4 + theta - 1
)
\
theta^6 (1, theta,theta^2, theta^3,theta^4)
=
(
  theta^2 - theta, theta^3 - theta^2, theta^4 - theta^3, - theta^4 + theta - 1, theta^2 + 1
)
\
theta^7 (1, theta,theta^2, theta^3,theta^4)
=
(
  theta^3 - theta^2, theta^4 - theta^3, - theta^4 + theta - 1, theta^2 + 1, theta^3 + theta
)
\
theta^8 (1, theta,theta^2, theta^3,theta^4)
=
(
  theta^4 - theta^3, - theta^4 + theta - 1, theta^2 + 1, theta^3 + theta, theta^4 + theta^2
)
$
This gives us $tr(theta) = 0, tr(theta^3) = 0, tr(theta^4) = 4, tr(theta^5) = - 5, tr(theta^6) = 0, tr(theta^7) = 0, tr(theta^8) = 4$.

We now have the matrix
$
det mat(5, 0, 0, 0,4;0, 0, 0, 4, -5;0,0,4,-5,0;0,4,-5,0,0;4,-5,0,0,4)
=2869 = 19 times 151
$
so since the discriminant is square free $Delta_K = 2869$, it also follows that $1, theta, theta^2, theta^3, theta^4$ is an integral basis.

= Question
== Statement
#let qu = $cal(Q) u a d_Delta$
We will denote by $[a,b,c]$ the quadratic form $a x^2 + b x y + c y^2$. Let
$qu$ denote the $Sl_2 (ZZ)$ equivalence classes of positive definite binary quadratic forms $[a,b,c]$ over $ZZ$ with discriminant $Delta = b^2 - 4 a c$.

A positive definite binary quadratic form $[a,b,c]$ over $ZZ$ is called "reduced" if
$
-a < b <= a < c, or 0 <= b <= a = c.
$
Show that every positive definite binary quadratic form $[a,b,c]$ over $ZZ$ is $Sl_2 (ZZ)$ equivalent to a unique reduced form.
== Solution
Let $[a,b,c]$ be a positive definite quadratic form in $qu$, first let us check the actions of the generators of $Sl_2 (ZZ)$
$
mat(0, 1; -1, 0)^T
mat(a, b/2; b/2, c)
mat(0, 1; -1, 0)
=
mat(-b/2, -c;a, b/2)
mat(0, 1; -1, 0)
=
mat(c, -b/2; -b/2, a)
$
so we can write $a' = c, b' = -b, c' = a$. The next action is
$
mat(1, 1; 0, 1)^T mat(a, b/2; b/2, c) mat(1, 1; 0, 1) = mat(a, b/2; a + b/2, c + b/2) mat(1, 1; 0, 1)
= mat(a, a + b/2; a + b/2, a + b + c)
$
which we can write as $a' = a, b' = b + 2a, c' = a + b + c$. For the inverse we get
$
mat(1, -1; 0, 1)^T mat(a, b/2; b/2, c) mat(1, -1; 0, 1) = mat(a, b/2; -a + b/2, c - b/2) mat(1, -1; 0, 1)
= mat(a, -a + b/2; -a + b/2, c - b + a)
$
which gives us $a' = a, b' = b - 2a, c' = c - b + a$. Now since we define the 'norm' on these quadratic forms by $norm([a,b,c]) = abs(b)$, which we know is positive because this is a positive definite quadratic form. We now check how the generators act on this norm, we get that the first one does not change the norm, just switches $a$ and $c$. If we instead use the second generator or its inverse we get
$
norm([a',b',c']) = abs(b') = abs(b plus.minus 2a)
$
thus we can decrease the norm this way if and only if $abs(a) < abs(b)$, and if $abs(a) = abs(b)$ we can keep the norm the same while making $b$ positive. Then for the representative with minimal norm we must have $-a <= b <= a$ and then by applying the first generator we can force $a <= c$. After that if $a < c$ and $-a = b$ then applying the second generator gives us $b' = -b = a, c' = c + 2a$ which forces $-a < b <= a < c$. If instead $a = c$ then we can use the first generator as necessary to force $0 <= b <= a = c$.

Thus the minimal norm representative is reduced. Now assume that $[a',b',c']$ and $[a,b,c]$ are $Sl_2 (ZZ)$ related and both are reduced. Now notice that for any vector $v = (x,y)$ in $ZZ^2 backslash {(0,0)}$ we have
$
[a,b,c] (x,y) >= a x^2, c y^2, (a - abs(b) + c) min(x^2,y^2)
>= min(a, c, a - abs(b) + c) = a
$
so since $[a,b,c]$ is $Sl_2 (ZZ)$ related to $[a',b',c']$ then for every $v = (x,y)$ in $ZZ^2 backslash {(0,0})$ we have
$
[a',b',c'] (x,y) >= a
$
so in particular $a' >= a$ and $c' >= a$. In identical argument shows that $a >= a'$ so $a = a'$. Now we can also ask a similar question, whats the second smallest non-zero value we can get? For $[a,b,c]$ this is $c$, for $[a',b',c']$ this is $c'$, so an identical argument shows that $c = c'$, this then immediately tells us that $abs(b) = abs(b')$.

Now if $a = c$ then $b$ is related to $-b$ through the first generator. If $a < c$ then if $a = abs(b)$ then we know $b = b' = a$ since they are both reduced. If $abs(b) < a$ then we know that $a$ and $c$ are strictly the two smallest non-zero values you can get from both $[a,b,c]$ and $[a',b',c']$, thus the relator in $Sl_2 (ZZ)$ that maps them to each other must be either $I$ or $-I$ and so $b = b'$. Thus every equivalence class has a unique representative.

= Question
== Statement
Show that the set $qu$ is finite and give an explicit upper bound in terms of $Delta$.
== Solution
As we showed in the previous question, the elements of $qu$ are in bijection with positive definite reduced quadratic forms $[a,b,c]$ with discriminants equal to $Delta$. Now for a positive definite reduced quadratic form we have
$
Delta = b^2 - 4 a c >= a c - 4 a c >= - 3 a c
$
so we have $a c <= - Delta/ 3$. But since $a,c$ are both positive there are finitely many such $a,c$'s that can satisfy this bound, specifically at most $Delta^2$ such pairs. Since each product would uniquely determine a $b$ (if such a $b$ exists) then there at most $Delta^2$ positive definite reduced quadratic forms with discriminant $Delta$, and so $abs(qu) <= Delta^2$.

= Question
== Statement
Calculate the class number of $K = QQ(sqrt(Delta))$ when
$
Delta = -3,-7,-15,-20.
$
Whenever $K$ in the above list is not a UFD, give an explicit example of non-unique factorization into irreducible elements.
== Solution
Since elements of $Cl (K)$ are in bijection with elements of $qu$ then we can simply check the number of reduced quadratic forms of discriminant $Delta$.

For $Delta = -3$, the bound from the previous question gives us
$
a dot c <= 1
$
so $a = c = 1$ is the only solution, which forces $b = 1$. Thus $H(QQ(sqrt(-3))) = 1$.

For $Delta = -7$, the bound is
$
a dot c <= 2
$
so $a = c = 1$ and $a = 1, c = 2$ are the only solutions. The first one cannot correspond to a form since $b^2 + 7 = 4$ has no solutions. The second one has $a = b = 1, c = 2$. Again $H(QQ(sqrt(-7))) = 1$.

For $Delta = -15$, the bound is
$
a dot c <= 5
$
but we also need $a dot c >= 4$ to have any hope of a solution, so only
$
a = 1, c = 4 quad a = 1, c = 5 quad a = b = 2
$
are possible solutions. From there we check that $a = b = 1, c = 4$ and $a = c = 2, b = 1$ are the only solutions. This gives us $H(QQ(sqrt(-15))) = 2$.

For $Delta = -20$, the bound is
$
5 <= a dot c <= 6
$
which gives us
$
a = 1, c = 5 quad a = 1, c = 6 quad a = 2, c = 3
$
then we check that $a = 1, b = 0, c = 5$ and $a = b = 2, c = 3$ are the only solutions. This gives us $H(QQ(sqrt(-20))) = 2$.

We now give examples of non-uniqueness, in $QQ(sqrt(-15))$
$
(1 - sqrt(-15)) / 2
(1 + sqrt(-15)) / 2
=
(1 + 15) / 4 = 4 = 2^2
$

Now we know that norm of a general element
$
N_(K quo QQ) (a + b (1 + sqrt(-15)) / 2) = (a + b / 2)^2 + 15 / 4 b^2
$
and so $N_(K quo QQ) ((1 - sqrt(-15))/2) = N_(K quo QQ) ((1+sqrt(-15))/2)= 1/4 +15/4 = 4$ and $N_(K quo QQ) (2) = 4$, but there are no elements with norm $2$ because
$
a^2 + a b + 4 b^2 = 2
$
clearly has no solutions so they are all irreducible.

For $QQ(sqrt(-20)) = QQ(sqrt(-5))$, we have
$
(1 + sqrt(-5))
(1 - sqrt(-5))
=
1 + 5
=
6
=
2 dot 3
$
these have norms $6,6,4,9$ but no elements have norms, $2,3$ so these are all irreducible and so we are done.

= Question
== Statement
Assume further that $Delta equiv 1 mod 4$. Show that $Cl_K$ is trivial if and only if $x^2 - x + (1 - Delta)/4$ represents prime numbers for all $x = 1,2,...,(abs(Delta) - 3)/4$.
== Solution
First note that $a = 1, b = 1, c = (1 - Delta)/4$ is a reduced positive definite quadratic form that represents an element of $Cl_K$. Now all other quadratic forms that are reduced must have $b^2 equiv 1 mod 4$ so we have
$$
