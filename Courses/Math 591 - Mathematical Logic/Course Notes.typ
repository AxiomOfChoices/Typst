#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/monograph.typ": frontpage
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing


#show: doc => frontpage(
  toptitle: [Mathematical Logic],
  name: [Jacob Reznikov],
middletitle: [My course notes for the Winter 2024 Mathematical Logic course by #link("https://www.math.mcgill.ca/msabok/")[Marcin Sabok] at McGill],
doc)

#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm))

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
  We will often use $ov(a)$ to denote the ordered collection $(a_1,...,a_n)$ where $n$ will be clear from context.
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
#pagebreak(weak: true)
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
  (g(a_1),...,g(a_n)) in underline(R_j)^mN\
  g(underline(f_i)^mM (a_1,...,a_n)) = underline(f_i)^mN (g(a_1),...,g(a_n))
  $

  We write $mM elm(lt.curly.eq) thin thin mN$ to mean $mM$ is an elementary substructure of $mN$ which is true if $mM seq mN$ and for every formula $phi(ov(x))$ and for every $ov(a) seq |mM|$ we have 
  $ 
  mM sat phi(ov(a)) <=> mN sat phi(ov(a))
  $
]

#theorem("Tarski-Vaught test")[
  Suppose $mM$ is an $L$-structure, $A seq |mM|$, then $A$ is the universe of an elementary substructure iff the following condition holds, called the Tarski-Vaught test

  #block(inset: (x: 2em))[For every formula $phi(x, ov(y))$ in $L$ and every $ov(a) seq A$, if $mM sat exists x thin phi(x, ov(a))$ then there exists $b in A$ such that $mM sat phi(b, ov(a))$]
]<thrm-tv_test>
#proof[
  First the $arrow.l.double$ direction, assume that the T-V test holds, then we need to show that $A$ is a substructure. First we use $phi = (x=c)$ to show that $A$ contains all constants of $mM$, then $phi = (x = phi_i (ov(a)))$ for $ov(a) seq A$, and we define the interpretation of $underline(R_j)$ to be exactly $underline(R_j)^mM sect A^(a_j)$ to make it a substructure.

  Now $A$ being a substructure is equivalent to 
  $
    A sat phi(ov(a)) <=> mM sat phi(ov(a))
  $
  for all $ov(a) seq A$ and $phi$ being an _atomic_ formula. So now we only need to prove this is true for the other formula types.
  - The connective types are immediate.
  - Let us assume $phi(ov(x)) = exists y thin psi(y, ov(x))$. Then $mM sat phi(ov(a))$ iff $mM sat exists y thin psi(y, ov(a))$ iff there exists $b in A$ with $mM sat psi(b, ov(a))$. But by definition this last form is equivalent to $A sat exists y thin psi(y, ov(a))$

  Assume, on the other hand, that $A$ is the universe of an elementary substructure $cal(A)$, then we need to prove the T-V test holds, assume then that for some formula $phi(x,ov(y))$ in $L$ and some $ov(a) seq A$ we have $mM sat exists x thin phi(x, ov(a))$ and so since it is an elementary substructure we also have that $cal(A) sat exists x thin phi(x, ov(a))$ and so we must have some $x in A$ such that $phi(x,ov(a))$ holds.
]


#theorem("Lowenheim-Skolem downwards Theorem")[
  Let $L$ be a language, for any $L$-structure $mM$ and every $A seq |mM|$, there exists an elementary substructure $mN elm mM$ with $A seq |mN|$
  $
    ||mN|| = |A| + |L| + aleph_0
  $
]<thrm-downwards>

#proof[
  Set $kappa = |A| + |L| + aleph_0$, using induction we will define a sequence $A_n$ of subsets of $mM$, where at each step $n$ we will try to satisfy all existential statements in $Th_L(A_(n-1))(mM)$, we will then set $|mN| = union.big_(n) A_n$.

  First we set $A_0 = A$, then at step $n > 0$, we will consider all formulas in $L(A_(n-1))$ (there are $|kappa times NN| = |kappa|$ many of them) and for each formula $phi(ov(x))$ we will pick some collection of elements $ov(a) seq |mM|$ such that $mM sat phi(ov(a))$, then we will add $ov(a)$ to $A_(n-1)$, adding these elements for each formula gives us $A_n$.

  Now we can use @thrm-tv_test to check that $mN elm mM$. Let $phi(ov(a)) = exists x (psi(x),ov(a))$ be a formula in $Th_L(mN)(mM)$, then $ov(a) in |mN|$ and so $ov(a) in A_n$ for some $n$ and thus for some $b in A_(n+1)$ we have $mN sat psi(b, ov(a))$ and thus $mN sat phi(ov(a))$.
]

#remark("Skolem's Paradox")[
  Let $Z F C^* seq Z F C$ be a finite substructure which proves Cantor's theorem. Let $V sat Z F C^*$. By the previous theorem we can find a countable $mM elm V$ for which $mM sat Z F C^*$ and $mM sat$ "exists an uncountable set".
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
]<thrm-completeness>

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
  If $mM$ is an infinite $L$-structure where $L$ is countably infinity then $forall k > ||mM||$ there exists a model $mN$ such that $mM elm mN$ and $||mN|| = k$
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

  Now we have by Gödel's completeness theorem that there exists a model $mN$ such that $mN sat Gamma$ then by construction we have $mM elm mN$ and $||mN|| >= kappa$ and so by #link(<thrm-downwards>)[downwards theorem] we can now decrease the cardinality until we reach $kappa$.
]



#corollary[
  If $mM$ is infinite then there exists $mN$ such that $mM equiv mN$ but $mM tilde.eq.not mN$.
]
#proof[
  We simply pick some $kappa > ||mM||$ and then use the upwards theorem to get a model $mN$ with $mM elm mN$ with $||mN|| = kappa$, now there can't exist a bijection between the two since they have different cardinalities.
]
#definition[
  A _theory_ is a set $Gamma$ of sentences such that if $Gamma proves phi$ then $phi in Gamma$.
  A theory $T$ is _complete_ if for every sentence $phi$ either $phi in T$ or $not phi in T$.
]
#remark[
  - For any model $mM$ the theory $Th(mM)$ is complete.

  - For any theory $T$ which is complete and consistent, there exists a model $mM$ with $T = Th(mM)$.
]

