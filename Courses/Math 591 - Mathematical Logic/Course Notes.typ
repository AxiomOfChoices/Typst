#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/monograph.typ": frontpage
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#set pagebreak(weak: true)

#show: doc => frontpage(
  toptitle: [Mathematical Logic],
  name: [Jacob Reznikov],
middletitle: [My course notes for the Winter 2024 Mathematical Logic course by #link("https://www.math.mcgill.ca/msabok/")[Marcin Sabok] at McGill],
doc)

#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm), numbering: "1")
#set enum(numbering: "(1)", indent: 1em)
#outline()
#pagebreak()

= Models and Languages
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

#remark[
  For a model $mM$ we will sometimes use $|mM|$ to refer to the universe of a model and $||mM||$ to denote the cardinality of said universe. Sometimes we will also use $mM$ to refer to the underlying universe, but only when it is clear from context what we are referring to.
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

We have defined the symbols of $L$, but how do we speak it? We will need the following
- Logical symbols, these will consist of 
  - Connectives: $or, and, not, =>, <=>$
  - Quantifiers: $exists, forall$
- Auxiliary symbols: Parentheses, Commas
- Variables: $x,y,z,v,...$
- Equivalency Symbol: $=$

As with any language we will build up our language first with nouns and then with phrases.

#remark[
  We will often use $ov(a)$ to denote the ordered collection $(a_1,...,a_n)$ where $n$ will be clear from context. We will also write $ov(a) ov(b), a ov(b)$ etc to mean tuple concatenation.

  We will also often use the notation $ov(a) A$ for some subset $A$ to denote $A union { a_1, ..., a_n }$, and if $A$ is finite we will use it to mean the tuple $(a_1,...,a_n,x_1,...,x_m)$ where $x_i$ are the ordered elements of $A$.
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
A term is what we would usually call a mathematical _expression_.
#example[
  $f(1+2)$, $3 + x$, $sin(e^(-15 y))$ are all terms in appropriate languages.
]

#definition[
  If $mM$ is an $L$-structure and $tau$ is a constant $L$-term then the _interpretation_ of $tau$, $tau^mM$, is also defined inductively
  - If $tau = c_k$ then $tau^mM = c_k^mM$
  - If $tau = f_i (tau_1,...,tau_n)$ then $tau^mM = f_i^mM (tau_1^mM, ..., tau_n^mM) in |mM|$
]

#example[
  $L = (+, dot, 0, 1)$ then $mM = (NN, +, dot, 0, 1)$ is an $L$-structure in which the $L$-term 
  $
    tau = 1 + 1 + 1
  $
  has the interpretation $3$.

  However, in the $L$-structure $(ZZ_3, +_3, dot_3, 0,1)$ the interpretation is instead $0$.
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

Formulas are our bread and butter, they form the language (no pun intended) of first order logic and it is through formulas that we will express and prove all nearly all results in this course.

Now this is all first order logic, but one might wonder, what makes it "first"? This comes from what things we can quantify over. In first order logic we can only quantify over elements $x in |mM|$, in _second_ order logic we can quantify over subsets $S seq |mM|$ like for example all relations. We can also see this as $S in cal(P)(|mM|)$. Third order logic would then be quantification over $S in cal(P)(cal(P)(|mM|))$, and so on.

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

Now one would expect that substitution should never change the meaning of a logical formula, but in fact, this is not quite right.
Consider the case $phi = forall y (y=x)$, the substitution $phi(subs(y,x))$ changes the meaning of the statement from "all $y$ are equal to $x$" to "all $y$ are equal to themselves". We want to avoid this outcome, which we can formalize as follows.
#definition[
  A substitution $phi(subs(tau,x))$ is called _correct_ if no free variable of $tau$ becomes bound in $phi(subs(tau,x))$
]

#definition[
  If $A seq |mM|$ and $mM$ is an $L$-structure then $L(A)$ is the language 
  $ L union {a : a in A} $
]

We extend our definition of interpretation of terms to terms of $L(mM)$ by setting $underline(a)^mM = a$


#definition[
  Let $mM$ be an $L$-structure and $sigma$ an $L(mM)$-sentence. We say that $sigma$ is _true_ in $mM$ or $mM$ _satisfies_ $sigma$, if $mM sat sigma$, which we define inductively as follows:
  - If $sigma$ is of the form $tau_1 = tau_2$ then $M sat sigma$ if and only if $tau_1^mM = tau_2^mM$ 
  - If $sigma$ is of the form $underline(R)_j (tau_1, ..., tau_n)$, then $mM sat sigma$ if and only if $(tau_1^mM, ..., tau_n^mM) in R_j^mM$
  - If $sigma$ is of the form $sigma_1 and sigma_2$ then $mM sat sigma_1 and sigma_2$ if and only if $mM sat sigma_1$ and $mM sat sigma_2$. A similar definition follows for the other logical connectives.
  - If $sigma$ is of the form $exists x thin phi$ then $mM sat sigma$ if there exists $a in |mM|$ with $mM sat phi(subs(a ,x))$. Similarly for $forall x thin phi$.
]

Note that while the first step may look circular, the first equality is in the space of _terms_ while the second is in the universe $|mM|$.

An important consequence of this definition is that every sentence of $L(mM)$ is either true or false in $mM$, hence either it or its negation are true in $mM$. We will formalize this very soon.
#pagebreak(weak: true)
= Model equivalences
#definition[
  Let $mM$ be a model in the language $L$. The _theory_ of $mM$ is defined as
  $
    Th_L(mM) = { sigma "is an" L"-sentence" : mM sat sigma}.
  $
  If $L$ is clear from context we will often omit it.

  We say that two $L$-structures, $mM$ and $mN$, are _elementarily equivalent_, and write $mM equiv mN$ if $Th(mM) = Th(mN)$.
]
#definition[
  We write $mM tilde.equiv mN$ and say that $mM$ and $mN$ are _isomorphic_ if there is a bijection $g : |mM| -> |mN|$ with
  $
  g(underline(c_k)^mM) = underline(c_k)^mN\
  (a_1,...,a_n) in underline(R_j)^mM <=>
  (g(a_1),...,g(a_n)) in underline(R_j)^mN\
  g(underline(f_i)^mM (a_1,...,a_n)) = underline(f_i)^mN (g(a_1),...,g(a_n))
  $
]
A lot of these definitions might look similar but they are of very different flavor, they all describe model equivalence but of different _resolutions_.

Elementarily equivalence means that the two models agree on all $L$-sentences, while isomorphism implies that they agree on all $L$-_formulas_ on _all inputs_ (after replacing the inputs with their images under $g$).
#definition[
  We write that $mM seq mN$ to mean that $mM$ is a _substructure_ of $mN$, meaning that
  $
  |mM| seq |mN|, underline(f_i)^mM seq underline(f_i)^mN, underline(R_j)^mM = underline(R_j)^mN sect |mM|^(a_j), thin thin "and" underline(c_k)^mM = underline(c_k)^mN
  $
  intuitively this means that the structure of $mM$ is induced from that of $mN$.
]

#v(-2%)
#definition[
  We write $mM elm mN$ to mean $mM$ is an _elementary substructure_ of $mN$ which we define to mean $mM seq mN$ and for every formula $phi(ov(x))$ and for every $ov(a) seq |mM|$ we have
  $
  mM sat phi(ov(a)) <=> mN sat phi(ov(a))
  $
]
These two definitions also deal with concept of 'substructure' on different resolutions. A standard substructure is a very weak property, substructures $mM$ of $mN$ could have radically different behaviour (we will see many examples of this).

However, an _elementary substructure_ must agree with its superstructure on _all formulas_ involving the smaller structures inputs, this is a much stronger condition and is akin to a subfield in algebra.
#proposition[
  If $mM elm mN$ then $mM$ is elementary equivalent to $mN$.
]
#proof[
  This is immediate from the definition of elementary equivalence.
]

#proposition[
  If $mM elm mN$ and $mN elm mM$ then $mM tilde.equiv mN$.
]
#proof[
  This is also immediate.
]

#theorem("Tarski-Vaught test")[
  Suppose $mM$ is an $L$-structure, $A seq |mM|$, then $A$ is the universe of an elementary substructure iff the following condition holds, called the Tarski-Vaught test (T-V test)

  #block(inset: (x: 2em))[For every formula $phi(x, ov(y))$ in $L$ and every $ov(a) seq A$, if $mM sat exists x thin phi(x, ov(a))$ then there exists $b in A$ such that $mM sat phi(b, ov(a))$]
]<thrm-tv_test>
#proof[
  First the backwards direction, assume that the T-V test holds, then we need to show that $A$ is a substructure. First we use $phi = (x=c)$ to show that $A$ contains all constants of $mM$, then $phi = (x = f_i (ov(a)))$ for $ov(a) seq A$ to show it contains the images of all functions, and we define the interpretation of $underline(R_j)$ to be exactly $underline(R_j)^mM sect A^(a_j)$ to make it a substructure.

  Now $A$ being a substructure is equivalent to 
  $
    A sat phi(ov(a)) <=> mM sat phi(ov(a))
  $
  for all $ov(a) seq A$ and $phi$ being an _atomic_ formula. So now we only need to prove this is true for the other formula types, which we do by induction on the structure of the formula.
  - The connective types are immediate.
  - For the quantifiers we can assume that the quantifier is $exists$ as otherwise we can use negation to change $forall$ to an $exists$. Hence let us assume $phi(ov(x)) = exists y thin psi(y, ov(x))$. Then $mM sat phi(ov(a))$ iff $mM sat exists y thin psi(y, ov(a))$ iff there exists $b in A$ with $mM sat psi(b, ov(a))$. But by definition this last form is equivalent to $A sat exists y thin psi(y, ov(a))$

  Assume, on the other hand, that $A$ is the universe of an elementary substructure $cal(A)$, then we need to prove the T-V test holds. Assume then that for some formula $phi(x,ov(y))$ in $L$ and some $ov(a) seq A$ we have $mM sat exists x thin phi(x, ov(a))$, then since $cal(A)$ it is an elementary substructure we also have that $cal(A) sat exists x thin phi(x, ov(a))$ and so we must have some $x in A$ such that $phi(x,ov(a))$ holds.
]


#theorem("Lowenheim-Skolem downwards Theorem")[
  Let $L$ be a language, for any $L$-structure $mM$ and every $A seq |mM|$, there exists an elementary substructure $mN elm mM$ with $A seq |mN|$
  $
    ||mN|| = |A| + |L| + aleph_0
  $
]<thrm-downwards>

#proof[
  Set $kappa = |A| + |L| + aleph_0$, using induction we will define a sequence $A_n$ of subsets of $mM$, where at each step $n$ we will try to satisfy all existential statements in $Th_L(A_(n-1))(mM)$, we will then set $|mN| = union.big_(n) A_n$.

  First we set $A_0 = A$, then at step $n > 0$, we will consider all formulas in $L(A_(n-1))$ (there are $|kappa times NN| = |kappa|$ many of them, see @prop-cardinal_arithmetic) and for each formula $phi(ov(x))$ we will pick some collection of elements $ov(a) seq |mM|$ such that $mM sat phi(ov(a))$, then we will add $ov(a)$ to $A_(n-1)$, adding these elements for each formula gives us $A_n$.

  Now we can use @thrm-tv_test to check that $mN elm mM$. Let $phi(ov(a)) = exists x (psi(x),ov(a))$ be a formula in $Th_L(mN)(mM)$, then $ov(a) in |mN|$ and so $ov(a) in A_n$ for some $n$ and thus for some $b in A_(n+1)$ we have $mN sat psi(b, ov(a))$ and thus $mN sat phi(ov(a))$.
]

#remark("Skolem's Paradox")[
  Let $Z F C^* seq Z F C$ be a finite theory which proves Cantor's theorem. Let $V sat Z F C^*$. By the previous theorem we can find a countable $mM elm V$ for which $mM sat Z F C^*$ and $mM sat$ "exists an uncountable set".
]

#definition[
  In first order logic we have the concept of a _proof system_, consisting of two parts.
  _Axioms_ which are formulas which are declared to always be true, and _proofs_ which is a finite sequence of $L$-formulas such that every step is either an axiom or follows from the previous steps using an inference rule.
]

#example[
  An example proof system has the following 4 types of axioms.
  - All instances of propositional tautologies are axioms.
  - $[forall x thin (phi -> psi)] -> [phi -> forall psi]$  as long as $x$ is not free in $phi$.
  - $forall x -> phi(subs(t,s))$ where $t$ is any $L$-term where the substitution is correct.
  - $x = x$, \ $x = y -> t(...,x,...) = t(...,y,...)$ for any $L$-term $t$, \ $x = y -> (phi(...,x,...) -> phi(...,y,...))$ for any formula $phi$.

  And the following inference rules.
  - If $phi$ and $phi -> psi$ then $psi$.
  - If $phi$ then $forall x thin phi$.
]

We will use the notation $Gamma proves phi$ to mean "$Gamma$ proves $phi$" and define it as the existence of a proof whose final step is $phi$ and every step is either an axiom or an element of $Gamma$ or follows from a previous step or by an inference in $phi$.

#definition[
  We say that $Gamma$ is _consistent_ if there exists $phi$ such that $Gamma tack.r.not phi$.

  We say that $Gamma$ _has a model_ if there is a model $mM$ such that $mM sat phi$ for all $phi in Gamma$.
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
  The forward direction is immediate, the hard part is the backward direction. By Gödel's completeness theorem, we can replace "having a model" with "is consistent".

    We now prove this by contrapositive, assume that $Gamma$ is inconsistent, then we have $Gamma proves exists x thin (x = x) and (not (x=x))$, now this proof consists of finitely many steps and thus can only use finitely many statements in $Gamma$, let $Gamma_0$ be that subset of statements. Since we can prove a contradiction using $Gamma_0$ it must also be inconsistent, thus one of the finite subsets of $Gamma$ is inconsistent.
]

As an example use we have the following theorem.

#theorem("Lowenheim-Skolem upwards Theorem")[
  If $mM$ is an infinite $L$-structure where $L$ is countably infinite then $forall k > ||mM||$ there exists a model $mN$ such that $mM elm mN$ and $||mN|| = k$
]
#proof[
  Let us consider the language $L' = L(mM) union {c_alpha : alpha < kappa}$ where $c_alpha$ are new constants.
  Now set
  $
    Gamma = Th_(L')(mM) union { c_alpha eq.not c_beta : alpha eq.not beta < kappa}
  $

  We want to show now that $Gamma$ is consistent, to see this we use compactness and take an arbitrary finite subset $Gamma_0$. Let $alpha_1,...,alpha_n$ be such that 
  $
    Gamma_0 seq Th_(L')(mM) union { c_(alpha_i) eq.not c_(alpha_j) : i eq.not j } 
  $
  choose then any $a_1, ..., a_n in |mM|$ which are distinct and interpret $c_alpha_i$ as $a_i$ to get a model of $Gamma_0$, hence $Gamma_0$ is consistent.

  Now we have by @thrm-completeness that there exists a model $mN$ such that $mN sat Gamma$, then by construction we have $mM elm mN$ and $||mN|| >= kappa$ and so by #link(<thrm-downwards>)[downwards theorem] we can now decrease the cardinality until we reach $kappa$.
]



#corollary[
  If $mM$ is infinite then there exists $mN$ such that $mM equiv mN$ but $mM tilde.equiv.not mN$.
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

= Categoricity
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
  Consider the language $L = (<)$, a dense linear order ($DLO_0$) is the theory generated by the additional axioms: $<$ is total, dense and has no endpoints. 
  - Total means $forall x thin forall y (x = y or x < y or y < x)$ 
  - Dense means $forall x thin forall y(x < y => exists z x < z < y)$
  - No endpoints means $not (exists z thin forall x (x eq.not z => x < z))$ for the max endpoint and similarly for the min endpoint.

  Examples of such a structure include $QQ$, $RR$ and many others.

  It turns out, however, that the only countable such structure is $QQ$, up to isomorphism.
]


#theorem("Cantor")[
  $DLO_0$ is $aleph_0$-categorical.
]<thrm-dlo_categorical>

In order to prove this result we will need to use a specific technique, since it appears all over model theory we will write up the main idea here for future reference.
#technique("Back and Forth method")[
  Let $mM$ and $mN$ be two countable models between which we want to construct an isomorphism $mM -> mN$.

  The method involves us enumerating the two models as $mM = {a_0, a_1,... }$ and $mN = {b_0, b_1, ...}$, it does not matter what in what order this enumeration happens.
  Our goal will be to construct a sequence of functions $f_n : A_n -> B_n$, where $A_n$ and $B_n$ are substructures of $mM$ and $mN$ respectively, $f_n$ is an isomorphism between said substructures, and $f_(n+1)$ is an extension of $f_n$. Additionally we will construct $f_n$'s such that every $a_i$ and $b_i$ will eventually appear in the domain / codomain of some $f_n$.
  Our goal then is to take the function
  $
    f := union_(n in NN) f_n,
  $
  one can easily check that this will be an isomorphism if we indeed have such a sequence.

  We construct $f_n$ inductively, usually starting with either $A_0 = {a_0}$ if there is a natural $b_i$ to map it to, or with $A_0 = nothing$ otherwise. We then assume that $f_n$ is constructed and try to construct $f_(n+1)$ by adding a single element mapping, this depends on the parity of $n$. If $n$ is even we pick the element in $mM$ with smallest index that has not yet been picked, let say $a_i$, and try to find a $b_j$ that has not yet been picked such that the extended function,
  $
    f_(n+1) := f_n union {(a_i, b_j)},
  $
  is again an isomorphism of $A union {a_i}$ to $B union {b_i}$. If $n$ is odd we do the exact same thing, but instead pick $b_i$ with smallest index that has not yet been picked. Doing this means that eventually each $a_i$ and $b_i$ will eventually be mapped and thus $f$ is indeed an isomorphism.
]<tech-back_and_forth>

