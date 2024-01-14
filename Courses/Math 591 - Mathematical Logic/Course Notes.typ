#import "../../Templates/generic.typ": generic
#import "../../Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "../../Templates/math.typ": *
#show: doc => generic(title: "Mathematical Logic Notes", name: "Jacob Reznikov", doc)
#show: doc => chapter_heading(doc)
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}
#let sat = $tack.r.double$
#let Th = math.op("Th")
#let mM = $cal(M)$
#let mN = $cal(N)$
#let bar(el) = $overline(#el)$
#let subs(a, b) = { return $attach(slash, tl: #a, br: #b)$ }


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

We have defined the symbols of $L$ but how do we speak it? We will need the following
- Logical symbols, these will consist of 
  - Connectives: $or, and, not, =>, <=>$
  - Quantifiers: $exists, forall$
- Auxiliary symbols: Parentheses, Commas
- Variables: $x,y,z,v$
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
  - If $tau = f_i (tau_1,...,tau_n)$ then $tau^mM = f_i^mM (tau_1^mM, ..., tau_n^mM) in M$
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

  An $L$-_sentence_ is an $L$-formula with no free variable.
]


#definition[
  Let $phi$ be a formula containing $x$, $phi(subs(tau, x))$ will denote the formula obtained by replacing every free occurrence of $x$ by $tau$.
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
  - If $sigma$ is of the form $exists x thin phi$ then $mM sat phi$ if there exists $a in |mM|$ with $mM sat phi(subs(underline(a),x))$. Similarly for $forall x thin phi$.
]


#definition[
  Let $mM$ be a model. The _theory_ of $mM$ is defined also
  $
  Th(mM) = { sigma "is an" L"-sentence" : mM sat sigma}
  $
  
  We say that two $L$-structures, $mM$ and $mN$, are elementary equivalent, and write $mM equiv mN$ if $Th(mM) = Th(mN)$.

  We write that $mM seq mN$ to mean that $mM$ is a substructure of $mN$, meaning that
  $ 
  |mM| seq |mN|, underline(f_i)^mM seq underline(f_i)^mN, underline(R_j)^mM = underline(R_j)^mN sect |mM|^(a_j), thin thin "and" underline(c_k)^mM = underline(c_k)^mN 
  $
  
  We write $mM equiv mN$ and say that $mM$ and $mN$ are isomorphic if there is a bijection $g$ with 
  $
  g(underline(c_k)^mM) = underline(c_k)^mN\
  (a_1,...,a_n) in underline(R_j)^mM <=>
  (f(a_1),...,f(a_n)) in underline(R_j)^mN\
  f(underline(f_i)^mM (a_1,...,a_n)) = underline(f_i)^mN (a_1,...,a_n)
  $

  We write $mM lt.curly(eq.prec) thin thin mN$ to mean $mM$ is an elementary substructure of $mN$ which is true if $|mM| seq |mN|$ and for every formula $phi(bar(x))$ and for every $bar(a) seq |mM|$ we have 
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
]

#theorem("Lowenheim-Skolem downwards Theorem")[
  Let $L$ be countable, for any $L$-structure $mM$ and every $A seq |mM|$, there exists an elementary substructure $mN lt.curly mM$with $A seq |mN|$ 
  $
    ||mN|| = |A| + |L| + aleph_0
  $
]

#proof[
  Set $kappa = |A| + |L| + aleph_0$, by transfinite induction on $kappa$ we will define a sequence $a_alpha$ for $alpha < kappa$ of elements in $mM$, where at each step $alpha$ we will try to satisfy a formula $phi_a (x) in L(A union a_(< alpha))$, we will then set $|mN| = { a_alpha : alpha < kappa }$.
]