== Categoricity
#definition[
  Let $kappa$ be an infinite cardinal, a theory $T$ is $kappa$-categorical if it has infinitely many models but exactly one model (up to isomorphism) of size $kappa$.
]
#proposition[
  If $T$ is $kappa$-categorical, then $T$ is complete.
]
#proof[
  Suppose that $T$ is not complete, let $sigma$ be such that $sigma in.not T$ and $not sigma in.not T$, then let $T_1 = T union {sigma}$ and $T_2 = T union {not sigma}$. Both are consistent, and thus have models of size $kappa$ which are both models of $T$, but the models are not isomorphic. This contradicts the fact that there is only one model of this size.
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

  The key question for any theory is, "is this theory complete?". We want to use our previous method and show that $A C F_p$ is categorical for some cardinal, but it turns out that it is not $aleph_0$-categorical. To see this we note that $hat(QQ), hat(QQ[a]), hat(QQ[a,b]),...$ are all non-isomorphic algebraically closed fields, where $a,b$ are transcendental and $hat$ denotes algebraic closure.
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
  - If $phi$ is a formula of the form $phi_1 or phi_2$ then $qd(phi) = max(qd(phi_1),qd(phi_2))$
  - If $phi$ is a formula of the form $exists x thin phi'$ then $qd(phi) = qd(phi') + 1$, similarly for $forall$.

  We write $mM equiv_n mN$ to mean "$mM$ is equivalent to $mN$ up to order $n$" if for every sentence $sigma$ of quantifier depth less than $n$ we have $mM sat phi <=> mN sat phi$.
]

We now define a tool for proving such partial equivalences.
#definition("Ehreufeucht-Fraisse (E-F) Games")[
  Let $L$ be finite relational, $Gamma(mM,mN)$ is a two player game where player I is called the Spoiler and player II is called the Prover. Together they will construct a function $f : A -> B$ where $A seq |mM|$ and $B seq |mN|$.

  Spoiler plays first and either plays an element of $m in |mM|$, challenging Prover to put $m$ in the domain of $f$, or they play an element $n in |mN|$ challenging Prover to put it in the range of $f$. Prover then plays the corresponding pairing for whatever Spoiler played. Then Spoiler starts again and they continue forever. Prover wins if the resulting $f$ is an isomorphism of the induced structures on $A$ and $B$, and Spoiler wins otherwise.

  We will also define a finite version of this game which we will denote $Gamma(mM,mN)_n$, it is the same as the regular game except that it ends at step $n$ and Prover wins if when it ends it is a finite partial isomorphism.
]


#theorem[
  Let $mM$ and $mN$ be $L$-structures where $L$ is a finite relational language. TFAE
  - $mM equiv mN$
  - The Prover has a winning strategy in $Gamma(mM,mN)_n$ for every $n$.
]

To prove this we will need a lemma first.

#lemma[
  We say that formulas $phi(ov(x)), psi(ov(x))$ are equivalent if $forall ov(x) thin phi(ov(x)) <=> psi(ov(x))$ is true in every model. Equivalently if $forall ov(x) thin phi <=> psi$ is provable from the empty set of axioms.

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
#lemma[
  TFAE
  - $mM equiv_n mN$
  - Prover has a winning strategy in $Gamma(mM, mN)_n$.
]
#proof[
  We show equivalence by induction on $n$.
  For $n = 0$ this is obvious since the two conditions are empty. For $n > 0$ we know that one of the two players has a winning strategy since its a finite length game. 

  Assume then that $mM equiv_n mN$, we want to show the Prover has a winning strategy. Suppose Spoiler plays $a in M$, by the previous lemma there exists a formula $phi(x)$ of quantifier depth at most $n - 1$ such that $mM sat phi(a)$ where $ mN sat phi(b) <=> (mM, a) equiv_(n-1) (mN, b). $
  Since $mM sat exists x thin phi(x)$, the quantifier depth of $exists x thin phi(x) <= n$, and by our assumption $mM equiv_n mN$ we have that $mN sat exists x thin phi(x)$ so there is some $b$ such that $mN sat phi(b)$. Our strategy is to just play $b$ and then continue with whatever strategy we have for the $n-1$ step game.

  Now assume that $mM equiv.not_n mN$, but that the duplicator has a winning strategy, so there exists a formula $exists x thin phi(x)$ where the quantifier depth of $phi$ is at most $n - 1$ such that 
  $
    mM sat exists x thin phi(x) "but" mN tack.r.double.not exists x thin phi(x)
  $
  Choose $a in |mM|$ such that $mM sat phi(a)$ and make $a$ the first move of the Spoiler. Let $b$ be the response of the duplicator, then in $Gamma_(n-1) (mM(a), mN(b))$ the Prover still has a winning strategy so by inductive hypothesis $(mM,a) equiv_(n-1) (mN, b)$ which contradicts the above assertion.
]

#proposition[
  If $mM$ and $mN$ are countable then we also have 
  $
    mM tilde.eq mN <=> "The Prover has a winning strategy in" Gamma(mM,mN)
  $
]
#proof[
  Assume $mM tilde.eq mN$, then the Prover wins trivially by just following the isomorphism.

  On the other hand assume Prover has a winning strategy, then we can play the role of the Spoiler to force Prover to construct an isomorphism. First enumerate the models 
  $
  |mM| = { m_0, m_1, ... }, quad
  |mN| = { n_0, n_1, ... }
  $
  on the first turn we pick $m_0$ and let Prover map it to some element of $|mN|$. On the second turn we pick the smallest index element of $|mN|$ that has not been picked before and force Prover to map it. We continue this, on odd turns we pick the smallest index element of $|mM|$ that has not been picked before, and on even turns we pick the smallest index element of $|mN|$ that has not been picked before. This essentially forces Prover to use the back-and-forth method. Since every element of both models will eventually be mapped and since Prover has to win this game, the resulting map $union.big_i f_i$ will be an isomorphism between $mM$ and $mN$.
]

== Ultrafilters and Ultraproducts

#definition[
  A family $cal(F) seq cal(P)(I)$ is called a filter if it is non empty, does not contain the empty set and satisfies the two conditions 
  - $A in cal(F), B in cal(F) => A sect B in cal(F)$
  - $A in cal(F), A seq B => B in F$.
]

#example[
  - The collection of cofinite subsets of $NN$
  - The set of neighborhoods of any point in a topological space
  - The set of subsets containing a fixed element in any set.

  This last example is called a principal filter.
]

#definition[
  A filter is called an _ultrafilter_ if it is not strictly contained in any other filter.
]

#remark[
  By Zorn's lemma every filter is contained in at least one ultrafilter. Since the collection of cofinite subsets is not contained in the principal filter this proves that every infinite set admits a non-principal ultrafilter (assuming ZFC).
]