Lets see an example of this.

#proof([of @thrm-dlo_categorical])[
  Let $mM = (M,<)$ and $mN = (N,<)$ be two countable models of $DLO_0$, we enumerate them $M = {a_0, a_1,...}$ and $N = {b_0, b_1, ...}$.

  We use @tech-back_and_forth to construct an isomorphism, we start by with $f_0 : {a_0} -> {b_0}$. As explained above we now only need to describe how we add one element from $mM$ and $mN$.
  Assume then that $f_n : A -> B$ is an isomorphism, then assume that we are on an even step and so we are adding some element $a_i$, then $a_i$ has some ordering compared to $A$. If $a_i$ is less than every element in $A$, then since $mN$ has no end points there is a $b_j in mN backslash B$ which is smaller than every element in $B$. Similarly if $a_i$ is larger than every element in $A$ then there exists a $b_j$ larger than every element of $B$. If $a_i$ is in between elements $x,y in B$, then because of density know that there is an element $b_j$ which is between $f(x),f(y)$. 

  In all 3 cases we will map $a_i$ to $b_j$ and take that to be $f_(n+1)$. One can easily check that $f_(n+1)$ remains an isomorphism and thus the back and forth method gives us an isomorphism between $mM$ and $mN$.
]

#corollary[
  $DLO_0 = Th(QQ,<)$, and so is complete.
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

  We write $mM equiv_n mN$ to mean "$mM$ is equivalent to $mN$ up to order $n$" if for every sentence $sigma$ of quantifier depth less than $n$ we have $mM sat sigma <=> mN sat sigma$.
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

  If $L$ is finite relational then for each $n, ell$ there exists a finite list $Phi_1, ..., Phi_k$ of formulas with $qd(n)$ in $ell$ variables such that every formula $phi$ with $qd(phi) <= n$ in $ell$ variables is equivalent to $phi_i$ for some $i <= k$.
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
    mM tilde.equiv mN <=> "The Prover has a winning strategy in" Gamma(mM,mN)
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

= Ultrafilters and Ultraproducts

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
#v(-2%);
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
= Types and Definable Sets
We will now develop more tools to use with models, first of these is the *type*, in short, a type is to formulas what a satisfiable theory is to sentences. For this chapter we will assume that $L$ is a countable language unless stated otherwise.
#definition[
  Let $T$ be a complete $L$-theory.
  Let $mM sat T$ then for $a in |mM|$ we say that the _type_ of $a$ is
  $
  tp^mM (a) = { phi(x) : mM sat phi(a) }.
  $
  If two elements $a,b$ have the same type then we cannot distinguish $a,b$ with first order formulas.

  More generally, if $ov(a)$ is a tuple of elements of $mM$ then the type of $ov(a)$ is
  $
    tp^mM (ov(a)) = { phi(x) : mM sat phi(ov(a)) }.
  $
]

We will also sometimes use the following notation
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
  S_n^T (A) = { "all complete n-types in " T "on" A}.
$

We will often drop the superscript when it is clear what theory we are working on.

#proposition[
  If $A$ is a finite set there is a natural injection $S_n^T (A) -> S_(n +|A|)^T (nothing)$.
]<prop-type_space_injection>
#proof[
  Enumerate $A$ as $A = { a_1, ..., a_m }$, then consider any type $p(ov(x)) in S_n^T (A)$. Write
  $
    p(ov(x)) = {phi_alpha (ov(x)) : alpha in I}
  $
  for some index set $I$. For each $phi_alpha (ov(x))$ we can write it as $phi'_alpha (ov(x), ov(a))$ where $ov(a)$ are some parameters from $A$. Then we can define the set of formulas in $n + m$ variables:
  $
    q(ov(x), ov(y)) = { phi'_alpha (ov(x), ov(y))) }.
  $
  Since $p$ is consistent then $q$ is also consistent since any finite fragment can be realized by plugging back elements of $A$, so $q$ is a type which can be completed into a complete type in $S_(n + m)^T (nothing)$, this defines a map $f : S_n^T (A) -> S_(n +|A|)^T (nothing)$.

  To see that this is an injection note that if $p != p'$ then there is some formula $phi in p$ with $not phi in p'$. Then $phi' in f(p)$ and $not phi' in f(p')$ so these cannot be equal types.  
]

#definition[
  A type $p(ov(x))$ is realized in a model $mM$ if there exists $ov(a) in mM$ with $p(ov(x)) seq tp^mM (ov(a))$.
]
#example[
  If $T = DLO_0$ and $mM = QQ$ then
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

We can also prove the above corollary in a different way, using Zorn's lemma. 
Next we will need will need some more notation.
#definition[
  A subset $F seq BB backslash {0}$, where $BB$ is a Boolean algebra, is a _filter_ if
  - If $a,b in F$ then $a dot b in F$.
  - If $a in F$ and $a <= b$ then $b in F$

  An _ultrafilter_ is a maximal filter with respect to inclusion.
]

#example[
  We say an ultrafilter $cal(U)$ on $BB$ is principal if $cal(U) = { a in BB : a >= a_0 }$ for some atom $a_0$.
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
  Set $I = S(BB)$, then the map $a |-> [a]$ is clearly a homomorphism by the above proposition, to see it is 1 to 1 we use the proof for Hausdorffness above to see that $[a] eq.not [b]$ if $[a] != [b]$.
]

#proposition[
  Let $cal(U)$ be an ultrafilter, $cal(U)$ is principal iff it is isolated in $S(BB)$.
]<prop-isolated_principle_ultrafilter>
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

The space $S_n^T (nothing)$ carries a clopen basis of the form $[phi(ov(x))] = {q in S_n^T (nothing) : phi seq q }$.

All of these also hold if we change $S_n^T (nothing)$ to $S_n^T (A)$

#definition[
  If $mM$ is a model of $T$ and $kappa >= aleph_0$ is an infinite cardinal, we say that $mM$ is $kappa$-_saturated_ if for every subset $A seq |mM|$ of size less than $kappa$ every type in $S_n^T (A)$ is realized in $mM$.

  $mM$ is _saturated_ if $mM$ is $|mM|$-saturated.
]

#remark[
  ${x eq.not a : a in mM}$ is not realized in any model $mM$, so no model is $kappa$-saturated for any $kappa > |mM|$.
]

We will next show how to construct saturated models, to complete this we will need a lemma.

#lemma[
  If $(mN_alpha)_(alpha < kappa)$ is an elementary chain, that is $mN_alpha elm mN_beta$ for $alpha < beta$. Then if $mN = union.big_(alpha = 0)^kappa mN_alpha$ we have $mN_alpha elm mN$ for all $alpha$.
]
#proof[
  We will use @thrm-tv_test to prove this, by structural induction on the formula $phi$. Assume that $ov(a) seq mN_alpha$ for some $alpha$ and $mN sat exists x thin phi(x, ov(a))$. Then for some $ov(b) in mN$ we have $mN sat phi(ov(b), ov(a))$. Now since it is a finite tuple we also have that $ov(b) in mN_beta$ for some $beta$, if $beta <= alpha$ then $ov(b) in mN_alpha$ so we are done, hence we assume that $beta > alpha$. Then we have $mM sat phi(ov(b), ov(a))$ so by induction we know that $mN_beta sat phi(ov(b), ov(a))$. But then since $beta > alpha$ we know that $mN_alpha elm mN_beta$ and thus $mN_alpha sat phi(ov(b), ov(a))$ and so the test holds by induction.
]

#theorem[
  For every $kappa$, for every $mM$, there exists a model $mN$ with $mN gt.curly mM$ and $mN$ is $kappa$-saturated.

  If $kappa$ is _weakly inaccessible_, that is $lambda < kappa => 2^lambda <= kappa$ (note that such cardinals cannot be proved to exist in ZFC) then for every $mM$ with $|mM| <= kappa$ there exists $mN$ with $mN gt.curly mM$ saturated with size $kappa$.
]<thrm-saturation>
#proof[
  Since $L$ is countable, then $S_n^T (A) <= 2^(|A| + aleph_0)$ by @prop-types_cantor_space. Let $mu = 2^kappa$, note that $cf(mu) > kappa$ by @thrm-Konig.

  We will now construct a sequence of models $(mM_alpha)_(alpha < mu)$. 
  We set $mM_0 = mM$, and at limit $alpha$ we have $mM_alpha = union.big_(beta < alpha) mM_beta$, we will assume that $|mM_alpha| < mu$.
  
  At successor steps $alpha = beta + 1$, we want to find $mM_alpha$ with $mM_beta elm mM_alpha$ such that for all $A seq mM_beta$ with $|A| < kappa$, every type in $S_n^T (A)$ is realized in $mM_alpha$. 
  Now we know that for every single type $p(ov(x))$ by @prop-add_one_type we can add a realization of that type, and then by @thrm-downwards we can get that realization with size at most $mu$, so we just need to do induction again to add every type.

  Let us count how many types we need to add, we know that for any fixed $A$ we have $|S_n^T (A)| <= 2^(kappa + aleph_0) = mu$. Now for any cardinality $beta$ we have that the number of subsets $A$ of a set of cardinality $mu$ with size $|A| = beta$ is
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
And yet other types can be omitted
#example[
  The type of a transcendental number in $A C F_p$ is distinct from that of an algebraic number, and can be omitted, for example in $hat(QQ)$.
]

The first example here is an important one to keep in mind since all the properties of that type can be proved from the single formula $phi(x) = (x = c)$.

#definition[
  A type $p(ov(x))$ is isolated if there exists a formula $phi(ov(x)) in p(ov(x))$ such that for every $psi(ov(x)) in p(ov(x))$ we have
  $
    T proves (phi(ov(x)) => psi(ov(x)))
  $
]

#proposition[
  $p(ov(x)) in S_n (A)$ is isolated iff ${p}$ is open in $S_n (A)$.
]
#proof[
  ${p}$ being open is equivalent to $p$ being an isolated point in the topological sense in $S_n (A)$. By @prop-isolated_principle_ultrafilter we then know that this is equivalent to $p$ being a principal ultrafilter. Now for formulas $phi$, $psi$ we have
  $
    phi <= psi <=> T proves (psi and phi <=> phi) <=> T proves (phi => psi) 
  $
  and hence $p$ being a principal ultrafilter is equivalent to $p = { psi "formula" : T proves phi => psi }$ which is exactly the definition of $phi$ isolating $p$.
]

#proposition[
  If $p(ov(x))$ is isolated, then $p$ cannot be omitted.
]
#proof[
  Let $phi(ov(x))$ be the generating formula for $p$, then 
  $
    exists x phi(ov(x))
  $
  is a true sentence in $T$ and thus any witness of this sentence is a realization of the type. Hence the type is realized in any model of $T$.
]

Now a priori we would not expect this converse to hold since it feels like being isolated is quite the strong condition, but in fact the converse does hold, which is shown in this theorem.

#theorem[
  If $p(ov(x))$ is not isolated, then there exists $mM sat T$ which omits $p(ov(x))$.
]
There are many proofs of this theorem but we will use one called *Henkin's construction*. This proof method is also the modern method for proving @thrm-completeness.
#proof[
  Let $L$ be a countable language and let ${c_n}_(n in NN)$ be a family of new constants not in $L$, enumerate all formulas in $L union {c_n}_(n in NN)$ as $phi_n$. Let $f: NN -> NN$ be increasing such that $c_f(n)$ does not appear in $phi_0,...,phi_n$. 

  We define the *Henkin axioms*
  $
    H_i = (exists x phi_i (x)) => phi_i (c_f(i)).
  $
  We now construct a sequence of sets of sentences $T_0 = T seq T_1 seq T_2 seq ...$ such that
  $
    T_(2n+1) = T_(2n) union {H_n} quad "and" quad T_(2n+2) = T_(2n+1) union { not phi_n (c_n) } "for some" phi_n (ov(x)) in p(ov(x))
  $
  Then by taking the union of these sets, we will get an axiomization of a consistent theory. We can then use Zorn's lemma to get a complete theory containing it and then if we set our universe to be the set of constants quotiented by the relation
  $
    c_i = c_j "as elements if" (c_i = c_j) "as a formula is in" T
  $

  Now a model satisfying this theory will not realize the type $p(ov(x))$ since if it did then some constant would realize it which would contradict the fact that our theory contains $not phi(c_n)$ for every $n$.

  All that is left to do is to check that at every odd step these sentences are indeed consistent and that at even steps we can pick specific $phi_n$ to make the set of sentences consistent.
 
  For the even steps assume that $T_(2n+1)$ is consistent but for every $psi(ov(x)) in p(ov(x))$ we have that $T_(2n+1) union { not psi (c_n) }$ is inconsistent. Then $T_(2n+1)$ is $T$ where we added some finitely many sentences, so we can write $T_(2n+1) = T union { psi_j (ov(c), c_n) : j < k }$ for some $k$ and $psi_j$.

  Now set
  $
    phi(ov(y), x) = and.big_(j<k) psi_j (ov(y), x)
  $
  then for every $psi(ov(x)) in p(ov(x))$ we have $T union { phi(ov(c),c_n) } union { not psi(c_n) }$ is inconsistent so
  $
    T proves (phi(ov(c), c_n) => psi(c_n))
  $
  But now since the $T$ does not contain $c_n$ as a constant we can replace all instances of $c_n$ with $x$ and all instances of $ov(c)$ with $ov(y)$ in the proof and get that
  $
    T proves (phi(ov(y),x)) => psi(x))
  $
  but then this means that 
  $
    T proves forall ov(y) (phi(ov(y), x) => psi(x))
  $
  but we have that
  $
    forall ov(y) (phi(ov(y), x) => psi(x))
    &= forall ov(y) (not phi(ov(y), x) or psi(x))
    = not exists ov(y) (phi(ov(y), x) and not psi(x))
    \ &= not (exists ov(y) phi(ov(y), x) and not psi(x))
    = (exists ov(y) (phi(ov(y),x))) => psi(x)
  $
  then $exists ov(y) (phi(ov(y),x))$ implies every $psi$ in the type $p(ov(x))$, but also $exists ov(y) (phi(ov(y),x))$ is true in $T_(2n+1)$ and thus is consistent with $T$ and thus is in the type $p$. This contradicts our assumption that $p(ov(x))$ is not isolated.
]

We now have a powerful way to think about and use types in proofs.
#corollary[
  In a complete theory $T$,
  $
    p "is isolated" <=> "every model of" T "realizes" p
  $
]

Now that we have the tools to omit types, we can use them to characterize the $aleph_0$-categorical theories.
#theorem("Ryll-Nardzewski")[
  Let $T$ be a complete theory over a countable language $L$, the following are equivalent.
  + $T$ is $aleph_0$-categorical.
  + $forall n, S_n^T (nothing)$ is finite.
]<thrm-aleph_0_categorization>
#proof[
  $(1) => (2)$. Suppose that $S_n^T (nothing)$ is infinite, we know that it is always a closed subset of the Cantor set. As an infinite compact space, $S_n^T (nothing)$ has a non isolated point, corresponding to a non isolated type $p$. By the omitting types theorem, there exists a model which omits $p$, since it is a type there is another model which realizes $p$, those two models then cannot be isomorphic. We can then make them both countable by @thrm-downwards which completes this side of the proof.

  $(2) => (1)$. We assume that $S_n^T (nothing)$ is finite. This implies that if $A seq mM sat T$, with $A$ being finite, then $S_n^T (A)$ is also finite by @prop-type_space_injection. Hence $S_n^T (A)$ is a finite Hausdorff space, so every type in $S_n^T (A)$ is isolated.
  
  Now let $mM,mN sat T$ be countable models, enumerate them as $mM = {a_0, a_1, ...}$ and $mN = {b_0, b_1, ...}$. We will now do a back and forth construction, at step $n$ we have a partial isomorphism $f_n : A_n -> B_n$. Define the tuples $ov(a) = (a_1,...,a_n), ov(b) = (b_1,...,b_n)$ containing all elements of $A_n$ and $B_n$ respectively.
  From the fact that it is a partial isomorphism we will know that
  $tp_n^mM (ov(a)) = tp_n^mN (ov(b)).$

  Now let us create the construct the maps by induction, at step $0$ we pick some $a in mM$, then by the discussion above $tp_n^mM (a)$ is isolated. Since it is isolated every model of $T$ realizes this type and so in particular there is an element $b in mN$ that realizes $tp_n^mM (a)$ and so we map $a$ to it.

  At the inductive even steps we will pick some $a_(n+1) in mM$ and note that $tp_n^mM(A) (a_(n+1))$ is again isolated so again there is some element $b_(n+1) in mN$ such that 
  $tp_n^mN(B)(b_(n+1)) = tp_n^mM(A) (a_(n+1))
  $
  and so we can map $a_(n+1)$ to $b_(n+1)$.
  At the odd steps we do the same thing as above but pick $b_(n+1) in mN$ first.
]

