#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#import "@preview/cetz:0.2.0"
#let head(doc) = header(doc, title: "Assignment 3")
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
A model $mM$ of a theory $T$ is called existentially closed if whenever $sigma$ is an existential $L(mM)$-sentence satisfied in a model $mN sat T$ containing $mM$, then $mM sat sigma$.

Show that the following are equivalent for a theory $T$:
  + all models of $T$ are existentially closed,
  + for every formula $phi(ov(x))$ there exists a universal formula $psi(ov(x))$ such that $T proves forall ov(x) (phi(ov(x)) <-> psi(ov(x)))$
== Solution
The backwards direction is simple, let $sigma(ov(c)) = exists ov(y) (phi(ov(c), ov(y))) $ be an existential $(|mM)$-sentence for some model $mM sat T$, where $ov(c)$ are the constants coming from $mM$. Now if for some model $mN sat T$ that contains $mM$ we have $mN sat sigma$, then by assumption there exists a universal formula $psi(ov(c))$ such that $T proves forall ov(c) (exists ov(y)(phi(ov(c),ov(y))) <-> psi(ov(c)))$ and so $mN sat psi(ov(c))$. But now $phi(ov(c))$ is a universal statement so since $ov(c) in mM$ then since universal statements are closed downwards then $mM sat phi(ov(c))$ and thus by using the assumption again $mM sat exists ov(y) (phi(ov(c),ov(y))$ and thus $mM sat sigma(ov(c))$.

Now the forward direction is tricky, first we can assume that $phi(ov(c))$ being true is consistent since otherwise it is equivalent to a false statement. Now let us first prove a lemma.
#lemma[
  Let $phi(ov(x))$ be a closed formula, meaning that if $mN sat T$ is a model containing $mM sat T$ then $mN sat phi(ov(a)) => mM sat phi(ov(a))$ for all $a in mM$. Then $T proves forall ov(x) (phi(ov(x)) <-> psi(ov(x)))$ for some universal formula $psi(ov(x))$.
]
#proof[
  Add a constant $c$ to the language $L$ and set $T' = angle.l T, phi(ov(c)) angle.r$ to be the theory closure of $T$ and $phi(ov(c))$. Assume then that $mM sat T'_forall$, then by assignment 2 there is some model $mN sat T'$ that contains $mM$. Then $mN sat phi(ov(c))$, but now since it is a closed formula $mM sat phi(ov(c))$ and so $T'_forall proves phi(ov(c))$. Then by definition, there is a finite collection of universal sentences $psi_i (ov(c))$ with
  $
    T union {psi_i (ov(c)) : i <= n } proves phi(ov(c)).
  $
  Then since a conjunction of universal sentences is also universal and so if we set $Phi (ov(c)) = and.big_i psi_i (ov(c))$ then $Phi (ov(c))$ is universal and
  $
    T proves Phi(ov(c)) -> phi(ov(c)).
  $
  On the other hand since $Phi (ov(c))$ is in $T'$ then $T union { phi(ov(c)) } proves Phi(ov(c))$ and so
  $
    T proves phi(ov(c)) -> Phi(ov(c)).
  $
  Thus $T proves phi(ov(c)) <-> Phi(ov(c))$. But since $T$ doesn't know anything about $ov(c)$ we can use the Model Theory Eraser™️ to replace it with a variable $ov(x)$ and take a universal quantifier.
]

We now prove the statement with induction on the number of quantifiers in the normal form of the formula $phi(ov(x))$
#pagebreak(weak: true)
=== Base case
If $phi(ov(x))$ is existential, since every model of $T$ is existential closed, $phi(ov(x))$ is closed and thus by the lemma above we are done.