#proposition[
  Let $cal(U)$ be a filter over $I$. TFAE
  - $cal(U)$ is an ultrafilter
  - For any $A seq I$ we have either $A in cal(U)$ or $I backslash A in cal(U)$, but not both.
]<prop-ultrafilter>
#proof[
  Assume that $cal(U)$ is an ultrafilter, then clearly for every $A$ we cannot have both $A$ and $I backslash A$ be in $cal(U)$. Now take some $A in.not cal(U)$, then
  $
    cal(U)' = { Y' seq I : Y backslash A seq Y' "for some" Y in cal(U) }
  $
  this is a filter since
  $
    Y_1 backslash A seq Y_1' "and"
    Y_2 backslash A seq Y_2'
    =>
    (Y_1 sect Y_2) backslash A = (Y_1 backslash A) sect (Y_2 backslash A) seq Y_1' sect Y_2'
  $
  and is obviously upwards closed. Now $cal(U) seq cal(U)'$ since for every $Y in cal(U)$ we have $Y backslash X seq Y$ and so since $cal(U)$ is an ultrafilter then $cal(U) = cal(U)'$. But note that $I in cal(U)$ so $I backslash A in cal(U)'$ and so $I backslash A in cal(U)$.

  On the other hand assume that the second condition holds, then let $F$ be a filter containing $cal(U)$, then if $F$ contains a subset $A in.not cal(U)$ then $I backslash A in cal(U)$ and so $I backslash A in F$. But then $A sect (I backslash A) = nothing in F$ which contradicts the definition of a filter.
]

#corollary[
  If $cal(U)$ is an ultrafilter
  $ A union B in cal(U) <=> A in cal(U) or B in cal(U) $
]

#remark[
  An Ultrafilter has a very natural description as a finitely additive measure on $I$, who's only values are $0$ and $1$. The measure is defined by $mu(A) = 1 <=> A in I$.

  In this context, if $p(x)$ holds on all $x in A$ for some $A in cal(U)$, then we can think of this as $p(x)$ holding almost everywhere. It is through this lens that we will often think of ultrafilters, so keep this in mind as you read the rest of this section.
]

#definition[
  If $(mM_i)_(i in I)$ are $L$-structures we can define $product_(i in I) mM_i$ to be an $L$-structure with the natural pointwise interpretation of all the constants, relations, and functions.
]

This definition is not really satisfying from the point of view of model theory since it rarely preserves any structure. For example the product of two fields is not a field. However, we can take the quotient of the product by a maximal ideal to get a field, this is the approach we will try to mimic with model theory and ultrafilters.

#definition[
  Let $I$ be a set. Let $(mM_i : i in I)$ be a sequence of $L$-structures. Let $cal(U)$ be an ultrafilter on $I$, the _ultraproduct_ 
  $
    product_(i in I) mM_i slash.big cal(U)
  $
  is defined as follows.

  On $product_(i in I) |mM_i|$ we define the equivalence relation $tilde_cal(U)$ by 
  $
    (a_i) tilde_cal(U) (b_i) "if" { i in I : a_i = b_i } in cal(U)
  $
  one can easily show that this is indeed an equivalence relation.

  The universe of $product_(i in I) mM_i slash.big cal(U)$ is just this infinite Cartesian product quotiented by this equivalence relation.
  The constants are interpreted as just the sequence of interpretations on each $mM_i$. Functions are interpreted pointwise as one would expect. Relations are interpreted as
  $
    R^(product_(i in I) mM_i slash.big cal(U))([(a_i^1)]_(tilde_cal(U)), ..., [(a_i^k)]_(tilde_cal(U))) "if"
    { i in I : mM_i sat R(a_i^1,...,a_i^k) } in cal(U)
  $
]
#remark[
  One needs to check that the last two interpretations are well defined, but this is easy to do by the definition of an ultrafilter.
]
#remark[
  If $cal(U)$ is the principal ultrafilter generated by $i_0 in I$ then 
  $ product_(i in I) mM_i slash.big cal(U) tilde.eq mM_(i_0) $
]
#theorem("Łoś's theorem")[
  Let $product mM_i slash.big cal(U)$ be an ultraproduct, fix any formula $phi(x_1,...,x_n)$ and $(a^1_i),...,(a^n_i) in product mM_i$ we have 
  $
    product mM_i slash.big cal(U) sat phi([(a^1_i)], ..., [(a^n_i)])
    <=>
    { i in I : mM_i sat phi(a^1_i, ..., a^n_i) } in cal(U)
  $
]
#proof[
  The atomic case is covered by the definition of an ultraproduct.

  We now induce on the complexity of $phi$, 
  - For $phi = phi_1 and phi_2$ we have by definition
  $
    product mM_i slash.big cal(U) sat phi <=> 
    product mM_i slash.big cal(U) sat phi_1 "and" 
    product mM_i slash.big cal(U) sat phi_2
  $
  now set 
  $
    A = { i in I : mM_i sat phi_1 } quad 
    B = { i in I : mM_i sat phi_2 }
  $
  then we know that for any $A,B$ we have $ A in cal(U), B in cal(U) <=> A sect B in cal(U) $ now by inductive hypothesis we have 
  $
    product mM_i slash.big cal(U) sat phi_1 "and" 
    product mM_i slash.big cal(U) sat phi_2
    <=>
    A in cal(U) "and" B in cal(U)
  $
  and so combined this gives us exactly what we want.
  - For $phi = not phi_1$ we have 
  $
    product mM_i slash.big cal(U) sat phi <=> product mM_i slash.big cal(U) tack.r.double.not phi_1
  $
  but since $cal(U)$ is an ultrafilter then by @prop-ultrafilter we have that 
  $
    { i in I : mM_i sat phi } in cal(U) <=> { i in I : mM_i sat phi }^c in.not cal(U) <=>  { i in I : mM_i sat phi_1 } in.not cal(U)
  $
  which is exactly what we want. This also gives us the disjunction case.
  - For $phi = exists psi$ we have 
  $
    uproduct sat phi <=> exists (a_i) in product mM_i : uproduct sat psi([a_i])
  $
  but by inductive hypothesis this is equivalent to
  $
    { i in I : mM_i sat psi(a_i) } in cal(U)
  $
  and so we have 
  $
    { i in I : mM_i sat psi(a_i) } seq { i in I : mM_i sat exists x thin psi(x)}
  $
  and thus the right set here is also in $cal(U)$ which proves what we wanted to show.
]

#corollary[
  If the $mM_i$ are all elementarily equivalent then $ Th(product mM_i slash.big cal(U)) = Th(mM_i) $
]

#definition[
  If $mM_i = mM$ for all $i in I$, then $product mM_i slash.big cal(U)$ is called the _ultrapower_ of $mM$.
]