#example[
  In $A C F_p$ we have that the type of any root of an irreducible polynomial is isolated while the type of the transcendental number is not isolated.
]

= Automorphism groups
In algebra for some algebraic structure an important role is played by the automorphism groups of these structures. As model theory is a sort of algebra without fields we will also use automorphism groups.
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
  Every tuple in an orbit has the same type since $Aut(mM)$ consists of automorphisms. Hence we have that if there are finitely many orbits, each $S_n (nothing)$ is finite, making $T$ $aleph_0$-categorical by @thrm-aleph_0_categorization.

  On the other hand if it is $aleph_0$-categorical, every $S_n (nothing)$ is finite, and so by @prop-type_space_injection so is every $S_n (A)$. Now let $ov(a),ov(b)$ be two tuples of the same type and consider $T(ov(a))$. In this theory we have $S_n^(T(ov(a))) (nothing) = S_n^T (ov(a))$ and thus each of its type spaces are finite. 

  Now again through @thrm-aleph_0_categorization we know that $T(ov(a))$ is $aleph_0$-categorical so since we can interpret $mM$ as an $T(ov(a))$ model by interpreting $ov(a)$ as $ov(b)$, so we have an isomorphism mapping $ov(a)$ to $ov(b)$, hence they are in the same orbit. Hence there at most as many orbits as there are $n$-types, so there are finitely many orbits.
]

= Infinitary Logic and Scott Analysis
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
    [ov(a)]_alpha = [ov(a)]_beta quad "for all" beta >= alpha
  $
  where $[ov(a)]_alpha$ is the equivalence class of $ov(a)$ with respect to $equiv_alpha$.
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
    SH(mM) = min { alpha < omega_1 : med equiv_alpha "is the same as" equiv_(alpha+1)}
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
  Let $mM,mN$ be countable structures with 
  $
    SH(mM) = SH(mN) = alpha,
  $ 
  if $mM equiv_(alpha+omega) mN$, then $mM tilde.equiv mN$.
]
#proof[
  Our proof will employ a back and fourth method, assume that at the step $n$ we have $(mM, a_1, ..., a_n) equiv_(alpha + 1) (mN, b_1,...,b_n)$.
  Assume then that we are on an even step and want to add an element $a_(n+1)$ to this equivalence, we leave this induction step as an exercise.

  // TODO: COMPLETE EXERCISE
]


We also have a partial converse to this result.
#proposition[
  Suppose that $SH(mM) = alpha$ and $mM equiv_(alpha + omega) mN$, then $SH(mN) = alpha$.
]
#proof[
  First we want to show that $SH(mN) <= alpha$. Choose $ov(a), ov(b) in mN^n$ and suppose that $ov(a) equiv_(alpha) ov(b)$. We want to show that $ov(a) equiv_(alpha + 1) ov(b)$ using $mN equiv_(alpha + omega) mM$.
  Find $ov(c),ov(d) in mM^n$ such that
  $
    (mM,ov(c)) equiv_(alpha + 1) (mN, ov(a)) "and" (mM, ov(d)) equiv_(alpha+1) (mN, ov(b))
  $
  then we also have
  $
    (mN,ov(b)) equiv_(alpha+1) (mM, ov(d)) equiv_(alpha + 1) (mM, ov(c)) equiv_(alpha + 1) (mN,ov(a))
  $
  and thus $SH(mN) <= alpha$.

  For the other inequality we just swap $mM$ and $mN$.
]
#corollary[
  Let $mM$ be a countable structure, there exists $alpha < omega_1$ such that for every countable structure $mN$
  $
    mN tilde.eq mM <=> mN equiv_alpha mM
  $
]
// TODO: FIX CHAPTERS
// TODO: FIX Lowenheim-Skolem NAME

However, with a bit of trickery, we can define a sentence which does uniquely classify our countable model.
#definition[
  Let $mM$ be an $L$ structure, $alpha = SH(mM)$.
  We define the _Scott Sentence_ of $mM$ as
  $
    phi.alt = phi^(mM, nothing)_alpha and and.big_(n=0)^infinity and.big_(ov(a) in mM) [ forall ov(x) (phi^(mM, nothing)_alpha (ov(x)) -> phi_(alpha+1)^(mM,ov(a)) (ov(x)))]
  $
]

#theorem("Scott Isomorphism Theorem")[
  Let $mM$ be a countable structure for every countable structure $mN$,
  $
    mN tilde.equiv mM <=> mN sat phi.alt^mM
  $
]
#proof[
  The forward direction is simple, if the two models are isomorphic $mN$ satisfies the sentence of $mM$ since they have the same sentences.

  For the backwards direction we want to use back and forth, we will use induction and assume we have some tuple $ov(a)$ and a partial isomorphism $f_n : mM -> mN$, in the sense that $(mM,ov(a)) equiv_alpha (mN, f_n(ov(a)))$.

  For $n = 0$ we have $mM equiv_alpha mN$ since $mN sat phi_alpha^(mM,nothing)$. Now assume that we have constructed the map for $n$, then we have $(mM,ov(a)) equiv_alpha (mN, f_n(ov(a)))$, then since $mN sat phi^mM$ then we get
  $
    mN sat phi_alpha^(mM, ov(a)) (f_n(ov(a))) => mN sat phi_(alpha+1)^(mM, ov(a)) (f_n(ov(a)))
  $
  but we know that
  $
    mN sat phi_alpha^(mM,ov(a)) (f_n (ov(a)))
  $
  so we must have
  $
    mN sat phi_(alpha+1)^(mM,ov(a)) (f_n (ov(a)))
  $
  and so
  $
    (mM, ov(a)) equiv_(alpha + 1) (mN, f_n (ov(a))).
  $
  Now by @def-scott_equiv we get that for any element in $a in mM$ we can pick an element $b in mN$ such that $(mM, ov(a),a) equiv_alpha (mN, f_n (ov(a)), b)$ and so we set $f_(n+1)$ to be the extension of $f_n$ with $f_(n+1)(a) = b$.

  This describes how we do the odd steps, on even steps we just swap $mN$ and $mM$.
]

= Quantifier Elimination
#definition[
  A theory $T$ has _quantifier elimination_, if for every formula $phi(ov(x))$ there exists a quantifier free formula $psi(ov(x))$ such that
  $
    T proves forall (ov(x)) (phi(ov(x)) <-> psi(ov(x)))
  $
]
At face value this seems like a hopelessly strong property, but in fact we can make any theory have quantifier elimination if we expand our language. This is called _Skolemization_.

#definition[
  A theory $T$ has _Skolem functions_, if for every formula $phi(ov(x), y)$ there exists a term $t_phi (ov(x))$ such that
  $
    T proves [ (exists y (phi(ov(x),y))) -> phi(ov(x), t_phi (ov(x)))]
  $
]

#proposition[
  If $T$ has Skolem functions then it has quantifier elimination.
]
#proof[
  We prove by induction on the complexity of a formula $phi(ov(x))$, for atomic formulas this is trivial. For conjunctions, disjunctions and negations this is also trivial. Now if $phi(ov(x)) = exists y (psi(ov(x), y))$ then through Skolem functions we get
  // TODO: FINISH PROOF
]

If $T$ has Skolem functions and $mM sat T$ with $A seq mM$, we can define $Sc(A)$ to be the closure of $A$ under all Skolem functions, sometimes called the Skolem hull of $A$.

#proposition[
  $Sc(A) elm mM$
]
#proof[
  Proof is trivial by @thrm-tv_test.
]

Let $T$ be a theory in $L$, we can add enough Skolem functions as follows.

- We replace $L$ with $L'$ with new added function symbols.
- We replace $T$ with $T' = T union { exists y (phi(ov(x), y)) -> phi(ov(x), f_phi (ov(x))) : phi }$
- We replace $mM$ with $mM'$ where we interpret the functions using the witnesses we know exist.

We now use induction, we set
- $L^(n+1) = (L^n)'$
- $T^(n+1) = (T^n)'$
- $mM^(n+1) = (mM^n)'$
then in the limit we have
- $L^s = union_(n < omega) L^n$
- $T^s = union_(n < omega) T^n$
- $M^s = union_(n < omega) M^n$

#proposition[
  - $mM^s sat T^s$, and $T^s$ has Skolem function.
  - $T^s$ is a conservative extension, in the sense that
  $
    T proves sigma <=> T^s proves sigma
  $
]
#proof[
  Exercise.
]

#proposition[
  $DLO_0$ has quantifier elimination.
]
#proof[
  We induct on the logical structure of $phi(ov(x))$, we show that there exists a quantifier free formula $psi(ov(x))$ such that
  $
    DLO_0 proves forall ov(x) (phi(ov(x)) <-> psi(ov(x))).
  $

  For atomic formulas this is trivial, for logical connectives this is also trivial, now assume that $phi = exists x (phi'(ov(x)))$.
  Since $exists x (alpha or beta) <-> exists x (alpha) or exists x beta$, we can assume that $phi'$ is in Normal Form, that is
  $
    phi' <-> or.big_i exists x and.big_j a^i_j
  $
  then WLOG $phi' = alpha_1 and ... and alpha_n$ with $alpha_i$ atomic or a negation of an atomic formula.

  Now write $c_1(ov(y)), ..., c_m (ov(y))$ to be the quantifier free formulas which describe a total order on $y_1,...,y_n$ which possibly identifies some of them.
  Now for each $i <= m$ if
  $
    QQ sat c_i (ov(b)) and c_i (ov(b)'),
  $
  then there exists an automorphism of $(QQ,<=)$ mapping $ov(b)$ to $ov(b)'$. For each $i <=m$ let $ov(b)_i$ such that $QQ sat c_i (ov(b)_i)$, then consider the index set
  $
    I = {i <= m : QQ sat exists ov(x) phi'(x,ov(b)_i)}
  $
  then we have
  $
    QQ sat (exists x phi(x,ov(y)) <-> forall_(j in I) c_j (ov(y)))
  $
  because if $ov(y)$ satisfies the left formula then it has some ordering and so we can use the automorphisms to map $ov(y)$ to some $ov(b)_i$ and then $i in I$ and thus the right side also holds. Similarly we can go the other way.

  Now since $DLO_0$ is complete we can lift the above sentence from $QQ$ to $DLO_0$ and get our result.
]

What we see in this proof is that quantifier elimination is intimately related to the type structure for finite tuples. We can make this relation more precise.

#proposition[
  Let $p in S_n (nothing)$, write $p_0$ for ${ phi in p : phi "is quantifier free" }$.
  
  A complete theory has quantifier elimination if and only if 
  $
    forall p in S_n (nothing), quad T union p_0 proves p
  $<eq-quant_elimination>
]
#proof[
  The forward direction is trivial, we just take any $phi in p$ and use quantifier elimination to get an equivalent quantifier free version which must also lie in $p$ and thus lie in $p_0$, then by equivalence we get the result.

  // TODO: fix this reference
  For the backwards direction assume the condition above holds, then let $phi$ be a formula, then $[phi] seq S_n (nothing)$ be the corresponding open set.
  Then for every $p in [phi]$ we have $T union p_0 proves phi$ so by compactness for some finite collection $psi_i^p$ of quantifier free formulas we have $T union { phi_i^p : i <= n } proves phi$. Then set
  $
    psi^p = and.big_i psi_i^p
  $
  and note that $[psi^p] seq [phi]$. Now since open sets of the form $[psi^p]$ cover $[phi]$ which is compact, we can take a finite subcollection $p_j$ such that $[psi^(p_j)]$ cover $[phi]$, then $[phi] = union.big_j^k [psi^(p_j)]$ and then
  $
    T proves phi <-> or.big_(j=1)^k psi^(p_j)
  $
  // TODO: Add proper variables here
]

#proposition[
  $A C F_p$ has quantifier elimination.
]<prop_acf_qe>
#proof[
  Let $p in S_n (nothing)$, we need $T union p_0 proves p$. Choose a large algebraically closed field $K$ and let $ov(a),ov(b) in K$ such that both realize $p_0$.
  We will show that there exists $phi in Aut(K)$ such that $phi(ov(a)) = ov(b)$, this will then imply that $tp(ov(a)) = tp(ov(b))$ which proves what we want. 

  Recall that $gen(ov(a)),gen(ov(b))$ are the subrings generated by $ov(a)$ and $ov(b)$ respectively.
  Now map $a_i |-> b_i$, we want to extend this map to $gen(ov(a)) -> gen(ov(b))$, recall that elements of $gen(ov(a))$ are are of the form $P(ov(a))$ where $P in ZZ[ov(x)]$, which we can also write as $tau_1(ov(a)) - tau_2(ov(a))$ where $tau_1,tau_2$ are two terms. We now map 
  $
    tau_1(ov(a)) - tau_2(ov(a)) -> tau_1(ov(b)) - tau_2(ov(b))
  $
  one can easily check that this is a well defined map.

  We now extend the isomorphism to the field of fractions for $gen(ov(a))$ and $gen(ov(b))$ in exactly the same way, by mapping
  $
    (tau_1(ov(a)))/(tau_2(ov(a))) -> (tau_2(ov(b)))/(tau_2(ov(b)))
  $
  and then once again we can extend to the algebraic closure of this field of fractions.

  Finally we have a map of countable algebraically closed subfields $L -> L$, we can extend this map to all of $K$ since $K$ has a transcendental basis of $L$ and so we can permute this transcendental basis whichever way we like to extend this map.
]

#pagebreak(weak: true)
= Algebraic Geometry
Now that we have quantifier elimination of $A C F_p$ we can use that to very quickly prove the foundations of algebraic geometry
#theorem("Lefchetz's principle")[
  Let $sigma$ be a sentence in the language of fields. TFAE
  + $sigma$ is true in every algebraically closed field of characteristic $0$.
  + $sigma$ is true in every algebraically closed field of characteristic $p$ for all but finitely many $p$. 
  + $sigma$ is true in every algebraically closed field of characteristic $p$ for infinitely many $p$
]<thrm-lef_principle>
#proof[
  Recall that for finite $p$, 
  $
    A C F_p = A C F union {"characteristic" = p},
  $
  and
  $
    A C F_0 = A C F union { "characteristic" != p : p "prime"}
  $

  Now $(2) => (3)$ is trivial, so we prove $(1) => (2)$ and $(3) => (1)$.

  For $(1) => (2)$, assume that $A C F_0 proves sigma$, then there is a finite subcollection of sentences $"characteristic" != p$ such that
  $
    A C F union { "characteristic" != p_i : i <= n} proves sigma
  $
  so we are done.

  For $(3) => (1)$, suppose that $A C F_0 tack.not sigma$ and $A C F_p proves sigma$ for infinitely many $p$. Then by completeness $A C F_0 tack.not not sigma$ so by $(1) => (2)$ there exists a prime $p_0$ such that for all prime numbers $p >= p_0$ we have $A C F_p proves not sigma$ and so we get a contradiction.
]
There are some fun consequences of this theorem.
#theorem("Ax")[
  If $f : CC^N -> CC^N$ is a map where every coordinate is a polynomial, then if it is injective, then it is surjective.
]
#proof[
  Let $hat(FF)_p$ be the algebraic closure of $FF_p$. We claim that every injective polynomial map $f : hat(FF)_p^N -> hat(FF)_p^N$ is surjective. If we have this then by @thrm-lef_principle we can transfer this result to $CC$.

  Now to prove the claim first note that every polynomial has finitely many coefficients and that
  $
    hat(FF)_p = union.big_(n = 1)^infinity FF_(p^n)
  $
  has the property that every finite subset generates a finite field. Then WLOG we may assume that all the coefficients of $f$ are in $FF_(p^m)$ for some fixed $m$. Then we get that $f$ induced a map $f_((n)) : FF_(p^n)^N -> FF_(p^n)^N$ for $n >= m$. By assumption all $f_((n))$ are injective and since these are finite fields they must also be surjective. Hence since $f = union.big_(n=m)^infinity f_((n))$ we get that $f$ is also surjective.

  Now to transfer this result to $CC$, fix $d in NN$ the degree of the polynomial and $N in NN$ the number of variables. We write $g(ov(x), ov(a))$ the degree $d$ polynomial in $ov(x)$ with coefficients $ov(a)$. Then consider the sentence
  $
    forall ov(a) ((forall ov(x) forall ov(y) (g(ov(x), ov(a)) = g(ov(y),ov(a)) => ov(x) = ov(y)) => forall ov(y) exists ov(x) (f(ov(x),ov(c)) = ov(y)))
  $
  this sentence encodes exactly the statement of the theorem for polynomials of degree $<= d$. Hence by @thrm-lef_principle since these sentences are true in $hat(FF)_p$ then they are also true in $CC$.
]

Coming back to quantifier elimination, we have an assortment of corollaries stemming from @prop_acf_qe 
#corollary(base: "heading")[
  Let $K < L$ both be algebraically closed fields, if $F(ov(x))$ is a system of polynomial equations and inequalities with coefficients from $K$ with a solution in $L$, then the system also has a solution in $K$.
]<cor-pol_equal>
#proof[
  Let $phi(ov(y)) = exists ov(x) F(ov(x), ov(y))$ where $ov(y)$ are the coefficients of the polynomials.

  By quantifier elimination we have that $phi(ov(y))$ is equivalent to a quantifier free formula $psi(ov(y))$. Then if for some choice of coefficients $L sat psi(ov(c))$ then $K sat psi(ov(c))$ and so we are done.
]

