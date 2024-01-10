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


General ideas: Mathematical structures from a higher perspective. 

First developed by Tarski, then demonstrated use in algebra, grew to be its own field.

We will study introductory Model Theory, end with #link("https://en.wikipedia.org/wiki/Categorical_theory")[Morley's categoricity theorem].

= Basic Definitions and Concepts
== Models and Languages
#definition[
  A _model_ or _structure_ is a tuple $ cal(M) = (M, (f_i)_(i in I), (R_j)_(j in J), (c_k)_(k in K)) $
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
    L = ((underline(f)_i)_(i in I'),(underline(R)_j)_(j in J'), (underline(c)_k)_(k in K'))
  $
  where now the $f_i$ are function _symbols_ with arity $a_i' in NN$, each $R_j$ are relation _symbols_ with arity $a_j' in NN$, and $c_j$ are constant _symbols_.

  A model $cal(M)$ is an $L$-structure if 
  $
    I = I',
    J = J',
    K = K',
    a_i = a_i',
    a_j = a_j'
  $
  If $cal(M)$ is an $L$-structure then the _interpretations_ of the symbols of the language are defined as
  $
  (f_i')^cal(M) = f_i, (R_j')^cal(M) = R_j, (c_k')^(cal(M)) = c_k
  $
]

#remark[
  For a model $cal(M)$ we will sometimes denote $|cal(M)|$ to refer to the universe of a model and $||cal(M)||$ to denote the cardinality of said universe.
]

We have defined the symbols of $L$ but how do we speak it? We will need the following
- Logical symbols, these will consist of 
  - Connectives: $or, and, not, =>, <=>$
  - Quantifiers: $exists, forall$
- Auxiliary symbols: Parentheses, Commas
- Variables: $x,y,z,v$
- Equivalency Symbol: $=$

As with any language we will build up our language first with nouns and then with phrases.

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
  If $cal(M)$ is an $L$-structure and $tau$ is a constant $L$-term then the _interpretation_ of $tau$, $tau^cal(M)$, is defined equivalently
  - If $tau = c_k$ then $tau^cal(M) = c_k^cal(M)$
  - If $tau = f_i (tau_1,...,tau_n)$ then $tau^cal(M) = f_i^cal(M) (tau_1^cal(M), ..., tau_n^cal(M)) in M$
]

#example[
  $L = (+, dot, 0, 1)$ then $M = (NN, +, dot, 0, 1)$ is an $L$-structure in which the $L$-term 
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

Now this is all first order logic, but one might wonder, what makes it "first"? This comes from what things we can quantify over. In first order logic we can only quantify over elements $x in |cal(M)|$, in _second_ order logic we can quantify over subsets $S seq |cal(M)|$ like all relations for example. We can also see this as $S in cal(P)(|cal(M)|)$. Third order logic would then be quantification over $S in cal(P)(cal(P)(|cal(M)|))$, and so on.

In this course, however, we will only be looking at first order logic.

#definition[
  If $phi$ is an $L$-formula then in the formulas
  $ phi' = forall x thin phi "or" phi' = exists x thin phi $
  we say that all occurrences of $x$ are _bound_ in $phi'$, and we say that $phi$ is the _range_ of $forall x$ or $exists x$ respectively.

  An occurrence of a variable $x$ in a formula $phi$ is _free_ if it is not bound in $phi$. 

  An $L$-_sentence_ is an $L$-formula with no free variable.
]

We will use the notation $cal(M) sat sigma$ to mean that sentence $sigma$ is true in the model $cal(M)$.

#definition[
  Let $phi$ be a formula containing $x$, $phi(tau/x)$ will denote the formula obtained by replacing every free occurrence of $x$ by $tau$.
]

Now one would expect that substitution should never change the meaning of a logical statement, but in fact, this is not quite right. 
Consider the case $phi = forall y (y=x)$, the substitution $phi(y/x)$ is changes the meaning of the statement from "all $y$ are equal to $x$" to "all $y$ are equal to themselves". We want to avoid this outcome, which we can formalize as follows.
#definition[
  A substitution $phi(tau/x)$ is called _correct_ if no free variable of $tau$ becomes bound in $phi(tau/x)$
]

#definition[
  If $A seq |cal(M)|$ and $cal(M)$ is an $L$-structure then $L(A)$ is the language 
  $ L union {a : a in A} $
]



