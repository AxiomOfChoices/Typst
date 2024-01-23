#import "../../Templates/generic.typ": latex
#import "../../Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "../../Templates/math.typ": *
#import "../../Templates/monograph.typ": frontpage
#show: latex
#show: chapter_heading
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let qd = math.op("qd")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}
#let sat = $tack.r.double$
#let proves = $tack.r$
#let subm = $lt.curly$
#let Th = math.op("Th")
#let mM = $cal(M)$
#let mN = $cal(N)$
#let bar(el) = $overline(#el)$
#let subs(a, b) = { return $attach(slash, tl: #a, br: #b)$ }

#show: doc => frontpage(
  toptitle: [Mathematical Logic],
  name: [Jacob Reznikov],
middletitle: [My course notes for the Winter 2024 Mathematical Logic course by #link("https://www.math.mcgill.ca/msabok/")[Marcin Sabok] at McGill],
doc)


= Basic Definitions and Concepts
== Models and Languages
#definition[
  A _model_ or _structure_ is a tuple $ mM = (M, (f_i)_(i in I), (R_j)_(j in J), (c_k)_(k in K)) $
  where 
  - $M$ is a set called the universe
  - $f_i$ are functions $f: M^(a_i) -> M$
  - $R_j$ are relations $R_j seq M^(a_j)$
  - $c_k$ are constants $c_k in M$. 
]

#remark[
  Sometimes constants can be seen as $0$-ary functions.
]

#example[
  Consider the model $(CC, +,dot, exp)$, consisting of the universe $CC$ with the 3 functions $+,dot,exp$. Note that we will often write out the functions inside the brackets as above, it will be clear if an object is a function,relation or constant from context.
]

#example[
  Another model would be $(RR, +, dot, <)$, consisting of the universe $RR$ with the 2 functions $+,dot$ and the 2-ary relation $<$.
]

#example[
  $(ZZ_4, +_4, 0)$, here $0$ is a constant.
]

#example[
  An important example is $(V,in)$ where $V$ is any set which sort of encodes set theory (though there are several issues with this).
]

We can see already that models can encode many objects that we study in math, and there are many many more such encodings.

All of this is very semantic encoding of a mathematical structure, but we will also be concerned with the syntactical encoding.

#definition[
  A _language_ (or _signature_) is a tuple
  $
    L = ((underline(f_i))_(i in I'),(underline(R_j))_(j in J'), (underline(c_k))_(k in K'))
  $
  where now the $f_i$ are function _symbols_ with arity $a'_i in NN$, each $R_j$ are relation _symbols_ with arity $a'_j in NN$, and $c_j$ are constant _symbols_.

  A model $mM$ is an $L$-structure if 
  $
    I = I',
    J = J',
    K = K',
    a_i = a'_i,
    a_j = a'_j
  $
  If $mM$ is an $L$-structure then the _interpretations_ of the symbols of the language are defined as
  $
  underline(f_i)^mM = f_i, underline(R_j)^mM = R_j, underline(c_k)^(mM) = c_k
  $
]

#remark[
  For a model $mM$ we will sometimes denote $|mM|$ to refer to the universe of a model and $||mM||$ to denote the cardinality of said universe.
]

We have defined the symbols of $L$, but how do we speak it? We will need the following
- Logical symbols, these will consist of 
  - Connectives: $or, and, not, =>, <=>$
  - Quantifiers: $exists, forall$
- Auxiliary symbols: Parentheses, Commas
- Variables: $x,y,z,v,...$
- Equivalency Symbol: $=$

As with any language we will build up our language first with nouns and then with phrases.

#remark[
  We will often use $bar(a)$ to denote the ordered collection $(a_1,...,a_n)$ where $n$ will be clear from context.
]

#definition[
  $L$-_terms_ are defined inductively as follows
  - Any constant symbol is an $L$-term
  - Any variable symbol is an $L$-term
  - If $tau_1,...,tau_n$ are $L$-terms $f_i$ is a function with arity $n$ then 
  $
    f_i (tau_1,...,tau_n)
  $
  is a term.

  An $L$-term is said to be _constant_ if it does not contain any variables.
]