#corollary("Weak Hilbert Nullstellensatz", base: "heading")[
  Let $K$ be an algebraically closed field, $f_1,...,f_n in K[ov(x)]$. $f_i$ have a common zero in $K^n$ if and only if $1 in.not (f_1,...,f_n)$.
]<cor-weak_null>
#proof[
  The forward direction is very easy, if they have a common zero then everything in the ideal has that same common zero.

  On the other hand if $1$ is not in the ideal, let $I$ be a maximal ideal containing $(f_1,...,f_n)$ then set
  $
    L = hat(K[ov(x)] quo I)
  $
  which is clearly an algebraically closed field containing $K$. Now in $L$ there are common roots, they are the variables $x_1,...,x_n$. Hence by the 
  // @cor-pol_equal 
  we get the desired result.
]

We can now apply this to some basic algebraic geometry.
#definition[
  + If $S seq K[ov(x)]$ we set #h(1fr)
    $
      V(S) = {ov(a) in K^n : f(ov(a)) = 0, forall f in S}
    $
  + If $Y seq K^n$ we set
    $
      I(Y) = { f in K[ov(x)] : f(ov(a)), forall ov(a) in Y}
    $

    We call a subset $V$ of $K^n$ _Zariski-closed_ if $V = V(S)$ for some $S in K[ov(x)]$.
    
    An ideal is _radical_ if it is closed under taking roots.
]
#proposition[
  For all $X,Y seq K^n$
  + $I(Y)$ is a radical ideal
  + If $X$ is Zariski-closed, then $X = V(I(X))$.
  + If $X subset.neq Y$ and $X,Y$ are Zariski-closed, then $I(Y) subset.neq I(X)$.
  + The Zariski-closed sets form a topology, that is they are closed under finite unions and arbitrary intersections. In particular if $X,Y$ are Zariski-closed then 
    $
      X union Y = V(I(X) sect I(Y))
    $ 
    and 
    $
      X sect Y = V(I(X) + I(Y)).
    $
]
#proof[
  Exercise.
]

#theorem("Hilbert basis theorem")[
  If $K$ is a field, then $K[ov(x)]$ is a Noetherian ring. That is, there is no infinite increasing chain of ideals. In particular, every ideal is finitely generated.
]

#corollary[
  If $K$ is a field, then there is no infinite decreasing sequence of Zariski-closed sets.
]
#proof[
  We apply Hilbert's Basis theorem along with the third proposition.
]

#definition[
  An ideal $I$ in a ring is _prime_ if
  $
    a dot b in I => a in I "or" b in I
  $
]
Clearly every prime ideal is radical.

#theorem("Primary decomposition")[
  If $I seq K[ov(x)]$ is a radical ideal, then there are prime ideals $J_1,...,J_n$ such that
  $
    I = J_1 sect ... sect J_n
  $
]

We can now prove the strong form of @cor-weak_null
#theorem("Hilbert Nullstellensatz strong form")[
  Let $K$ be algebraically closed, if $I subset.neq J$ and both are radical in $K[ov(x)]$, then
  $
    V(J) subset.neq V(I)
  $
]<thrm-strong_null>
#proof[
  Note that the non-strict inclusion is trivial, the hard part is to prove the non-strict inclusion. That is, we want to find a common root of $I$ which is not a common root of $J$. Let $p in J backslash I$, we want want to find a point $ov(b)$ which is a common root of $I$ but $p(ov(b)) != 0$.

  We decompose $I = I_1 sect ... I_n$ into prime ideals and let $i$ be such that $p in.not I_i$.

  By Hilbert basis theorem we have $I_i = (f_1,...,f_n)$ so we want to find a root of $f_1,...,f_n$ which is not a root of $p$. Let $R = K[ov(x)]/I_i$ then $R$ is an integral domain since $I_i$ is prime, let $R_0$ be the field of fractions of $R$ and $L = hat(R_0)$.

  In $L$ consider the system
  $
    cases( f_i = 0 : 1 <= i <= m, p eq.not 0)
  $
  it has a solution in $L$ and thus by 
  // @cor-pol_equal 
  it also has a solution in $K$ and so we are done.
]
#corollary[
  If $I$ is a radical ideal then $I = I(V(I))$
]
#proof[
  Apply @thrm-strong_null to $J = I(V(I))$.
]

#lemma[
  Let $K$ be a field,
  + A subset of $K^n$ is definable over $K$ by an atomic formula if and only if it is of the form $V(p)$ for some $p in K[x_1,...,x_n]$.
  + A subset of $K^n$ is definable over $K$ by a quantifier free formula if and only if it is a Boolean combinations of Zariski closed sets.
]<lem-constr>
#proof[
  (1) is straight forward, as is the forward direction for (2).

  For the backward direction of (2), assume that $X$ is a Boolean combination of $Z_i$ for some Zariski-closed family $Z_i$, then by definition we have 
  $
    Z_i = V(p^i_1) sect ... sect V(p^i_(n_i)
  $ 
  then immediately we have that $X$ is a boolean combination of
  $
    V(p^i_j)
  $
]

#definition[
  A set in $K^n$ is constructible if it satisfies (2) in @lem-constr.
]

#theorem("Chevalley")[
  Let $K$ be algebraically closed, the images of constructible sets by polynomial maps are constructible.
]
#proof[
  Let $X seq K^n$ be constructible, $p : K^n -> K^m$ be a polynomial map
  $
    p(X) = {ov(y) in K^n : exists ov(x) (ov(x) in X and ov(y) = p(ov(x)))}
  $
  then since $p(ov(x))$ is definable over $K$ subset of $K^m$. Since the theory of $K$ has quantifier elimination, $p(ov(x))$ is definable by a quantifier free formula and thus is constructible.
]

= Homogeneous Structures
#definition[
  $mM$ is $kappa$-_homogeneous_ if for every subset $A seq mM$ with $|A| < kappa$, every elementary embedding $f : A -> mM$ and every element $a in mM$ there is an extension $g : A union {a} -> mM$ which is also an elementary embedding.

  $mM$ is called _homogeneous_ if it is $|mM|$-homogeneous. $mM$ is _strongly_ $kappa$-_homogeneous_ if we have an extension $g : mM -> mM$ of $f$ instead.
]

One might wonder why we do not similarly define $mM$ to be strongly homogeneous if it is strongly $|mM|$-homogeneous. This is explained by the following proposition.
#proposition[
  $mM$ is homogeneous if and only if it is strongly $|mM|$-homogeneous.
]
#proof[
  Exercise, quite simple using back and forth.
]

#proposition[
  If $mM equiv mN$ are saturated and are of the same cardinality then $mM tilde.equiv mN$.
]
#proof[
  We prove, as expected, by back and forth. Set $kappa = ||mM|| = ||mN|$ and numerate both models as 
  $
    mM = {a_alpha : alpha < kappa } "and"
    mN = {b_alpha : alpha < kappa }.
  $

  We will construct a partial map $f_alpha : A_alpha -> B_alpha$ with $|f| <= 2 |alpha|$ such that $f_alpha seq f_(alpha + 1)$ and $a_alpha in A_alpha, b_alpha in B_alpha$.

  We start with the base case of $alpha = 0$ where $f_alpha = nothing$.
  For the limit case suppose that $f_beta$ is constructed for $beta < alpha$, we write
  $
    f'_alpha = union.big_(beta < alpha) f_beta
  $
  and we look at the type $p = tp^mM (a_alpha quo A_alpha)$. Notice that for any formula $phi in p$ we can replace all the parameters in $A_alpha$ with their image under $f_alpha$, so we can define $f'_alpha (p)$ which is then a complete type over $B_alpha$ and thus $f'_alpha (p) in S_n (B_alpha)$. Then set $b$ to be the realization of this type, then we define the extension $f''_alpha (a_alpha) = b$.
  We similarly do the same for the backwards direction, we take a type in $mN$ and map it back to $mM$. Then we set $f_(alpha) = f''_alpha$.
]

#theorem[
  Suppose $mM equiv mN$ are homogeneous of the same cardinality, then if $mM,mN$ realize the same complete $n$-types over the empty set for each $n$, then $mM tilde.equiv mN$.
]
Before we prove this we need a small lemma
#lemma[
  For any $A seq mM$ there is some embedding $A -> mN$.
]
#proof[
  Induction on $|A|$.
  + If $A$ is finite then since $mM$ and $mN$ realize the same types this is immediate.
  + If $|A| = mu >= aleph_0$ then we can enumerate $A = {a_alpha : alpha < mu}$ and so by a sub induction on $alpha$ we construct $f(a_alpha)$. 
    Suppose that for some fixed $alpha$ we have constructed $f(a_beta)$ for $beta < alpha$. Then let $A_alpha = {a_beta : beta <= alpha }$ then by our outer induction hypothesis there exists an embedding $g : A_alpha -> mN$. Note that we are not done since the $g$ could be incompatible with $f$, but notice that that $f compose g^(-1)$ is a map $g(A_alpha backslash {a_alpha}) -> mN$ then by homogeneity we can extend this to an elementary embedding $h : g(A_alpha) -> mN$ and then we set $f(a_alpha) = h(g(a_alpha))$.
]

The intuitive explanation for this proof is that by induction we get a sequence of maps $f_alpha$ and then by homogeneity we can arrange the images of the maps so that they sit on top of each other for increasing $alpha$ which is enough to construct a limit map.

Now to prove the theorem.
#proof[
  We now use a back and forth argument to prove the theorem. We will not delve into the full details here but simply mention that when we want to add an element to the partial isomorphism $f_alpha$, we use the above lemma to get a new map $g$ with an extended domain. But then to make that map compatible with the previous maps we can use homogeneity again to align the images so that the image of $g$ sits on top of the images of $f_alpha$, then we use that as our extension.
]

#definition[
  A model $mM$ is called $kappa$-_universal_ if for every $mN equiv mM$ with $||mN|| <= kappa$ there exists an elementary embedding $f : mN -> mM$.

  $mM$ is called _universal_ if it is $|mM|$-universal.

  $mM$ is $< aleph_0$-universal if for every $n$, $mM$ realizes all types in $S_n^(Th(mM)) (nothing)$.
]
// TODO: ADD CLARIFICATION HERE
#theorem[
  If $mM$ is $kappa$-saturated then $mM$ is $kappa$-homogeneous and $kappa$-universal.
]
#proof[
  For $kappa$-homogeneity if we have $|A| < kappa$ and an embedding $f : A -> mM$, then pick any $a in mM$. We can take the type $p = tp(a quo A)$ and map it to $q = f(p)$ and define $f(a)$ to be the element that realizes this type.

  For $kappa$-universality we let $mN equiv mM$, and $||mN|| <= kappa$. \ Then we enumerate $mN = {a_alpha : alpha < kappa}$, and we construct $f(a_alpha)$ by induction. We set $p = tp(a_alpha quo { a_beta : beta < alpha })$ and then $q = f(p)$ and so we just set $f(a_alpha)$ to be any element which realizes $q$.
]
// TODO: MAKE ALL THESE PROOFS CLEARER

#theorem[
  If $mM$ is $kappa$-homogeneous and $< aleph_0$-universal then $mM$ is $kappa$-saturated.
]
#proof[
  Let $A seq mM$ with $|A| < kappa$, let $p in S(A)$, we want to show that $p(M) != nothing$, we prove this by induction on $|A|$.

  // TODO: ADD REFERENCE TO EXTENSION
  First assume that $|A|$ is finite, then let $mN$ be an extension $mM elm mN$ which realizes the type $p$ through some element $b$. Then consider the type $q = tp^mN (A union b)$, by $< aleph_0$ universality we get that $mM$ realizes $q$ through some set $A'$ and element $b'$. But then by homogeneity since $A$ and $A'$ have the same type we can map $A',b'$ to inside $mM$ so that the image of $A'$ is $A$. But then the image of $b'$ realizes $p$ so we are done. 

  Next we use induction, assume that the statement holds for all $A'$ with $|A'| < mu$, we want to show it holds for $|A| = mu$. Enumerate ${ a_alpha : alpha < mu}$, then let $p_0$ be all the formulas in $p$ that do not use any of the constants in $A$. Since $mM$ realizes $p_0$ let $b$ be a witness $p_0$, let $mN$ again be an extension of $mM$ which realizes $p$ with $b'$ as a witness.

// TODO: FIX B AND B' IN THIS PROOF.
  Now $b$ and $b'$ have the same type, so if we consider $tp^mN(a_0 quo b')$ we can replace $b'$ by $b$ in every formula and obtain a type over $b$ in $mM$, by inductive hypothesis this type will be witnessed by an element $a'_0$ in $mM$. We then repeat this by induction, assuming we found $a'_beta$ for $beta < alpha$, then we can consider the type $tp^mN (a_alpha quo a_(< alpha) b')$, we again replace $a_(< alpha) b'$ in the parameters by $a'_(< alpha) b$ and then we get the element $a'_alpha$ in $mM$.

  We thus obtain $A' = {a'_alpha : alpha < mu}$ such that $b$ satisfies the same formula over $A'$ as $b'$ satisfies over $A$. We then can use homogeneity to map $A',b$ into $mM$ so that the image of $A$ is $A'$, then the image of $b$ is a witness to type $p$. 
]

= Fraïssé Theory
#definition[
  Let $mM$ be a countable structure in a countable language $L$. The $Age(mM)$ is the family of finitely generated submodels of $mM$. Alternatively $Age(mM)$ is the set of Isomorphism classes of finitely generated $L$-models that can be embedded into $mM$.
]
#proposition[
  + Hereditary Property (HP) - If $A in Age(mM)$ and $B$ embeds into $A$ then $B in Age(mM)$.
  + Joint Embedding Property (JEP) - If $A,B in Age(mM)$ then there exists $C in Age(mM)$, such that $A,B$ both embed into $C$. 
]
#proof[
  // TODO: FINISH
  Exercise.
]

#proposition[
  Let $K$ be a countable class of finitely generated $L$-structures, if $K$ satisfies HP and JEP as above, then $K = Age(mM)$ for some countable model $mM$.
]
#proof[
  Enumerate $K = {B_1,B_2,...}$. By induction construct a sequence $A_n in K$ such that $A_1 seq A_2 seq ...$ as follows. Start with $A_0 = B_0$, now given $A_n$ we let $A_(n + 1) in K$ be an element such that $A_n,B_n$ both embed into $A_(n+1)$. Now at the end we take $mM = union.big_(n=1)^infinity A_n$.

  It is clear that $Age(mM)$ is contained in $K$ since every finitely generated submodel of $mM$ is a submodel of some $A_n$ and thus is in $K$. On the other hand for each $B_i in K$ then it embeds into $A_(i + 1)$ and thus into $mM$. 
]

#definition[
  // TODO: ADD COMMUTATIVE DIAGRAM
  A class $K$ has the amalgamation property (AP) if for every $A,B,C in K$ such that $A$ embeds into both $B$ and $C$, then there exists a $D in K$ such that $B$ embeds into $D$ and $C$ embeds into $D$.
  $D$ is sometimes called an amalgam of $B,C$ over $A$.
]

#definition[
  A countable structure $mM$ is called _ultrahomogeneous_ if every partial isomorphism $A -> B$ between finitely generated substructures $A,B seq mM$ extends to an automorphism $mM -> mM$.
]

#proposition[
  If $mM$ is ultrahomogeneous then $Age(mM)$ satisfies AP.
]
#proof[
  Exercise.
]
It turns out that the converse to this result is also true.
#theorem("Fraïssé")[
  If $K$ satisfies HP, JEP, AP then there exists a unique ultrahomogeneous $mM$ such that $K = Age(mM)$.
  This is often denoted as $M = lim K$, and called the Fraïssé limit of $K$.
]
Before we start with the proof we need to introduce a bit of theory.
#definition[
  A structure $mM$ is weakly homogeneous, if for all finitely generated $A,B seq mM$ with $A seq B$ and all embeddings $f : A -> mM$ we have an extension $g : B -> mM$.
]
// TODO: ADD COMMUTATIVE DIAGRAM

#proposition[
  If $mM$ is ultrahomogeneous then $mM$ is weakly homogeneous.
]
#proof[
  Exercise.
]

One can notice that the definition of weak homogeneity is ideal for extending back and forth maps, as is confirmed in the next proposition.
#lemma[
  For $mM,mN$ weakly homogeneous with $Age(mM) = Age(mN)$, every isomorphism  $f : A -> B$ between finitely generated substructures $A seq mM$, $B seq mN$, extends to a full isomorphism $g : mM -> mN$.
]<lem-weak_iso_extension>
#proof[
  We use back and forth, as usual we will attempt to build a map $f_n : A_n -> B_n$, starting with $f : A -> B$. On even induction steps we try to extend the domain of $f_n$ from $A_n$ to $A_(n+1)$. Notice that $A_(n+1)$ is in $Age(mM)$ and thus by assumption also in $Age(mN)$. Then by weak homogeneity we have that $f_n : A_n -> mN$ extends into $f_n' : A_(n+1) -> mM$, we then call $B_(n+1) = f_n'(A_(n+1))$ and $f_(n+1) = f_n'$.

  On odd steps we do the same thing but swap $mM$ and $mN$.
]