#corollary[
  Let $T$ be a set of sentences $T$ has a model iff every finite subset of $T$ has a model.
]
#proof[
  Assume that $L$ is countable and $T$ is countable and enumerate $T = { sigma_1, sigma_2, ... } $. Then set $T_n$ to be the truncation of $T$, that is $T_n = { sigma_1, ..., sigma_n }$. By assumption we have the existence of some models $mM_n$ with $mM_n sat T_n$. Let $cal(U)$ be a non-principal ultrafilter on $NN$.

  Set $mM = product_(i in NN) mM_i slash.big cal(U)$, then 
  $
    mM sat sigma <=> { n in NN : mM_n sat sigma } in cal(U)
  $
  Now for a fixed $sigma_i$ we have $mM_n sat sigma_i$ if $n >= i$ so
  $
    {n in NN : mM_n sat sigma_i } in cal(U)
  $
  because it is cofinite and a non-principal ultrafilter contains all cofinite sets. Thus 
  $
    product mM_i slash.big cal(U) sat sigma_i
  $

  The uncountable case is a bit more complicated, we start with defining $ F = { Delta seq T : Delta "is finite"}. $ Now set $X_Delta = { Y in F : Delta seq Y }$, then I claim that the set 
  $
    D = { Y seq F : X_Delta seq Y "for some" Delta }
  $
  is a filter. This is easy to see by just checking the definition. Now since it is a filter it is contained in some maximal ultrafilter $cal(U)$.
  Now for each finite subset $Delta in F$ we have some model $mM_Delta sat Delta$ so we can consider $mM = product_(Delta in F) mM_Delta slash cal(U)$. Now for a fixed $sigma in T$ we have that 
  $
    { Delta in F : mM_Delta sat sigma } supset.eq X_{sigma} in cal(U),
  $
  and so $mM sat sigma$.
]

#pagebreak(weak: true)
== Types and Definable Sets
We will now develop more tools to use with models, first of these is the *type*, in short, a type is to formulas what a satisfiable theory is to sentences.
#definition[
  Let $L$ be countable, and $T$ a complete $L$-theory.
  Let $mM sat T$ then for $a in |mM|$ we say that the _type_ of $a$ is
  $
  tp^mM (a) = { phi(x) : mM sat phi(a) }.
  $
  If two elements $a,b$ have the same type then we cannot distinguish $a,b$ with first order formulas.

  More generally, if $ov(a)$ is a tuple of elements of $mM$ then the _type_ of $ov(a)$ is
  $
    tp^mM (ov(a)) = { phi(x) : mM sat phi(ov(a)) }.
  $
]

We will also use the following notation
$
  F_L (ov(x)) = { "formulas with variables" ov(x) }
$
if $phi(ov(a)) in F_L (ov(x))$ and $mM$ is a model 
$
  phi(mM) = { ov(a) in mM : mM sat phi(ov(a)) }
$

#definition[
  $phi(ov(x))$ is $T$-_consistent_ if $T proves exists ov(x) phi(ov(x))$ or equivalently $phi(mM) eq.not nothing$.
]
#definition[
  A set of formulas $p(ov(x)) seq F_L (ov(x))$ is $T$-_consistent_ if for every finite subset $p_0(ov(x)) seq p(ov(x))$ we have 
  $
    T proves exists ov(x) (and.big_(phi in p_0) phi(ov(x)) )
  $
]
#definition[
  A _type in_ $T$ is a set of formulas $p(ov(x))$ which is $T$-consistent, we call it a 1-type if $ov(x) = x$ and an $n$-type if 
  $ov(x) = (x_1,...,x_n)$
]
#definition[
  A type $p(ov(x))$ is _complete_ if for every formula $phi(ov(x)) in F_L (ov(x))$ either $phi(ov(x)) in p$ or $not phi(ov(x)) in p$
]

#example[
  $tp^mM (ov(x))$ is always a complete type
]
#remark[
  If $mM elm mN$, and $ov(a) in mM$ then $tp^mM (ov(a)) = tp^mN (ov(a))$.
]

Slightly generalizing the concept of a type we have the following
#definition[
  For a set of parameters $A seq |mM|$ we define
  $
    T(A) = Th_(L(A)) (mM),
  $
  that is all the true $L(A)$-sentences in $mM$.

  A type _over_ $A$ is a type in $T(A)$.
]

We then have the generalization of the notation,
$
  F_(L(A))(ov(x)) = {phi(ov(x), ov(a)) : ov(a) in A, phi(ov(x), ov(y)) in F_L (ov(x), ov(y))}
$
and
$
  tp^mM (subs(ov(b),A)) =  { phi(ov(x), ov(a)) : mM sat phi(ov(b), ov(a)) }
$
as well as 
$
  S_n^T (A) = { "all complete n-types in " T "on" A}
$


#definition[
  A type $p(ov(x))$ is realized in a model $mM$ if there exists $ov(a) in mM$ with $p(ov(x)) seq tp^mM (ov(a))$.
]
#example[
  If $T = D L O_0$ and $mM = QQ$ then
  $
    p(x) = {s < x, x < r : s < sqrt(2) < r }
  $
  is not realized in $QQ$.
]
Types have several basic properties that we will use quite often.
#proposition[
  If $p(ov(x))$ is a type over $A seq |mM|$ then there exists $mM elm mN$ such that $p(ov(x))$ is realized in $mN$.
]<prop-add_one_type>
#proof[
  Let $ov(c)$ be new constants, define 
  $
    T' = { phi(ov(c)) : phi(ov(x)) in p(ov(x)) } union Th_(L(M))(M)
  $
  and model of $T'$ will realize $p$ because the interpretation of $ov(c)$ will realize $p$.

  Since $Th_(L(M))(M) seq T'$ any model of $T'$ will be an elementary extension of $mM$. It is thus enough to show that $T'$ is consistent.

  By assumption every finite subset of $p(ov(x))$ will be consistent with $Th_(L(M))(M)$ and thus by compactness $T'$ is consistent.
]
#corollary[
  Every type is a subset of a complete type since if $p$ is realized by $ov(b) in mN$ then $p seq tp^mN (subs(ov(b),A))$
]

We can also prove the above corollary in a different way, using Zorn's lemma, we will need some more notation.
#definition[
  A subset $F seq BB backslash {0}$, where $BB$ is a Boolean algebra, is a _filter_ if
  - If $a,b in F$ then $a dot b in F$.
  - If $a in F$ and $a <= b$ then $b in F$

  An _ultrafilter_ is a maximal filter with respect to inclusion.
]

