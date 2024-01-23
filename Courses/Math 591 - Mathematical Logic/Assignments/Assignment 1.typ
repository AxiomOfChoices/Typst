#import "../../../Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#import "../../../Templates/assignment.typ": *
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}
#let sat = $tack.r.double$
#let satn = $tack.r.double.not$
#let proves = $tack.r$
#let subm = $lt.curly$
#let Th = math.op("Th")
#let mM = $cal(M)$
#let mN = $cal(N)$
#let bar(el) = $overline(#el)$
#let subs(a, b) = { return $attach(slash, tl: #a, br: #b)$ }
= Question
== Statement
A language is functional if it has no relational symbols. Find an example of two structures $mM$, $mN$ in a functional language such that $mM equiv mN$, $mM seq mN$ but $mM$ is not an elementary substructure of $mN$.

== Solution
Consider for the language $L = (+)$ the two $L$-structures $mM = (ZZ, +)$ and $mN = (ZZ / 2, +)$, it is clear that $mM seq mN$ and since $mM tilde.eq mN$ by the function $g(x) : |mN| -> |mM|$ defined by $g(x) = 2x$ then we have that $mM equiv mN$. 

To see that it is not an elementary substructure consider the formula $ phi(y) = exists x thin (x + x = y) $
then we have $mN sat phi(1)$ but $mM satn phi(1)$, and so $mM$ is not an elementary substructure of $mN$.

#pagebreak(weak: true)

= Question
== Statement
Let $L = (+,0)$ be the language of groups. Is $(ZZ,+,0)$ elementarily equivalent to $(ZZ^2,+,0)$?

== Solution
No, consider the statement $exists z (forall y (exists x (y = x + x or y = x + x + z)))$, it essentially says that every element of the universe is either odd or even once we let $z = 1$. This statement holds in $ZZ$, we now prove that it doesn't hold in $ZZ^2$. Consider the set $A_z seq ZZ^2$ defined by 
$
  A_z = { y in ZZ^2 | exists x in ZZ^2 (y = x + x or y = x + x + z) }
$
now consider the image of $A_z$ under taking mod $2 ZZ^2$, we can easily see that it is equal to 
$
  A_z mod 2 ZZ^2 = {0, z mod 2 ZZ^2}
$
and thus always has cardinality 2. But $ZZ^2 mod 2 ZZ^2$ has cardinality $4$, so we can't hit every element. Thus the statement does not hold in $ZZ^2$ and so they have different theories.

#pagebreak(weak: true)

= Question
== Statement
Let $mM$ be a finite structure in a finite language. Find a sentence $sigma$ such that if $mN sat sigma$, then $mN tilde.eq mM$.

== Solution
First enumerate the elements of $|mM|$ as $a_1,...,a_n$. First we want to make sure that $mN$ contains 'copies' of these elements. We thus construct the statement 
$
  exists y_1 thin exists y_2 thin ... thin exists y_n 
  thin
  and.big_(i eq.not j) (y_i eq.not y_j)
  thin
  and
  (forall z thin 
  or.big_i (z = y_i))
$
we then need to check that all functions map as we expect, for any function $f_j$ with arity $k_j$ define the auxiliary function $i(j,c_1,c_2,...,c_(k_j))$ implicitly by
$
  a_(i(j,c_1,c_2,...,c_(k_j))) = f_j^mM (a_(c_1), a_(c_2), ..., a_(c_(k_j))) 
$
it is essentially the index translation of $f_j$. We then have the formula
$
  S F = and.big_(f_j) (and.big_((c_1,...,c_(k_j)) in [n]^(k_j)) (y_(i(j,c_1,c_2,...,c_(k_j))) = f_j (y_(c_1), y_(c_2), ..., y_(c_(k_j))))).
$
For the relations $R_j$ with arity $p_j$, we define also the index set 
$
  I_j = {(c_1,...,c_(p_j)) in [n]^(p_j)| (a_(c_1),...,a_(c_(p_j))) in R_j^mM}
$
and then add the formula
$
  S R = and.big_(R_j) (
    (and.big_((c_1,...,c_k) in I_j) (y_(c_1),...,y_(c_k)) in R_j)
    and 
    (and.big_((c_1,...,c_k) in.not I_j) (y_(c_1),...,y_(c_k)) in.not R_j)
  ).
$
Finally, for the constants $c_ell$, we define $j(ell)$ also implicitly by 
$
  a_(j(ell)) = c_ell^mM