// TODO: MAKE K BOLD FOR ALL ITS USES.
#corollary[
  For $mM$ countable, weakly homogeneous is equivalent to ultrahomogeneous.
]
// TODO: ADD LINK TO THEOREM
#proof("Fraïssé's Theorem")[
  Uniqueness is easily shown since ultrahomogeneity implies weak homogeneity which allows us to apply @lem-weak_iso_extension to the empty isomorphism.

  For existence, by the corollary above, it is enough to find a weakly homogeneous countable model $mM$ such that $Age(mM) = K$.

  Enumerate $K = {B_n : n in NN}$, and all pairs of embedding $f_n: B_(k_n) -> B_(ell_n)$. We want to construct a sequence $A_n seq A_(n+1)$ such that $A_n in K$ for all $n$, with the additional property that if we have an embedding $B_(k_n) -> A_m$ for some $m <= n$ then 2we also have an extension $B_(ell_n) -> A_(n+1)$.

  To guarantee this we can use AP. The union of $A_n$ is then the desired structure. // TODO: ADD A COMMUTATIVE DIAGRAM.
]

= Monster Model
Let $kappa$ be a big cardinal (not too large, something of the order $2^(display(2)^(display(scripts(dots.up)^display(omega))))$). Ideally we would like a saturated model of size $kappa$, but as we saw in @thrm-saturation this is often quite difficult to achieve. Instead, in practice, we often use a $kappa$-saturated model which is $kappa$-strongly homogeneous.

#theorem("Monster Model")[
  For $kappa >= aleph_0$, $T$ complete and $L$ countable, there exists a model $frak(C) sat T$ which is $kappa$-saturated and $kappa$-strongly homogeneous.
]<thrm-monster>
Before we prove this we will need a tiny lemma.
#lemma[
  For all $mN sat T$ there exists an elementary extension $mN elm mN'$, such that
  - For all $A seq mN$ with $|A| < kappa$ all of $S(A)$ are realized in $mN'$
  - For all $f : A -> B$ elementary embedding between two $A,B seq mN$ with $|A|,|B| < ||mN||$, $f$ can be extended to $f' : A' -> B'$ also an elementary embedding with $A union mN seq A'$ and $B union mN seq B'$.
// TODO: ADD EMBEDDING SYMBOL
]<lem-monster_extension>
#proof[
  Let $mu = ||mN||$, then for the first condition we simply pick $mN'$ which is $mu^+$-saturated through @thrm-saturation.

  Now assume that we have an embedding $f : A -> B$, since $mN'$ is $mu$-saturated we can, by a simple inductive argument, construct an extension $g : mN -> mN'$. Now the issue here is that $g(mN)$ might contain $mN$ which is required by the lemma.

  To fix this set $mN_0 = g(mN)$, and construct $h : mN_0 union mN -> mN'$ extending $g^(-1)$. We then can set $A' = h(mN_0 union mN)$ and $B' = mN_0 union mN$. Then $h^(-1) : A' -> B'$ is an extension of $f$ as desired.
]

#proof([of @thrm-monster])[
  We will construct an elementary chain $mN_alpha$ with $alpha < kappa^+$, $mN_alpha sat T$.
  - $mN_0$ can be arbitrary
  - For limit $alpha$ we will have $mN_alpha = union.big_(gamma < alpha) mN_gamma$
  - For $alpha + 1$ we will have $mN_(alpha + 1)$ be the extension of $mN_alpha$ provided by @lem-monster_extension.

  We then set $frak(C) = union.big_(alpha < kappa^+) mN_alpha$, note that since $kappa^+$ is regular then $cf (kappa^+) = kappa^+$.

  Now we check $kappa$-saturation, if $A seq mM$, $|A| < kappa$, $p in S(A)$, we know that $A seq mN_alpha$ for some $alpha$ by regularity of $kappa$. So we also know that $p$ is realized in $mN_(alpha+1)$ and thus since this is an elementary chain $p$ is realized through the same element in $frak(C)$.

  Next we check $kappa$-homogeneity, if $A,B in frak(C)$, $|A|,|B| < kappa$, $f : A -> B$, there is $alpha$ such that $A,B seq mN_alpha$ again by regularity. We then fix $f = f_alpha$ use @lem-monster_extension to extend $f_alpha$ to $f_(alpha+1)$, we repeat this for successor steps and for limit steps we union. We can continue doing this for all $alpha$ to extend $f$ to an automorphism $g : frak(C) -> frak(C)$.
]

#remark[
  Since $frak(C)$ has so many automorphisms, it is often useful to consider, for any subset $A seq frak(C)$ with $|A| seq kappa$, the group $Aut(frak(C) quo A)$ consisting of automorphisms of $frak(C)$ that fix $A$. This group naturally acts on $frak(C)^n$.

  One can easily show that for any two tuples $ov(x),ov(y)$, they are in the same orbit of $Aut(frak(C) quo A)$ if and only if $tp(ov(x) quo A) = tp(ov(y) quo A)$.
  So orbits of $Aut(frak(C) quo A)$ are equivalent to realizations of $S(A)$.
]

= Indiscernibles
#definition[
  Let $(I, <=)$ be a linear order, a set $A = { a_i : i seq I } seq mM$ is called _order-indiscernible_ if for all formulas $ phi (x_1,...,x_n)$ and linear suborders $forall i_i < ... < i_n, j_1 < ... < j_n in I$ we have
  $
    mM sat phi(a_(i_1),...,a_(i_n)) <=> mM sat phi(a_(j_1),...,a_(j_n))
  $
]
#example[
  $DLO_0$ with $A = mM = I = QQ$ is order indiscernible.

  If $K > L$ are algebraically closed fields with $K$ transcendental over $L$, then a transcendental basis of $K$ over $L$ is also an example.

  Any basis of an infinite dimensional vector space.
]

#theorem("Ehrenfeucht–Mostowski")[
  Let $T$ be a theory with infinite models, $I$ arbitrary, there exists a model $mM sat T$ with an order-indiscernible sequence $(a_i : i in I)$ of infinite cardinality.
]<thrm-E_M>
#proof[
  Let $(c_i : i in I)$ be new constants and set $L' = L union {c_i : i in I}$. We want to show that the augmented theory
  $
    T' := T union { phi(c_(i_1),..., c_(i_n)) <-> phi(c_j_1,...,c_j_n)} : phi in F_L , i_1 < ... < i_n, j_1 <... < j_n}
  $
  is consistent.

  We use compactness, let $S seq F_L$ be a finite subset of formulas, then we define the theory
  $
    T'' = T union { phi(c_(i_1),..., c_(i_n)) <-> phi(c_j_1,...,c_j_n)} : phi in S , i_1 < ... < i_n, j_1 <... < j_n}
  $
  and we will construct a model of $T''$.

  #lemma[
    If $A seq NN$, ${a_n : n in A} seq mM$, and $phi$ a formula. There exists $B seq A$ infinite such that for any sequences $i_1 < ... < i_n, j_1 < ... < j_n in B$ we have
    $
      mM sat phi(a_i_1,...,a_i_n) <=> mM sat phi(a_j_1,...,a_j_n)
    $
  ]
  #proof[
    Ramsey's theorem says that if we color ordered $n$-tuples of $A$ infinite, then there exists an infinite subset $B seq A$ such that all ordered tuples of $B$ have the same color.

    We define the coloring
    $
      C(a_(i_1),...,a_i_n) = cases(1 "if" mM sat phi(a_i_1,...,a_i_n), 0 "otherwise"),
    $
    then the infinite set given by Ramsey's theorem is exactly the subset $B$ we want.
  ]

  Applying the Lemma for each formula in $S$ we get that any model satisfies $T''$ and so $T''$ is consistent and so by compactness so is $T'$.
]

#corollary[
  Let $T$ be a theory with infinite models, then there is a model $mM sat T$ with
  $
    Aut(QQ, <) < Aut(mM)
  $
  where the second $<$ means subgroup.
]
#proof[
  Consider the Skolemization $T^S$ of $T$, use @thrm-E_M to get a model $mM^S sat T^S$ with an order-indiscernible sequence $(a_q : q in QQ)$.

  Set $mN^S$ be the smallest submodel containing $(a_q : q in QQ)$ then $mN^S elm mM^S$ since with Skolemization we have quantifier elimination. Let $mN$ be a reduct of $mN^S$ to $L$. //TODO: CHECK Skolemization CAPITALIZATION.

  If $phi in Aut(QQ, <)$ we want to define $ov(phi) in Aut(mN)$. Since everything in $Aut(mN)$ has the form of a Skolem term in the elements $a_q$ we can define
  $
    ov(phi)(a_q) = a_(phi(q))
  $
  on the generating elements, and
  $
    ov(phi)(t(a_i_1,...,a_i_n)) = t(a_phi(i_1),...,a_phi(i_n))
  $
  on terms.

  The fact that $ov(phi)$ is well defined and an automorphism will follow from the fact that $(a_q : q in QQ)$ is order-indiscernible.

  One can then easily check that the map $phi |-> ov(phi)$ is an embedding 
  $
    Aut(QQ, <) -> Aut(mN),
  $
  which gives us the subgroup relation.
]

#definition[
  A model $mM$ is an _Ehrenfeucht–Mostowski model_ if there exists an infinite order-indiscernible sequence $(a_i : i in I) seq mM$ such that $mM$ is generated by $(a_i : i in I)$. This generating sequence is called a _spine_ of $mM$.
]
<def-E_M_model>

#theorem[
  Let $mM$ be an Ehrenfeucht-Mostowski model with theory $T = Th(mM)$ over a countable language $L$.
  - The number of types in $S_n^T (nothing)$ realized in $mM$ is countable.
  - If $I$ is well-ordered, then for all $A seq mM$ the number of types in $S_n^T (A)$ realized in $mM$ is at most $|A| + aleph_0$.
]
#proof[
  For simplicity we restrict to $n=1$, $forall a in mM$ we can write $a$ as a term
  $
    a = t(a_i_1,...,a_i_n), quad i_1 < ... < i_n
  $
  note that if $a$ and $a'$ are assigned the same term (but possibly with different input sequence) then the assumption that $a_i$ are order-indiscernible gives us that $tp^mM (a) = tp^mM (a')$. Thus we have a well-defined surjective map
  $
    "terms" -> "types realized"
  $
  so since our language is countable the number of terms is countable and hence we get the first statement of the theorem.

  For the second statement, we again assume $n = 1$, and we notice that for any term $t(a_i_1,...,a_i_n)$ if we we have $a,a'$ both equal to this term for different sequences of inputs, then they have the same type over $A$ only if we have an automorphism taking the arguments of $a$ to the arguments of $a'$ while fixing $A$.

  We will for now assume that $A seq (a_i : i in I)$ and deal with this later, then such an automorphism exists if the arguments $a_i_k$ have the same relative positions. Proof is complicated and I got confused, will finish later.
  // TODO: FINISH LATER.
]

#definition[
  For $T$ a complete theory, $L$-countable and $kappa$ a cardinal.
  - $T$ is called _$kappa$-stable_ if for any model $mM sat T$ and all subsets $A seq mM$, $|A| < kappa$, we have $|S_1(A)| <= kappa$.
  - $T$ is stable if it is $kappa$-stable for some $kappa$.
  - $T$ is _totally transcendental_ (TT) if it is $kappa$-stable for _all_ $kappa$.
]

#example[
  $DLO_o$ is not $aleph_0$-stable since $S_1(QQ) tilde.equiv RR$ which has larger cardinality than $aleph_0$.
]

#theorem[
  $T$ is totally transcendental if and only if it is $aleph_0$-stable.
]<thrm-stable>
#proof[
  One direction is obvious, for the other direction we prove by contrapositive. Suppose $T$ is not $kappa$ stable for some $kappa$, that is, there is a model $mM sat T$ with a subset $A seq mM$, $|A| = kappa$ satisfying $|S_1(A)| > kappa$.

  We now want to find a countable subset $A_0 seq A$ such that $S_1 (A_0) >= 2^(aleph_0)$. We will call a formula $phi$ *big* if the neighborhood $[phi] seq S_1 (A)$ has size $|[phi]| > kappa$.
  #lemma[
    If $phi$ is big, then there exists $psi$ such that both $phi and psi$ and $phi and (not psi)$ are big.
  ]
  #proof[
    Assume for a contradiction that for each $psi$ either $phi and psi$ or $phi and (not psi)$ are not big, since $phi$ is big the other must be big and then WLOG we can assume $phi and psi$ is small and $phi and (not psi)$ is big.

    We now can write
    $
      [phi] = union.big_{psi : phi and psi "is not big"} [phi and not psi] union {p}.
    $
    where
    $
      p = {phi and psi : phi and psi "is big" } in S_1 (A)
    $
    // TODO: JUSTIFY P MORE
  ]
  Now using this lemma we can keep splitting $S_1 (A)$ into a tree of formulas $phi_s$ such that at each level all the subsets $[phi_s]$ are big.

  Now let $A_0$ be the set of parameters in the formulas $phi_s$, this set is countable since there are countably many formulas.

  For every branch $x in 2^omega$ we can consider the type we get by putting all the formulas of the branch in a set gives a type which we can complete to get a type in $S_1 (A_0)$. These types are not equal for different branches, and there are $2^(aleph_0)$ many branches so $S_1 (A_0)$ has cardinality at least $2^(aleph_0)$.
  // TODO: ADD DIAGRAM
]

= Ranks in Topological Spaces
#definition[
  We define the _Cantor-Bendixson derivative_ as $ X' = X backslash { "isolated points of" X }. $
  We then define $X^(alpha)$ by induction on $alpha$, 
  - $X^(alpha + 1) = (X^alpha)'$.
  - $X^gamma = sect.big_(beta < gamma) X^(beta)$.
]
// TODO: FIX LONG DEFINITIONS
#definition[
  If $X$ is separable then $exists alpha < omega_1$ such that $X^(alpha) = X^(alpha + 1)$.
  The minimal $alpha$ at which this stabilizes is called the _Cantor-Bendixson rank_, often written as
  $
    CB(X) = min {alpha : X^(alpha) = X^(alpha+1)}.
  $
  The left over after removing these isolated points is called the _perfect kernel_, written as
  $
    X^infinity = sect.big_(alpha < CB(X) + 1) X^(alpha)
  $
  and it is, as the name suggests, perfect, as in it does not have any isolated points.
]
#definition[
  As a bit of abuse of notation we also define the function
  $
    CB : X -> Ord union {infinity}
  $
  as
  $
    CB(p) = cases(min(alpha : p in.not X^alpha) &: p in.not X^infinity, infinity &: p in X^infinity)
  $
]

#definition[
  Assume that $X$ is a $0$ dimensional space, that is
  $
    Clop(X) = {U seq X : U "is clopen"}
  $
  forms a basis.

  We define (again with abuse of notation) $CB : Clop(X) -> Ord union {infinity}$, by induction
  - $CB(U) >= 0$ if $U != nothing$ and $CB(nothing) = -1$.
  - $CB(U) >= alpha + 1$ if $forall n$ we can find $V_1,...,V_n$ disjoint clopen subsets of of $U$ with $CB (V_i) >= alpha$.
  - $CB(U) >= gamma$ if $forall beta < gamma$ we have $CB (U) >= beta$. 
]

#example[
  $X = alpha + 1$ for $alpha$ some ordinal, we can define a topology by setting $(gamma, beta]$ to be the open basis.

  Write $alpha$ in its Cantor normal form
  $
    alpha = omega^(alpha_0) k_0 + .... + omega^(alpha_ell) k_ell
  $
  then $CB(alpha+1) = alpha_0$.
]

#proposition[
  For $X$ being $0$-dimensional compact space and $U,V$ clopen subsets.

  + $CB(U) = 0$ if and only if $U$ is finite.
  + If $U seq V$ then $CB(U) <= CB(V)$.
  + $CB(U union V) = max { CB(U), CB(V) }$.
  + $CB (U >= alpha + 1)$ if and only if there is an infinite sequence $V_n seq U$ which is open and disjoint with $CB(V_i) >= alpha$.
  + If $p in X$ then $CB(p) = min { CB(U) : p in U "with" U "clopen"}$.
  + $CB(U) = max { CB(p) : p in U }$.
]<prop-cb_rank_properties>
#proof[
  + Exercise.
  + Exercise.
  + One direction is clear by 2, for the other we prove by induction that if $CB (U union V) >= alpha$ then either $CB(U) >= alpha$ or $CB(V) >= alpha$, we leave induction step as exercise.
  + One direction is again clear, for the other we assume that $CB(U) >= alpha + 1$ then we can find two disjoint $U_1, U_2$ clopen subsets of $U$ with $CB(U_1),CB(U_2) >= alpha$. We can then enlarge $U_2$ to $U backslash U_1$ and then by $3$ we know that one of $U_1,U_2$ has $CB(U_i) = alpha + 1$ so we can repeat this splitting again on that $U_i$. Doing this by induction we get a sequence of $U_i$ with $CB(U_i) >= alpha$ as desired.
  + Exercise.
  + Exercise.
]

