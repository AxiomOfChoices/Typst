#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/cetz:0.2.0"
#let head(doc) = header(doc, title: "Assignment 6")
#show: head
#show: latex
#show: NumberingAfter
#show: thmrules
#show: symbol_replacing

#set page(margin: (x: 1.6cm, top: 2.5cm, bottom: 1.9cm))
#show math.equation: it => {
  if it.has("label") {
    return math.equation(block: true, numbering: "(1)", it)
  } else {
    it
  }
}

#show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(
      el.location(),
      numbering(
        "(1)",
        counter(math.equation).at(el.location()).at(0) + 1,
      ),
    )
  } else {
    it
  }
}

#let lemma = lemma.with(numbering: none)
#set enum(numbering: "(a)")
#let claim = claim.with(base_level: 1)

= Question
<question-1>
== Statement
Show that the computation of the Morley rank of a formula with parameters in a model $mM$ does not depend on the choice of an $aleph_0$-saturated extension of $mM$.
== Solution
Let us formalize the statement of the question.
#claim[
  If $mN_1,mN_2 succ mM$ and $mN_1,mN_2$ are $aleph_0$-saturated then for any formula $phi$ with parameters in $mM$ we have
  $
  RM_mN_1 (phi) = RM_mN_2 (phi).
  $
]
To show this is true we first show that it is enough to prove the claim
#claim[
  If $mM elm frak(C)$ and $phi$ is a formula with parameters in $mM$ then
  $
  RM_mM (phi) = RM_frak(C) (phi)
  $
]
Assume that this claim is true, then since every model embeds in the monster model we get that
$
RM_mN_1 (phi) = RM_frak(C) (phi) = RM_mN_2 (phi)
$
and so knowing the second claim proves the first claim.

Now let us prove the second claim, we denote $mN := frak(C)$ and note that $mN$ is $aleph_0$-strongly homogeneous.

We now prove
$
RM_mM (phi) >= alpha <=> RM_mN (phi) >= alpha
$
through induction on $alpha$.

The base case, $alpha = 0$, is trivial since
$
RM_mM (phi) >= 0 <=> phi(mM) != nothing
$
and since $phi(mM)$ being empty can be written as an $L$-sentence we have
$
RM_mM (phi) >= 0 <=> phi(mM) != nothing
<=>
phi(mN) != nothing <=> RM_mN (phi) >= 0
$

The limit case is also trivial by inductive hypothesis.
For the successor case assume that $RM_mM (phi) >= alpha + 1$, then there is an infinite sequence of $L(mM)$ formulas $phi_i$ that are pairwise inconsistent, imply $phi$, and have $RM_mM (phi_i) >= alpha$. The $phi_i$ are also $L(mN)$ formulas and hence by inductive hypothesis we have $RM_mN (phi_i) >= alpha$, so we also have $RM_mN (phi) >= alpha + 1$.

On the other hand assume that $RM_mN (phi) >= alpha + 1$, then for any $n$ there are $L$-formulas $phi_i (ov(x), ov(y))$ and parameters $ov(a)_i$ for $1 <= i <= n$ such that $phi_i (ov(x), ov(a)_i)$ are pairwise inconsistent, imply $phi(ov(x))$, and have $RM_mN (phi_i (ov(x), ov(a)_i)) >= alpha$. Now let $ov(c)$ be the parameters of $phi$ in $mM$ and consider
$
tp_mN (ov(a)_1 ... ov(a)_n quo ov(c))
$
since this is a type over $ov(c)$ and since $mM$ is $aleph_0$-saturated we get that there is a realization of this type in $mM$. That is there are tuples $ov(b)_i in mM$ with
$
tp_mN (ov(a)_1 ... ov(a)_n quo ov(c))
= tp_mM (ov(b)_1 ... ov(b)_n quo ov(c))
= tp_mN (ov(b)_1 ... ov(b)_n quo ov(c)).
$
Next consider the $L(mM)$-formulas $psi_i (ov(x)) := phi_i (ov(x), ov(b)_i)$, since $mN$ is $aleph_0$-strongly homogeneous there is an automorphism $f$ of $mN$ that fixes $ov(c)$ and such that $f(ov(a)_i) = ov(b)_i$. Under this automorphism the formulas $phi_i (ov(x), ov(a)_i)$ map to $phi_i (ov(x), ov(b)_i) = psi_i$. Using this we get that since $phi_i (ov(x), ov(a)_i)$ are pairwise inconsistent so are $psi_i$, since this automorphism fixes $ov(c)$ it also fixes $phi$, so since $phi_i (ov(x), ov(a)_i)$ imply $phi$ so do $psi_i$. Since we have this decomposition of $phi$ into $psi_i$'s it is enough to show that $psi_i$'s have $RM_mM (psi_i) >= alpha$.
But now Morley rank is a model theoretic property and so it is preserved under automorphisms and thus
$
RM_(mN) (psi_i) = RM_(mN) (phi_i (ov(x), ov(a)_i)) >= alpha,
$
which finishes the proof.