#definition[
  If $mM$ is an $L$-structure and $tau$ is a constant $L$-term then the _interpretation_ of $tau$, $tau^mM$, is defined equivalently
  - If $tau = c_k$ then $tau^mM = c_k^mM$
  - If $tau = f_i (tau_1,...,tau_n)$ then $tau^mM = f_i^mM (tau_1^mM, ..., tau_n^mM) in |mM|$
]

#example[
  $L = (+, dot, 0, 1)$ then $mM = (NN, +, dot, 0, 1)$ is an $L$-structure in which the $L$-term 
  $
    tau = 1 + 1 + 1
  $
  has the interpretation $3$.

  However, in the $L$-structure $(ZZ_3, +_3, dot_3, 0,1)$ the interpretation is instead $0$
]

#definition[
  An $L$-_formula_ is also defined inductively
  - If $tau_1, tau_2$ are $L$ terms then $tau_1 = tau_2$ is an $L$-formula
  - If $tau_1,...,tau_n$ are $L$-terms then $R_j (tau_1,...,tau_n)$ is a formula if $R_j$ is an $n$-ary relation.
  - If $phi_1, phi_2$ are $L$-formulas, then 
    $
      phi_1 or phi_2, phi_1 and phi_2, not phi_1, phi_1 => phi_2, phi_1 <=> phi_2 
    $
    are all $L$-formulas.
  - If $phi$ is an $L$-formula, $x$ is a variable, then
    $
      forall x thin phi, exists x thin phi
    $
    are both $L$-formulas.
  The first 2 of these are called _atomic_ $L$-formula.
]

#example[
  The following are all formulas,
  $
  1 = 1+1,
  x = 1,
  0 = 1,
  1 = 1,
  (1 = 1) and not (0 = 1),
  forall x(x = 1), \
  (exists x(x=1)) => (forall x forall y thin x = y),
  forall x forall x thin 1 = 1
  $
]

Now this is all first order logic, but one might wonder, what makes it "first"? This comes from what things we can quantify over. In first order logic we can only quantify over elements $x in |mM|$, in _second_ order logic we can quantify over subsets $S seq |mM|$ like all relations for example. We can also see this as $S in cal(P)(|mM|)$. Third order logic would then be quantification over $S in cal(P)(cal(P)(|mM|))$, and so on.

In this course, however, we will only be looking at first order logic.

#definition[
  If $phi$ is an $L$-formula then in the formulas
  $ phi' = forall x thin phi "or" phi' = exists x thin phi $
  we say that all occurrences of $x$ are _bound_ in $phi'$, and we say that $phi$ is the _range_ of $forall x$ or $exists x$ respectively.

  An occurrence of a variable $x$ in a formula $phi$ is _free_ if it is not bound in $phi$. 

  An $L$-_sentence_ is an $L$-formula with no free variables.
]


#definition[
  Let $phi$ be a formula containing $x$ (which we will follow denote as $phi(x)$), $phi(subs(tau, x))$ will denote the formula obtained by replacing every free occurrence of $x$ by $tau$.
]

Now one would expect that substitution should never change the meaning of a logical statement, but in fact, this is not quite right. 
Consider the case $phi = forall y (y=x)$, the substitution $phi(subs(y,x))$ is changes the meaning of the statement from "all $y$ are equal to $x$" to "all $y$ are equal to themselves". We want to avoid this outcome, which we can formalize as follows.
#definition[
  A substitution $phi(subs(tau,x))$ is called _correct_ if no free variable of $tau$ becomes bound in $phi(subs(tau,x))$
]

#definition[
  If $A seq |mM|$ and $mM$ is an $L$-structure then $L(A)$ is the language 
  $ L union {a : a in A} $
]

We extend our definition of interpretation of terms to terms of $L(|mM|)$ by setting $underline(a)^mM = a$