#example[
  The principal ultrafilter $cal(U)$ on $BB$ if $cal(U) = { a in BB : a >= a_0 }$ for some atom $a_0$.
]
#definition[
  If $BB$ is a Boolean algebra then $S(BB)$ is the set of all ultrafilters over $BB$, we can give it a topology generated by 
  $
    [ a ] = { cal(U) in S(BB) : a in cal(U) }
  $
]

#proposition[
  + ${ [a] : a in BB }$ is indeed a basis of a topology.
  + $[a]^c = [-a]$
  + $[a + b] = [a] union [b]$
  + $[a dot b] = [a] sect [b]$
  + The topology defined above is Hausdorff and compact.
]
#proof[
  + This will follow from 4.
  + For any ultrafilter $cal(U)$ that does not contain $a$ we must have $-a in cal(U)$ and so
    $
      cal(U) in [a] <=> cal(U) in.not [-a]
    $
  + Since $a,b <= a + b$ then
    $
      (cal(U) in [a]) or (cal(U) in [b]) => (a + b) in cal(U) => cal(U) in [a + b]
    $
    on the other hand $a + b in cal(U) => (a in cal(U)) or (b in cal(U))$ and so
    $
      cal(U) in [a + b] => (cal(U) in [a]) or (cal(U) in [b])
    $
  + Since $a dot b <= a,b$ then almost by definition
    $
      (a in cal(U)) and (b in cal(U)) <=> a dot b in cal(U)
    $
  + For any two distinct ultrafilters $cal(U), cal(U)'$, then for some $x$ we have $x in cal(U)$ and $x in.not cal(U)'$. Then $cal(U) in [x], cal(U)' in.not [x]$ as well as $cal(U) in.not [-x], cal(U)' in [-x]$ and so the topology is Hausdorff.
    To show compactness let $union.big_(i) [a_i] = S(BB)$, then ${ - a_i : i in I }$ cannot be a subset of any ultrafilter $cal(U)$, for then
    $
    -a_i in cal(U), forall i in I => a_i in.not cal(U), forall i in I => cal(U) in.not [a_i], forall i in I => cal(U) in.not union.big_(i) [a_i].
    $
    Thus, some finite subset of $-a_i$'s must have product zero since otherwise ${ - a_i : i in I }$ satisfies the finite intersection property and thus is contained in some ultrafilter. But then if ${-a_(i_1), ..., -a_(i_k)}$ has zero product then any ultrafilter cannot contain all of them, thus any ultrafilter $cal(U)$ has to contain some $a_(i_j)$ and so $union.big_k [a_(i_k)] = S(BB)$.
]

#theorem("Stone's Theorem")[
  For every Boolean algebra $BB$ there exists a set $I$ with $BB seq cal(P)$
]
#proof[
  Set $I = S(BB)$ and the map $a |-> [a]$ is clearly a homomorphism by the above proposition, to see it is 1 to 1 we use the proof for Hausdorffness above to see that $[a] eq.not [b]$.
]

#proposition[
  Let $cal(U)$ be an ultrafilter, $cal(U)$ is principal iff it is isolated in $S(BB)$.
]
#proof[
  Assume that ${cal(U)}$ is an open set, then ${cal(U)} = [a]$ for some $a$. Now if $a$ is not atomic then $0 < b < a$ for some $b$ and so $[a] = [a dot b] union [a dot (- b)]$ but $[a dot b],[a dot (-b)]$ are both non-empty and not equal since they both contain the ultrafilters generated by the filter 
  $
    { Y in BB : a dot b <= Y } "and" { Y in BB : a dot (-b) <= Y }
  $
  this contradicts the fact that $[a]$ contains only one element. Thus $a$ is an atom and so the principal ultrafilter of $a$ is in $[a]$. Since $[a] = {cal(U)}$ we have that $U$ must be the principal ultrafilter of $a$.

  On the other hand if $cal(U)$ is principal then $cal(U) in [a]$ for some atom $a$ but since its atomic anything in $[a]$ must be the principal ultrafilter of $a$. Thus $[a] = {cal(U)}$ and so $cal(U)$ is isolated.
]

#definition[
  Let $T$ be a complete theory and $mM sat T$ then 
  $
    Def(mM) = { phi(mM) : phi in F_L (x) }
  $
  is a Boolean algebra of subsets of $mM$ called the algebra of _definable_ subsets of $mM$.
]
#proposition[
  The map $iota : F_L (ov(x)) -> Def(mM)$ given by 
  $
    iota : phi |-> phi(mM)
  $
  is a homomorphism.
]
#remark[
  $ker(iota) = { phi : phi(mM) = nothing }$ is the set of $T$-inconsistent formulas.
]
We have then by Isomorphism theorem for rings
$
  F_L (ov(x)) slash ker (iota) tilde.equiv Def(mM)
$

We can also identify $S_n^T (nothing)$ with $S(F_L (ov(x)))$ which makes it a compact set with basic open sets $[phi(ov(x))] = {p in S_n^T (nothing) : phi(ov(x)) in p }$.

#proposition[
  If $L$ is countable then $S_n^T (nothing)$ is homeomorphic to a closed subset of the Cantor space.
]<prop-types_cantor_space>
#proof[
  To see this we will turn $S_n^T (nothing)$ into an infinite binary tree, first enumerate $F_L (ov(x)) = { phi_1,... }$ then for every type $p in S_n^T (nothing)$ we have either $phi_1 in p$ or $not phi_1 in p$. This gives a splitting of $S_n^T (nothing)$ into two open subsets, we then split again on $phi_2$ and get 4 open subsets. Continuing this construction, we get that the complete types will be infinite branches in this tree, and it is well known that such an infinite binary tree is isomorphic to the Cantor space.
]
#remark[
  This construction can also be done with $L$ uncountable, we then get a homomorphism to $2^(|L|)$ seen as a product space.
]

The closed sets of $S_n^T (nothing)$ are of the form $[p(ov(x))] = {q in S_n^T (nothing) : p seq q }$.

All of these also hold if we change $S_n^T (nothing)$ to $S_n^T (A)$

#definition[
  If $mM$ is a model of $T$ and $kappa >= aleph_0$ is an infinite cardinal, we say that $mM$ is $kappa$-_saturated_ if for every subset $A seq |mM|$ of size less than $kappa$ every type in $S_n^T (A)$ is realized in $mM$.

  $mM$ is _saturated_ if $mM$ is $|mM|$-saturated.
]

#remark[
  ${x eq.not a : a in mM}$ is not realized in any model $mM$, so no model is $kappa$-saturated for any $kappa > |mM|$.
]

We will next show how to construct saturated models, to complete this we will need a lemma.

#definition[
  For a cardinal $gamma$, $cf(gamma)$ is called the co-finality of $gamma$ and is the cardinality of the shortest unbounded sequence in $gamma$.
]