$
and then add the formula 
$
  S C = and.big_(c_ell) (
      y_(j(ell)) = c_ell
    )
$
Finally then, our statement $sigma$ is 
$
   sigma = exists y_1 thin exists y_2 thin ... thin exists y_n 
  thin
  (and.big_(i eq.not j) (y_i eq.not y_j)
  thin
  and
  (forall z thin 
  or.big_i (z = y_i))
  and 
  S F
  and
  S R
  and
  S C)
$
If this statement holds then the map $a_i -> y_i$ will form an isomorphism.
#pagebreak(weak: true)

= Question
== Statement
Show that the theory of the infinite countable atomless Boolean algebra is $aleph_0$-categorical.

== Solution
#let ICAB = $I C A B$
We will let $ICAB$ denote the set of statements encoding an infinite countable atomless Boolean algebra.
Let $(A, or, and, not)$ and $(B, or, and, not)$ be two models of $ICAB$.
// We write $x <= y$ to denote $x or y = y$ or equivalently $y and x = x$. It is trivially a partial order on the universe.

We will find an isomorphism between the two using a modified back-and-forth method. We will construct a partial isomorphism $f_n : A_n -> B_n$ in steps where at each step $n$ we have $A_n$ is a finite subalgebra of $A$ and $B_n$ is a finite subalgebra of $B$. At step $0$ we start with the trivial subalgebra ${0,1}$ for both $A_0$ and $B_0$, and we induct as follows.

First note that $A_(n-1),B_(n-1)$ are both atomic since they are finite and thus have bases of atoms ${a_1,...,a_k}, {b_1,...,b_k}$ such that $f_(n-1)(a_i) = b_i$. On even steps we want to add an element $a in A backslash A_(n-1)$ to $A_(n-1)$, extend the map $f_(n-1)$ to map $a$ to some element $b in B$, and then extend it naturally on $A_n := angle.l a,A_(n-1) angle.r$, giving us $f_n$. On even steps we want to do the same but swapping $B$ and $A$.

The key part here is finding an appropriate element $b$ that related to $B_(n-1)$ in the same way that $a$ related to $A_(n-1)$. Our atoms then will be quite helpful as the relations of $a$ with the atoms $a_i$ will encode all the information we need. In particular, there are only 3 ways in which $a$ can relate to a given basis element $a_i$, these are
$
  phi_1(a,a_i) &= (a and a_i = 0) "or" \
  phi_2(a,a_i) &= (0 < a and a_i < a_i) "or"\
  phi_3(a,a_i) &= (a and a_i = a_i).
$
It is easy to see that one of these formulas must hold for every $i$. We can then say that for some indices $c_i in {1,2,3}$ we have that the statement
$
  and.big_(i in [k]) phi_(c_i) (a, a_i)
$
holds true.
Our job then becomes to find an element $b in B$ such that the statement
$
  and.big_(i in [k]) phi_(c_i) (b, f_(n-1) (a_i))
$
is true. This is quite simple, for each $i$, if $c_i = 1$ we set $d_i = 0$, if $c_i = 2$ we use atomlessness to set $d_i$ to be anything satisfying with $d_i < f(a_i)$, if $c_i = 3$ we set $d_i = f(a_i)$. Finally we just union the $d_i$'s together and that will be our desired $b$.

#pagebreak(weak: true)
= Question
== Statement
Find an example of two countable structures which are elementarily equivalent but not isomorphic.

== Solution
#let suc = math.op("succ")

=== Normal example
#let clos = math.op("closure")
Language of algebraically closed fields, we have $clos(QQ) tilde.eq.not clos(QQ[pi])$ but since the theory is complete they are both elementarily equivalent.

=== Cursed example

My two example structures are $mM = (ZZ,suc)$ and $mN = (ZZ union.sq ZZ,suc)$ where $suc$ is the _relation_ corresponding to the successor function. We think of $mN$ as consisting of two _branches_ of $ZZ$.

We can show that $mM$ and $mN$ are not isomorphic, assume that they are, then we have an isomorphism $f : |mM| -> |mN|$. Now we have $f(0) = (n,i)$ for some $(n,i)$, then we can easily see that $f(x) = (n+x,i)$ for all $x in |mM|$ due to how we define the relations. But then we have nothing that maps to $(n,1-i)$ and so we get a contradiction.

Now we need to show that they are elementarily equivalent, to show that we can use the Ehreufeucht-Fraisse Game $Gamma(mM,mN)_n$.