#definition[
  Let $mM$ be an $L$-structure and $sigma$ an $L(|mM|)$-sentence. We say that $sigma$ is true in $mM$, and write $mM sat sigma$ if 
  - If $sigma$ is of the form $tau_1 = tau_2$ then $M sat sigma$ if and only if $tau_1^mM = tau_2^mM$ (note that while this may look circular, the first equality is in the space of _terms_ while the second is in the universe $|mM|$)
  - If $sigma$ is of the form $underline(R)_j (tau_1, ..., tau_n)$, then $mM sat sigma$ if and only if $(tau_1^mM, ..., tau_n^mM) in R_j$
  - If $sigma$ is of the form $sigma_1 and sigma_2$ then $mM sat sigma_1 and sigma_2$ if $mM sat sigma_1$ and $mM sat sigma_2$. A similar definition follows for the other logical connectives.
  - If $sigma$ is of the form $exists x thin phi$ then $mM sat sigma$ if there exists $a in |mM|$ with $mM sat phi(subs(underline(a),x))$. Similarly for $forall x thin phi$.
]

== Model equivalences
#definition[
  Let $mM$ be a model. The _theory_ of $mM$ is defined also
  $
  Th(mM) = { sigma "is an" L"-sentence" : mM sat sigma}
  $
  
  We say that two $L$-structures, $mM$ and $mN$, are elementarily equivalent, and write $mM equiv mN$ if $Th(mM) = Th(mN)$.

  We write that $mM seq mN$ to mean that $mM$ is a substructure of $mN$, meaning that
  $ 
  |mM| seq |mN|, underline(f_i)^mM seq underline(f_i)^mN, underline(R_j)^mM = underline(R_j)^mN sect |mM|^(a_j), thin thin "and" underline(c_k)^mM = underline(c_k)^mN 
  $
  
  We write $mM tilde.eq mN$ and say that $mM$ and $mN$ are isomorphic if there is a bijection $g$ with 
  $
  g(underline(c_k)^mM) = underline(c_k)^mN\
  (a_1,...,a_n) in underline(R_j)^mM <=>
  (g(a_1),...,f(a_n)) in underline(R_j)^mN\
  g(underline(f_i)^mM (a_1,...,a_n)) = underline(f_i)^mN (a_1,...,a_n)
  $

  We write $mM subm(lt.curly.eq) thin thin mN$ to mean $mM$ is an elementary substructure of $mN$ which is true if $mM seq mN$ and for every formula $phi(bar(x))$ and for every $bar(a) seq |mM|$ we have 
  $ 
  mM sat phi(bar(a)) <=> mN sat phi(bar(a))
  $
]

#theorem("Tarski-Vaught test")[
  Suppose $mM$ is an $L$-structure, $A seq |mM|$, then $A$ is the universe of an elementary substructure iff the following condition holds, called the Tarski-Vaught test

  #block(inset: (x: 2em))[For every formula $phi(x, bar(y))$ in $L$ and every $bar(a) seq A$, if $mM sat exists x thin phi(x, bar(a))$ then there exists $b in A$ such that $mM sat phi(b, bar(a))$]
]
#proof[
  First the $arrow.l.double$ direction, assume that the T-V test holds, then we need to show that $A$ is a substructure. First we use $phi = (x=c)$ to show that $A$ contains all constants of $mM$, then $phi = (x = phi_i (bar(a)))$ for $bar(a) seq A$, and we define the interpretation of $underline(R_j)$ to be exactly $underline(R_j)^mM sect A^(a_j)$ to make it a substructure.

  Now $A$ being a substructure is equivalent to 
  $
    A sat phi(bar(a)) <=> mM sat phi(bar(a))
  $
  for all $bar(a) seq A$ and $phi$ being an _atomic_ formula. So now we only need to prove this is true for the other formula types.
  - The connective types are immediate.
  - Let us assume $phi(bar(x)) = exists y thin psi(y, bar(x))$. Then $mM sat phi(bar(a))$ iff $mM sat exists y thin psi(y, bar(a))$ iff there exists $b in A$ with $mM sat psi(b, bar(a))$. But by definition this last form is equivalent to $A sat exists y thin psi(y, bar(a))$

  Assume, on the other hand, that $A$ is the universe of an elementary substructure $cal(A)$, then we need to prove the T-V test holds, assume then that for some formula $phi(x,overline(y))$ in $L$ and some $overline(a) seq A$ we have $mM sat exists x thin phi(x, overline(a))$ and so since it is an elementary substructure we also have that $cal(A) sat exists x thin phi(x, overline(a))$ and so we must have some $x in A$ such that $phi(x,overline(a))$ holds.
]


