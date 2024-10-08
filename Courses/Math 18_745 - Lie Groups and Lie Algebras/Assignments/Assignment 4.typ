#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 4", name: "Jacob Reznikov", doc)
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
#update_lecture()
#update_lecture()
= Exercise
== Statement
Let $G$ be an Algebraic group and, $H$ be an algebraic subgroup of $G$. Let $N_G (H) = {g in G | g H g^(-1) seq H }$ be the normalizer of $H$ in $G$. Prove that it is an algerbraic subgroup, whos Lie algerba is $N_(frak(g)) (frak(h))$, whose $frak(g) = Lie G, frak(h) = Lie H$.
== Solution
Let $C_G$ be the polynomials that define $G$ and $C_H$ be the polynomials that define $H$, then we define the polynomial set $C'$ by
$
  C' = { (det g)^(deg p) p((g x adj g)/(det g)): p in C_H, x in H}
$
where $adj g$ is the adjugate of $g$, which is equal to $g^(-1) det (g)$, and is polynomially dependent on $g$. It is easy to see then, that the elements of $C'$ are indeed polynomials, for any rational terms of $det g$ are cancelled out by the $(det g)^(deg p)$ up front. We then have that 
$
  N_G (H) = {g in Gl_n : q(g) = 0, p(g) = 0, forall q in C_G, p in C'}.
$

To check the second statement we check when $1 + epsilon X in N_G (H)$, we get that for each $h in H$ we have
$
  (1 + epsilon X) h (1 + epsilon X)^(-1)
  =
  (1 + epsilon X) h (1 - epsilon X)
  =
  h + epsilon (X h - h X)
$
thus $1 + epsilon X in Lie N_G (H)$ if and only if $h^(-1) X h - X in Lie H$ or otherwise said $X in frak(n)_(frak(g)) frak(h)$.

= Question
== Statement
Let $frak(g) in sl_2 (FF)$ with $char FF != 2$. Let $frak(h) = FF mat(0,1;0,0)$. This is a maximal nilpotent subalgebra, but not a Cartan subalgebra. 
== Solution
This is a subalgebra of dimension $1$, if it was not a maximal nilpotent subalgebra, then $sl_2$ would contain a 2 dimensional nilpotent subalgebra $frak(h)'$. Any other basis vector of $frak(h)'$ is of the form
$
  x = mat(a,0;b,-a)
$
but then we have
$
  [x,mat(0,1;0,0)] 
  =
  mat(a,0;b,-a) mat(0, 1;0, 0)
  -
  mat(0, 1;0, 0) mat(a,0;b,-a)
  =
  mat(0, a; 0, b) - mat(b, -a;0, 0) 
  =
  mat(-b, 2a; 0, b)
$
so since it it is a 2 dimensional Lie algebra we must assume that $b = 0$ as otherwise we can span the whole space. Then if $b = 0$ and $a != 0$ then $[frak(h)', frak(h)] = frak(h)$ so the algebra is not nilpotent. Thus $frak(h)$ is indeed maximal nilpotent. However, we have $frak(n)_(frak(g)) frak(h) != frak(h)$ because we have
$
  [
    mat(1,0;0,-1),
    mat(0,1;0,0) 
  ]
  =
  mat(1,0;0,-1) mat(0,1;0,0)
  -
  mat(0,1;0,0) mat(1,0;0,-1)
  =
  mat(0, 1;0, 0)
  -
  mat(0, -1;0, 0)
  =
  mat(0, 2;0, 0)
$
and so $mat(1,0;0,-1)$ is in $frak(n)_(frak(g)) frak(h)$ but is not in $frak(h)$.

= Question
== Statement
Let $frak(g)$ be a 3 dimensional Lie algebra of rank 1, then we showed in class that $frak(g) = FF h plus.circle V$ where $dim V = 2$ and $[h,V] seq V$. Show that in this case $frak(g)$ is isomorphic to one of the following lie algebras with basis $h,a,b$.
+ $[h,a] = a, [h,b] = a + b, [a,b] = 0$
+ $[h,a] = a, [h,b] = lambda b, lambda != 0, [a,b] = 0$
+ $[h,a] = a, [h,b] = -b, lambda != 0, [a,b] = h$
== Solution
We use the generalized root space decomposition, $frak(g) = frak(h) plus.circle (plus.circle.big_(lambda in frak(h)^*) frak(g)_((lambda))^frak(h))$, here since $frak(h) = FF h$ then the roots $lambda$ are just scalars defined by $h |-> lambda$. We can clearly see in this decomposition that $V = plus.circle.big_(lambda in frak(h)^*) frak(g)_((lambda))^frak(h)$, thus the root decomposition is equivalent to the decomposition of $V$ into generalized eigenspaces of $ad h$. Now as a linear transformation, up to a change of basis, it has one of the two forms
$
  ad h tilde.eq mat(lambda, 1; 0, lambda),
  wide
  ad h tilde.eq mat(lambda_1, 0; 0, lambda_2).
$
We now treat the cases one by one. 

In the first case, we have $[h,a] = lambda a$ and $[h, b] = lambda b + a$. Now if $lambda = 0$ then we have $[h, a] = 0$ and so $a in frak(n)_frak(h) frak(g)$ contradicting that $frak(h) = frak(n)_frak(h) frak(g)$. Hence let us that $lambda != 0$, then changing basis to 
$
h' = 1/lambda h, a' = a/lambda, b' = b
$ 
we get
$
  [h', a'] = a/lambda = a',
  wide
  [h', b'] = 1/lambda [h, b] = 1/lambda (lambda b + a) = b' + a',
$
now we assume that we already did this change of basis, we want to ask what are the possible values of $[a,b]$. Now we have $a,b in frak(g)_((1))^(frak(h))$ and so from the root decomposition we have that $[a,b] in frak(g)_((2))^(frak(h))$ which only contains $0$ by construction so we must have $[a,b] = 0$ and so this exactly matches $(a)$.

Now for the second case, we again can assume that $lambda_1,lambda_2 != 0$ so we may replace $h$ by $h' = 1/lambda_1 h$ to get
$
  [h', a] = 1/lambda_1 [h, a] = a,
  wide
  [h', b] = 1/lambda_1 [h, b] = lambda_2/lambda_1 b.
$
Now defining $lambda = lambda_2/lambda_1$ and noting that $lambda != 0$, we have $a in frak(g)_((1))^(frak(h))$ and $b in frak(g)_((lambda))^(frak(h))$ then we have $[a,b] in frak(g)_((lambda + 1))^(frak(h))$ so we now get two cases. If $lambda != -1$, then we have $lambda + 1 != 0,1,lambda$ so $[a,b] = 0$, this matches exactly case (b). If $lambda = -1$ then $lambda + 1 = 0$ so we can have $[a,b] != c h$ for some non-zero constant $c$. Replacing $a$ with $a' = a/c$ we get
$
  [h,a'] = 1/c a = a',
  wide
  [h,b] = -b,
  wide
  [a',b] = 1/c [a,b] = h,
$
which exactly matches case (c).

= Question
== Statement
Show that all Lie algebras from (a) and (b) solvable and find conditions of their isomorphism. Show that (c) is isomorphic to $sl_2 (FF)$ and that it is not solvable.
== Solution
Let $frak(g)_a$ be a model of the Lie algebra from (a), we have that 
$
  frak(g)_a^1
  =
  [frak(g)_a, frak(g)_a] 
  =
  V
$
and $[V,V] = 0$ so $frak(g)_a$ is indeed solvable. Similarly let $frak(g)_(b, lambda)$ be a model of the Lie algebra from (b), we have that
$
  frak(g)_(b,lambda)^1
  =
  [frak(g)_(b,lambda), frak(g)_(b,lambda) ]
  =
  V
$
and again $[V,V] = 0$ so $frak(g)_(b,lambda)$ is solvable.

Now $frak(g)_a$ and $frak(g)_(b,lambda)$ are never isomorphic because under any isomorphism we must have $frak(h) seq frak(g)_a$ map onto $frak(h) seq frak(g)_(b,lambda)$ and yet $ad h$ in $frak(g)_a$ is never a scalar multiple of $ad h$ in $frak(g)_(b, lambda)$ in any basis, so an isomorphism can never exist.

Now we also know that for $lambda != lambda'$ if $frak(g)_(b, lambda) iso frak(g)_(b, lambda')$ then we must have
$
  c mat(1, 0; 0, lambda) tilde.eq mat(1, 0; 0, lambda')
$
for some constant $c$. It is easy to see that this is only possible if $c = 1$ and $lambda = lambda'$ or if $c = lambda' = 1/lambda$ and so for this isomorphism exists exactly when $lambda lambda' = 1$.

Finally let $frak(g)_c$ be a model for (c), then set
$
  tilde(h) = mat(1,0;0,-1), tilde(e) = mat(0,1;0,0), tilde(f) = mat(0,0;1,0)
$
to be a basis for $sl_2 (FF)$. We note that
$
  [tilde(h), tilde(e)] = 2 tilde(e),
  [tilde(h), tilde(f)] = -2 tilde(f),
  [tilde(e), tilde(f)] = tilde(h),
$
so the mapping $h -> tilde(h)/2, a -> tilde(e)/sqrt(2), b -> tilde(f)/sqrt(2)$ defines an isomorphism. Then $frak(g)_c$ is clearly not solvable and hence not isomorphic to the other two.

#update_lecture()
= Question
== Statement
Show that if $A$ and $B$ are commuting nilpotent operators on a vector space over a field of characteristic $0$ then
$
  e^(A + B) = e^A e^B.
$
== Solution
We have by definition
$
  e^(A + B) = sum_(i = 0)^N (A + B)^i/(i!)
$
where $N$ is such that $A^N B^(N-i) = 0$ for all $i <= N$ (such always exists since you can take twice the max of their nilpotent degree). Now since $A$ and $B$ commute we know that $(A + B)^i = sum_(k=0)^i binom(i,k) A^k B^(k-i)$ and so we have
$
  e^(A + B) 
  &= sum_(i = 0)^N (A + B)^i/(i!)
  = sum_(i = 0)^N 1/(i!) sum_(k=0)^i binom(i,k) A^k B^(i-k)
  = sum_(i = 0)^N 1/(i!) sum_(k=0)^i i!/(k! (i-k)!) A^k B^(i-k)
  \ &= sum_(i = 0)^N sum_(k=0)^i 1/(k! (i-k)!) A^k B^(i-k)
$
on the other hand we have
$
  e^A e^B
  = sum_(i = 0)^N A^i/(i!) sum_(j = 0)^N B^j/(j!)
  = sum_(i = 0)^N sum_(j = 0)^N 1/(i! j!) A^i B^j
$
then for $i + j >= N$ this sum the terms are zero by assumption so we have
$
  e^A e^B 
  = sum_(i = 0)^N sum_(j = 0)^(N - i) 1/(i! j!) A^i B^j
$
now notice that we are summing over all integers $i,j >= 0$ with $i + j <= N$ exactly once. This is also exactly what we are doing in the sum 
$
  e^(A + B) = sum_(i = 0)^N sum_(k=0)^i 1/(k! (i-k)!) A^k B^(i-k)
$
and so we get $e^(A + B) = e^(A) e^B$.

= Question
== Statement
Let $frak(g)$ be an arbitrary algebra over a field $FF$ of characteristic $0$, and let $D$ be a derivation of the algebra $frak(g)$. Show that if $D$ is a nilpotent operator then $e^D$ is an automorphism of the algebra $frak(g)$.
== Solution
First we will prove a small lemma
#lemma[
  Let $D$ be a derivation of an algebra $frak(g)$, we have
  $
    D^n (a b) = sum_(i=0)^n binom(n,i) D^i (a) D^(n - i) (b)
  $
]
#proof[
  We prove by induction, this is clearly true for $n = 1$. Now we have
  $
    D^(n+1) (a b)
    &= D(D^n (a b))
    = D(sum_(i=0)^n binom(n,i) D^i (a) D^(n - i) (b))
    = sum_(i=0)^n binom(n,i) D(D^i (a) D^(n - i) (b))
    \ &= sum_(i=0)^n binom(n,i) D(D^i (a) D^(n - i) (b))
    = sum_(i=0)^n binom(n,i) (D^(i+1) (a) D^(n - i) (b) + D^(i) (a) D^(n - i + 1) (b))
    \ &= sum_(i=0)^n binom(n,i) (D^(i+1) (a) D^(n - i) (b)) + sum_(i=0)^n binom(n,i) (D^(i) (a) D^(n - i + 1) (b))
    \ &= sum_(i=1)^(n+1) binom(n,i-1) (D^(i) (a) D^(n - i + 1) (b)) + sum_(i=0)^n binom(n,i) (D^(i) (a) D^(n - i + 1) (b))
    \ &= D^(n+1) (a) b + a D^(n+1) (b) + sum_(i=1)^n (binom(n,i-1) + binom(n,i)) (D^(i) (a) D^(n - i + 1) (b))
    \ &= D^(n+1) (a) b + a D^(n+1) (b) + sum_(i=1)^n (binom(n+1,i) (D^(i) (a) D^(n - i + 1) (b))
    \ &= sum_(i=0)^(n+1)  binom(n+1,i) D^(i) (a) D^(n - i + 1) (b)
  $
]
Let us now check that $e^D$ is indeed a morphism of algebras. We have
$
  e^D (a b)
  &= sum_(i=0)^N (D^i (a b))/i!
  = sum_(i=0)^N sum_(k=0)^i binom(i,k) D^(k) (a) D^(i-k) (b) 1/i! 
  \ &= sum_(i=0)^N sum_(k=0)^i 1/(k! (i-k)!) D^(k) (a) D^(i-k) (b)
$
and we also have
$
  e^D (a) e^D (b)
  &= sum_(i=0)^N (D^i (a))/i! sum_(j = 0)^N (D^j (b))/j!
  &= sum_(i=0)^N sum_(j = 0)^N 1/(i! j!)(D^i (a)) (D^j (b))
$
and so by the exact same argument as for the previous question, these two are equal. To show it is an automorphism, we simply recall that its inverse is $e^(-D)$ by the previous question.

= Question
== Statement
Recall that 
$
(d f)|_(x = a) (b) = d/(d t)|_(t=0) f(a + t b).
$
Show that $(d f)|_(x = 0)$ is a linear operator on $FF^m$ with the matrix $((partial f_i)/(partial x_j) (a))_(i,j)$
== Solution
The fact that $(d f)|_(x = 0)$ is linear is by definition, to compute the matrix we set $b = e_j$ and check 
$
  (d f)|_(x = 0) (e_j) 
  &= d/(d t)|_(t = 0) f(a + t e_j) 
  = (d/(d t)|_(t = 0) f_1 (a + t e_j), ..., d/(d t)|_(t = 0) f_m (a + t e_j))
  \ &=
  (partial_(x_j) f_1|_(x = a), partial_(x_j) f_2|_(x = a), ..., partial_(x_j) f_m|_(x = a))
$
and so the $i$-th component is given by $partial_(x_j) f_i|_(x = a)$ which is exactly what we wanted.



#[
#pb()
#set heading(numbering: none)
#heading("Bonus Problem")
]
== Statement
+ Show that if $F$ is a polynomial in $m$ indeterminents such that $F(f_1,...,f_m)$ is identically zero then $det((partial f_i)/(partial x_j))$ is identically 0.
+ Given algebraically independent polynomials in $y_1,...,y_m$ in $FF[x_1,...,x_m]$, show that the field extension $FF(x_1, ..., x_m) supset.eq F(y_1,...,y_m)$ is finite, in the sense that each $x_i$ satisfies a non-zero polynomial equation over $FF(y_1,...,y_m)$.
+ For each $i = 1,2,...,m$ take a polynomial equation satisfied by $x_i$ over $FF(f_1,...,f_m)$ and clear the denominators to get a polynomial over $FF[f_1,...,f_m]$ and let $p_i (f_1,...,f_m)$ be the leading coefficient of this polynomial. Show that the set of points
  $
    {y in FF^m | p_i (y) != 0 "for" i = 1,2,...,m}
  $
  is contained in $f(FF^m)$.
== Solution
+ Since
  $
    F(f_1,...,f_m) = 0
  $
  then we have by chain rule
  $
    partial_(x_i) F(f_1,...,f_m) = sum_j (partial F)/(partial f_j) (partial f_j)/(partial x_i) = 0
  $
  so the matrix-covector product has
  $
    (partial F)/(partial f_j) (partial f_j)/(partial x_i) = 0.
  $ 
  Now at any point we have either $(partial F)/(partial f_j) = 0$ or the image of $(partial f_j)/(partial x_i)$ is contained in the kernel of $(partial F)/(partial f_j)$. We thus have
  $
    FF^m = (sect.big_(j) V((partial F)/(partial f_j))) union V(det (partial f_j)/(partial x_i)),
  $
  but as union of Zariski closed sets one of these sets must equal the entirety of $FF^m$. Now this cannot be
  $
    sect.big_(j) V((partial F)/(partial f_j))
  $
  as at least one polynomial here is non-trivial if $F$ is not constant (I am assuming that $F != 0$), hence $FF^m = V(det (partial f_j)/(partial x_i))$.
+ Clearly $FF(y_1,...,y_m)$ has transcendence degree $m$ and thus if $FF(x_1,...,x_m)$ was not a finite extension it would have transcendence degree at least $m + 1$. But clearly it also has transcendence degree $m$ so it is a finite extension.
+ Construct $p_i (f_1,...,f_m)$ as in the question, let $y in FF^m$ be such that $p_i (y) != 0$ for $i = 1,2,...,m}$, then we can define the homomorphism
  $
    G : FF[f_1,...,f_m] &-> FF\
        f_i &|-> y_i
  $
  and so since $p_i (y)$ are non-zero then we get that $p_i$ gets mapped to a non-zero element of $FF$, and thus $G(p_i)$ is invertible. We can thus define an extension
  $
    tilde(G) : FF[f_1,...,f_m, p_1^(-1),...,p_m^(-1)] -> FF.
  $
  Now inside the ring $FF[f_1,...,f_m, p_1^(-1),...,p_m^(-1)]$ we can divide the polynomial solved by $x_i$ by its leading coefficient to get a monic polynomial, making $x_i$ integral. Since we assumed that $FF$ is algebraically closed and noting that $FF[x_1,...,x_m]$ is an integral extension of $FF[f_1,...,f_m, p_1^(-1),...,p_m^(-1)]$ we thus get another extension of $G$,
  $
    ov(G) : FF[x_1,...,x_m] -> FF.
  $
  Now by construction we have that the tuple
  $
    (ov(G)(x_1),...,ov(G)(x_n))
  $
  is such that
  $
    f_i (ov(G)(x_1),...,ov(G)(x_n)) = y_u
  $
  so we get that
  $
    f(ov(G)(x_1),...,ov(G)(x_n)) = y
  $
  and so indeed $y$ is in $f(FF^m)$.

Finally we note that ${y in FF^m | p_i (y) != 0 "for" i = 1,2,...,m}$ is a Zariski open set and thus $f(FF^m)$ contains a Zariski open set.

= Question
== Statement
Let $frak(g) = sl_2 (RR)$. Show that $frak(h)_1 = RR mat(1, 0;0, -1)$ and $frak(h)_2 = RR mat(0, 1;-1, 0)$ are Cartan subalgebras of $frak(g)$, but they are not conjugate by any automorphism of $frak(g)$.
== Solution
We already know from class that $frak(h)_1$ is Cartan so we only check $frak(h)_2$. Now $frak(h)_2$ is clearly nilpotent, so we check $frak(n)_frak(h)_2 frak(g)$. For any $mat(a,b;c,-a)$ we have
$
  [mat(a,b;c,-a), mat(0,1;-1,0)]
  &=
  mat(a,b;c,-a) mat(0,1;-1,0)
  -
  mat(0,1;-1,0) mat(a,b;c,-a)
  =
  mat(-b,a;a,c)
  -
  mat(c,-a;-a,-b)
  \ &=
  mat(-b-c, 2 a; 2a, b+c)
$
which is never in $frak(h)_2$ unless it is equal to zero, in which case $a = 0$ and $b + c = 0$ and hence $frak(n)_frak(h)_2 frak(g) = frak(h)_2$.

Now to see that they are not conjugate by any automorphism, we recall that $frak(h)_1$ has two weight spaces, with weights $2,-2$. On the other hand we can compute for $frak(h)_2$,
$
  (ad mat(0, 1; -1, 0)) mat(a, b; c, -a)
  =
  mat(b+c,-2a;-2a,-b-c)
$
so if it is in an eigenspace we have
$
  b + c = lambda a, - 2 a = lambda b, - 2 a = lambda c
$
for some $lambda$. From this we immediately get $c = b$ so
$
  2 b = lambda a, - 2 a = lambda b
$
so
$
  2 b =  lambda^2/(-2) b.
$
now if $b = 0$ then we get $a = 0$ and so no weight space there, on the other hand if $b != 0$ then
$
  -4 = lambda^2
$
so $lambda = 2 i$. Thus $frak(h)_2$ has no decomposition into a real weight space, so it cannot be conjugate to $frak(h)_1$ by a real automorphism.