With these topological preliminaries out of the way we can apply them to Model Theory, namely noticing that $S_n (A)$ for any $A$ is always a $0$-dimensional compact Hausdorff space.

= Morley Rank
Let $T$ be a complete theory and $mM sat T$ an $aleph_0$-saturated model.
#definition[
  We define the _Morley Rank_ as a function
  $
    RM : Def_mM(mM) -> Ord union {infinity}
  $ 
  where $Def_mM(mM)$ are the definable sets with $mM$ as parameters, we define it through
  $
    RM(phi) = CB([phi] sect S_1 (mM))
  $
]
#proposition[
  + $RM(phi) = 0$ if and only if $phi(mM)$ is finite (we sometimes call this $phi$ being _algebraic_).
  + If $phi proves psi$ then $RM(phi) <= RM(psi)$.
  + $RM(phi or psi) = max(RM(phi), RM(psi))$.
]
#proof[
  Follows from @prop-cb_rank_properties with a little effort, details left as Exercise.
]

#definition[
  For a type $p in S_1 (mM)$ we define
  $
    RM(p) = min { RM(phi) : phi in p}
  $
]

#proposition[
  $RM(p) = CB(p)$ where we see $p$ as a point in $S_1(mM)$.
]
#proof[
  Directly from @prop-cb_rank_properties point 5.
]

Since the definitions heavily depend on $mM$ it is natural to ask whether we can say anything about how these properties change when we change the model. In fact we can, and this is formalized in the following proposition.
#proposition[
  If $phi$ is a formula with parameters in $mM$, $mM$ is $aleph_0$ saturated and $mM elm mN$ is an $aleph_0$-saturated extension then
  $
    RM^mM (phi) = RM^mN (phi)
  $
]
#proof[
  Exercise on assignment, will add when due date is passed.
]

By convention we usually define $RM$ inside the Monster Model, since we can easily embed other models into it.

Notice that we can extend this definition to not complete types, we do this through
$
  RM(p) = min {RM(phi) : phi in p}.
$

#proposition[
  If $p$ is a type over $A$, then there is a complete $q$ extending $p$ with
  $
    RM(p) = RM(q)
  $
]
#proof[
  We know that $p$ corresponds to a closed set of $S_1(A)$, we then consider the collection of formulas
  $
    q_0 = { not phi : RM(p union {phi}) < RM(p)}
  $
  one can check that $q_0$ is also a type which extend $p$. //TODO: COMPLETE PROOF THAT IT IS A TYPE.

  Any $q$ completing $q_0$ is an extension of $p$ with correct rank. //TODO: ADD INTUITION HERE.
]

#theorem[
  Let $T$ be a complete theory, $T$ is totally transcendental if and only if $RM(x = x) < infinity$.
]<thrm-rank_well_defined>

#remark[
  This is actually equivalent to $RM(x = x) < omega_1$, this is left as an exercise.
]
#proof([of @thrm-rank_well_defined])[
  Suppose that $RM(x = x) = infinity$, then there is some ordinal $beta$ such if $RM(phi) > beta$ then $RM(phi) = infinity$ (since we can never have arbitrarily large ranks). // TODO: ADD MORE EXPLANATION HERE.

  We will now construct a tree of formulas $phi_n$ indexed by $n in 2^(< omega)$, we start with $phi_nothing = (x = x)$ and continue by noticing that $RM(phi_nothing) > beta + 1$ implies that we can find two formulas $phi_0$and $phi_1$ with $RM(phi_0),RM(phi_1) > beta$ and hence we also have $RM(phi_0) = RM(phi_1) = infinity$. We then continue this and keep splitting formulas $phi_n$ to get a tree of non empty formulas. 

  Morally the construct of this tree is using the fact that Moraly rank 'stabilizes' in a very similar way as Scott rank.

  There are then at least $2^(aleph_0)$ leaves in this tree which correspond to at least $2^(aleph_0)$ types over the set of parameters of all $phi_n$ which is a countable set.

  For the other direction assume that $T$ is not transcendental and that $RM(x = x) < infinity$, then we can construct a similar tree as in the proof of @thrm-stable. Let $alpha = inf (RM(phi_n) : 2^(< omega))$, then if $RM(phi_(n)) = alpha$ then we can expand the tree starting from $phi_n$ to get arbitrarily large collections of disjoint formulas $phi_i$ that each have rank at least $alpha$, this then implies that $RM(phi_n) = alpha + 1$, and so the infimum is actually at least $alpha+1$, which is a contradiction.
]

#definition[
  ${ov(a)_i : i in I} seq mM$ is called _indiscernible_, if for any two sequences of tuples $i_1 != ... != i_n seq I$ and $j_1 != ... != j_n seq I$ we have
  $
    tp(ov(a)_i_1,...,ov(a)_i_n) = tp(ov(a)_j_1,...,ov(a)_j_n)
  $
]

#theorem[
  If $T$ is stable then every order indiscernible sequence is indiscernible.
]
#proof[
  Let $kappa$ be such that $T$ is $kappa$-stable, then assuming, aiming for a contradiction, that $(a_i : i in I)$ is order indiscernible but not indiscernible. WLOG we may assume that $I$ has a dense subset $J$ of size $<= kappa$ and that every non-empty interval has size at least $kappa$. // TODO: JUSTIFY THIS THROUGH STRETCHING.

  By assumption we have a finite sequence $1,...,n in I$ (we will write them as integer for simplicity) and a permutation $sigma$ such that
  $
    tp(a_1,...,a_n) != tp(a_sigma(1),...,a_sigma(n)),
  $
  namely for some formula $phi$ we have
  $
    sat phi(a_1,...,a_n) "and" sat not phi(a_sigma(1),...,a_sigma(n))
  $
  then by writing $sigma = tau_1 ... tau_m$ where $tau_i$ are each transpositions of consecutive integers, we notice that by considering the partial products $tau_1...tau_j$ we know that at some $j$ $phi$ flips from being true to not true and hence we can reduce this to the case of one such transposition. That is
  $
    sat phi(a_1,...,a_(i-1),a_i,a_(i+1),a_(i+2)...,a_n)
  $
  and
  $
    sat not phi(a_1,...,a_(i-1),a_(i+1),a_(i),a_(i+2)...,a_n).
  $

  Now let $A = {a_j : j in J} union {a_1,...,a_(i-1),a_(i+2),...,a_n}$, we can now show that for any $i' < i'' in (i, i+1)$ (interval inside the ordering of $I$ not in the integers) we have
  $
    tp(a_(i') quo A) != tp(a_(i'') quo A)
  $

  Let $j in J$ be such that $i' < j < i''$, then consider the formula
  $
    chi(x,y) = phi(a_1,...,a_(i-1),x,y,a_(i+2),...,a_n)
  $
  then we have by assumption $sat chi(a_i,a_(i+1))$ and $sat not chi(a_(i+1), a_i)$ so by order indiscernibility we have
  $
    sat chi(i',j),  sat not chi(i'',j)
  $
  // TODO: ADD INTUITION
]

// TODO: ADD MONSTER MODEL NOTATION.

#proposition[
  If $X$ is a compact space and $U seq X$ with $CB(U) = alpha$, then there exists $n$ such that if $U_1,...,U_k seq U$ which are disjoint with $CB(U_i) >= alpha$ then $k <= n$.
]<prop-CB_degree>
#proof[
  Directly by definition.
]
// TODO: MOVE PROPOSITION.
//


#definition[
  We call the minimal such $n$ in @prop-CB_degree the $CB$-degree of $U$.
]

#definition[
  If $phi$ is a formula over $A$ with $A seq frak(C)$. The _Morley degree_ of $phi$ is the $CB$-degree of $[phi] seq S(mM)$, where $mM$ is any $aleph_0$-saturated model containing $A$.

  We denote it $deg_mM (phi)$.
]

#proposition[
  $deg_mM (phi)$ does not depend on $mM$.
]

#proposition[
  If $phi$ has Morley degree $n$, then there exists formulas $phi_1,...,phi_n$ all with $deg(phi) = 1$ such that
  $
    [phi] = [phi_1] union ... union [phi_n]
  $
]
#proposition[
  - If $RM(phi_1) = RM(phi_2) < infinity$ and $phi_1 (mM) sect phi_2 (mM) = nothing$ then #h(1fr)
    $
      deg(phi_1 or phi_2) = deg(phi_1) + deg(phi_2)
    $
  - If $RM(phi_1) < RM(phi_2)$ then
    $
      deg(phi_1 or phi_2) = deg(phi_2)
    $
]
#proof[
  Exercise.
]

As usual we extend these definitions to types
#definition[
  If $p$ is a type then its _degree_ is defined as
  $
    deg(p) = min {deg(phi) : p proves phi and RM(phi) = RM(p) }
  $

  A type is stationary if $deg(p) = 1$.
]

= Algebraic and Definable Closure

#definition[
  We say that a formula $phi(ov(x), ov(a))$ is _algebraic_ if
  $phi(frak(C))$ is finite.

  We say a type $p$ is _algebraic_ if $p(frak(C))$ is finite.

  The _algebraic closure_ $acl(A)$ of a set $A$ is the set of tuples $ov(a)$ such that $tp(ov(a) quo A)$ is algebraic. We sometimes think of it as a subset of the model $frak(C)$.

  The _definable closure_ $dcl(A)$ of a set $A$ is the set of tuples $ov(a)$ such that $tp(ov(a) quo A)$ has a unique realization.
]

#remark[
  We do not call formulas or types with a unique realization "definable formulas" or "definable types" because those terms are already in use in model theory for something else.
]

#proposition[
  + $p$ is algebraic if and only if there is a formula implied by $p$ which is algebraic.
  + $|p(frak(C))| = 1$ if and only if there is a formula implied by $p$ such that $|phi(frak(C))| = 1$.
]<prop-algebraic_passing_to_formulas>
#proof[
  The backwards direction is immediate since the any realization of $p$ is also a realization of $phi$.

  On the other hand assume that $p$ is algebraic, then we know that the collection of formulas
  $
    { ov(x)_1 != ov(x)_2 : m != n} union union.big_(n=1)^infinity {phi(ov(x)_n) : phi in p}.
  $
  is not realizable, since that would contradict the fact that it is algebraic. Hence by compactness some finite subcollection of these formulas is also not realizable. But then we have some formulas $phi_1,...,phi_n$ which are not consistent with ${ ov(x)_1 != ov(x)_2 : m != n }$, we then have 
  $
    Phi := phi_1(ov(x)) and ... and phi_n (ov(x))
  $
  is also not consistent with ${ ov(x)_1 != ov(x)_2 : m != n }$ and so $Phi$ is formula implied by $p$ which has finitely many realizations.

  For 2 we do the exact same thing.
]

#proposition[
  If $mM elm frak(C)$ arbitrary with $phi(ov(x))$ a formula over $mM$. $phi$ is algebraic if and only if $phi(mM)$ is finite.
]
#proof[
  Forward direction is obvious.

  Assume that $mM$ has at most $n$ many realizations of $phi$, then we can write the formula
  $
    exists ov(x)_1 ov(x)_2 ... ov(x)_n forall y (and.big_(i=1)^n y!= x) => not phi(y)
  $
  and since it is not true in $mM$ it is not true in $frak(C)$, hence $frak(C)$ also has at most $n$ many realizations.
]

#proposition[
  $tp(a b quo A)$ is algebraic if and only if $tp(a quo A)$ and $tp(b quo A a)$ are algebraic.
]<prop-algebraic_decomposition>
#proof[
  Let $p = tp(a b quo A)$, $q = tp(a quo A)$, $p_a = tp(b quo A a)$.

  Assume that $p$ is algebraic, we want to show that $q$ is algebraic, we have a map $p(frak(C)) -> q(frak(C))$ defined by forgetting the second coordinate of the tuple. It is onto because if $a' in q(frak(C))$ then by homogeneity of $frak(C)$ we get that there is a $b'$ such that $a'b'$ has the same type as $a b$ and so $a'b' in p(frak(C))$ and projects onto $a'$. Hence $q(frak(C))$ is finite.

  We also see that $p_a (frak(C))$ is finite since if there were infinitely many realizations of it then the pairs $(a,b_i)$ would all be unique in $p(frak(C))$ which would contradict the fact that $p$ is algebraic.
  
  On the other hand assume that $q, p_a$ are algebraic, then by homogeneity we know that $|p_(a') (frak(C))|= |p_a (frak(C))|$ and so since
  $
    p(frak(C)) = union_(a' in q(frak(C))) {a'} times p_(a') (frak(C))
  $
  we get that $p(frak(C))$ is finite.
]

#proposition[
  + $A seq seq acl(A)$.
  + If $A subset B$ then $acl(A) seq acl(B)$.
  + $acl(acl(A)) = acl(A)$.
  + $acl(A) = display(union.big_(A_0 seq A\ A_0 "finite") acl(A_0))$.
  + $A seq dcl(A) seq acl(A)$.
  + If $A$ is a subset of $B$ then $dcl(A) seq dcl(B)$.
  + $dcl(dcl(A)) = dcl(A)$
  + $dcl(A) = display(union.big_(A_0 seq A\ A_0 "finite") dcl(A_0))$.

  Properties 1,2,3 and 5,6,7 are sometimes shortened to "$acl$/$dcl$ is a monotone idempotent operator".
]
#proof[
  All are trivial apart from 3,7.

  For 3 first let $a in acl(acl(A))$, by @prop-algebraic_passing_to_formulas we get that there is a formula $phi(ov(x), ov(b))$ with parameters $ov(b) in acl(A)$ such that $|phi(x,ov(b)) < infinity$ and so that $sat phi(a,ov(b))$.

  $tp(a quo A ov(b))$ is algebraic and $tp(ov(b) quo A)$ is algebraic so by @prop-algebraic_decomposition we get that $tp(a ov(b) quo A)$ is algebraic so by @prop-algebraic_decomposition again $tp(a quo A)$ is algebraic.
]

#example[
  Let $T = A C F_p$, for a set $A$, $(A)$ denotes the field generated by $A$, we then have.
  $
  acl(A) = "algebraic closure of" (A).
  $

  We have $a in acl(A)$ if and only if $I(a quo lr(angle.l A angle.r)) != 0$.  

  The defined closure is more interesting, it is
  $
    dcl(A) = cases((A) "if" p = 0, hat((A))^(rad) "if" p > 0)
  $
  one would expect it to always be $(A)$ but in positive characteristic we can also take $p$-th roots because of the properties of the Frobenious map. //TODO: ADD PROPERTIES
]

Often in math, a closure operator has another interesting property which we have not talked about before, called the exchange property. A familiar example of this are vector spaces, where two basis for the same subset must have the same cardinality. We now start exploring how we can extend this to our model theoretic setting.

#definition[
  A definable (over $mM$) set $D seq mM$ is _minimal_ if $D$ is infinite and every definable subset of $D$ is either finite or co-finite.
]

#definition[
  A formula $phi(x)$ is strongly minimal if $phi(mN)$ is minimal for each elementary extension $mM elm mN$.
]

#proposition[
  If $mM$ is $aleph_0$-saturated then $phi(mM)$ is minimal if and only if $phi$ is strongly minimal.
]

#definition[
  $T$ is strongly minimal if $x = x$ is strongly minimal, or equivalently all models $mM sat T$ are minimal.
]

#example[
  $A C F_p$ is strongly minimal.
]

#proposition[
  If $T$ is $aleph_0$-stable then there exists a formula $phi(x)$ over $frak(C)$ which is strongly minimal.
]
<prop-strongly_minimal_formula>
#proof[
  We know from @thrm-rank_well_defined that $RM(x = x) < infinity$ and since $x = x$ has infinitely many realizations we have $RM(x = x) > 0$, so we can find a formula $phi$ with $RM(phi) = 1$.

  We can then pick a formula $psi$ with $[psi] seq [phi]$, $RM(psi) = 1$ and $deg(psi) = 1$. One can then check that the formula $psi$ is strongly-minimal. // TODO: ADD CHECK
]

#theorem("Exchange Property")[
  Suppose that $D seq mM$ is minimal, $A seq D$, $a,b in D$.

  If $a in acl(A b) backslash acl(A)$, then $b in acl(A a)$.
]<thrm-exchange_property>
#proof[
  Since $a in acl(A b)$, there is a formula $phi(x,ov(b))$ with $ov(b) in A$ such that
  $
    mM sat phi(a,ov(b)) "and" |{ x in D : mM sat phi(x,ov(b))}| = n
  $
  for some $n in NN$.
  Let $psi(y)$ be the formula encoding
  $
    |{x in D : phi(x,y)}| = n.
  $
  Now $psi(y)$ is either finite or co-finite in $D$ by assumption of strong minimality. If $psi(D)$ is finite then $b in acl(A)$ so $a in acl(acl(A)) = acl(A)$ which contradicts our assumption.

  Hence $phi(D)$ is co-finite and so the complement is finite, we now let
  $
    E = D sect {y : phi(a,y) and psi(y)},
  $
  if $E$ is finite then $b in acl(A a)$ and so we are done, we thus assume that $E$ is co-finite.

  Assume that $D backslash E$ has $ell$ elements, let $chi(x)$ be the formula that says
  $
    |D backslash {y : phi(x,y) and psi(y)}| = ell.
  $
  If $chi(mM) sect D$ is finite then $a in acl(A)$ which is again a contradiction so $chi(mM) sect D$ is co-finite.

  Pick $n+1$ elements $a_1,...,a_(n+1)$ in $chi(mM) sect D$, we then have that
  $
    D sect sect.big_(i=1)^(n+1) {y : phi(a_i, y) and psi(y)}
  $
  is an intersection of co-finite sets in $D$ and thus is also co-finite in $D$, hence we can pick an element $b'$ in this set. Now $b'$ satisfies $psi$, which contradicts the fact that each $a_i$ is in ${x in D : phi(x,y)}$. // TODO: ADD DIAGRAM
]