#theorem("Lowenheim-Skolem downwards Theorem")[
  Let $L$ be countable, for any $L$-structure $mM$ and every $A seq |mM|$, there exists an elementary substructure $mN subm mM$ with $A seq |mN|$
  $
    ||mN|| = |A| + |L| + aleph_0
  $
]<thrm-downwards>

#proof[
  Using induction we will define a sequence $A_n$ of subsets of $mM$, where at each step $n$ we will try to satisfy all statements in $L(A_(n-1))$, we will then set $|mN| = union.big_(n) A_n$.

  First we set $A_0 = A$, then at step $n > 0$, we will consider all formulas in $L(A_(n-1))$ (there are $|kappa times ZZ| = |kappa|$ many of them) and for each formula $phi(overline(x))$ we will pick some collection of elements $overline(a) seq |mM|$ such that $mM sat phi(overline(a))$, then we will add $overline(a)$ to $A_(n-1)$, adding these elements for each formula gives us $A_n$.
]

#remark("Skolem's Paradox")[
  Let $Z F C^* seq Z F C$ be a finite substructure which proves cantor's theorem. Let $V sat Z F C^*$. By the previous theorem we can find a countable $mM subm V$ for which $mM sat Z F C^*$ and $mM sat "\"exists an uncountable set\""$.
]

#definition[
  In FOL we have the concept of a _proof system_, consisting of two parts. 
  _Axioms_, and _proofs_ which is a finite sequence of $L$-formulas such that every step is either an axiom of follows from the previous steps using an inference rule.

]

#example[
  An example proof system has the following 4 types of axioms.
  - All instances of propositional tautologies are axioms.
  - $[forall x thin phi -> psi] -> [phi -> forall psi]$  as long as $x$ is not free in $phi$.
  - $forall x -> phi(subs(t,s))$ where $t$ is any $L$-term where the substitution is correct.
  - $x = x$, \ $x = y -> t(...,x,...) = t(...,y,...)$ for any $L$-term, \ $x = y -> (phi(...,x,...) -> phi(...,y,...))$

  And the following inference rules.
  - If $phi$ and $phi -> psi$ then $psi$.
  - If $phi$ then $forall x thin phi$.
]

We will use the notation $Gamma proves phi$ to mean "$Gamma$ proves $phi$" and define it as the existence of a proof whose final step is $phi$ and every step is either an axiom or an element of $Gamma$ or follows from a previous step or by an inference in $phi$.

#definition[
  We say that $Gamma$ is consistent if there exists $phi$ such that $Gamma tack.r.not phi$.
]

By a famous theorem of Gödel that we will not prove in this class we can actually not care about any proof system details.
#theorem("Gödel's completeness theorem")[
  Let $Gamma$ be a set of sentences in $L$ then $Gamma$ is consistent if and only if $Gamma$ has a model.
]

We will not prove this theorem in this class but we will use an important corollary of it.

#corollary("Compactness Theorem")[
  Let $Gamma$ be a set of $L$-sentences, $Gamma$ has a model if and only if every finite subset of $Gamma$ has a model.
]
#proof[
  The $=>$ direction is immediate, the hard part is the $arrow.l.double$ direction. By Gödel's completeness theorem, we can replace "having a model" with "is consistent".
  
    We now prove this by contrapositive, assume that $Gamma$ is inconsistent, then we have $Gamma proves exists x thin (x = x) and (not (x=x))$, now this proof consists of finitely many steps and thus can only use finitely many statements in $Gamma$, let $Gamma_0$ be that subset of statements. Since we can prove a contradiction using $Gamma_0$ it must also be inconsistent, thus one of the finite subsets of $Gamma$ is inconsistent.
]

As an example use we have the following theorem.