#theorem("König's theorem")[
  For a cardinal $gamma$, $cf(2^gamma) > gamma$.
]<thrm-Konig>

#lemma[
  If $(mN_alpha)_(alpha < kappa)$ is an elementary chain, that is $mN_alpha elm mN_beta$ for $alpha < beta$. Then if $mN = union.big_(alpha = 0)^kappa mN_alpha$ we have $mN_alpha elm mN$ for all $alpha$.
]
#proof[
  Let $phi(ov(a))$ be a formula, we show that $mN_alpha sat phi(ov(a)) <=> mN_alpha$ for all alpha by induction. Since every $mN_alpha$ is contained in $mN$ then this is true for all atomic formula $phi$. Now we induct on the structure of $phi$, for logical connectives this is trivial. Now assume that $phi = exists x thin psi(x,ov(a))$, then certainly $mN_i sat phi => mN sat phi$, now if $mN sat phi(ov(a))$ then there is some $j >= i$ such that $b in |mN_j|$ and so $mN_j sat psi(b,ov(a))$ so $mN_j sat phi(ov(a))$ and so $mN_i sat phi(ov(a))$.
]

#theorem[
  For every $kappa$, for every $mM$, there exists a model $mN$ with $mN gt.curly mM$ and $mN$ is $kappa$-saturated.
  
  If $kappa$ is _weakly inaccessible_, that is $lambda < kappa => 2^lambda <= kappa$ (note that such cardinals cannot be proved to exist in ZFC) then for every $mM$ with $|mM| <= kappa$ there exists $mN$ with $mN gt.curly mM$ saturated with size $kappa$.
]
#proof[
  Assume that $L$ is countable, then $S_n^T (A) <= 2^(|A| + aleph_0)$ by @prop-types_cantor_space. Let $mu = 2^kappa$, note that $cf(mu) > kappa$ by @thrm-Konig.

  We will now construct a sequence of models $(mM_alpha)_(alpha < mu)$ with $mM_0 = mM$ and at limit $alpha$ we have $mM_alpha = union.big_(beta < alpha) mM_beta$, we will assume that $|mM_alpha| < mu$.
  At successor steps $alpha = beta + 1$, we want to find $mM_alpha$ with $mM_beta elm mM_alpha$ such that for all $A seq mM_beta$ with $|A| < kappa$, every type in $S_n^T (A)$ is realized in $mM_alpha$. 
  Now we know that for every single type $p(ov(x))$ by @prop-add_one_type we can add a realization of that type, and then by @thrm-downwards we can get that realization with size at most $mu$, so we just need to do induction again to add every type.

  Let us count how many types we need to add, we know that for any fixed $A$ we have $|S_n^T (A)| <= 2^(kappa + aleph_0) = mu$. Now for any cardinality $beta$ we have that the number of subsets $A$ with $|A| = beta$ is
  $
    mu^beta = (2^kappa)^beta = 2^(kappa times beta) = 2^kappa = mu
  $
  so in total we have $sum_(lambda < kappa) mu^lambda = kappa mu = mu$ steps and so our final model $mM_(alpha + 1)$ is also of size at most $mu$ which completes the induction.
]

#example[
  There are strange consequences to this theorem, for example there are models of Piano Arithmetic that satisfy a statement encoding "PA is inconsistent".
]

We can see that the process of adding types is not very difficult, in model theory we have a saying about this:
"Any fool can realize a type, but it takes a model theorist to omit one".
We have not yet looked at omitting types, but the definition is exactly what you would expect.

#definition[
  For a complete theory $T$, a model $mM sat T$ and a type $p(ov(x))$. We say that $mM$ _omits_ $p(ov(x))$ if it does not realize it, i.e. $p(mM) = nothing$.
]

Now the difficulty in omitting types is that some types can *never* be omitted.
#example[
  If $c$ is a constant of a language $L$ then the type of the interpretation of $c$ can never be omitted.
]
But some types can be omitted
#example[
  The type of a transcendental number in $A C F_p$ is distinct from that of an algebraic number, and can be omitted, for example in $hat(Q)$.
]

The first example here is an important one to keep in mind since all the properties of that type can be proved from the single formula $x = c$.

#definition[
  A type $p(ov(x))$ is isolated if there exists a formula $phi(ov(x)) in p(ov(x))$ such that for every $psi(ov(x)) in p(ov(x))$ we have
  $
    T proves (phi(ov(x)) => psi(ov(x)))
  $
]

#proposition[
  $p(ov(x)) in S_n(A)$ is isolated iff ${p}$ is open in $S_n(A)$.
]
#proof[
  Exercise
  // TODO: FINISH EXERCISE
]

This characterization is important due to the following fact.
#proposition[
  If $p(ov(x))$ is isolated, then $p$ cannot be omitted.
]
#proof[
  Let $phi(ov(x))$ be the generating formula for $p$, then 
  $
    exists x phi(ov(x))
  $
  is a true sentence in $T$ and thus any witness of this sentence is a realization of the type.
]

Now apriori we would not expect this converse to hold since it feels like being isolated is quite the strong condition, but in fact the converse does hold, which is shown in this theorem.

