#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#import "@preview/cetz:0.2.0"
#let head(doc) = header(doc, title: "Assignment 4")
#show: head
#show: latex
#show: NumberingAfter
#show: thmrules
#show: symbol_replacing

#set page(margin: (x: 1.6cm, top: 2.5cm, bottom: 1.9cm))
#show math.equation: it => {
  if it.has("label"){
    return math.equation(block: true, numbering: "(1)", it)
  }
  else {
    it
  }
}

#show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      link(el.location(),numbering(
        "(1)",
        counter(math.equation).at(el.location()).at(0)+1
      ))
    } else {
      it
    }
}

#let lemma = lemma.with(numbering: none)
#set enum(numbering: "(a)")
= Question
<question-1>
== Statement
Suppose $mM$ is an $aleph_0$-categorical structure. Show that a subset $A seq mM^n$ is invariant under the action of $Aut(mM)$ on $mM^n$ if and only if it is definable over $nothing$
== Solution
First assume that a subset is definable, that is
$
  A = {ov(a) in mM^n : phi(ov(a))}
$
for some logical formula $phi$. Then we have for any $f in Aut(mM)$, since it is an isomorphism
$
  phi(x) <=> phi(f(x))
$
and so
$
  x in A <=> f(x) in A
$
hence $A$ is invariant.

#claim[
  The orbits of $mM^n$ under the action of $Aut(mM)$ are $p(mM)$ for complete types $p in S_n^Th(mM) (nothing)$.
]
#proof[
  Clearly $p(mM)$ is invariant under the action of $Aut(mM)$, now let $ov(a),ov(b)$ be two tuples of the same type. We have a partial isomorphism $f: ov(a) -> ov(b)$, we now will use back and forth to construct this to an automorphism. By induction we assume $A_n$ and $B_n$ have the same type, then assume we want to add $a$ to $A_n$, then $tp^mM (A_n, a)$ is a complete type. 

  Since $mM$ is $aleph_0$-categorical all its types are isolated and so $tp^mM (A_n, a)$ by a formula $phi(ov(x), y)$. Now the formula $exists y phi(ov(x),y)$ is a formula over $A_n$ which is in $tp^mM (A_n)$ and so is also in $tp^mM (B_n)$. We call $b$ the witness of this formula over $B_n$ and map $a$ to $b$ to extend the map.

  This is the construction for odd steps, for even steps we just switch $A_n$ and $B_n$. The union of these partial isomorphism is then an isomorphism $mM -> mM$ that maps $ov(a)$ to $ov(b)$.
]

Now a set is invariant if and only if it is a union of orbits, and a set is definable if and only if it is a union of complete types. Since orbits are exactly compete types then we are done.

#pagebreak(weak: true)
= Question
== Statement
Let $alpha < omega_1$ be an ordinal and let $mM$ and $mN$ be countable structures. Show that if $mM$ and $mN$ satisfy the same $cal(L)_(omega_1, omega)$-sentences of quantifier depth less or equal to $omega+alpha$, then $mM equiv_alpha mN$. Show also that if $mM equiv_alpha mN$, then $mM$ and $mN$ satisfy the same $cal(L)_(omega_1, omega)$-sentences of quantifier depth at most $alpha$.
== Solution
#claim[
  The sentences $phi^(mM)_(alpha)$ we saw in class have quantifier depth at most $omega+alpha$.
]
#proof[
  We prove by induction. We clearly see that 
  $
    phi_0^mM = and.big_(phi in Th(mM)) phi
  $
  and so since these are sentences all have finite quantifier depth we get that $qd(phi_0^mM) <= omega$.

  In the limit we have
  $
    phi_alpha^mM = and.big_(beta < alpha) phi_(beta)^mM
  $
  and so we have $qd(phi_alpha^mM) = sup(qd(phi_beta^mM)) <= sup(omega + beta) = omega + alpha$.

  In the successor step we have
  $
    phi_(alpha+1)^mM = 
    (and.big_(b in mM) exists y phi_alpha^(mM, b) (y))
    and
    (forall y or.big_(b in mM) phi_alpha^(mM, b) (y)).
  $
  and so 
  $
    qd(phi_(alpha+1)^mM) 
    &= 
    max(sup(qd(phi_alpha^(mM, b)) + 1), sup(qd(phi_alpha^(mM,b) + 1)))
    \ &=
    sup(qd(phi_alpha^(mM, b)) + 1)
    <= 
    omega + alpha + 1
  $
]


