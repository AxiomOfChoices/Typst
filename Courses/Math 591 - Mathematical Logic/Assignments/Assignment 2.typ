#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#let head(doc) = header(doc, title: "Assignment 2")
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
<question-3>
== Statement
An $forall exists$-sentence $phi$ is one of the form $phi = forall overline(x)thin exists overline(y) thin psi$ where $psi$ is quantifier free.

Show that $T$ is axiomatizable by $forall exists$-sentences if and only if the class of models of $T$ is closed under taking unions of increasing chains (linearly ordered by inclusion) of models.
== Solution
#remark[
  I unfortunately stumbled upon the solution of questions 2 and 3 in the textbook by David Marker while trying to look up what a universal statement means. Both solutions are largely inspired by whats in that book.
]
We will try to emulate the solution for question 2, we set $T_(forall exists)$ to be the set of $forall exists$-sentences in $T$. Assume that $mM_i sat T$ for all $i in I$, set $mM = union.big_i mM_i$, then let $phi in T$ be of the form $phi = forall overline(x) thin exists overline(y) thin psi$, we have 
$
  mM sat phi <=> forall overline(a) in |mM|, exists overline(b) in |mM|, mM sat psi(overline(a),overline(b))
$<eqn-union_satisfy>
now fix some $overline(a)$, since it is a finite tuple of elements, there exists some $i$ with $overline(a) in |mM_i|$. Since $phi$ holds in $mM_i$ there is some vector of elements $overline(b) in |mM_i|$ with $mM_i sat psi(overline(a), overline(b))$. Since $psi$ is atomic then $mM sat psi(overline(a), overline(b))$ as well and so by @eqn-union_satisfy we have $mM sat phi$.

For the other direction we have a lot more work to do. Assume that models of $T$ are closed under taking unions of chains and that $mM sat T_(forall exists)$. First let us construct a superstructure of $mM$ that satisfies $T$, to do this set $Gamma = T union C union S$ where $C$ is the set of atomic $L(|mM|)$-sentences true in $mM$ and $S$ is the set of $exists forall$-$L$-sentences (not $forall exists$) that are true in $mM$.