= Question
<question-2>
== Statement
Suppose that $tp(ov(a)) = tp(ov(b))$ and let $phi(ov(x), ov(y))$ be a formula. Show that $RM(phi(ov(x), ov(a))) = RM(phi(ov(x), ov(b)))$.
== Solution
Using @question-1 we know that we can embed $mM$ into a monster model $frak(C)$ and have
$
RM_mM (phi(ov(x), ov(a))) = RM_frak(C) (phi(ov(x), ov(a)))
"and"
RM_mM (phi(ov(x), ov(b))) = RM_frak(C) (phi(ov(x), ov(b)))
$
We now note that there is an automorphism of $frak(C)$ that maps $ov(a)$ to $ov(b)$ since it is $aleph_0$-strongly homogeneous, we thus get
$
RM_frak(C) (phi(ov(x), ov(a))) = RM_frak(C) (phi(ov(x), ov(b))),
$
and so we also get
$
RM_mM (phi(ov(x), ov(a)))
= RM_frak(C) (phi(ov(x), ov(a)))
= RM_frak(C) (phi(ov(x), ov(b)))
= RM_mM (phi(ov(x), ov(b))).
$

= Question
== Statement
Given an algebra $cal(A)$ of definable subsets of a model $mM$ we define the Morley rank over $cal(A)$ as follows. For a set $A in cal(A)$ we define
#[
  #set enum(numbering: "(i)", indent: 1em)
  + $RM_cal(A) (A) >= 0$ if $A$ is non-empty.
  + $RM_cal(A) (A) >= alpha + 1$ if there exists a sequence $B_n$ of disjoint subsets of $A$, with each $B_n in cal(A)$ and $RM_cal(A) (B_n) >= alpha$ for each $n$.
  + $RM_cal(A) (A) >= gamma$ for a limit $gamma$ if for every $beta < gamma$, $RM_cal(A) (A) >= beta$.
]