#theorem("Lowenheim-Skolem upwards Theorem")[
  If $mM$ is an infinite $L$-structure where $L$ is countably infinity then $forall k > ||mM||$ there exists a model $mN$ such that $mM subm mN$ and $||mN|| = k$
]
#proof[
  Let us consider the language $L' = L(mM) union {c_alpha : alpha < kappa}$ where $c_alpha$ are new constants.
  Now set 
  $
    Gamma = Th(mM) union { c_alpha eq.not c_beta : alpha eq.not beta < kappa}
  $

  We want to show now that $Gamma$ is consistent, to see this we use compactness and take an arbitrary finite subset $Gamma_0$. Let $alpha_1,...,alpha_n$ be such that 
  $ Gamma_0 seq Th(mM) union { c_(alpha_i) eq.not c_(alpha_j) : i eq.not j } $
  choose then any $a_1, ..., a_n in |mM|$ which are distinct and interpret $c_alpha_i$ as $a_i$ to get a model of $Gamma_0$, hence $Gamma_0$ is consistent.

  Now we have by Gödel's completeness theorem that there exists a model $mN$ such that $mN sat Gamma$ then by construction we have $mM subm mN$ and $||mN|| >= kappa$ and so by #link(<thrm-downwards>)[downwards theorem] we can now decrease the cardinality until we reach $kappa$.
]

#definition[
  A _theory_ is a set $Gamma$ of sentences such that if $Gamma proves phi$ then $phi in Gamma$.

  A theory $T$ is _complete_ if for every sentence $phi$ either $phi in T$ or $not phi in T$.
]

#remark[
  - For any model $mM$ the theory $Th(mM)$ is complete.

  - For any theory $T$ which is complete, there exists a model $mM$ with $T = Th(mM)$.
]

#corollary[
  If $mM$ is infinite then there exists $mN$ such that $mM equiv mN$ but $mM tilde.eq.not mN$.
]
#proof[
  We simply pick some $kappa > ||mM||$ and then use the upwards theorem to get a model $mN$ with $mM subm mN$ with $||mN|| = kappa$, now there can't exist a bijection between the two since they have different cardinalities.
]
== Categoricity
#definition[
  Let $kappa$ be an infinite cardinal, a theory $T$ is $kappa$-categorical if it has infinitely many models but exactly one model (up to isomorphism) of size $kappa$.
]
#proposition[
  If $T$ is $kappa$-categorical, then $T$ is complete.
]
#proof[
  Suppose that $T$ is not complete, let $sigma$ be such that $sigma in.not T$ and $not sigma in.not T$, then let $T_1 = T union {sigma}$ and $T_2 = T union {not sigma}$. Both are consistent but are not isomorphic, this contradicts the fact that there is only one model of this size.
]

#example[
  Consider the language $L = (<)$, a dense linear order ($D L O_0$) is the theory generated by the additional axioms: $<$ is total, dense and has no endpoints. 
  - Total means $forall x thin forall y (x = y or x < y or y < x)$ 
  - Dense means $forall x thin forall y(x < y => exists z x < z < y)$
  - No endpoints means $not (exists z thin forall x (x eq.not z => x < z))$ for the max endpoint and similarly for the min endpoint.

  Examples of such a structure include $QQ$, $RR$ and many others.

  It turns out, however, that the only countable such structure is $QQ$, up to isomorphism.
]

#proposition("Cantor")[
  $D L O_0$ is $aleph_0$-categorical.
]

#proof[
  Let $(A,<)$ and $(B,<)$ be two countable models of $D L O_0$, we enumerate them $A = {a_0, a_1,...}$ and $B = {b_0, b_1, ...}$.
  
  We now use the "back and forth" method, which essentially incrementally pairs up elements of $A$ with elements of $B$, and in the limit this will give us a bijection which will be our isomorphism.

  More formally we will construct a sequence $phi_n : A_n -> B_n$ where $A_n seq A, B_n seq B$ where each $phi_n$ is monotone increasing, and so that at step $2n$ we have $a_n in A_n$ and $b_n in B_n$.

  For the base case we take $a_0$ and pair it with anything in $B$, lets say $b_20$, now we look at the smallest (in the sense of the enumeration) element $b_i$ in $B$ (in this case $b_0$), and try to map it to something in $A$. Now $b_i$ will be somehow related to $b_20$, we can now use the density and the lack of endpoints to always find an element in $A$ that has the same relations as $b_i$ so we can always find a proper pairing.

]