Now assume that $Gamma$ is inconsistent, then by compactness let $T' union C' union S'$ be a finite subset that achieves a contradiction, then construct the sentence 
$
  phi =
  exists overline(x)_1 ... exists overline(x)_n
  (and.big_(phi_i (overline(a)) in C') phi_i (overline(x)_i))
$
and the sentence
$
  phi' = and.big_(psi in S) psi
$
then if $T' union { phi, phi' }$ is consistent then by interpreting the $overline(x)_i$ given to us by $phi$ as the constants in $C'$ we get that $T' union C' union S'$ is consistent. On the other hand if $T union {phi, phi' }$ is inconsistent then $T' proves not (phi and phi')$, but one can easily check that $not (phi and phi')$ is an $forall exists$-sentence and thus is in $T_(forall exists)$. But then $mM sat not (phi and phi')$, which contradicts the construction of $C$ and $S$. It is clear that a model $mN$ of $Gamma$ is a superstructure of $mM$ which satisfies $T$ and also satisfies all $exists forall$-statements that are true in $mM$.

Now set $mM_0 = mM$ and $mN_0 = mN$, we will construct the sequences $mM_i,mN_i$ inductively in two steps. On even steps we will construct $mN_i$ from $mM_i$ exactly as we did above, with $mN_i equiv mN_0$ and $mM_i seq mN_i$. 
We construct $mM_i$ as a superstructure of $mN_(i-1)$ which is also an elementary superstructure of $mM$. To do construct such a superstructure we need to check that $S(mM) union C(mN_(i-1))$ where $S(mM)$ is the set of all $L(|mM|)$-sentences that are true in $mM$ and $C(mN_(i-1))$ is the set of all atomic $L(|mN_(i-1)|)$-sentences that are true in $mN_(i-1)$. Assume that this set is inconsistent, then by compactness let $S' union C'$ be an inconsistent finite subset. Now define the sentence
$
  phi = exists overline(x)_1 ... exists overline(x)_n 
  (and.big_(phi_i (overline(a)) in C') phi_i (overline(x)_i))
$
by the exact same argument as above either $S(mM) union { phi }$ is consistent, which would contradict inconsistency above, or it is inconsistent so $S(mM) proves not phi$, then $not phi$ is an $exists forall$-sentence with $mM sat not phi$, but then by induction we know that $mN_(i-1) sat not phi$ which contradicts the construction of $phi$ from statements in $C(mN_(i-1))$. Any model of $S(mM) union C(mN_(i-1))$ then satisfies what we want.

We then get the chain 
$
  mM_0 seq mN_0 seq mM_1 seq mN_1 seq ... 
$
so consider 
$
  cal(M)' := union.big_i mM_i = union.big_i mN_i
$
Since it is a union of $mM_i$ which are all elementary superstructures of $mM$ they are all elementarily equivalent, thus $cal(M)' equiv mM$. But now each $mN_i$ is a model of $T$ and so since $T$ is closed under taking unions of chains we have that $cal(M)'$ is a model of $T$. But then $mM$ is also a model of $T$. We have thus proved that every model of $T_(forall exists)$ is also a model of $T$ and thus $T = Cn(T_(forall exists))$.

#pagebreak(weak: true)
= Question
<question-4>
== Statement
A model $mM$ of a theory $T$ is existentially closed if whenever $sigma$ is an existential $L(|mM|)$-sentence satisfied in a model $mN sat T$ containing $mM$, then $mM sat sigma$.

Show that if $T$ is axiomatizable by $forall exists$-sentences, then it has an existentially closed model.
== Solution
I'm gonna assume that $T$ is consistent as otherwise I think this is false.
Let $mM$ be a model of $T$, set $kappa = ||mM|| + ||L|| + aleph_0$ define $frak(X)$ the collection of superstructures $mN sat T$ with $|mN| seq |mM| union.sq kappa$, note that this collection is a set. 
#lemma[
  Let $mN in frak(X)$ be a model which fails to be existentially closed for some sentence $sigma$, then $mN$ has a superstructure $mN' in frak(X)$ with $mN' sat sigma$.
]
#proof[
  By definition $mN$ has some superstructure $mN^*$ with $mN^* sat T$ and $mN^* sat sigma$. By Lowenheim-Skolem downwards Theorem we have that there exists a model $mN'$ with $mN seq mN' lt.curly mN^*$ and $||mN'|| <= kappa$. By $mN' lt.curly mN^*$ we have that $mN' sat T$ and $mN' sat sigma$, also by enumerating $|mN'| backslash |mN|$ we can map all those elements to elements of $kappa$ to get that $mN'$ is isomorphic to some model in $frak(X)$.
]

Now $frak(X)$ is partially ordered by inclusion, now for every chain $mM_i$ in $frak(X)$ we have that $|mM_i| seq |mM| union kappa$ and so $|union.big_i mM_i| seq |mM| union kappa$. But also since $T$ is axiomatizable by $forall exists$-sentences, then by @question-3 we have that $union.big_i mM_i sat T$. Now by Zorn's lemma we have that since chains contain upper bounds then there exists a maximal element of $frak(X)$. But by the lemma above a maximal element cannot fail to be existentially closed for any sentence $sigma$, so it must be existentially closed.

#pagebreak(weak: true)
= Question
== Statement
Suppose $T$ has only infinite models. Show that if $T$ is $kappa$-categorical for some $kappa >= |L|$ and axiomatizable by $forall exists$-sentences, then all models of $T$ are existentially closed. Conclude that every algebraically closed field is existentially closed.
== Solution
Assume some model $mM sat T$ fails to be existentially closed for some existentially sentence $sigma$, then by @question-4 it is contained in an existentially closed superstructure $mN$ with $mN sat T$ and $mN sat sigma$. Now $sigma$ contains finitely many constants from $L(|mM|)$, name them $c_i$ for $i in [k]$, now replace every such constant with a corresponding variable $x_i$ consider the sentence $sigma'$ defined as 
$
  sigma' = forall x_1 ... forall x_n thin sigma(x_1,...,x_n).
$
This sentence is true in $mN$ since it is existentially closed, but then since its an $L$-sentence and $T$ is complete it must be in $T$. Thus $mM sat sigma'$ and so by definition of $sat$ we have that in particular
$
  mM sat sigma(c_1,...,c_n)
$
which is a contradiction.

Now algebraically closed fields are defined over the language $(+,dot,0,1)$ and satisfy the following axioms
- $forall x (x + 0 = 0)$
- $forall x forall y forall z (x + (y + z)) = ((x + y) + z)$
- $forall x forall y (x + y = y + x)$
- $forall x exists y (x + y = e)$
- $forall x (x dot 0 = 0)$
- $forall x forall y forall z (x dot (y dot z) = (x dot y) dot z)$
- $forall x (x dot 1 = x)$
- $forall x (x dot y = y dot x)$
- $forall x forall y forall z (x dot (y + z) = (x dot y) + (x dot z))$
- $forall x exists y (x != 0 -> x dot y = 1)$
And then we add axioms of the form $1 + 1 = 0, 1 + 1 + 1 = 0,...$ to fix a characteristic $p$.
All of these axioms are $forall exists$-sentences, and we know that $|L| <= aleph_0$ and if we call these theories $A C F_p$ are $aleph_1$ categorical and so all algebraically closed fields are existentially closed.

#pagebreak(weak: true)
= Quesiton
== Statement
Let $mM$ be a model. An _Ultrapower_ of $mM$ is a model of the form $product_i mM_i slash cal(U)$ where all $mM_i = mM$.

Let $mM^*$ be an ultrapower of $mM$. Show that the diagonal map $iota$ mapping $a$ to the equivalence class of the constant sequence with value $a$ is an elementary embedding of $mM$ into $mM^*$. Show that if $mM^*$ is obtained from a nonprincipal ultrafilter on $NN$, then $iota$ surjective if and only if $mM$ is finite.
== Solution
Let $a$ be a vector of elements in $mM$ and $tilde(a)$ is the image of that vector of elements under $iota$, then let $phi(overline(x))$ be a formula, we have that ${ i in I : mM_i sat (tilde(a))_i }$
is either equal to $I$ or the empty set.
Then we have by Łoś's Theorem we have that
$
  mM sat a <=> { i in I : mM_i sat (tilde(a))_i } = I <=> { i in I : mM_i sat (tilde(a))_i } in cal(U)
  <=> mM^* sat tilde(a).
$
which is precisely the definition of an elementary embedding.

#lemma[
  If $cal(U)$ is an ultrafilter and $A union.sq B in cal(U)$ then exactly one of the following is true
  - $A in cal(U)$
  - $B in cal(U)$
]
#proof[
  We know that either $A in cal(U)$ or $I backslash A in cal(U)$, if $I backslash A in cal(U)$ then 
  $
  (I backslash A) sect (A union B) = B in cal(U)
  $
]

Next assume that $I = NN$, we want to show that if $mM$ is finite then $iota$ is surjective.
Assume that $mM$ is finite and enumerate its elements ${x_1,...,x_n} = |mM|$. Let $(a_i)_(i in NN)$ be a fixed element of $mM^*$, then consider the set 
$
  S_j = { i in NN : a_i = x_j }
$
that is, the set of indices where the element of the sequence with that index is equal to $x_j$.

Now we have that $NN = union.sq.big_(j) S_j$ and so since $NN in cal(U)$ by repeatedly applying the lemma exactly one of the $S_j$ are in $cal(U)$ (we are allowed to do this since the union is finite). Let $j_0$ be that distinguished $j$. Then we have
$
  { i in NN : a_i = iota(x_(j_0))} = S_(j_0) in cal(U)
$
and so $a_i tilde_(cal(U)) iota(x_(j_0))$ and so we found $a_i$ as the image of an element in $a_i$.

On the other hand assume that $mM$ is not finite, then let ${x_1,x_2,...}$ be an enumeration of some countably infinite subset of it. Consider the element $(x_i)_(i in NN) in mM^*$, we have that for any element $x in mM$ the set ${ i in NN : x_i = x}$
is either a singleton or the empty set. But any nonprincipal filter contains no finite subsets thus $iota(x) tilde.not_(cal(U)) x_i$ for all $x in mM$ and so the map $iota$ is not surjective.

#pagebreak(weak: true)
= Question
== Statement
Let $mM$ and $mN$ be elementarily equivalent models, show that $mM$ embeds into some ultrapower of $mN$.

== Solution
First we will need a lemma.
#lemma[
  Fix some finite $Delta seq Th_(L(mM))(mM)$, let $C = {c_1,...,c_n}$ be the set of additional constants that appear in $Delta$ but are not in $L$. There is an interpretation $mN_Delta$ of $mN$ as a model of $L(C)$ with $mN_Delta sat Delta$.
]
#proof[
  Let $Delta = {phi_1 (ov(c)),...,phi_k (ov(c))}$, then $mM$ satisfies the $L$-sentence
  $
    psi = exists ov(x) (and.big_(i=1)^k phi_i (ov(x)))
  $
  then by elementary equivalence $mN$ also satisfies $psi$, so by interpreting $ov(x) = (x_1,...,x_n)$ as the constants $c_1,...,c_n$ we get that $mN_Delta$ is a model of $L(C)$ with $mN_Delta sat Delta$.
]