#theorem[
  If $p(ov(x))$ is not isolated, then there exists $mM sat T$ which omits $p(ov(x))$.
]
There are many proofs of this theorem but we will use one called *Henkin's construction*. This proof method is also the modern method for proving @thrm-completeness.
#proof[
  Let $L$ be a countable language and let ${c_n}_(n in NN)$ be a family of new constants not in $L$, enumerate all formulas in $L union {c_n}_(n in NN)$ as $phi_n$. Let $f: NN -> NN$ be increasing such that $c_f(n)$ does not appear in $phi_0,...,phi_n$. 

  We define the *Henkin axioms*
  $
    H_i = (exists x phi_i (x)) -> phi_i (c_f(i)).
  $
  We now construct a sequence of sets of sentences $T_0 = T seq T_1 seq T_2 seq ...$ such that
  $
    T_(2n+1) = T_(2n) union {H_n} quad "and" quad T_(2n+2) = T_(2n+1) union { not phi_n(c_n) } "for some" phi_n(ov(x)) in p(ov(x))
  $
  Then taking the union of these sets we will get an axiomization of a consistent theory. We can then use Zorn's lemma to get a complete theory containing it and then if we set our universe to be the set of constants quotiented by the relation
  $
    c_i = c_j "as elements if" (c_i = c_j) "as a formula is in" T
  $

  Now a model satisfying this theory will not realize the type $p(ov(x))$ since if it did then some constant would realize it which would contradict the fact that our theory contains $not phi(c_n)$ for every $n$.

  All that is left to do is to check that at every odd step these sentences are indeed consistent and that at even steps we can pick specific $phi_n$ to make the set of sentences consistent.

  // TODO: ADD FULL PROOF
 
  For the even steps assume that $T_(2n+1)$ is consistent but for every $psi(ov(x)) in p(ov(x))$ we have that $T_(2n+1) union { not psi (c_n) }$ is inconsistent. Then $T_(2n+1)$ is $T$ where we added some finitely many sentences, so we can write $T_(2n+1) = T union { psi_j (ov(c), c_n) : j < k }$ for some $k$ and $psi_j$.

  Now set
  $
    phi(ov(y), x) = and.big_(j<k) psi_j (ov(y), x)
  $
  then for every $psi(ov(x)) in p(ov(x))$ we have $T union { phi(ov(c),c_n) } union { not psi(c_n) }$ is inconsistent so
  $
    T proves (phi(ov(c), c_n) -> psi(c_n))
  $
  But now since the $T$ does not contain $c_n$ as a constant we can replace all instances of $c_n$ with $x$ and all instances of $ov(c)$ with $ov(y)$ in the proof and get that
  $
    T proves (phi(ov(y),x)) -> psi(x))
  $
  but then this means that 
  $
    T proves forall ov(y) (phi(ov(y), x) -> psi(x))
  $
  but we have that
  $
    forall ov(y) (phi(ov(y), x) -> psi(x))
    &= forall ov(y) (not phi(ov(y), x) or psi(x))
    = not exists ov(y) (phi(ov(y), x) and not psi(x))
    \ &= not (exists ov(y) phi(ov(y), x) and not psi(x))
    = (exists ov(y) (phi(ov(y),x))) -> psi(x)
  $
  then $exists ov(y) (phi(ov(y),x))$ implies every $psi$ in the type $p(ov(x))$, but also $exists ov(y) (phi(ov(y),x))$ is true in $T_(2n+1)$ and thus is consistent with $T$ and thus is in the type $p$. This contradicts our assumption that $p(ov(x))$ is not isolated.
]

Now that we have the tools to omit types, we can use it to characterize the $aleph_0$-categorical theories.
#theorem("Ryll-Nardzweski")[
  Let $T$ be a complete theory over a countable language $L$, the following are equivalent.
  - $T$ is $aleph_0$-categorical.
  - $forall n, S_n^T (nothing)$ is finite.
]
#proof[
  $(1 => 2)$. Suppose that $S_n^T (nothing)$ is infinite, we know that it is always a closed subset of the Cantor set. As an infinite compact space, $S_n^T (nothing)$ has a non isolated point, corresponding to a non isolated type $p$. By the omitting types theorem, there exists a model which omits $p$, since it is a type there is another model which realizes $p$, those two models then cannot be isomorphic. We can then make them both countable by @thrm-downwards which completes this side of the proof.

  $(2 => 1)$. We assume that $S_n^T (nothing)$ is finite. This implies that if $A seq mM sat T$, with $A$ being finite, then $S_n^T (A)$ is also finite since we can inject it into $S_(n+1)^T (nothing)$. So every type in $S_n^T (A)$ is isolated.
  Now let $mM,mN sat T$ be countable models, enumerate them as $mM = {a_0, a_1, ...}$ and $mN = {b_0, b_1, ...}$. We will now do a back and forth construction, at step $n$ we have a partial isomorphism $f_n : A_n -> B_n$. Define the tuples $ov(a) = (a_1,...,a_n), ov(b) = (b_1,...,b_n)$ containing all elements of $A_n$ and $B_n$ respectively.
  From the fact that it is a partial isomorphism we will know that
  $
    tp_n^mM (ov(a)) = tp_n^mN (ov(b)).
  $

  Now let us create the construct the maps by induction, at step $0$ we pick some $a in mM$ then $tp_n^mM (a)$is isolated. Since it is isolated every model of $T$ realizes it and so in particular there is an element $b in mN$ that realizes the type and map $a$ to it.

  At the inductive even steps we will pick some $a_(n+1) in mM$ and note that $tp_n^mM(A) (a_(n+1))$ is again isolated so again there is some element $b_(n+1) in mN$ such that $tp_n^mN(B)(b_(n+1)) = tp_n^mM(A) (a_(n+1))$ this type and so we can map $a_(n+1)$ to $b_(n+1)$.
  At the odd steps we do the same thing as but pick $b in mN$ first.
]

#example[
  In $A C F_p$ we have that the type of any irreducible polynomial is isolated while the type of the transcendental number is not isolated.
]

== Automorphism groups
In algebra for some algebraic structure an important role is played by the automorphism groups of these structures. As model theory is a sort of algebra without algebra we will also use automorphism groups.
#definition[
  Let $mM$ be a countable structure of a countable language $L$. We define the automorphism group $Aut (mM)$ to be
  $
    Aut(mM) := { F : mM -> mM : F "is an automorphism" }
  $
]

$Aut(mM)$ acts on $mM^n$ for all $n$, and is in fact a Polish topological group.
#proposition[
  $Aut(mM)$ is a Polish group, that is separable, infinite, and admits a complete metric.
]
#proof[
  Given $f in Aut(mM)$, neighborhoods of $f$ are
  $
    U_(a_1,...,a_n)^f = { g in Aut(mM) : g(a_1) = f(a_1), ..., g(a_n) = f(a_n)}
  $

  Define the sets $[A,B]$ for finite tuples $A,B seq mM$ by
  $
    [A,B] = {f in Aut(mM) : f(A) = B}
  $

  A complete metric can be defined as
  $
    d(f,g) := exp_2 (- min {n : f(n) != g(n) "or" f^(-1)(n) != g^(-1)(n) })
  $
]

#theorem[
  $Th(mM)$ is $aleph_0$-categorical if and only if for all $n$, $Aut(mM)$ acts on $mM^n$ with finitely many orbits.
]
#proof[
  Exercise.
]

== Infinite-Ary-Logic and Scott Analysis
We now want to take a short look at different types of logic.

$cal(L)_(omega_1,omega)$ is the extension of finite order logic over a countable language $L$, where in formulas we allow infinite countable $or.big, and.big$.

More precisely,
+ The atomic formulas of $cal(L)_(omega_1,omega)$ are the same as in first order logic.
+ If $phi_k$ is a countable set of formulas then
  $
    and.big_(k in omega) phi_k "and" or.big_(k in omega) phi_k
  $
  are both in $cal(L)_(omega_1,omega)$
+ If $phi$ is in $cal(L)_(omega_1,omega)$ then $exists x (phi(x))$ and $forall y (phi(y))$ are both in $cal(L)_(omega_1,omega)$.

