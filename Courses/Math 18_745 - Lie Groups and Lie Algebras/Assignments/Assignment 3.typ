#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 3", name: "Jacob Reznikov", doc)
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
#update_lecture()
#update_lecture()
#update_lecture()
#update_lecture()
#update_lecture()
= Exercise
== Statement
Show that any non-abelian 3-dimensional nilpotent Lie Algebra is isomorphic to $heis_3$.
== Solution
As we saw in class, any nilpotent Lie Algebra has non-trivial center, so let $Z(frak(g))$ be that center.

Now since $frak(g)$ is non-abelian the center is not the whole of $frak(g)$, and so it has either dimension $1$ or $2$. 
Now from a previous assignment we know that we cannot have $dim(Z(frak(g))) = n - 1 = 2$ so we have $dim(Z(frak(g))) = 1$. Now we know that $dim(Z(frak(g))) = n - 2$ and so again by the last assignment we have either $frak(g) = heis_3$ or $frak(g) = frak(h) plus.circle Z(frak(g))$ where $frak(h)$ is the canonical non-abelian Lie algebra of dimension 2. Aiming for a contradiction, we assume that we have a basis $a,b,c$ with
$
  [a,b] = -[b,a] = a
$
being the only non-trivial bracket. We then have $[frak(g), frak(g)] = span(a)$ and so $frak(g)^n = span(a)$ for all $n >= 1$. Thus in this case it is not a nilpotent algebra so we are done.

= Exercise
== Statement
Let $FF$ be a field of characteristic $2$, and $V = FF[x] quo x^2 FF[x]$ be the representation of $heis_3$, given by $p |-> diff/(diff x), q |-> x, c |-> I$. Show that $V = V_((lambda))^(heis_3)$, but $lambda$ is not a linear function on $heis_3$. Compute $lambda$.
== Solution
Let $a_0 + a_1 x$ be any element of $V$ and $b_0 p + b_1 q + b_2 c$ be any element of $heis_3$. We have
$
  (b_0 p + b_1 q + b_2 c) (a_0 + a_1 x) 
  &= b_0 a_1 + b_1 a_0 x + b_2 a_0 + b_2 a_1 x 
  \ &= (b_0 a_1 + b_2 a_0)  + (b_1 a_0 + b_2 a_1) x
$
so we can say that $b_0 p + b_1 q + b_2 c$ acts as
$
  mat(b_2, b_0; b_1, b_2) 
$
the characteristic polynomial is
$
  (b_2 - lambda)^2 - b_0 b_1
  =
  lambda^2 + b_2^2 + b_0 b_1
  =
  lambda^2 + det mat(b_2, b_0; b_1, b_2).
$
now if we have a solution $rho$ then we have 
$
  (lambda - rho)^2 = lambda^2 + det mat(b_2, b_0; b_1, b_2)
$
so it has no other eigenvalues except for $rho$, hence it is $V = V_lambda$ (I am assuming that the field is perfect as I do not think it holds otherwise). We thus have that
$
  lambda = sqrt(b_2^2 + b_0 b_1),
$
this is clearly not linear because
$
  lambda(p + q) = sqrt(1) = 1 != 0 + 0 = lambda(p) + lambda(q)
$


= Exercise
== Statement
By the example of the adjoint representation of the 2 dimensional non-abelian solvable Lie algebra. Show that the generalized weight space decomposition fails for solvable Lie algebras that are not nilpotent.
== Solution
Let ${a,b}$ be a basis for $frak(h)$ with $[a,b] = a$, then we have
$
  ad a = mat(0,1;0,0), quad ad b = mat(-1,0;0,0).
$
Now $ad b$ has two separate eigenvalues, so if they had a generalized weight space decomposition then $ad a$ must be diagonal, but it is not diagonal so they cannot have a decomposition.

