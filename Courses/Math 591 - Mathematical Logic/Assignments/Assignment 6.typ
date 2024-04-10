#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/cetz:0.2.0"
#let head(doc) = header(doc, title: "Assignment 5")
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
Show that the computation of the Morley rank of a formula with parameters in a model $mM$ does not depend on the choice of an $aleph_0$-saturated extension of $mM$.
== Solution
Let us formalize the statement of the question.
#claim[
  If $mN succ mM$ and $mM$ is $aleph_0$-saturated then for any formula $phi$ with parameters in $mM$ we have
  $
    RM_mM (phi) = RM_mN (phi).
  $
]
#proof[
  We will show this by proving
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
    RM_mM (phi) >= 0 <=> phi(mM) != nothing <=> phi(mN) != nothing <=> RM_mN (phi) >= 0
  $

  The limit case is also trivial.
  For the successor case assume that $RM_mM (phi) >= alpha + 1$, then there is an infinite sequence of $L(mM)$ formulas $phi_i$ that are pairwise inconsistent, imply $phi$, and have $RM_mM (phi_i) >= alpha$. The $phi_i$ are also $L(mN)$ formulas and hence by inductive hypothesis we have $RM_mN (phi_i) >= alpha$, so we also have $RM_mN (phi) >= alpha + 1$.

  On the other hand assume that $RM_mN (phi) >= alpha + 1$, then for any $n$ there are $L$-formulas $phi_i (ov(x), ov(y))$ and parameters $ov(a)_i$ for $1 <= i <= n$ such that $phi_i (ov(x), ov(a)_i)$ are pairwise inconsistent, imply $phi(ov(x))$, and have $RM_mN (phi_i (ov(x), ov(a)_i)) >= alpha$. Now consider the sentence
  $
    sigma = exists ov(b)_1 ... ov(b)_n thin exists ov(a)_1 ... ov(a)_n (and.big_(i) phi_(i)(ov(b)_i, ov(a)_i) and (and.big_(j != i) not phi_j (ov(b)_i, ov(a)_j))).
  $
  This sentence describes witnesses to the existence of $n$ representatives of distinct definable subsets of $phi(mN)$, but since this sentence is true in $mN$ it is also true in $mM$. Let $ov(b)_i, ov(a)_i$ be the witnesses to its truth in $mM$, then consider the formulas
  $
    psi_i (ov(x)) = phi_(i)(ov(x), ov(a)_i) and (and.big_(j != i) not phi_j (ov(x), ov(a)_j))
  $
  the $psi_i$ are clearly pairwise inconsistent but also $ov(b)_i in psi_i (mM)$ so they are all non-empty, hence we found $n$ disjoint non-empty subsets of $phi(mM)$. Since this is true for every $n$ and each
]