Now set $I = { Delta seq Th_(L(mM))(mM) : Delta "is finite"}$, then define the basic sets $[Delta] = { Delta' in I : Delta seq Delta' }$ and then $D = { Y seq I : [Delta] seq Y "for some" Delta }$. $D$ is a filter since if $[Delta_1] seq Y_1, [Delta_2] seq Y_2$ then
$
  [Delta_1 union Delta_2] = [Delta_1] sect [Delta_2] seq Y_1 sect Y_2
$
Now let $cal(U)$ be any ultrafilter containing $D$, we prove that $mN^* = product_(Delta in I) mN_Delta slash cal(U)$ is a model of $L(mM)$ that satisfies $Th_(L(mM))(mM)$.

First for any element $c in mM$ consider the sentence $phi = exists x (x = c)$, then ${phi} in I$. Now $[{phi}] in cal(U)$ and for any $Delta in [{phi}]$ we have
$
  mM_Delta sat phi
$
so set $x_Delta$ to be a witness of $x$ in $phi$ in $mM_Delta$.
Then all sequences $(a_Delta)_(Delta in I)$ in $mN^*$ with $a_Delta = x_Delta$ on $[{phi}]$ are equivalent and so we can define the interpretation
$
  c^(mN^*) = (a_Delta)_(Delta in I)
$

Now for any $phi in Th_(L(mM))(mM)$ we can write $phi = psi(c_1,...,c_m)$ then for any $Delta in [{phi}]$ we have
$
  mN_Delta sat phi
$
so
$
  { Delta in I : mN_Delta sat phi } supset.eq [{phi}] in cal(U)
$
and thus $mN^* sat Th_(L(mM))(mM)$ and so $mM lt.curly mN^*$.