=== Universal Quantifier
Assume that $phi(ov(x)) = forall ov(y) (phi'(ov(x),ov(y)))$, then by inductive hypothesis applied to $phi'$,
$
  T proves forall ov(y) forall ov(x) (phi'(ov(x), ov(y)) <-> psi(ov(x),ov(y)))
$
and so as a consequence of this
$
  T proves forall ov(x) (forall ov(y) (phi'(ov(x), ov(y))) <-> forall ov(y) (psi(ov(x),ov(y))))
$
now $forall ov(y) (psi(ov(x),ov(y)))$ is still universal and so we are done.
=== Existential Quantifier
Assume instead that $phi(ov(x)) = exists ov(y) (phi'(ov(x), ov(y)))$, again by inductive hypothesis, now applied to $not phi'$,
$
  T proves forall ov(y) forall ov(x) (not phi'(ov(x), ov(y)) <-> psi(ov(x),ov(y)))
$
for some universal formula $psi$.
Now as a consequence of this
$
  T proves forall ov(x) (forall ov(y) (not phi'(ov(x),ov(y))) <-> forall ov(y) (psi(ov(x),ov(y))))
$
and so since $p <-> q$ is equivalent to $not p <-> not q$ we get
$
  T proves forall ov(x) (exists ov(y) (phi'(ov(x),ov(y))) <-> exists ov(y) (not psi(ov(x),ov(y)))).
$
But now $exists ov(y) (not psi(ov(x),ov(y)))$ is an existential formula and so by base case, we have for some universal formula $phi'$
$
  T proves forall ov(x) (exists ov(y) (not psi(ov(x),ov(y))) <-> phi'(ov(x)))
$
and so we also have
$
  T proves forall ov(x) (phi(ov(x)) <-> phi'(ov(x)))
$

#pagebreak(weak: true)

= Question
== Statement
A theory is called Model Complete if for any two models $mM, mN sat T$, if $mM$ is a substructure of $mN$, then $mM elm mN$.

Show that a theory $T$ is model complete if and only if every model of $T$ is existentially closed.
== Solution
Assume that $T$ is model complete, let $mM sat T$ and $sigma(ov(a))$ is an existential $L(mM)$ sentence, then if for some $mN sat T$ containing $mM$ we have $mN sat sigma(ov(a))$ then by model completeness we have $mM elm mN$ and thus $mM sat sigma(ov(a))$. Thus $mM$ is existentially closed.

On the other hand assume that all models of $T$ are existentially closed, assume that $mM,mN sat T$ with $mM seq mN$ then by @question-1 we have that for any $L(mM)$-sentence $sigma(ov(c))$
$
  T proves forall ov(x) (sigma(ov(x)) <-> psi(ov(x)))
$
for some universal formula $psi$. But then $mN sat sigma(ov(a))$ means that $mN sat psi(ov(a))$ and so since universal formulas are closed downwards $mM sat psi(ov(a))$ and so $mM sat sigma(ov(a))$. Thus we have 
$
  mN sat sigma(ov(a)) => mN sat sigma(ov(a)).
$
<eqn-1>
For the other direction, again by @question-1, now applied to $not sigma(ov(a))$, we get
$
  T proves forall ov(x) (not sigma(ov(x)) <-> psi(ov(x)))
$
for some universal statement $psi$. But then by negating inside the brackets we get
$
  T proves forall ov(x) (sigma(ov(x)) <-> not psi(ov(x))).
$
Now $not psi$ is an existential formula which means it is closed upwards so $mM sat sigma(ov(a))$ means that $mM sat not psi(ov(x))$ and so $mN sat not psi(ov(x))$ and finally $mN sat sigma(ov(a))$. We have thus showed that 
$
  mM sat sigma(ov(a)) => mN sat sigma(ov(a))
$
and so together with @eqn-1 this proves that $mM elm mN$.

#pagebreak(weak: true)

= Question
<question-3>
== Statement
Describe the complete $n$-types over the empty set for the theory of dense linear orders without endpoints.
== Solution
I will claim that this set of complete $n$-types is in correspondence with the set of finite linear orders on at most $n$ elements.
To see this we will need the following simple lemma to reframe our question.
#lemma[
  For two complete $n$ types $p_1(x_1,...x_n)$ and $p_2(x_1,...x_n)$ over the empty set in a theory $T$, $p_1 = p_2$ if and only if for every two models $mM sat p_1$, $mN sat p_2$, $mM$ and $mN$ are elementarily equivalent as models over the language $L(a_1,...a_n)$.
]
<lemma-elem_equiv>
#proof[
  Since the types are complete we know that
  $
  Th_(L(a_1,...,a_n)) (mM) = p_1
  "and" 
  Th_(L(a_1,...,a_n))(mN) = p_2.
  $
  The statement then follow trivially.
]
Our plan is now to get the correspondence as in the following diagram
#block(width: 100%)[
  #set align(center)
  #cetz.canvas({
  import cetz.draw: *
  set-style(mark: (end: ">"))
  content((0,0), box(inset: 3pt)[Start with type $p$ on $a_1,...,a_n$], name: "top left")
  content((0,-1.5), box(inset: 3pt)[Check for each $i,j$ if $a_i < a_j$ or $a_j < a_i$ or neither], name: "middle left")
  content((0,-3), box(inset: 3pt)[Get ordering on some set of size at most $n$], name: "bottom left")

  content((7,0), box(inset: 3pt)[Start with order on $A$], name: "top right")
  content((7,-1.5), box(inset: 3pt)[Realize $A$ as $A seq QQ$], name: "middle right")
  content((7,-3), box(inset: 3pt)[Get type $tp_n^QQ (A)$], name: "bottom right")

  line((name: "top left", anchor: "south"), (name: "middle left", anchor: "north"))
  line((name: "middle left", anchor: "south"), (name: "bottom left", anchor: "north"))
  line((name: "top right", anchor: "south"), (name: "middle right", anchor: "north"))
  line((name: "middle right", anchor: "south"), (name: "bottom right", anchor: "north"))
})]
Now clearly for any finite linear order on some set $A$ with $|A| <= n$, the order is realized on some finite subset of $QQ$. Now set $a_1,...,a_n$ to be the $QQ$ elements realizing it, then $tp_n^QQ (a_1,...a_n)$ is a complete type.

Now let $p$ be some arbitrary complete $n$-type on $T$, let $a_1,...,a_n$ be the variables of the type, then since the type is complete we have for each $i,j$ either $a_i < a_j$, $a_j < a_i$ or neither. This then gives us a finite total ordering on the $a_i$'s with 'neither' corresponding to $a_i = a_j$.

Now we want to check that the two operations are inverses of each other. Clearly if we start with an ordering, get a type, then the type gives us back the ordering we started with since the type will contain sentences of the form $a_i < a_j$ characterizing the ordering.

Now assume then that we start with a type $p$, get an ordering, then realize the ordering in $QQ$, and get the type $tp_n^QQ (A)$. We want to argue that $tp_n^QQ (A) = p$, to see this we will use #link(<lemma-elem_equiv>)[the lemma above]. We will show that in fact any countable model of $p$ is isomorphic to $tp_n^QQ (A)$ and so $p$ is $omega$-categorical and thus complete, making all its models elementarily equivalent. Recall that we showed dense linear orders are $omega$-categorical by using the back and forth construction, and recall that our inductive step did not care what partial isomorphism we had in the previous step. Now since the partial map $f : mM -> QQ$ given by $f(a_i) = a_i$ is a partial isomorphism we can treat it as a step in the back and forth method thus completing $f$ to an isomorphism. Thus $p$ is $omega$-categorical and thus complete.

#pagebreak(weak: true)
= Question
== Statement
Describe the complete $n$-types over the empty set for the theory of atomless Boolean algebras.
== Solution
First I will define a 'generating' set for a Boolean algebra $A$ to be a set of elements $a_i$ such that each element of $A$ can be written of the form
$
  or.big_(i in S) and.big_(j in K_i) s_(i,j) 
$
where $s_(i,j)$ is of the form $a_ell$ or $not a_ell$.

Similarly to the above question I claim that the complete $n$-types are in correspondence with generating sets of size at most $n$ for finite Boolean algebras.
We will use #link(<lemma-elem_equiv>)[the lemma in question 3] as well.
In order to recreate the argument from question 3 we want a standard model of this theory to work with. We will define one implicitly, by taking an infinite sequence of elements $x_1,x_2,...$ and declaring that any finite intersection of $x_i$ or $not x_i$ using each element at most once is non zero, we will then consider the 'free' Boolean algebra generated by these elements and call it $BB$.

Now our plan will be very similar to the previous question
#block(width: 100%)[
  #set align(center)
  #cetz.canvas({
  import cetz.draw: *
  set-style(mark: (end: ">"))
  content((0,0), box(inset: 3pt)[Start with type $p$ on $a_1,...,a_n$], name: "top left")
  content((0,-1.5), box(inset: 3pt)[Consider all relations satisfied by these elements], name: "middle left")
  content((0,-3), box(inset: 3pt)[Get some finite Boolean algebra $A$], name: "bottom left")

  content((7,0), box(inset: 3pt)[Start some finite Boolean algebra $A$], name: "top right")
  content((7,-1.5), box(inset: 3pt)[Realize $A$ as $A seq BB$], name: "middle right")
  content((7,-3), box(inset: 3pt)[Get type $tp_n^BB (A)$], name: "bottom right")

  line((name: "top left", anchor: "south"), (name: "middle left", anchor: "north"))
  line((name: "middle left", anchor: "south"), (name: "bottom left", anchor: "north"))
  line((name: "top right", anchor: "south"), (name: "middle right", anchor: "north"))
  line((name: "middle right", anchor: "south"), (name: "bottom right", anchor: "north"))
})]
First let us construct a finite subalgebra for each type, we do this by considering elements of the form
$
  and.big_(i=1)^n s_i
$
where each $s_i$ is either $a_i$ or not $a_i$. Then the type $p$ will tell us for each such element whether it is equal to $0$ or not. Then we collect all the ones that are not equal to zero and consider them as atoms and use that to generate a finite Boolean algebra. One can easily check that for this Boolean algebra the original elements $a_i$ form a generating set for this algebra.

The second thing we need to prove is that every finite Boolean algebra is realized in $BB$.
We can do this by the back and forth method we used in Assignment 1, we can construct, step by step, an isomorphism between any finite Boolean algebra $A$ to some finite subalgebra of $BB$

We now need to check that any two models of some type $p$ are elementarily equivalent. We show this also using back and forth, let $p$ be a type and $A$ the associated finite subalgebra, we need to show that for any countable model $mM sat p$ we have $(mM,a_1,...,a_n) equiv (BB,a_1,...,a_n)$, but this is simple by starting with the partial isomorphism mapping $a_i in mM$ to $a_i in BB$ and then extending it to all of $mM$ and $BB$ using back and forth.
Thus as in @question-3 we showed the correspondence.

#pagebreak(weak: true)
= Question
<question-5>
== Statement
A model $mM$ of a complete theory $T$ is a _prime model_ if for every model $mN sat T$ there exists an elementary embedding of $mM$ into $mN$.

Show that $mM$ is a prime model if and only if $mM$ is countable and every type $tp^mM (ov(a))$ for a tuple $ov(a)$ in $mM$ is isolated.
== Solution
I am going to assume the language is countable since otherwise this can't be true.

Assume that a model is prime, then by Lowenheim-Skolem downwards Theorem we get that there are countable models $mN$ of $T$ with $mN elm mM$. Now by assumption $mM elm mN$ and so they must be isomorphic and thus $mM$ must be countable. Now assume that a type $tp^mM (ov(a))$ is not isolated for some tuple $ov(a)$. This means that there is a model of $T$ that omits $tp^mM (ov(a))$ and so there is no way to elementarily embed $mM$ into $mN$ since the image of $ov(a)$ would have the same type.

On the other hand let $mM$ be a model model which is countable and in which every tuple has an isolated type. Then let $mN sat T$ be any other model, then we construct an elementary embedding by induction (or as I like to call it, the forth method), where at each step we will form a partial embedding $f_n : A_n -> B_n$ where $A_n seq mM$ and $B_n seq mN$.

At the base case we map constants to constants $f_0$ maps constants to constants, now enumerate the rest of $mM$ as $a_0,a_1,...$ and assume we have constructed $f_n$. Now let $a_j$ be the element of smallest index not in $A_n$, consider the type $tp^mM (ov(A_n), a_j)$ where $ov(A_n)$ represents the ordered tuple of elements in $A_n$. This type must be isolated so there is some formula $phi(ov(A_n),a_j)$ which implies the whole type. Since $f_n$ is a partial embedding we have $mN sat exists x (phi(ov(B_n), x))$ and so pick a witness $y$ to this sentence and extend $f_n$ by setting $f_(n+1) (a_j) = y$. This continues to be a partial embedding. Then by induction we construct an embedding $f : mM -> mN$.

#pagebreak(weak: true)
= Question
== Statement
Prove that $T$ has a prime model if and only if for every $n$, the isolated types are dense in $S_n (T)$.
== Solution
Assume that $T$ has a prime model, then let $p$ be a type in $S_n (T)$ with some model $mN sat T$ that realizes it and let $mM$ be the prime model of $T$, giving us $mM elm mN$. Now let $[phi(ov(a))]$ be some open neighborhood containing $p$, then $phi in p$. But then $mN sat exists ov(x) (phi(ov(x)))$ and so $mM sat exists ov(x) (phi(ov(x)))$. Now by @question-5 we get that the witness $ov(a)$ of this sentence in $mM$ has an isolated type $tp_n^mM (ov(a))$ and thus by construction $phi in tp_n^mM (ov(a))$ and so $tp_n^mM (ov(a)) in [phi(ov(a))]$ and so we have found an isolated type in $[phi(ov(a))]$ and so the set of isolated types is dense in $S_n (T)$.

On the other hand assume that the set of isolated types is dense, we want to show the existence of a countable model $mM$ in which every type is isolated. Notice first that we don't need to worry about countability since we can just use Lowenheim-Skolem to bring the cardinality down. Next notice that $mM$ realizing a non-isolated type for an $n$-tuple $ov(a)$ is equivalent to
$
  mM sat { not phi(ov(a)) | phi(ov(x)) "isolates a complete type" } =: p_n
$
for if $mM sat phi(ov(a))$ for some isolating formula then it would have an isolated type.

Now if $p_n$ is not a type, that is not finitely consistent, then all the types of $mM$ are isolated so no issues there, so we can assume that $p_n$ is a type. Now we simply need to omit this type, in order to do that we need to show that $p_n$ is not isolated, that is, for every satisfiable formula $psi(ov(x))$ there is a formula $phi(ov(x))$ which isolates a complete type such that $T tack.not forall ov(x) (psi(ov(x)) -> not phi(ov(x)))$.

But this is true, since for every formula $psi$ we have that there exists some complete isolated type $p in [psi]$, let $phi$ be its isolated formula, then $T proves forall ov(x) (phi(ov(x)) -> psi(ov(x))$ so $T tack.not forall ov(x) (psi(ov(x)) -> not phi(ov(x)))$, and so $p_n$ are all not isolated and thus all $p_n$ can be simultaneously omitted.