#corollary[
  $D L O_0 = Th(QQ,<)$, and so is complete.
]

#example[
  $A C F_p$ is the theory generated by the axioms of an algebraically closed field of characteristic $p$.

  The key question for any theory is, "is this theory complete?". We want to use our previous method and show that $A C F_p$ is categorical for some cardinal, but it turns out that it is not $alpha_0$-categorical. To see this we note that $hat(QQ), hat(QQ[x]), hat(QQ[x,y]),...$ are all non-isomorphic algebraically closed fields, where $x,y$ are transcendental and $hat$ denotes algebraic closure.
]

#proposition[
  $A C F_p$ is $kappa$-categorical for every uncountable $kappa$.
]
#proof[
  If $K,L sat A C F_p$ of size $kappa$. The transcendental degree, the size of a field's transcendental basis, will also be equal to $kappa$, then any bijection between transcendental bases will extend to an isomorphism between $K$ and $L$.
]

#corollary[
  $A C F_p$ is complete.
]

We now want to discuss how to check that two models are elementarily equivalent.

#definition[
  Given a formula $phi$ its _quantifier depth_ $qd$ is defined by induction,
  - If $phi$ is atomic $qd(phi) = 0$.
  - If $phi$ is a logical connective like $phi_1 or phi_2$ then $qd(phi) = max(qd(phi_1),qd(phi_2))$
  - If $phi$ is a quantifier $exists x thin phi'$ then $qd(phi) = qd(phi') + 1$, similarly for $forall$.

  We write $mM equiv_n mN$ to mean "$mM$ is equivalent to $mN$ up to order $n$" if for every sentence $sigma$ of quantifier depth less than $n$ we have $mM sat phi <=> mN sat phi$.
]

We now define a tool for proving such partial equivalences.
#definition("Ehreufeucht-Fraisse (E-F) Games")[
  Let $L$ be finite relational, $Gamma(mM,mN)$ is a two player game where player I is called the spoiler and player II is called the prover. Together they will construct a function $f : A -> B$ where $A seq |mM|$ and $B seq |mN|$.

  Player I plays first and either plays an element of $m in |mM|$, challenging player II to put $m$ in the domain of $f$, or they play an element $n in |mN|$ challenging player II to put it in the range of $f$. Player II then plays the corresponding pairing for whatever player I played. Then player II starts again and they continue forever. Player II wins if the resulting $f$ is an isomorphism of the induced structures on $A$ and $B$.

  We will also define a finite version of this game which we will denote $Gamma(mM,mN)_n$, it is the same as the regular game except that it ends at step $n$ and prover wins if when it ends it is a finite partial isomorphism.
]


#theorem[
  Let $mM$ and $mN$ be $L$-structures where $L$ is a finite relational language. TFAE
  - $mM equiv mN$
  - The prover has a winning strategy in $Gamma(mM,mN)_n$ for every $n$.
]

To prove this we will need a lemma first.

#lemma[
  We say that formulas $phi(overline(x)), psi(overline(x))$ are equivalent if $forall overline(x) thin phi(overline(x)) <=> psi(overline(x))$ is true in every model. Equivalently if $forall overline(x) thin phi <=> psi$ is provable from the empty set of axioms.

  For each $n, ell$ there exists a finite list $Phi_1, ..., Phi_k$ of formulas with $qd(n)$ in $ell$ variables such that every formula $phi$ with $qd(phi) <= n$ in $ell$ variables is equivalent to $phi_i$ for some $i <= k$.
]
#proof[
  We induct on $n$, $n = 0$, there are finitely many atomic formulas so we are done.
  If $phi$ is quantifier free, then it is a boolean combination of formulas $tau_1,...,tau_m$ then $phi$ is equivalent to
  $
    or.big_(X in S) (and.big_(i in X) sigma_i and.big_(i in.not X) (not sigma_i))
  $
  where $S$ is a collection of subsets of ${1,...,m}$, this case then follows from the fact that $S$ is finite. 
  Now assume this holds for quantifier depth at most $n$, if $phi$ is of quantifier depth at most $n + 1$, then $phi$ is equivalent to a disjunction of conjunctions of formulas of the form $exists x thin phi'$ or $forall x thin phi'$, where $qd(phi') <= n$. By inductive hypothesis we then have $phi'$ is equivalent to one of finitely many formulas $Phi'_k$, then $exists x thin phi'$ is equivalent to $exists x thin Phi'_k$ and similarly for $forall$.
]