We now know that $acl$ is an operator which is monotone idempotent with the exchange property, operators with these properties are called a _pregeometry_ or a _matroid_.

#definition[
  Let $D seq mM$ be minimal, a set $A seq D$ is _independent_ if for all $a in A$ we have  
  $
    a in.not acl(A backslash {a}).
  $

  If we have some other $C seq D$ then $A$ is _independent over_ $C$ if instead $a in.not acl(A union C backslash {a})$
]

#definition[
  $A$ is a basis for $Y seq D$ if $A seq Y$, $A$ is independent and $acl(A) = acl(Y)$.
]

The following is standard.
#lemma[
  Let $A,B seq D$ be independent, $A seq acl(B) = Y$.

  + If $A_0 seq A$, $B_0, B$ such that $A_0 union B_0$ is a basis for $Y$, for each $a in A backslash A_0$ there exists $b in B_0$ such that $A_0 union {a} union B_0 backslash {b}$ is a basis for $Y$.
  + $|A| <= |B|$.
]
#proof[
  Since $a in acl(A_0 union B_0)$ there is a finite subset $B'$ of $B_0$ such that $a in acl(A_0 union B')$, then we can pick a minimal such $B'$.

  Pick $b in B'$ and by applying @thrm-exchange_property we know that
  $
    b in acl(A_0 union {a} union B_0 backslash {b}).
  $
  This then gives us that $acl(A_0 union {a} union B_0 backslash {b}) supset.eq Y$.

  Now $A_0 union {a} union B_0 backslash {b}$ is independent since if $a in acl(A_0 union B_0 backslash {b})$ then $b in acl(A_0 union B_0 backslash {b})$ which contradicts the fact that $A_0 union B_0$ is a basis.

  Now for the second result we know that if $|B| >= aleph_0$ then $|acl(B)| <= |B|$ since our language is countable and so the number of formulas is countable, so we have
  $
    |A| <= |acl(B)| <= |B|.
  $
  On the other hand assume that $B$ is finite, then we start with $A_0 = nothing$, $B_0 = B$ and add elements to $A_i$ while removing from $B_i$ and keeping $A_i union B_i$ a basis, since we can keep doing this until $A_i = A$ then we must have at least $|A|$ elements in $B$ and so $|A| <= |B|$.
]

#corollary[
  If $A$ is also a basis then $|A| = |B|$.
]

#definition[
  Let $mM$ be a model with $A seq mM$, the _dimension_ of a strongly-minimal formula $phi$ over $A$ is the cardinality of any basis of $phi(mM)$ (which is well defined by the work done above).
]

#theorem[
  Suppose that $mN_1, mN_2 succ mM$ (or $mM = nothing$) are all theories of $T$, and that $phi$ is a strongly-minimal formula with parameters in $A seq mM$.
  If $a_1,... in phi(mN_1), b_1,... in phi(mN_2)$ are independent sets then //TODO: MAKE NOTATION CLEARER
  $
    tp(ov(a) quo A) = tp(ov(b) quo A)
  $
  where $ov(a),ov(b)$ are any tuples of the same length of distinct elements of $a_i,b_i$ respectively.
]<thrm-elementary_bases>
#proof[
  We induct on $n$, for $n = 1$ suppose that $mN_1 sat psi(a)$ then we want to show that $mN_2 sat psi(b)$, since $a$ is independent it cannot be algebraic so $psi(mN_1) sect phi(mN_1)$ cannot be finite.

  Then since $phi$ is strongly-minimal we have that $phi(mN_1) sect psi(mN_1)$ is co-finite in $phi(mN_1)$ and so $mN_1 sat |phi(mN_1) backslash psi(mN_1)| = m$ for some $m$. But then $mN_2 sat |phi(mN_2) backslash psi(mN_2)| = m$, so since $b$ is not algebraic we cannot have $b in phi(mN_2) backslash psi(mN_2)$ and so $b in phi(mN_2) sect psi(mN_2)$ and thus $mN_2 sat psi(b)$.
  // TODO: ADD REMARK ABOUT FINITE SET STATEMENTS AS FORMULAS.

  Now for the inductive step assume $ov(a) = a_1...a_(j+1)$ and $ov(b) = b_1...b_(k+1)$ and write $ov(a)' = a_1...a_k, ov(b)'=b_1...b_k$. By inductive hypothesis we have $tp(ov(a)' quo A) = tp(ov(b)' quo A)$ and so suppose that $mN_1 sat psi(a_(k+1), ov(a)')$ and we want to show that $mN_2 sat psi(b_(k+1), ov(b)')$.

  In $mN_1$ we have by the same argument that $a_(k+1)$ is not algebraic over $ov(a)'A$ and so
  $
    mN_1 sat |phi(mN_1) backslash psi(mN_1,ov(a)')| = n
  $
  hence
  $
    mN_2 sat |phi(mN_2) backslash psi(mN_2, ov(b)')| = n
  $
  and by the same argument $mN_2 sat psi(b_(n+1), ov(b))$.
]

#theorem[
  Suppose that $mN_1, mN_2 succ mM$ (or $mM = nothing$) are all theories of $T$, and that $phi$ is a strongly-minimal formula with parameters in $A seq mN_1 sect mN_2$.
  If
  $
    dim(phi(mN_1)) = dim(phi(mN_2))
  $
  then there exists a partial elementary map $f : phi(mN_1) ->> phi(mN_2)$.
]
#proof[
  First we set $f'$ to be identity on $A$, then we pick bases $(a_alpha)_(alpha in I), (b_alpha)_(alpha in I)$. Then by mapping $a_alpha |-> b_alpha$ we know that by @thrm-elementary_bases this remains a partial embedding. We now use Zorn's lemma to pick a maximal partial embedding $f$ with respect to inclusion that contains $f'$, and we want to show that the domain of $f$ is $phi(mN_1)$ and the range is $phi(mN_2)$. 

  // TODO: SIMPLIFY BASES NOTATION.
  To see this assume that we have $x in phi(mN_1) backslash dom(f)$, then we know that $x$ is algebraic over $(a_alpha)_(alpha in I)$ so we know by assignment that it is isolated. // TODO: INCLUDE PROOF
  Hence we can find $y in phi(mN_2)$ with $tp(x quo dom(f)) = tp(y quo rng(f))$, hence $g$ which extends $f$ by mapping $x$ to $y$ is also elementary which contradicts the fact that $f$ was maximal.
]
#corollary[
  If $T$ is strongly-minimal then $mN_1 tilde.equiv mN_2$ if and only if $dim(mN_1) = dim(mN_2)$.
]<cor-dimensions_implies_isomorphism>

#corollary[
  If $T$ is strongly-minimal, then $T$ is $kappa$-categorical for every $kappa >= aleph_1$.
]
#proof[
  Let $mN_1,mN_2 sat T$ with $||mN_1|| = ||mN_2|| = kappa$ and let $I_1 seq mN_1, I_2 seq mN_2$ be bases, since $L$ is countable we have
  $
    ||I_1|| = ||acl(I_1)|| = ||mN_1|| = ||mN_2| = ||acl(I_2)|| = ||I_2||
  $
  and so by @cor-dimensions_implies_isomorphism we get that $mN_1 tilde.equiv mN_2$.
]

= Prime Model Extensions
Let $A seq frak(C)$.
#definition[
  A model $mM elm frak(C)$ such that $A seq mM$ is _prime over_ $A$ if for every other model $mN$ with $A seq mN elm frak(C)$ there is an elementary embedding $mM elm mN$ which restricts to the identity on $A$.
]
<def-prime_over_set>

#theorem[
  If $T$ is $aleph_0$-stable then for every $A seq frak(C)$ there exists an $mM elm frak(C)$ which is prime over $A$.
]
#proof[
  The strategy is quite simple, pick $delta$ with $delta <= ||frak(C)||$ and we construct $(a_alpha : alpha < delta)$ such that if there exists $a in frak(C)$ such that $tp(a quo A union a_(< alpha))$ is isolated and who's type is not realized in $A union (a_alpha : alpha < delta)$ then $a_alpha = a$ for one such $a$. At some point we stop and are left with $mM = A union {a_alpha : alpha < delta}$. Now we need to show is that $mM$ is an elementary sub model and that it is prime over $A$.

  Let us denote $A_alpha = A union {a_alpha : alpha < beta}$, then we will use @thrm-tv_test to prove $mM$ is an elementary submodel, assume that in $frak(C)$ we have
  $
    frak(C) sat exists x phi(x, ov(a))
  $
  for $ov(a) in mM$, since $mM = union.big_(alpha < delta) A_alpha$ we may assume that $ov(a) in A_alpha$ for some $alpha$. By $aleph_0$-stability we know that isolated types in $S(A_alpha)$ are dense, assume otherwise, then there is a neighborhood in $S(A_alpha)$ without any isolated points. Then since we have no isolated points and the space is Hausdorff we can repeatedly split it in half to construct a tree of formulas $phi_sigma, sigma in 2^(< omega)$ such that $phi_(sigma 0), phi_(sigma 1)$ are inconsistent and both imply $phi_sigma$, this tree contradicts $aleph_0$-stability as can be seen in the proof of @thrm-stable.

  Now since the isolated types in $S(A_alpha)$ are dense, we choose an isolated type $p in S(A_alpha)$ such that $phi(x, ov(a)) in p$, so let $psi$ be the formula isolating $p$, since $psi$ has finitely many parameters and $frak(C)$ is $aleph_0$ saturated we can find an element realizing $psi$ and hence $p$. Let $a in frak(C)$ with $a sat p$ then it will be added at some point to $A_alpha$ and hence will be in $mM$.

  Now to show $mM$ is prime we use transfinite induction on $alpha$, the base case and limit case as trivial, then for the successor step we use the fact that if $tp(a quo B union A)$ is isolated and for any $b in B$ $tp(b quo A)$ is isolated then $tp(a quo A)$ is isolated. Now from this we get that $mM$ is prime over $A$ since we can inductively construct an embedding $mM -> mN$.
]
#remark[
  This is a stronger condition than the isolated types being dense, which is what is needed to guarantee a prime model if $A$ is empty.
]

#corollary[
  If $T$ is $aleph_0$-stable then $forall A seq frak(C)$ there exists $mM$ prime over $A$ such that for all elements $a in mM$ we have $tp(a quo A)$ is isolated.
]

= Categoricity theorem
We now start working towards Categoricity Theorem, the main result of this course.

#definition[
  Let $kappa > lambda >= aleph_0$, an $L$-theory $T$ is said to have a _$(kappa, lambda)$-model_ if there exists a model $mM sat T$ with $|mM| = kappa$ and an $L(mM)$-formula, $phi(x)$ such that $|phi(mM)| = lambda$.
]

#definition[
  Let $mM elm mN sat T$. Then $(mN, mM)$ is a _Vaughtian pair_ if there is an $L$-formula $phi(x)$ such that $phi(mM) = phi(mN)$ are both infinite.
]

#lemma[
  If $T$ has a $(kappa, lambda)$-model, then it has a Vaughtian pair $(mN, mM)$ such that $|mN| < kappa$ and $|mM| = lambda$.
]
#proof[
  We use @thrm-downwards, we let $mN sat T$ of size $kappa$ and $phi$ be such that $|phi(mN)| = lambda$, we can then find $mM$ such that $phi(mN) seq mM$ and $mM elm mN$. Then we have $phi(mM) = phi(mN)$ by elementarity.
]

#definition[
  Suppose $cal(U)$ is a unary predicate. Let $phi(x)$ be an $L$-formula. The _relativization_ of $phi$ to $cal(U)$, denoted $phi^cal(U)$, is defined as follows:
  $
    phi^cal(U) (ov(x)) := cal(U)(x_1) and ... and cal(U)(x_n) and phi(ov(x))
  $
  for $phi$ atomic, and
  $
    phi^cal(U) (ov(x)) := exists y (y and psi^cal(U) (y,z))
  $
]
#proposition[
  If $mN$ is an $L$-model with an added unary predicate $cal(U)$, then $cal(U)(mN)$ induced an elementary $L$-submodel if and only if for any tuple $ov(a) in mM$ and any $L$-formula $phi$ we have
  $
    mM sat phi(ov(a)) <=> mN^(L') sat phi^cal(U)(ov(a)).
  $
]
<prop-relativization>
#proof[
  Exercise, prove by induction.
]

If $(mN_i, mM_i) sat T$ are Vaughtian pairs we write $(mN_1, mM_1) elm (mN_2, mN_2)$ to mean that they have the same $L$-formula in their definition, that $mN_1 elm mN_2, mM_1 elm mM_2$, and that $phi(mN_1) = phi(mN_2), phi(mM_1) = phi(mM_2)$.

#lemma[
  If $T$ has a Vaughtian pair $(mN,mM)$, then it also has a Vaughtian pair $(mN_0, mM_0)$ with $||mN_0|| = ||mM_0|| = aleph_0$.
]
#proof[
  Set $L' = L cal {cal(U)}$ and interpret $mN$ as an $L'$ model by setting $cal(U)(x) <=> x in mM$, then consider for any $L$-formula $phi$ the $L$-sentence
  $
    sigma_phi := forall ov(z) ((and.big_(i <= n) cal(U)(x_i) and phi(ov(x))) -> phi^cal(U) (ov(x)))
  $
  since $mM elm mN$ then we have for any tuple $ov(a) in mN$
  $
    mN sat and.big_(i <= n) cal(U)(a_i) and phi(ov(a)) &<=> (mN sat phi(ov(a))) and ov(a) in mM => mM sat phi(ov(a)) \ &=> mN sat phi^cal(U) (ov(a))
  $
  and so $mN sat sigma_phi$.

  Now we use @thrm-downwards to construct a countable $L'$-model $mN_0$ with $mN_0 elm mN$, then in $mN_0$ we also have $mN_0 sat sigma_phi$ for all $phi$. Then $cal(U)(mN_0)$ is exactly an elementary submodel exactly by @prop-relativization, so we will define $mM_0 := cal(U)(mN_0)$. To check that $(mN_0, mM_0)$ is a Vaughtian pair we apply @prop-relativization specifically with $phi$ being the formula that defines the infinite subset shared between $mM$ and $mN$. All its properties can be encoded as $L'$-sentences so are shared for $mN_0$.
]

#lemma[
  Suppose that $mM elm mN sat T$, then there is a pair $mM_0 elm mN_0$ such that $(mN,mM) succ (mN_0, mM_0)$ and such that $mM_0,mN_0$ are both countable, homogeneous, and realize the same types in $S_n (T)$.
]
<lem-model_pair_embedding>
// TODO: FIX REFERENCE UNDERLINING
#proof[
  Fix an $L$-formula $phi$ and set $L' = L union { cal(U) }$.

  #claim[
    If $ov(a) in mM_0$, and $p in S_n (ov(a))$ is realized in $mN_0$, then there exists countable extensions $(mN', mM') succ (mM_0, mN_0)$ such that $p$ is realized in $mM'$.
  ]
  #proof[
    Let $L'' = L'(mN_0)$, $c$ a new constant, and let $T:= Th_(L'') (mN_0, mM_0) union {phi^cal(U) (c, ov(a) : phi in p}$. $T$ is finitely satisfiable since for any formulas $phi_i$ we have that since $p$ is realized in $mN_0$
    $
      mN_0 sat exists ov(x) and.big_i phi_i (ov(x))
    $
    and so by elementarity so does $mN_0$.

    Hence let $mN' sat T$ and set $mM' = cal(U)(mN')$.
  ]

  #claim[
    If $ov(b) in mN_0$, $p in S_n (ov(b))$, then there exists two countable models $(mN'', mM'') succ (mN_0, mM_0)$ such that $p$ is realized in $mN''$.
  ]
  #proof[
    Almost exactly the same.
  ]

  With these two claims we can now construct what we want, we will build sequences of countable models $mM_i, mN_i$ such that $(mN_(i+1), mM_(i+1)) succ (mN_i, mM_i)$ and
  - $i = 3i$: Any type $p in S_n (nothing)$ that is realized in $mN_i$ is realized in $mM_(i+1)$. We use the first claim for this.
  - $i = 3i + 1$: If $ov(a),ov(b),ov(c) in mN_i$ are such that $tp(ov(a)) = tp(ov(c))$ then there exists a $d in mN_(i+1)$ such that $tp(ov(a)ov(c)) = tp(ov(b)ov(d))$. We use claim 2 for this.
  - $i = 3i + 2$: If $ov(a),ov(b),ov(c) in mM_i$ are such that $tp(ov(a)) = tp(ov(c))$ then there exists a $d in mM_(i+1)$ such that $tp(ov(a)ov(c)) = tp(ov(b)ov(d))$. We use claim 1 for this.

  Then it is easy to check that $mN := union.big_i mN_i$ and $mM := union.big_i mM$ work.
]