First define the following metric on $|mN|$,
$
  d_mN ((x,i),(y,j)) = cases(|x - y| &"if" i = j \ infinity &"if" i eq.not j)
$
and define the standard metric on $|mM|$, $d_mM (x,y) = |x-y|$.

Now we construct the winning strategy for the prover, we will denote by $A_k$ the current paired elements of $|mM|$, by $B_k$ the current paired elements of $|mN|$ and by $f_k$ the current partial isomorphism.

At step $k$, if the spoiler picks $a in |mM|$, we first check if $d(a, A_k) > 2^(n-k)$. 
  - If it is then we pick some $b in |mN|$ such that $d(b,B_k) >= d(a,A_k)$ and pair $a$ with $b$, that is we set $f_(k+1)(a) = b$.
  - If instead we have $d(a,A_k) <= 2^(n-k)$ then let $a_i$ be the closest element of $A_k$ to $a$. Then if $f_k (a_i) = (n,j)$ then we set $f_(k+1)(a) = (n - a_i + a, j)$.
If the spoiler picks $b in |mM|$, we first check if $d(b, B_k) > 2^(n-k)$
  - If it is then we pick some $a in |mM|$ such that $d(a,A_k) >= d(b,B_k)$ and pair $a$ with $b$, that is we set $f_(k+1)(a) = b$.
  - If instead we have $d(b, B_k) <= 2^(n-k)$ then let $b_i$ be the closest element of $B_k$ to $b$. Since their distance is not infinity we have that both $b$ and $b_i$ are in the same branch so we have $b = (n,j), b_i = (n_i,j)$ for some $j$. Then since $b_i in B_k$ we have $f_k (a_i) = b_i$ for some $a_i in A_k$. We then set $f(a_i - n_i + n) = b$.

We now prove that this process is well defined (it might not be since in the second case there is no immediate guarantee that $(n - a_i + a,j)$ isn't already in the image of something), and that it results in a partial isomorphism.

#lemma(numbering: none)[
  We say that a pairing $(a,b)$ is _related_ to a pairing $(a',b')$ if $b$ and $b'$ are in the same branch and $a' - a = b' - b$, we write this as $(a,b) R (a',b')$.

  If at step $k$ the pairing $(a,b)$ was added then we have 
  $
    (a,b) cancel(R) (a',b') => d(a,a') >= 2^(n-k) and d(b,b') >= 2^(n-k)
  $
  for all pairings $(a',b')$ already in $f_k$.
]
#proof[
  We prove by induction, at the start we have no pairings $(a',b')$ so this statement holds trivially. Now assume that this is true at step $k - 1$. 
  - If the pair $(a,b)$ is added as in the first or third case then they might not be related to any other pairing but both $a$ and $b$ are at least $2^(n-k)$ distance away from all other elements of $A_n,B_n$.
  - If the pair $(a,b)$ is added as in the second or fourth case case, then by construction they are related to $(a_i, f_k (a_i))$. We can also easily see that $R$ is transitive and so
    $
      (a, b) cancel(R) (a',b') &=> (a_i,f_k (a_i)) cancel(R) (a',b') 
      \ &=> d(a_i, a') >= 2^(n-k+1) and d(f_k (a_i),b') >= 2^(n-k+1)
    $
    by inductive hypothesis. But now by construction we have 
    $
      d(a, a_i) <= 2^(n-k) and d(b, f_k (a_i)) <= 2^(n-k)
    $
    and so by inverse triangle inequality we get 
    $
      d(a,a') >= 2^(n-k) and d(b, b') >= 2^(n-k)
    $
    which is precisely what we wanted to show.
]

Now this immediately proves that the construction is well defined since if $(n - a_i + a, j)$ is already mapped to by something in the second case then that pairing cannot be related to $(a, f_k (a))$ and thus must be further than $2^(n-k)$ from $f_k (a)$ and which contradicts the fact that $|a - a_i| <= 2^(n-k)$.

This also proves that the end result is a partial isomorphism, to see this note that being a partial isomorphism in this language is equivalent to the statement
$
  forall a thin forall a' (d(a,a') <= 1 or d(f(a), f(a')) <= 1 => (a, f(a)) R (a', f(a')))
$
Now notice that the lemma's statement only applies to the last placed pair, but for all the other pairs their distance to their closest unrelated pair can only decrease if a new pair is placed so in fact the lemma holds for all the pairs that exist at step $k$.

But after this modification, the lemma when applied with step $n = k$ is exactly the contrapositive of the statement above.