We will now use this lemma to prove a slightly weaker statement that will then use to prove the main theorem.
// TODO: REMOVE DISCLAIMER
#lemma("This is different from what he wrote in class but what he wrote in class was wrong")[
  TFAE
  - $mM equiv_n mN$
  - Prover has a winning strategy in $Gamma(mM, mN)_n$.
]
#proof[
  We show equivalence by induction on $n$.
  For $n = 0$ this is obvious since the two conditions are empty. For $n > 0$ we know that one of the two players has a winning strategy since its a finite length game. 

  Assume then that $mM equiv_n mN$, we want to show the prover has a winning strategy. Suppose spoiler plays $a in M$, by the previous lemma there exists a formula $phi(x)$ of quantifier depth at most $n - 1$ such that $mM sat phi(a)$ where $ mN sat phi(b) <=> (mM, a) equiv_(n-1) (mN, b). $
  Since $mM sat exists x thin phi(x)$, the quantifier depth of $exists x thin phi(x) <= n$, and by our assumption $mM equiv_n mN$ we have that $mN sat exists x thin phi(x)$ so there is some $b$ such that $mN sat phi(b)$. Our strategy is to just play $b$ and then continue with whatever strategy we have for the $n-1$ step game.

  Now assume that $mM equiv.not_n mN$, but that the duplicator has a winning strategy, so there exists a formula $exists x thin phi(x)$ where the quantifier depth of $phi$ is at most $n - 1$ such that 
  $
    mM sat exists x thin phi(x) "but" mN tack.r.double.not exists x thin phi(x)
  $
  Choose $a in mM$ such that $mM sat phi(a)$ and make $a$ the first move of the spoiler. Let $b$ be the response of the duplicator, then in $Gamma_(n-1) (mM(a), mN(b))$ the prover still has a winning strategy so by inductive hypothesis $(mM,a) equiv_(n-1) (mN, b)$ which contradicts the above assertion.
]

#proposition[
  If $mM$ and $mN$ are countable then we also have 
  $
    mM tilde.eq mN <=> "The prover has a winning strategy in" Gamma(mM,mN)
  $
]
#proof[
  Exercise
]

#corollary[
  In a finite relational language two countable structures are isomorphic iff they are elementarily related.
]

== Ultrafilters and Ultraproducts

#definition[
  A family $cal(F) seq cal(P)(I)$ is called a filter if it is non empty, does not contain the empty set and satisfies the two conditions 
  - $A in cal(F), B in cal(F) => A sect B in cal(F)$
  - $A in cal(F), A seq B => B in F$.
]

#example[
  The collection of cofinite subsets of $NN$, the set of neighborhoods of any point in a topological points, the set of subsets containing a fixed element in any set.

  This last example is called a principle filter.
]

#definition[
  A filter is called maximal if it is not strictly contained in any other filter, also sometimes called ultrafilter.
]

#remark[
  By Zorn's lemma every filter is contained in at least one maximal filter. Since the collection of cofinite subsets is not a maximal filter and is not contained in the principle filter this proves that there are non-principle ultrafilters (assuming ZFC).
]

#proposition[
  Let $cal(F)$ be a filter. TFAE 
  - $cal(F)$ is an ultrafilter
  - For any $A seq I$ we either have $A in cal(F)$ or $A in.not cal(F)$.
]

#definition[
  If $(mM_i)_(i in I)$ are $L$-structures we can define $product_(i in I) mM_i$ to be an $L$-structure with the natural pointwise interpretation of all the constants, relations, and functions.
]

This definition is not really satisfying from the point of view of model theory since it rarely preserves any structure. For example the product of two fields is not a field. However, we can take the quotient of the product by a maximal ideal to get a field, this is the approach we will try to mimic with model theory and ultrafilters.