#theorem("Vaught's Two Cardinal Theorem")[
  Let $T$ be an $L$-theory. The following are equivalent:
  + There exist cardinals $kappa > lambda >= aleph_0$ such that $T$ has a $(kappa, lambda)$-model.
  + $T$ has a Vaughtian pair.
  + $T$ has an $(aleph_1, aleph_0)$-model.
]
<thrm-vaught_two_cardinal>
#proof[
  We already proved $(1) => (2)$, $(3) => (1)$ is immediate, so we just need to show $(2) => (3)$. Assume then, that $T$ has a Vaughtian pair $(mN,mM)$ with $mM,mN$ countable.

  We now construct a sequence of models, $mM_alpha$ such that $(mM_(i+1), mM_(i)) equiv (mM_1, mM_(0))$, we start with $mM_0 = mM$ and $mM_1 = mN$, we do the successor step using @lem-model_pair_embedding and in limit steps we just take unions. We then set $mN' := union.big_(i < alpha) mN_i$, this is model of size $aleph_1$ but we still have that $(mN', mM)$ is a Vaughtian pair so since we have a formula $phi$ given to use by the pair, we have that $phi(mN') seq mM$ and thus $|phi(mN')| = aleph_0$ and so this $mN'$ is a $(aleph_1,aleph_0)$ model.
]

#lemma[
  Suppose $T$ is $aleph_0$-stable, $mM sat T$, $||mM|| >= aleph_1$. There exists $mN$ with $mM elm mN$ such that $mN$ and $mM$ realize the same types over countable subsets of $mM$.
]
#proof[
  We start with a claim that finds an 'unsplittable' formula.
  #claim[
    There exists an $L(mM)$-formula $phi(x)$ such that $|phi(mM)| >= aleph_1$ and for every formula $psi(x)$ in $L(mM)$ we have $|phi and psi (mM)| <= aleph_0$ or $|phi and (not psi) (mM)| <= aleph_0$.
  ]
  #proof[
    Suppose such a formula does not exist, we can then construct a tree of formulas $phi_sigma$ for $sigma in 2^(<omega)$ such that $|phi_sigma (mM)| >= aleph_1$, $phi_(sigma^0), phi_(sigma^1)$ are inconsistent and both imply $phi_sigma$.

    If $A$ is the set of parameters of $phi_sigma$'s then $|S_1 (A)| >= 2^(aleph_0)$, which contradicts $aleph_0$ stability.
  ]
  Let $phi$ be as in the claim above, we define the type. // TODO: DOUBLE CHECK SYNTAX
  $
    p = { psi(x) : psi "is an" L(mM) "formula with" |psi and phi(mM)| >= aleph_1 }.
  $
  Then $p$ is a complete type in $S(mM)$ due to the defining property of $phi$, then let $mM' succ mM$ be the extension that realizes $p$, and set $c$ to be a witness.

  We now take $mN$ to be the prime model over $mM union {c}$ (@def-prime_over_set), then every $b in mN$ has isolated type over $mM union {c}$. Clearly $mN$ contains $mM$ and thus all the types of $mM$, so it is enough to show that $mM$ contains all the types of $mN$. Let $Gamma(w)$ be a countable type over $mM$ that is realized in $mN$, we show that is also realized in $mM$. Let $b sat Gamma$, then $tp(b quo mM c)$ is isolated by some formula $theta(w, c)$. 
  // TODO: FIX SPECIFICITY OF TYPES

  Now we know, since $c$ realizes $p$ and since $exists w theta(omega, c)$ is true then $exists w theta(omega, x) in p$. We also know that  
  $
    mN sat forall w (theta(omega, c) -> gamma(w))
  $
  for all formulas $gamma in Gamma$, by definition of isolated type. We then choose to look at the set
  $
    Delta = {exists w theta(w, x)} union {forall w (theta(w, x) -> gamma(w)) : gamma in Gamma}
  $
  this set is countable and if it has a realization in $mM$, say by $c'$, then if $b'$ is the witness of $exists theta(w, c')$ in $mM$ then it satisfies the type $Gamma$.

  #claim[
    $Delta$ has a realization in $mM$.
  ]
  #proof[
    For each $delta in Delta$ we have that
    $
      delta and phi(mM) "is co-countable in " phi(mM)
    $
    so
    $
      and.big_(delta in Delta) delta and phi(mM) "is non empty". 
    $
  ]
]

#proposition[
  Let $T$ be $kappa$-categorical for some $kappa >= aleph_1$, then $T$ is $aleph_0$-stable.
]
#proof[
  If $T$ is not $aleph_0$ stable, then it has a model $||mM|| = kappa$, with a countable subset $A$ such that $mM$ realizes uncountably many types over $A$. Let $T^s$ be the Skolemization of $T$ and $(I, <)$ an ordered set order isomorphic to $kappa$. Let $mN$ be an EM-Model (@def-E_M_model) generated by an order-indiscernible sequence modeled after $(I,<)$.

  For every $A seq mN$, $mN$ realizes at most $|A| + aleph_0$ types over $A$ so $mM tilde.equiv.not mN$ which contradicts categoricity.
]

#proposition[
  Let $kappa$ be uncountable and $T$ a complete theory, there exists $mM sat T$ with $||mM|| = kappa$ and any $L(mM)$-definable subset of $mM$ is either finite or has size $kappa$.
]<prop-unsplittable_model>
#proof[
  Exercise, use compactness.
]

#corollary[
  If $T$ is $kappa$-categorical with $kappa >= aleph_1$ then $T$ has no Vaughtian pair.
]
#proof[
  Let $mM$ be as in @prop-unsplittable_model, let $mN$ be the $(kappa, aleph_0)$-model $mN$ that we proved exists in @thrm-vaught_two_cardinal. // TODO: ADD REFERENCE TO THEOREM.
  Clearly $mM tilde.equiv.not mN$ which contradicts categoricity.
]

Before we jump into the proof let us slightly generalize @prop-strongly_minimal_formula.
#lemma[
  Let $T$ be an $aleph_0$-stable theory, $mM sat T$, there exists an $L(mM)$-formula which is minimal in $mM$.
]
#proof[
  We repeat the same tree trick we keep using, if such a formula does not exist we can start with $phi_nothing = (x = x)$ and keep splitting into two 'large' parts to generate a tree of formulas $phi_sigma, sigma in 2^(<omega)$. Let $A$ be the number of parameters of each formula $phi_sigma$, then $|S_1 (A)| >= 2^(aleph_0)$.
]

Since minimality seems weak one might question the usefulness of this lemma, but that worry should disappear given the next lemma.
#lemma[
  Suppose $T$ has no Vaughtian pair, let $mM$ be a model of $T$, and $phi(x, ov(y))$ be an $L$-formula.
  There is some number $n$ such that for all $ov(a) in mM$,
  $
    |phi(mM,ov(a))| > n => phi(mM, ov(a)) "infinite"
  $
]<lem-infinity_bound>
#proof[
  Suppose not, then for each $n in NN$ we have some tuple $ov(a)_n$ such that $phi(mM, ov(a)_n)$ is finite of size at least $n$. // TODO: GET RID OF DANGLING INEQUALITIES.
  Let $cal(U)$ be a unary predicate, $L' = L union {cal(U)}$, let $p(ov(y))$ be the $L'$-type consisting of the formulas
  + $cal(U)(mM)$ defined a proper elementary submodel, this is done by adding $phi^cal(U)$ for every $phi in Th(mM)$.
  + $cal(U)(y_1) and ... and cal(U)(y_k)$.
  + For each $n$ the formulas $|phi(mM, ov(y))| > n$.
  + $forall x (phi(x, ov(y) -> cal(U)(x)))$.
  #claim[
    $p$ is consistent.
  ]
  #proof[
    We can, by compactness, only show that $p'$ is consistent where we picked only finitely many formulas from (3) and keep the rest the same. To that end let $mN$ be an arbitrary proper supermodel with $mM elm mN$. Interpret $cal(U)$ as $mM$ and $ov(y)$ as $ov(a)_n$ where $n$ is the largest that we picked in (3). 

    Then $phi(mM, ov(a)_n)$ is finite implies that $phi(mM, ov(a)_n) = phi(mN, ov(a)_n)$ and so $p'$ is realized.
  ]
  A realization of $p$ is a Vaughtian pair, which is our contradiction.
]

#corollary[
  If $T$ has no Vaughtian pair, $mM$ is a model of $T$ and $phi$ is a minimal $L(mM)$-formula, then it is also strongly minimal.
]
<cor-minimal_implies_strong>
#proof[
  Suppose that $mN succ mM$ and $phi$ is not minimal in $mN$. Let $psi(x, y)$, $ov(a) in mN$ be such that
  $
    phi and psi (x, ov(a)) quad phi and not psi (x, ov(a))
  $
  are both infinite. Let $n$ be as in @lem-infinity_bound for both $phi and psi, phi and not psi$ (take max).

  Then $mN$ satisfies
  $
    exists ov(y) (|phi and psi(x, ov(y))| > n) and (|phi and not psi(x, ov(a))| > n),
  $
  so let $ov(a)' in mM$ be such that $phi and psi (mM, ov(a)')$ and $phi and not psi (mM, ov(a'))$ are both infinite. This contradicts the fact that $phi$ is minimal in $mM$. 
]

We finally have enough tools to prove the main theorem.
#theorem("Morley")[
  The following are equivalent.
  + $T$ is categorical in some uncountable cardinal $kappa$.
  + $T$ is categorical in all uncountable cardinals.
]
#proof[
  $(2) => (1)$ is trivial. Assume then that $T$ is $gamma$-categorical for some uncountable cardinal $gamma$, then it is $aleph_0$-stable and has no Vaughtian pair. Let $kappa$ be some arbitrary cardinal, Let $mM_0$ be a prime model of $T$, this is possible to find because the isolated types are dense in $mM$ (because $S(nothing)$ is countable). Let $mM,mN sat T$ with $||mM|| = ||mN|| = kappa$, then since $mM_0$ is prime $mM_0 elm mM$ and $mM_0 elm mM$.

  There exists a minimal $L(mM_0)$-formula $phi$, by @cor-minimal_implies_strong we get that $phi$ is also minimal in $mM$ and in $mN$.
  Then $|phi(mM)| = |phi(mN)| = kappa$ because we have no Vaughtian pairs. We then have $dim(phi(mM)) = dim(phi(mN))$.

  Let $I$ be a basis for $phi(mM)$, and $J$ be a basis for $phi(mN)$, take any bijection $f : I -> J$. This map extends to elementary maps $f' : phi(mM) -> phi(mN)$. Now take $mM' succ mM$ prime over $phi(mM)$, since every element of $mM'$ realizes an isolated type over $phi(mM)$ then we can extend $f'$ to $f'': mM' -> rng(f'')$.

  But since we have no Vaughtian pair we know that $mM' = mM$ and $rng(f'') = mN$ and so $f'' : mM -> mN$ is an isomorphism and so we are done.
]

This subject, of course, goes a lot deeper than this theorem. Here is a selection of results for the interested reader to look into.
#theorem("Balduin-Lachlan")[
  The following are equivalent.
  + $T$ is uncountably categorical.
  + $T$ is $aleph_0$-stable and has no Vaughtian pairs.
]

#theorem("Balduin-Lachlan")[
  If $T$ is $aleph_1$-categorical, not $aleph_0$-categorical, then it has $aleph_0$ countably many models of size $aleph_0$.
]
#pagebreak()
#set heading(numbering: "A.1", supplement: [Appendix])
#show heading: it => {
  if it.level == 1 and it.numbering != none {
    [#it.supplement #counter(heading).display():]
  } else if it.numbering != none {
    [#counter(heading).display().]
  }

  h(0.3em)
  it.body
  parbreak()
}
#counter(heading).update(0)
#let definition = definition.with(numbering: "A.1")
#let proposition = proposition.with(numbering: "A.1")
#let theorem = theorem.with(numbering: "A.1")

= Transfinite induction and Cardinal Arithmetic
In model theory we very often want to count things, but natural numbers are often not enough since we deal with truly massive sets, this is where ordinals, which extend the counting of natural numbers, are very useful.

#definition[
  An _ordinal_ is a set $alpha$ such that the relation $in$ is a well ordering on $alpha$, that is a linear order where every subset $S seq alpha$ has a minimal element.

  Equivalently $alpha$ has no infinite strictly decreasing sequence with respect to $in$.
]

We will not go into the details of ordinal theory, that is the job of Set Theory class. We will, however, list their key properties here.
#proposition[
  Assuming $ZFC$,
  + Every well ordered set is isomorphic to some ordinal.
  + Any collection (not necessarily a set) of ordinals has a minimal ordinal with respect to $in$.
  + Every ordinal takes one of 3 forms
    - Zero/Empty Set: ${}$.
    - Successor ordinal: $suc(alpha) := alpha union {alpha}$ for some ordinal $alpha$, sometimes denoted $alpha^+$ or $alpha + 1$.
    - Limit ordinal: $union.big_(gamma in X) gamma$ for some set $X$ of ordinals.
]

Ordinals are important because of their ability to extend induction.
#theorem[
  Let $p(alpha)$ be a boolean property defined on all ordinals $alpha$. If
  - $p({})$ is true.
  - $p(alpha) => p(suc(alpha))$.
  - $(forall gamma in X, p(gamma)) => p(union.big_(gamma in X) gamma)$.
  Then $p$ is true for all ordinals.
]

We can also use induction for constructions.
#theorem[
  Let $x_alpha$ be variables indexed by ordinals $alpha$ and $p_beta (x_(<=beta))$ be a property depending on all variables $x_alpha$ with $alpha <= beta$. If the following conditions hold
  - There is an object $a_0$ such that $p_0 (a_0)$ is true.
  - For any objects $a_alpha$ for $alpha <= beta$ such that $p_beta (x_(<= beta))$ is true there is an object $a_(beta + 1)$ such that $p_(beta + 1) (x_(<= beta + 1))$ is true.
  - For any limit ordinal $gamma$ and any objects $a_alpha$ for $alpha < gamma$ such that $p_beta (x_(<= beta))$ is true for all $beta < gamma$ there is an object $a_(gamma)$ such that we also have $p_gamma (x_(<= gamma))$.
  Then there is an assignment of $x_alpha$ such that $p_beta$ is true for all ordinals $beta$.
]

Here is an example of this
#definition[
  For any ordinal $alpha$, we define inductively
  + $alpha + 0 = alpha$.
  + $alpha + suc(beta) = suc(alpha + beta)$.
  + If $gamma$ is a limit ordinal then $alpha + gamma = union.big_(beta < gamma) (alpha + beta)$.
]
We can similarly define multiplication and exponentiation of ordinals.

Now ordinals generalize counting, but it turns out that we can use them to get a generalized notion of size.

#definition[
  Let $alpha,beta$ be two sets, we say that $alpha$ and $beta$ are _equal in cardinality_ and write $|alpha| = |beta|$ to mean that there is a bijection between $alpha$ and $beta$.
]

Now one can easily check that this is an equivalence relation when restricted to ordinals, and it thus partitions ordinals into equivalence classes.
#definition[
  Let $S$ be an equivalence class of cardinality in the ordinals, as a collection of ordinals it has a minimal element $kappa$, all such minimal elements are called _cardinals_.
]

Because of axiom of choice every set $X$ has a well ordering and thus is in bijection with some ordinal $alpha$, hence is also in bijection with exactly one cardinal $kappa$. We say that $kappa$ is the _cardinality_ of $X$ and denote it as $kappa = |X|$.

We can index the cardinals in increasing order using ordinals, all the natural numbers are cardinals, $|NN|$ is the next ordinal which we denote $aleph_0$, the next ordinal after that is $aleph_1$ and so on.


For cardinals we define operations differently.
#definition[
  We define for any two cardinals $alpha, beta$
  $
    alpha + beta = |alpha union.sq beta| \
    alpha times beta = |alpha times beta| \
    alpha^beta = |{ f : beta -> alpha}|
  $
]

These operations are not as interesting as those of ordinals, which we see in the following proposition.
#proposition[
  For any two cardinals $alpha,beta$, if $alpha >= aleph_0$ or $beta >= aleph_0$ we have
  $
    alpha + beta = beta + alpha = alpha times beta = beta times alpha = max(alpha, beta)
  $
]<prop-cardinal_arithmetic>

#definition[
  The continuum hypothesis is the statement
  $
    2^(aleph_0) = aleph_1.
  $
  The generalized continuum hypothesis is the statement
  $
    2^(aleph_alpha) = aleph_(alpha + 1)
  $
  for all ordinals $alpha$.
]
It turns out that the continuum hypothesis is independent of $ZFC$.


#definition[
  For a cardinal $gamma$, $cf(gamma)$ is called the _co-finality_ of $gamma$ and is the cardinality of the shortest unbounded sequence in $gamma$.

  Equivalently, $cf(gamma)$ is the largest cardinal such that for every sequence of cardinals $kappa_alpha$ smaller than $gamma$ which has length at most $cf(gamma)$, has $union.big_(alpha < cf(gamma)) kappa_alpha <= gamma$.
]

#theorem("König's theorem")[
  For a cardinal $gamma$, $cf(2^gamma) > gamma$.
]<thrm-Konig>