= Exercise
== Statement
Let $frak(g) = gl_n (FF)$ and $frak(h) = {"diagonal matrices"}$. Find the generalized weight space decomposition for the tautological and adjoint representation of $frak(g)$ restricted to $frak(h)$ and show that 
$
  pi(frak(g)_((alpha))^(frak(h))) V_((lambda))^(frak(h)) seq V_((lambda + alpha))^(frak(h))
$
and that
$
  [frak(g)_((alpha))^frak(h), frak(g)_((beta))^frak(h))] seq frak(g)_((alpha + beta))^((frak(h)))
$
== Solution
For $V = FF^n$ we have
$
  V = plus.big_(i=1)^n span(e_i)
$
and we have
$
  span(e_i) = V_(lambda_i)^(frak(h))
$
where $lambda_i$ sends a diagonal matrix to its $i$-th diagonal entry.

Now for the adjoint representation, we write any matrix $M in gl_n (FF)$ as
$
  M = sum_(i,j <= n) a^(i j) e_(i j)
$
then we have,
$
  span(e_(i j)) seq frak(g)^(frak(h))_(lambda_i - lambda_j)
$
which we can because we can compute
$
  [e_(i i), e_(i j)] = e_(i i) e_(i j) - e_(i j) e_(i i) = e_(i j)\
  [e_(j j), e_(i j)] = e_(j j) e_(i j) - e_(i j) e_(j j) = -e_(i j).
$
And clearly
$
  V = plus.big_(i,j=1)^n span(e_(i j)),
$
so this is the weight decomposition.

We now fix $i,j$ and set $alpha = lambda_i - lambda_j$, this gives us
$
  pi(frak(g)_((alpha))^frak(h))
  V_((lambda_k))^frak(h)
  =
  span(e_(i j))
  span(e_k)
  =
  cases(span(e_i) : j = k, 0 : "otherwise")
$
but notice that we have exactly $alpha + lambda_k = lambda_i$ exactly when $j = k$.

Now fix $i,j$ and $k,ell$ then we have
$
  [span(e_(i j)), span(e_(k ell))] =
  span(e_(i j) e_(k ell) - e_(k l) e_(i j)) =
  cases(span(e_(i ell)) : j = k\, i != ell, span(e_(k j)) : i = ell\, j != k, 0 : "otherwise")
$
which is exactly equal to $V_(lambda_(i) - lambda_(j) + lambda_k - lambda_ell)^frak(h)$.

#update_lecture()
= Exercise
== Statement
Show that the Zariski topology is indeed a topology.
== Solution
First we check that $nothing, FF^n$ are closed, we know that $F({}) = FF^n$ and that $F({0}) = FF^n$.

Let $A$ and $B$ be two closed sets, then we have $A = F(S_A)$ and $B = F(S_B)$ for some sets of polynomials $S_A, S_B$. We set
$
  S := { p(x) dot q(x) : p in S_A, q in S_B }
$
and find that
$
  F(S) = F(S_A) union F(S_B) = A union B
$
so their union is closed.

Finally let ${S_alpha}_(alpha in I)$ be any collection of closed sets. Then we have
$
  F(union.big_(alpha in I) S_alpha) = sect.big_(alpha in I) F(S_alpha)
$
and so the intersection of any family of closed sets is also a closed set.

= Exercise
== Statement
Let
$
  det(ad a - lambda I) = (-lambda)^d + c_(d-1) (a) (-lambda)^(d-1) + ... + c_0 (a)
$
show that $c_(d - j) (a)$ is a homogeneous polynomial of degree $d - j$.
== Solution
We consider $ad (t a)$, we have
$
  det(ad t a - lambda I) &= t^d (ad(a - lambda/t I) )= t^d ((-lambda/t)^d + c_(d-1) (a) (-lambda/t)^(d-1) + ... + c_0 (a))
  \ &= t^d (1/t^d (-lambda)^d + 1/t^(d-1) c_(d-1) (a) (-lambda)^(d-1) + ... + c_0 (a))
  \ &= (-lambda)^d + t c_(d-1) (a) (-lambda)^(d-1) + ... + c_0 (a) t^d.