Suppose that $T$ is totally transcendental and let $frak(C) sat T$ be the monster model.
+ Find a countable set $C$ of tuples of elements of $frak(C)$ such that for every $ov(a) in C$ and every $ov(b) in frak(C)$ there exists $ov(b') in C$ such that $tp(ov(b) quo ov(a)) = tp(ov(b') quo ov(a))$.
+ Let $cal(A)$ be the algebra of sets definable over $C$. Show that for every set $A in cal(A)$ we have $RM(A) = RM_cal(A) (A)$.
+ Show that if $A in cal(A)$, then $RM_(cal(A)) (A)$ is equal to the $CB([A])$ computed in the stone space of $cal(A)$. Conclude that $RM_cal(A) (A) < omega_1$.
Conclude that $RM(x = x) < omega_1$.
== Solution
=== (a)
To find this countable set we will construct via induction a sequence of countable sets $C_n$ such that for every $ov(a) in C_n$ and every $ov(b) in frak(C)$ there exists $ov(b') in C_(n+1)$ such that
$
tp(ov(b) quo ov(a)) = tp(ov(b') quo ov(a)).
$
After constructing such a sequence, setting $C = union.big_(n) C_n$ we get a countable union of countable sets which also clearly satisfies the requirements of the question.

To construct such a sequence we start with $C_0 = { () }$, the set containing the empty tuple. Then assuming we constructed $C_n$, fix some positive natural number $m$, and consider the partition of $frak(C)^m$ given by the equivalence classes of the equivalence relation
$
ov(v) tilde ov(w) <=> tp(ov(v) quo C_n) = tp(ov(w) quo C_n).
$
Now since $T$ is totally transcendental and since $C_n$ is countable by inductive hypothesis we get that there are at most countable many equivalence classes of this relation, hence let $D_m$ be a countable set of representatives for each equivalence class. We now set
$
C_(n+1) := C_n union.big_(m) D_m.
$

Clearly $C_(n+1)$ remains countable and for any tuples $ov(a) in C_n$, $ov(b) in frak(C)^m$ we have that there is some element $ov(b') in C_(n+1)$ such that
$
tp(ov(b) quo C_n) = tp(ov(b') quo C_n),
$
and hence
$
tp(ov(b) quo ov(a)) = tp(ov(b') quo ov(a)),
$

=== (b)
Let $phi(ov(x), ov(a))$ be the formula defining $A in cal(A)$, we prove the statement by proving
$
RM(phi) >= alpha <=> RM_cal(A) (phi) >= alpha
$
through induction on $alpha$.

#remark[
  I am going to use $RM(phi), RM(A)$ as well as $RM_cal(A) (phi), RM_cal(A) (A)$ interchangeably wherever it is convenient.
]

Base case is simple, since $RM(phi) >= 0$ and $RM_cal(A) (phi) >= 0$ are both equivalent to $A$ being non-empty. The limit case is also simple by inductive hypothesis.

Now assume that $RM_cal(A) (A) >= alpha + 1$, then we have an infinite sequence of sets $A_n in cal(A)$ that are disjoint, contained in $A$ and have $RM_cal(A) (A_n) >= alpha + 1$. Since they are in $cal(A)$ they are definable over $C$ and thus also over $frak(C)$, but by inductive hypothesis we have
$
RM(A_n) = RM_cal(A) (A_n) >= alpha
$
and thus we have that $RM(A) >= alpha + 1$.

Next assume that $RM(A) >= alpha + 1$, then we have infinitely many disjoint definable sets $A_n$ contained in $A$ such that $RM(A_n) >= alpha$. Now let $phi_n (ov(x), ov(b)_n)$ be the formulas that define $A_n$, for each $ov(b)_n$ we can can, by part (a), find $ov(b'_n)$ such that for any $n$ we have
$
tp(ov(b)_n quo ov(a)) = tp(ov(b'_n) quo ov(a)).
$
Since $frak(C)$ is $kappa$-strongly homogeneous for very large enough $kappa$, we have that there exists an automorphism $f: frak(C) -> frak(C)$ such that $f$ fixes $ov(a)$, and $f(ov(b)_n) = ov(b'_n)$, since this automorphism preserves Morley rank we get that
$
alpha <= RM(phi_n (ov(x), ov(b)_n)) = RM(phi_n (ov(x), ov(b'_n)))
$
and since $ov(b'_n)$ are all in $C$, then $B_n := phi_n (ov(frak(C)), ov(b'_n))$ are all elements of $cal(A)$, so we also get by inductive hypothesis
$
RM(B_n) >= alpha <==> RM_cal(A) (B_n) >= alpha
$
and so we conclude $RM_cal(A) (B_n) >= alpha$.

Now since $f$ maps the formulas $phi_n (ov(x), ov(b)_n)$ to the formula $phi_n (ov(x), ov(b'_n))$ we get that it also maps $A_n$ onto $B_n$. We hence know that $B_n$'s are disjoint since $A_n$'s are disjoint, then since $f$ fixes $ov(a)$ we get that the set $A$ is invariant under $f$ and so $B_n = f(A_n) seq f(A) = A$.

We now know that we have a sequence of subsets $B_n$ of $A$, which are disjoint and each have $RM_cal(A) (B_n) >= alpha$, so we get that $RM_cal(A) (A) >= alpha + 1$.

=== (c)
First note that the stone space $S(cal(A))$ is indeed a $0$-dimensional topological space, since the open sets $[A]$ forming its basis are closed since $[A]^c = [A^c]$. From here the definition given in the question is identical to the Cantor-Bendixson rank we defined in class for clopen subsets of a $0$-dimensional topological space.

Then since $T$ is totally transcendental and $S(cal(A))$ is in correspondence with $S_n (C)$ then we know that $|S(cal(A))| <= aleph_0$. Next since $T$ is totally transcendental we saw in class that
$
CB([frak(C)]) = RM_cal(A) (frak(C)) = RM (frak(C)) = RM (x = x) < infinity.
$
and so the Cantor-Bendixson derivatives of $S(cal(A))$ never stabilize and so every step removes at least one point. Now since the Cantor-Bendixson rank's image always contains an initial segment of ordinals we get that
$
CB : S(cal(A)) -> {alpha : alpha <= RM(x = x)}
$
is surjective. Hence we have
$
|{alpha : alpha <= RM(x = x)}| <= |S(cal(A))| <= aleph_0
$
and this is only possible if $RM(x = x) < omega_1$.

= Question
== Statement
Let $K$ be an algebraically closed field and $k$ its subfield. Describe the spaces $S_n (k)$ in terms of the spectrum (the set of all prime ideals) of polynomial rings. Which types in $S_1(k)$ are algebraic?

== Solution
Consider a complete type $p in S_n (k)$, for every polynomial $f$ in $n$ we know that either
$
f(ov(x)) = 0 in p "or" not (f(ov(x)) = 0) in p.
$
Since we want to connect these to prime ideals we would hope that the set of vanishing polynomials on the type are a prime ideal of polynomials, which is exactly the case. Set
$
Z(p) = {f "polynomial over" k : f(ov(x)) in p}
$
then for any $f,g in k[ov(x)]$ we have
$
K sat (f(ov(x)) = 0) and (g(ov(x)) = 0) => (f(ov(x)) + g(ov(x)) = 0)
$
so $V(p)$ is is additive. Additionally we have
$
K sat (f(ov(x)) = 0) or (g(ov(x)) = 0) <=> f(ov(x)) g(ov(x)) = 0
$
and so $V(p)$ is either an ideal or empty, and if it is an ideal it is a prime ideal in $k[ov(x)]$.

Now the converse is also true, every prime ideal also corresponds to a type. Let $I$ be a prime ideal of $k[ov(x)]$, then consider the type
$
W(I) = {f(ov(x)) = 0 : f in I}
$
this is not yet a complete type but we can take all the conclusions of this type to complete it. This is because $A C F_p$ has quantifier elimination so every formula is equivalent to boolean combination of polynomials, so the truth value of every formula can be derived from just the formulas in the set above. We also map the 'empty' ideal to the complete type of a transcendental number over $k$.

We can see that these two operations are inverses of each other, and so complete types in $S_n (k)$ are in correspondence with prime ideals of $k[ov(x)]$.

Now let us specifically consider $S_1 (k)$, take an algebraic type $p$ and consider its corresponding prime ideal $Z(p)$. Since this is an ideal in $k[x]$, which is a PID, then there is a polynomial $f$ such that $Z(p) = (f)$. Now since $Z(p)$ is a prime ideal we also know that $f$ is irreducible and thus is either linear has no roots of $k$. If it is linear then its only root is just an element of $k$ which is trivially algebraic, hence we can assume that $f$ is at least quadratic and has no roots in $k$. Now $K$ is algebraically closed so $f$ factors as
$
f = product_i (x - alpha_i)
$
for some $alpha_i in K backslash k$, since $f$ is irreducible over $k$ then the polynomials $f$ are minimal polynomials for $alpha_i$ and so all $alpha_i$ are in the algebraic closure $ov(k)$. Conversely for any element $ov(x)$ in the algebraic closure, its minimal polynomial is irreducible and thus generates a prime ideal. We thus have that the algebraic types in $S_1 (k)$ are exactly the types of elements of the algebraic closure of $k$.

= Question
<question-5>
== Statement
Show that any algebraic type is isolated.
== Solution
Let $p$ be an algebraic type, from class then we know that there is an algebraic formula $phi$ such that $phi in p$.
Now take some model $mM sat T$ and consider the sets $A := phi(mM)$ and $B := p(mM)$. Both of these sets are finite, and we also have
$
B = A sect.big_(psi in p) psi(mM).
$
Now since $A$ is finite then $A backslash B$ is finite so enumerate it as ${ov(x)_1,...,ov(x)_n}$, then by the equation above, for each $ov(x)_i$, there is a formula $psi_i in p$ such that $mM tack.r.double.not psi_i (ov(x)_i)$.

Now this means that
$
(phi and.big_(i <= n) psi_i)(mM) seq B,
$
but also we know that anything in $B$ satisfies all of these formulas so we get
$
B seq (phi and.big_(i <= n) psi_i)(mM)
$
and so $phi and.big_(i <= n) psi_i$ isolates $p$.

= Question
== Statement
Find an example of a minimal but not strongly minimal structure.
== Solution
Consider the structure $(S, <)$ where $S = omega_0 union.sq omega_0^-$ where $omega_0$ has the standard well order, $omega_0^-$ has the reverse order, and every element of $omega_0^-$ is larger than every element of $omega_0$. I am certain the formula $x = x$ in this model is a minimal formula, but I am not entirely sure how to prove it.

Now consider the collection of formulas
$
q(ov(x)) = {n < x : x in omega_0} union {x < m : m in omega_0^-},
$
this is clearly finitely satisfiable in $(S, <)$ and thus constitutes a type. Let $(S', <)$ denote any elementary extension which implements this type, let $y$ be the realization of this type. We now show that the formula $x = x$ is not minimal in this structure. Consider the formula $phi(z) = z < y$, we know that $phi(S')$ contains $omega_0$ while its complement contains $omega_0^-$ so neither are finite. This finishes the proof.

= Question
<question-7>
== Statement
Given a tuple $ov(a)$ and a set of parameters $A$ we write $RM(ov(a) quo A)$ for the Morley rank of $tp(ov(a)quo A)$.

Suppose $b$ is algebraic over $A ov(a)$. Show that $RM(ov(a)b quo A) = RM(ov(a) quo A)$.
== Solution
First recall that by @question-5 since $b$ is algebraic over $A ov(a)$ it is also isolated over $A ov(a)$ and thus there is a formula $phi(x, ov(a), ov(c))$ where $ov(c) in A$ that isolates $tp(b quo A ov(a))$.

We now show that $RM(ov(a) quo A) <= RM(ov(a) b quo A)$, to see this, for any formula $psi(ov(y), ov(x))$ we define the following operation
$
pi(psi)(ov(y)) = exists x (phi(x, ov(y), ov(c)) and psi(ov(y), x)).
$
#claim[
  As long as $psi_i$ each imply $exists x phi(x, ov(y), ov(c))$, $pi$ does not increase $RM$.
]
#proof[
  We prove by induction that
  $
  RM(pi(psi)) >= alpha => RM(psi) >= alpha,
  $
  this is clear for when $alpha = 0$, if $pi(psi)(ov(a)')$ for some $ov(a)'$ then there exists an $x$ such that $psi(ov(y), x)$. The limit step is also clear.
  
  Now assume that $RM(pi(psi)) >= alpha + 1$, then there are formulas $psi_i$ that are pairwise inconsistent, all imply $pi(psi)$, and have $RM(psi_i) >= alpha$. Then consider the formulas $psi_i'$ defined by
  $
  psi_i' (ov(y), x) = phi(x, ov(y), ov(c)) and psi_i (ov(y)),
  $
  these are clearly also pairwise inconsistent and imply $psi$. Furthermore we have
  $
  pi(psi_i') (ov(y))
  &= exists x (phi(x, ov(y), ov(c)) and psi_i'(ov(y), x))
  = exists x (phi(x, ov(y), ov(c)) and phi(x, ov(y), ov(c)) and psi_i (ov(y)))
  \ &<=> psi_i (ov(y)) and (exists x phi(x, ov(y), ov(c)))
  => psi_i (ov(y))
  $
  and thus by inductive hypothesis we have that $alpha <= RM(psi_i) <= RM(psi_i')$ and thus we get $RM(psi) >= alpha + 1$.
]
Now from class we know that there is a formula $psi(x, ov(y), ov(c))$ such that $RM(psi) = RM(ov(a) b quo A)$. Since $exists x phi(x, ov(y), ov(c))$ is true for $ov(a)b$ we can replace $psi$ with $psi and (exists x phi(x, ov(y), ov(c)))$ and thus assume WLOG that $psi => exists x phi(x, ov(y), ov(c))$. Then applying the above claim to it we get that
$
RM(pi(psi)) <= RM(ov(a) b quo A),
$
but now $pi(psi)$ is in $tp(ov(a) quo A)$ almost directly by definition, so we get
$
RM(ov(a) quo A) = min {
  RM(sigma) : sigma in tp (ov(a) quo A)
} <= RM(pi(psi)) <= RM(ov(a) b quo A).
$

Next we need to show that $RM(ov(a) b quo A) <= RM(ov(a) quo A)$. By an inductive argument similar to the above we may assume that $RM(ov(a) quo A) = alpha$ and $RM(ov(a) b quo A) >= alpha + 1$. Now let us pick a formula $theta$ which matches the rank of $ov(a)$, and we then work with the formula
$
psi(ov(y), x) := theta(ov(y)) and phi(x, ov(y), ov(c)) and |{
  x : phi(x, ov(y), ov(c))
}| = n.
$
Since $psi in tp(ov(a) b quo A)$ we have that $RM(psi) >= RM(ov(a) b quo A)$ so we let $psi_i$ be formulas that are pairwise inconsistent, imply $psi$ and have $RM(psi_i) >= alpha$.

Now from class we know that there exist elements $ov(a)_i b_i$ such that $RM(psi_i) = RM(ov(a)_i b_i quo A)$, then by induction we know that $RM(ov(a)_i b_i) = RM(ov(a)_i)$ and so since $pi(psi_i)$ is satisfied by $ov(a)_i$ then
$
RM(pi(psi_i)) >= RM(psi_i) >= alpha
$
#claim[
  There is a sequence $psi_n_i$ such that $and.big_(i <= m) pi(psi_n_i)$ is non empty in $S_n (A)$ for all $m in NN$.
]
#proof[
  Assume this is not the case, then form a graph $G$ with vertices $psi_i$ and an edge between $psi_i$ and $psi_j$ if their images under $pi$ intersect. By Ramsey's theorem for infinite graphs this graph either contains an infinite clique or an infinite independent set. An infinite clique corresponds to exactly the sequence we want so assume for a contradiction that we have an infinite independent set.
  
  Such an infinite independent set then corresponds to pairwise inconsistent formulas $pi(psi_n_j)$ that imply $theta(ov(y))$. Then since $RM(pi(psi_n_i)) >= alpha$ we have $RM(theta) >= alpha + 1$ which contradicts our assumption that $RM(theta) = alpha$.
]
Since $S_n (A)$ is compact this intersection of closed sets is non-empty and thus there is a type $p$ with $pi(psi_n_i) in p$ for all $i$. But then we are working in the Monster model so this type is realized by an element $ov(g)$. Then by construction there are elements $d_i$ such that $psi_n_i (ov(g), d_i)$ is satisfied for all $i$, but since $psi_n_i$ are pairwise inconsistent the $d_i$ are all distinct, but since $psi_n_i (ov(g), d_i)$ all imply $|{ x : phi(x, ov(g), ov(c))}| = n$ this is a contradiction, which proves that $RM(theta) >= alpha + 1$.

= Question
== Statement
Show that in strongly minimal structures we have $dim(ov(a) quo A) = RM(ov(a) quo A)$.
== Solution
We prove by induction that
$
dim(ov(a) quo A) = n <=> RM(ov(a) quo A) = n
$
for all ordinals $n$.

For $n = 0$ this is trivial since $RM(ov(a) quo A) = 0$ is equivalent to $ov(a)$ being algebraic over $A$ which is equivalent to $dim(ov(a) quo A) = 0$.

We now prove this for $n$ assuming it holds for $n-1$, by @question-7 we may WLOG assume that the $a_i$ are all independent since removing the non-independent ones does not change rank or dimension. Then we have that the dimension of $ov(a)$ is just its length, which we will assume to be $n$.

We now prove that $RM(ov(a) quo A) >= n$, then let $phi(ov(x))$ be a formula that matches this rank, set $ov(a)'$ to be all the elements of $ov(a)$ besides the first one, and let $b_i$ such that $tp(b_i quo ov(a)' A) = tp(ov(a) quo A)$, then consider the formulas $psi_i = phi(ov(x)) and x_1 = b_i$, then by @question-2 we know that
$
RM(psi_i) >= RM(b_i, ov(a)' quo A) = RM(ov(a)' quo A).
$
Now $RM(ov(a)' quo A)$ is $n - 1$ by induction and clearly $psi_i$ are pairwise inconsistent and imply $phi$ so $RM(phi)>= n$.

Next we prove that $RM(ov(a) quo A) <= n$, we again let $phi(ov(x))$ be a formula that matches this rank and we assume for a contradiction that $RM(phi) >= n+1$, then there is a formula $psi$ which is false for $ov(a)$, implies $phi$ and has $RM(psi) >= n$. Let $ov(b)$ realize $psi$ then since $tp(ov(a)) != tp(ov(b))$ we have that $ov(b)$ is dependent so we have $dim(ov(b) quo A) <= n - 1$ and thus by induction we know that $RM(ov(b)) <= n - 1$. But now this is true for all realizations, so since $RM(psi)$ is the maximum of the ranks of its realizations we get that $RM(psi) <= n - 1$ which contradicts its construction.

