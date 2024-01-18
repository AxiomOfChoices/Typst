#import "../../../Templates/generic.typ": generic
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#import "../../../Templates/assignment.typ": *
#show: doc => generic(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: doc => NumberingAfter(doc)
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
We will let $ICAB$ denote the set of statements encoding generating Let $(A, or, and, not)$ and $(B, or, and, not)$ be two models of $ICAB$.
We write $x <= y$ to denote $exists z : x or z = y$ or equivalently $exists z : y and z = x$.
First we will need a small lemma to help us.
#lemma(numbering: none)[
  Assuming $x <= y$ then for any $b$
  $
    b or x = y <=> y and (not x) <= b <= y
    \
    b and y = x <=> x <= b <= (not y) or x
  $
]
#proof[
  For the first statement we first prove the $=>$ direction, clearly since $b or x = y$ we have that $b <= y$. We also have 
  $
    b and (not x) = (b or x) and (not x) = y and (not x)
  $
  and so $y and (not x) <= b$

  For the other direction assume that $y and (not x) <= b <= y$
  then we have 
  $
    b or x <= y or y = y
  $
  and also
  $
    y = x or (y and (not x)) <= x or b
  $
  and thus $b or x = y$
]

First we will enumerate $A$ as ${a_0,a_1,...}$ and $B$ as ${b_0,b_1,...}$.
We now construct an isomorphism $f : A -> B$ with the back and forth method. Our base case will be the function $f : {0,1} -> {0,1}$ defined as identity. In the inductive case we will assume we have constructed a partial isomorphism $f_n : A_n -> B_n$ with $A_n seq A$, $B_n seq B$ and both $A_n$ and $B_n$ are boolean subalgebra (closed under $or,and,not$).
#pagebreak(weak: true)
For an even step $n = 2k$ we take $a_i$ to be the element of $A backslash A_n$ of smallest index. Now since $A_n$ is a subalgebra $a_i$ can be related to elements of $A_n$ in one of 2 ways 
  - $a_i or x = y$ for some $x,y in A_n$
  - $a_i and x = y$ for some $x,y in A_n$
We will use the previous lemma to convert all of these relations into upper and lower bounds.
  - A relation of the form $a_i or x = y$ will contribute the lower bound $l = y and (not x)$ and also contribute the upper bound $u = y$
  - A relation of the form $a_i and x = y$ contributes the upper bound $u = (not x) or y$ and the lower bound $l = y$
We then congregate all of these lower and upper bounds into a set of lower bounds $L$ and a set of upper bounds $U$, we then set $u' = min(U)$ and $l' = max(L)$.
Then all the relations of $a_i$ are completely encoded by $l' < a_j < u'$ where both $l'$ and $u'$ are in $A_n$ since its a subalgebra.
We then want to find an element $b_j$ such that $f(l') < b_j < f(u')$. 
#lemma(numbering: none)[
  Any model $mM$ of $ICAB$ is dense.
]
#proof[
  Let $x < y$ then since it is atomless there exist a nontrivial element $z$ such that $z < y and (not x)$ then $x < x or z < y$.
] 
From this lemma we can always find an appropriate $b_j$ and so we set $f(a_i) = b_j$ and then we set $A_(n+1) = angle.l A_n union {a_i} angle.r$ and then extend $f$ from $A_n union {a_i}$ to $A_(n+1)$ in the natural way.

On odd steps we do the exact same thing but from $B$ to $A$ instead.

#pagebreak(weak: true)
= Question
== Statement
Find an example of two countable structures which are elementarily equivalent but not isomorphic.

== Solution
#let suc = math.op("succ")
My two example structures are $mM = (ZZ,suc)$ and $mN = (ZZ union.sq ZZ,suc)$ where $suc$ is the _relation_ corresponding to the successor function. We think of $mN$ as consisting of two _branches_ of $ZZ$.

We can show that $mM$ and $mN$ are not isomorphic, assume that they are, then we have an isomorphism $f : |mM| -> |mN|$. Now we have $f(0) = (n,i)$ for some $(n,i)$, then we can easily see that $f(x) = (n+x,i)$ for all $x in |mM|$ due to how we define the relations. But then we have nothing that maps to $(n,1-i)$ and so we get a contradiction.

Now we need to show that they are elementarily equivalent, to show that we can use the Ehreufeucht-Fraisse Game $Gamma(mM,mN)_n$.
//
// Now our strategy will have two stages, while the spoiler has not picked any elements in $B^c$ the prover will use the map $f(x) = b + 2(x-a)$ to map the pairing elements.
//
// After the first turn when the spoiler picks an element $b' in B^c$, we will switch strategy and instead consider the current set of matched elements $A seq |mM|$, then we map $b'$ to $sup A + 3^n$, after this when we pick
//
First define the following metric on $|mN|$,
$
  d_mN ((x,i),(y,j)) = cases(|x - y| &"if" i = j \ infinity &"if" i eq.not j)
$
and define the standard metric on $|mM|$, $d_mM (x,y) = |x-y|$.

// #pagebreak(weak: true)
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

//  - If the spoiler chooses an element $a in |mM|$ with $d(a, C_i) > 3^n$ for all $i$, then the prover adds $a$ to any empty collection $C_(i_0)$, finds an element $b in |mN|$ with $d(b, D_i) >= d(a,C_i)$ for all $i$, adds $b$ to $D_(i_0)$, and finally maps $a$ to $b$.
//  - If the spoiler chooses an element $b in |mN|$ with $d(b, D_i) > 3^n$ for all $i$, then the prover adds $b$ to any empty collection $D_(i_0)$, finds an element $a in |mM|$ with $d(a, C_i) >= d(b, D_i)$ for all $i$, adds $a$ to $C_(i_0)$, and finally maps $a$ to $b$.
//  - If the spoiler chooses an element $a in |mM|$ with $d(a, C_i) <= 3^n$ for some $i$ then for some $i_0$ we have $a in N(C_i)$. As we will show shortly, $N(C_i)$ and $N(D_i)$ have the same size for the same $i$ and so can be mapped to each other monotonically. 