Now recall that, in ordinary logic, for a finite model $mM$, there exists a sentence $sigma$ with $mM sat sigma$ and 
$
  (mN sat sigma) => mM tilde.equiv mN
$
Our goal now is to generalize this using our new type of logic to the case of countable models.

#definition[
  Let $mM$ be a countable structure.
  Define $equiv_alpha$ on $mM^n$ for $alpha$ an ordinal, $n$ a natural number, by transfinite induction. 
  For the base case
  $
    ov(a) equiv_0 ov(b) quad "if" quad tp^mM (ov(a)) = tp^mM (ov(b)),
  $
  in the limit case
  $
    ov(a) equiv_gamma ov(b) quad "if" ov(a) equiv_beta ov(b), forall beta < gamma,
  $
  and in the successor step
  $
    ov(a) equiv_(alpha + 1) ov(b) quad "if" quad & forall c in mM, exists d in mM med (ov(a),c) equiv_(alpha) (ov(b), d)\ "and" quad & forall d in mM, exists c in mM med (ov(a),c) equiv_(alpha) (ov(b), d)
  $
]<def-scott_equiv>

We record some important properties of these relations
#proposition[
  - $equiv_alpha$ is an equivalence relation on $mM^n$ for all $n in NN$.
  - If $alpha < beta$ and $ov(a) equiv_beta ov(b)$ then $ov(a) equiv_alpha ov(b)$.
  - For every $ov(a)$, there is an ordinal $alpha < omega_1$ such that
  $
    [ov(a)]_alpha = [ov(b)]_beta quad "for all" beta >= alpha
  $
  where $[ov(a)]_alpha$ is the equivalence class of $ov(a)$ with respect to $equiv_alpha$.
  - 
]
Essentially we are saying that the equivalence classes of these relations form a decreasing sequence in alpha which stabilizes at some countable ordinal.
#proof[
  Exercise.
  // TODO: COMPLETE PROOF
]

In fact an even stronger property is true
#proposition[
  There exists $alpha < omega_1$, such that $equiv_alpha$ is the same equivalence relation as $equiv_beta$ for all $beta >= alpha$.
]
#proof[
  For each $n$, $equiv_alpha$ forms a decreasing sequence of subsets of $mM^n times mM^n$, which is a countable set, so it must stabilize.
]

This proposition motivates the following definition.

#definition[
  The _Scott height_ (or _rank_) of a countable structure $mM$ is defined as
  $
    S H(mM) = min { alpha < omega_1 : med equiv_alpha "is the same as" equiv_(alpha+1)}
  $
]

We now want to use these tools to work towards our characterizing sentence for countable structures.
We now define an equivalence on models that mirrors @def-scott_equiv.
#definition[
  We define $equiv_alpha$ on countable $L$ structures through transfinite induction.
  For the base case
  $
    mM equiv_0 mN "if" mM equiv mN,
  $
  for the limit case
  $
    mM equiv_gamma mN "if" mM equiv_beta mN "for all" beta < gamma,
  $
  and for the successor step
  $
    mM equiv_(alpha + 1) mN "if" quad & forall a in mM, exists b in mN, (mM, a) equiv_alpha (mN, b)
    \ "and" quad & forall b in mN, exists a in mM, (mM, a) equiv_alpha (mN, b)
  $
]

We can see that this definition in fact generalizes @def-scott_equiv.
#proposition[
  $ov(a) equiv_alpha ov(b)$ if and only if $(mM,ov(a)) equiv_alpha (mM,ov(b))$.
]
// TODO: COMPLETE PROOF

Now with this definition we can start to construct some characterizing sentences.
#lemma[
  $forall alpha < omega_1$, $forall ov(alpha) in m, exists phi_alpha^(mM,ov(a)) (x) in cal(L)_(omega_1,omega)$, such that $forall mN, forall ov(b) in mN$,
  $
    (mM, ov(a)) equiv_alpha (mN, ov(b)) <=> mN sat phi_alpha^(mM,ov(alpha)) (ov(beta))
  $
]
#proof[
  We prove by induction on $alpha$, in the case of $alpha = 0$
  $
    phi_0(ov(x)) = and.big_(phi in tp^mM (ov(a))) phi(ov(x)).
  $
  If $alpha$ is a limit ordinal then
  $
    phi_alpha^(mM,ov(a)) (ov(x)) = and.big_(beta < alpha) phi_beta^(mM, ov(a)).
  $
  Finally for $alpha + 1$ we have
  $
    phi_(alpha + 1)^(mM, ov(a)) (ov(x)) = 
    ( and.big_(b in mM)  exists y phi_alpha^(mM, (ov(a), b))(ov(x),y) )
    and
    ( forall y and.big_(b in mM)phi_alpha^(mM, (ov(a), b))(ov(x),y) )
  $
]

Unfortunately, the sentences are not exactly what we want, they only guarantee isomorphic models under a fairly strong assumption.
#theorem("Scott")[
  Let $mM,mN$ be countable structures with $S H(mM) = S H(mN) = alpha$, 
  if $mM equiv_(alpha+1) mN$, then $mM tilde.equiv mN$.
]
#proof[
  Our proof will employ a back and fourth method, assume that at the step $n$ we have $(mM, a_1, ..., a_n) equiv_(alpha + 1) (mN, b_1,...,b_n)$.
  Assume then that we are on an even step and want to add an element $a_(n+1)$ to this equivalence, we leave this induction step as an exercise.

  // TODO: COMPLETE EXERCISE
]

We also have a partial converse to this result.
#proposition[
  Suppose that $S H(mM) = alpha$ and $mM equiv_(alpha + omega) mN$, then $S H(mN) = alpha$.
]
#proof[
  First we want to show that $S H(mN) <= alpha$. Choose $ov(a), ov(b) in mN^n$ and suppose that $ov(a) equiv_(alpha) ov(b)$. We want to show that $ov(a) equiv_(alpha + 1) ov(b)$ using $mN equiv_(alpha + omega) mM$.
  Find $ov(c),ov(d) in mM^n$ such that
  $
    (mM,ov(c)) equiv_(alpha + 1) (mN, ov(a)) "and" (mM, ov(d)) equiv_(alpha+1) (mN, ov(b))
  $
  then we also have
  $
    (mN,ov(b)) equiv_(alpha+1) (mM, ov(d)) equiv_(alpha + 1) (mM, ov(c)) equiv_(alpha + 1) (mN,ov(a))
  $
  and thus $S H(mN) <= alpha$.

  For the other inequality we just swap $mM$ and $mN$.
]