$
At the same time we also have
$
  det(ad t a - lambda I)
  = (-lambda)^d + c_(d-1) (t a) (-lambda)^(d-1) + ... + c_0 (t a) t^d.
$
and so we have that $c_(j)$ is homogeneous of degree $d - j$.

= Exercise
== Statement
+ Show that the Jordan decomposition of $ad a$ in $gl(gl_n (FF))$ is given by
  $
    ad a = (ad a_s) + (ad a_n)
  $
  where $a = a_s + a_n$ is the Jordan decomposition of $a in gl_n (FF)$.
+ If $lambda_1,...,lambda_n$ are the eigenvalues of $a_s$ then $lambda_i - lambda_j$ are the eigenvalues of $ad a_s$.
+ $ad a_s$ has the same eigenvalues of $ad a$.
== Solution
+ Up to a change of basis we may assume that $a_s$ is diagonal, and so $a_s in frak(h)$ and thus $gl_n (FF)$ decomposes as $product_lambda frak(g)_(lambda)^(frak(h))$ so by definition any element $x in frak(h)$ acts with eigenvalues $lambda(x)$ on $gl_n (FF)$, so $ad a_s$ is diagonal. On the other hand, $a_n$ is nilpotent and so we saw in class that $ad a_n$ is also nilpotent. It is thus enough to check that $ad a_s$ and $ad a_n$ commute. But we have
  $
    [ad a_s, ad a_n] b = [a_s, [a_n, b]] - [a_n, [a_s, b]] = -[[a_s,a_n],b],
  $
  but $[a_s,a_n]$ is zero since they commute by assumption.
+ As we saw in the previous question the weights of $frak(h)$ on $gl_n (FF)$ are $lambda_i - lambda_j$ where $lambda_i$ is the functional taking an element of $frak(h)$ to its $i$-th diagonal entry. Now this diagonal entry is also exactly the $i$-th eigenvalue of that element. Hence by applying this to $a_s$ we get exactly the desired result.
+ This is immediate from part a since this is the Jordan decomposition.

= Exercise
== Statement
Show that
+ $rank(gl_n (FF)) = n$.
+ The discriminant of $gl_n (FF)$ is given by #h(1fr)
  $
  c_n (a) = product_(i != j) (lambda_i - lambda_j)
  $ 
  where $lambda_i$'s are all eigenvalues of $a in gl_n (FF)$ (over $ov(FF)$), taken with their multiplicities.
+ Compute the discriminant $c_2 (a)$ in $gl_2 (FF)$ in terms of the matrix coefficients of $a$:
  $
    c_2 (a) = 4 det a - (tr a)^2
  $
== Solution
+ We know that $ad a$ has eigenvalues $lambda_i - lambda_j$ so these are all the roots of the characteristic polynomial. Hence we have
  $
    det(ad a - lambda I) = product_(i,j=1)^n (lambda_i - lambda_j - lambda)
  $
  now exactly $n$ of these terms are of the form $lambda_i - lambda_i - lambda = - lambda$ so we have $c_j (a) = 0$ for all $j <= n - 1$. On the other hand if $a$ has $n$ different eigenvalues then we have
  $
    c_n (a) = product_(i != j) (lambda_i - lambda_j)
  $
  which is then non-zero.
+ This follows immediately from the previous discussion.
+ We have for $a = mat(lambda_1, 0; 0, lambda_2)$ that
  $
    product_(i!=j)^2 (lambda_i - lambda_j) = 
    - (lambda_1 - lambda_2)^2 = 2 lambda_1 lambda_2 - lambda_1^2 - lambda_2^2
    = 4 lambda_1 lambda_2 - (lambda_1 + lambda_2)^2
    \ = 4 det(a) - tr(a)^2
  $

