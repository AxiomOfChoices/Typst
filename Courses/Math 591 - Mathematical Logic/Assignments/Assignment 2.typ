#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 1", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let Cn = math.op("Cn")
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

#set page(margin: (x: 1.6cm, top: 2.5cm, bottom: 2cm))

= Question
== Statement
Show that two countable structures are isomorphic if and only if the Duplicator/Prover has a winning strategy in $G_omega (mM,mN)$
== Solution
Assume $mM tilde.eq mN$, then the Prover wins trivially by just following the isomorphism.

On the other hand assume Prover has a winning strategy, then we can play the role of the Spoiler to force Prover to construct an isomorphism. First enumerate the models 
$
  |mM| = { m_0, m_1, ... }, quad
  |mN| = { n_0, n_1, ... }
$
on the first turn we pick $m_0$ and let Prover map it to some element of $|mN|$. On the second turn we pick the smallest index element of $|mN|$ that has not been picked before and force Prover to map it. We continue this, on odd turns we pick the smallest index element of $|mM|$ that has not been picked before, and on even turns we pick the smallest index element of $|mN|$ that has not been picked before. This essentially forces Prover to use the back-and-forth method. Since every element of both models will eventually be mapped and since Prover has to win this game, the resulting map $union.big_i f_i$ will be an isomorphism between $mM$ and $mN$.

#pagebreak(weak: true)
= Question
== Statement
We say that a theory is axiomatized by a set $A$ of sentences if $T = Cn(A)$ where $Cn$ denotes the conclusions of a set of sentences. A universal sentence $phi$ is a sentence of the form $phi = forall overline(x) thin psi(overline(x))$ where $psi$ is quantifier free.

Let $T$ be an $L$-theory and $T_forall$ be the set of all universal sentences $sigma$ such that $T proves sigma$. Show that $mM sat T_forall$ if and only if there is an $mN sat T$ such that $mM seq mN$. Conclude that $T$ is axiomatizable by a set of universal sentences if and only if the set of models of $T$ is closed under taking substructures.
== Solution
// #remark[
//   I am pretty sure the statement as written above could be false, for example if $T = { exists x : x != x }$, then $T_forall$ is satisfied by all models but no supermodel of it satisfies $T$. I thus modified the intermediate lemma so that I can still reach the correct conclusion.
//   ]
#lemma[
  $mM sat T_forall$ iff we have a model $mN$ with $mM seq mN$ and $mN sat T$.
]
#proof[
  One direction is easy, assume that $mM seq mN$ with $mN sat T$, let $phi = forall overline(x) thin psi(overline(x))$ with $phi in T$. Then by unwrapping the definition of satisfaction we know that
  $
    mN sat phi => forall overline(a) in |mN| (mN sat psi(overline(a))) => forall overline(a) in |mM| (mM sat psi(overline(a))) => mM sat phi
  $

  Now assume that $mM sat T_forall$, then first note that $T$ must be consistent since otherwise all the atomic contradictions in $T$ would also be in $T_forall$. Let $S$ denote the set of all quantifier free sentences in $L(|mM|)$ that are true in $mM$. We now show that $T union S$ is consistent by contradiction. Assume it is not, then by compactness it would have an inconsistent finite subcollection, denote that subcollection $T' union S'$, where $S'$ is non empty by consistency of $T$. Then consider the sentence 
  $
    Phi = exists overline(x)_1 ... exists overline(x)_k (and.big_(phi_i (overline(a)) in S') phi_i (overline(x)_i))
  $
  if this sentence is true in some model $mM'$ of $T'$ then $mM' sat T' union S'$ since we can just interpret the constants in $S'$ to be the witnesses of the above sentence.

  On the other hand if this sentence is false in all models of $T'$ then by completeness theorem $T' proves not Phi$, but notice that 
  $
    not Phi = forall overline(x)_1 ... forall overline(x)_k (or.big_(phi(overline(a)) in S') not phi(overline(x)_k))
  $
  and so $not Phi$ is a universal sentence and thus in $T_forall$. Thus $mN sat not Phi$ but since $S'$ is non empty then some $phi_i (overline(x)_i)$ would be false for all possible parameters $overline(x)_i$, contradicting its construction.

  By completeness then, $T union S$ has a model $mN$, that model is then a superstructure of $mM$ since it satisfies all the sentence of $S$, this proves the lemma.
]

Now using this lemma, assume $T_forall$ axiomatizes $T$, then if $mN$ is a model of $T$ then for any substructure $mM$ we have by the above lemma $mM sat T_forall$ and thus $mM sat T$. On the other hand if the models of $T$ are closed under taking substructures then if $mM sat T_forall$ we have that there exists $mN$ with $mM seq mN$ and $mN sat T$ so then $mM sat T$ also. Since this is true for every model by completeness $T_forall proves T$.
#pagebreak(weak: true)
= Question
== Statement
An $forall exists$-sentence $phi$ is one of the form $phi = forall x_1 ... forall x_n exists y_1 ... exists y_k psi$ where $psi$ is quantifier free.

Show that $T$ is axiomatizable by $forall exists$-sentences if and only if the class of models of $T$ is closed under taking unions of increasing chains (linearly ordered by inclusion) of models.
== Solution