So if $mM$ and $mN$ agree on all $cal(L)_(omega_1,omega)$ sentences of quantifier depth at most $omega+alpha$ then they agree on $phi_alpha^mM$ and thus from class we know that $mM equiv_alpha mN$.

On the other hand assume that $mM equiv_alpha mN$, then we prove by induction on the structure of sentences that they satisfy the same $cal(L)_(omega_1,omega)$-sentences of quantifier depth at most $alpha$.
For standard sentences without infinite-ary logic this is trivial since $mM equiv_0 mN$ implies they have the same theory. 

If $phi = not psi$ for some $psi$ of quantifier depth at most $alpha$, then by induction
$
  mM sat psi <=> mN sat psi "implies" mM sat phi <=> mN sat phi
$
and so the statement follows.

If $phi = exists x (psi(x))$ for some $psi$, then $alpha = beta + 1$ where $psi$ is of quantifier depth at most $beta$. Then assume $phi$ holds in one model, say $mM$, then for some $a in mM$ we have that $mM sat psi(a)$. But now since $mM equiv_(alpha) mN$ then for some $b in mN$ we have $(mM, a) equiv_(beta) (mN, b)$ so by inductive hypothesis we have that $mN sat psi(b)$ so $mN sat phi$. The same proof works for the other direction.

Finally if $phi = and.big_(alpha) psi_alpha$ for $psi_alpha$ of quantifier depth at most $alpha$, then by inductive hypothesis
$
  mM sat psi_alpha <=> mN sat psi_alpha
$
and so since this is true for all $alpha$ it also holds for their conjunction and thus for $phi$.

#pagebreak(weak: true)
= Question
== Statement
Let $mM$ and $mN$ be countable structures and of the same Scott rank $alpha$.
Show that if $mN equiv_(alpha+omega) mM$, then $mN$ is isomorphic $mM$. 
== Solution
We construct the isomorphism by back and forth, by induction we will construct maps $f_n : A_n -> B_n$ such that $(mM, A_n) equiv_(alpha+1) (mN, B_n)$. For the base case this is trivial, so assume for the induction step that we have the map $f_n$.

Now we want to add a specific element $a in mM$ to $A_n$, so by definition of $equiv_(alpha+1)$ there is some element $b in mN$ such that $(mM, A_n, a) equiv_(alpha) (mN, B_n, b)$. Now we also know that $mM equiv_(alpha + n + 2) mN$ so again by definition we can pick elements $c_i in mN$ such that, if we define $C_n = { c_i : i <= n }$ then we have
$
  (mM, A_n, a) equiv_(alpha+1) (mN, C_n, c_(n+1)).
$

Now notice that
$
  (mN, B_n, b) equiv_(alpha) (mM, A_n, a) equiv_alpha (mN, C_n, c_(n+1)),
$
so we have that $(mN, B_n, b) equiv_alpha (mN, C_n, c_(n+1))$.
But since the Scott rank of $mN$ is $alpha$ then that also means that $(mN, B_n, b) equiv_(alpha+1) (mN, C_n, c_(n+1))$.

We thus have
$
  (mN, B_n, b) equiv_(alpha+1) (mN, C_n, c_(n+1)) equiv_(alpha+1) (mM, A_n, a)
$
so $(mN, B_n, b) equiv_(alpha+1) (mM, A_n, a)$ which completes the proof.

#pagebreak(weak: true)
= Question
== Statement
Show that the theory of atomless Boolean algebras has quantifier elimination.
== Solution
In assignment 3 we showed that the complete types of this theory are all isolated by the finite orders within said types. But the finite orders that isolate them are quantifier free formulas so all the complete types are isolated by quantifier free formulas. Since this is true from class we know that this theory has quantifier elimination.

#pagebreak(weak: true)
= Question
== Statement
Does every $aleph_0$-categorical theory has quantifier elimination?
== Solution
The answer is no, to see this consider the theory of dense linear orders with end points, a model of which is for example $QQ sect [0,1]$. This theory is $aleph_0$-categorical since you can construct the isomorphism by just removing the endpoints, using $aleph_0$-categoricity of dense linear orders without endpoints and then just mapping the endpoints to each other.

This theory does not have quantifier elimination, to see this simply note that this is a relational language, so all quantifier free formulas in one variable are logically equivalent to true or false. However, we have 3 different types over one element in this theory, one is the type of the interior, which is isolated by
$
  phi(x) = exists y (y > x) and exists y (y < x)
$ 
one is the type of the top endpoint which is isolated by
$
  phi(x) = forall y (not (y > x))
$
and the last one is the one of the bottom endpoint, which is isolated by
$
  phi(x) = forall y (not (y < x))
$
