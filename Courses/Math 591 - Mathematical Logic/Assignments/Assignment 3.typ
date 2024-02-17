#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#let head(doc) = header(doc, title: "Assignment 3")
#show: head
#show: latex
#show: NumberingAfter
#show: thmrules
#show: symbol_replacing

#set page(margin: (x: 1.6cm, top: 2.5cm, bottom: 2cm))
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
== Statement
A model $mM$ of a theory $T$ is called existentially closed if whenever $sigma$ is an existential $L(|mM|)$-sentence satisfied in a model $mN sat T$ containing $mM$, then $mM sat sigma$.

Show that the following are equivalent for a theory $T$:
  + all models of $T$ are existentially closed,
  + for every formula $phi(ov(x))$ there exists a universal formula $psi(ov(x))$ such that $T proves forall ov(x) (phi(ov(x)) <-> psi(ov(x)))$
== Solution
The backwards direction is simple, let $sigma(ov(c)) = exists ov(y) (phi(ov(c), ov(y))) $ be an existential $L(|mM|)$-sentence for some model $mM sat T$, where $ov(c)$ are the constants coming from $mM$. Now if for some model $mN sat T$ that contains $mM$ we have $mN sat sigma$, then by assumption there exists a universal formula $psi(ov(c))$ such that $T proves forall ov(c) (exists ov(y)(phi(ov(c),ov(y))) <-> psi(ov(c)))$ and so $mN sat psi(ov(c))$. But now $phi(ov(c))$ is a universal statement so since $ov(c) in mM$ then since universal statements are closed downwards then $mM sat phi(ov(c))$ and thus by using the assumption again $mM sat exists ov(y) (phi(ov(c),ov(y))$ and thus $mM sat sigma(ov(c))$.

Now the forward direction is tricky, first we can assume that $phi(ov(c))$ being true is consistent since otherwise it is equivalent to a false statement. Now let us first prove a lemma.
#lemma[
  Let $phi(ov(x))$ be a closed formula, meaning that if $mN sat T$ is a model containing $mM sat T$ then $mN sat phi(ov(a)) => mM sat phi(ov(a))$ for all $a in mM$. Then $T proves forall ov(x) (phi(ov(x)) <-> psi(ov(x)))$ for some universal formula $psi(ov(x))$.
]
#remark[
  Universal sentences are always closed.
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
// Now with this lemma our plan is clear, we are given by assumption that all existential formulas are closed, and we want to show that all formulas are closed. We will use induction on the number of quantifiers of the formula in normal form to prove this.

We now prove the statement with induction on the structure of the formula $phi(ov(x))$
#pagebreak(weak: true)
=== Base case
If $phi(ov(x))$ is existential, since every model of $T$ is existential closed, all $phi(ov(x))$ is closed and thus by the lemma above we are done.

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
