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
Let $mM$ be a countable ultrahomogeneous structure. Show that $Age(mM)$ has the amalgamation property.
== Solution
Assume we have the following diagram in $Age(mM)$
#align(center)[
  #commutative-diagram(
    node((0, 0), $C$),
    node((0, 1), $A$),
    node((1, 0), $B$),
    arr($C$, $A$, $f_1$),
    arr($C$, $B$, $f_2$),
  )
]
then both $A$ and $B$ are submodels of $mM$ so let $g_1, g_2$ be their respective embeddings. Now consider $C_1 = g_1 compose f_1 (C)$ and $C_2 = g_2 compose f_2 (C)$, both are finitely generated submodels of $mM$ isomorphic to each other, and thus by ultrahomogeneity we get a map $h : mM -> mM$ with $h compose g_1 compose f_1 = g_2 compose f_2$.

Now consider $A' = h compose g_1 (A)$ and $B' = g_2 (A)$, we have that $D = ip(A',B')$ is finitely generated and thus is in $Age(mM)$. We now have the diagram
#align(center)[
  #commutative-diagram(
    node((0, 0), $C$),
    node((0, 1), $A$),
    node((1, 0), $B$),
    node((1, 1), $D$),
    arr($C$, $A$, $f_1$),
    arr($C$, $B$, $f_2$),
    arr($A$, $D$, $h compose g_1$),
    arr($B$, $D$, $g_2$)
  )
]
By construction this diagram commutes and so we have the amalgamation property.

= Question
<question-2>
== Statement
Show that a theory $T$ has a countable saturated model if and only if all $S_n (T)$ are countable.
== Solution
If $T$ has such a model $mM$, then all types are in the model, so we have that a surjective map
$
  mM^n -> S_n (T)
$
hence since $||mM||^n = aleph_0$ we get $S_n (T)$ is countable.

On the other hand assume each $S_n (T)$ is countable, then we will construct saturated countable model. First we need to show that we have $|S_n (A)| <= aleph_0$.
To see this, let $p$ be a type in $S_n (A)$ with $A$ finite, enumerate $A$ as $a_1,...,a_m$ and note that $ov(b)$ realizing $p$ means by definition that
$
  mM sat phi(ov(b), a_1,...,a_m), quad forall phi(ov(x),a_1,...,a_m) in p.
$
Now for each formula $phi$ we will replace all $a_i$ with variables $y_i$ and call that modified formula $phi'$, then we immediately get that
$
  mM sat phi(ov(b), a_1,...,a_m) <=> mM sat phi'(ov(b), ov(a))
$
and so
$
  ov(b) "realizes" p <=> (ov(b),ov(a)) "realizes" p'
$
where $p'$ contains $phi'$ for each $phi in p$.

Hence each complete type in $S_n (A)$ is equivalent to a complete type in $S_(n + m) (nothing)$ so we have $|S_n (A)| <= |S_(n + m) (nothing)| <= aleph_0$.

In #link("https://notes.axiomofchoice.dev/Mathematical%20Logic.pdf?time_stamp=1710726223#%5B%7B%22num%22%3A26%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C56.693%2C468.53165%2C0%5D")[class (Theorem 1.5.9)] we showed that we can construct a model of $T$ that is $aleph_0$ saturated, it is enough then to show that its cardinality is also $aleph_0$.
We know that $|S_n (A)| <= aleph_0$ and so as in the proof we have that for each finite subset we add at most $aleph_0$ elements and we have $aleph_0$ finite subsets so our cardinality of our model is
$
  sum_(n in NN) aleph_0 = aleph_0
$
and so our model is countable and saturated.

= Question
<question-3>
== Statement
Show that a theory $T$ has countably many countable models up to isomorphism, then all $S_n (T)$ are countable.
== Solution
Let $C$ be the set of equivalence classes of models of $T$ with underlying set $NN$ up to isomorphism. Assume that $C$ is countable, then we have for each $mM in C$ the set of types in $S_n (T)$ realized in $mM$ is countable. So since every type is realized in some countable model the set of types is the union of the types realized in elements of $C$ so is a countable union of countable sets and thus is countable.

= Question
<question-4>
== Statement
Show that if a complete theory $T$ has countably many countable models up to isomorphism, then it has both a prime and a countable saturated model.
== Solution
By applying @question-3 we get that $S_n (T)$ are countable for every $n$, then by applying @question-2 we get that $T$ has a countable saturated model. It is thus enough to show that it has a prime model.

To see this note that since each $S_n (T)$ is countable the collection of non-isolated types is also countable, hence by omitting types theorem we can omit all non-isolated types, which by Assignment 3 gives us a prime model.

= Question
== Statement
Show that a complete theory cannot have exactly 2 countable models up to isomorphism.
== Solution
We aim for a contradiction to assume that such a theory $T$ exists. Then since it is not $aleph_0$-categorical it must have a non-isolated type $p$, and some $S_n (T)$ is not finite. Since a prime model cannot contain this type and a countable saturated model must contain this type, by @question-4 we get that $T$ has a prime model $mM_0$ and a countable saturated model $mM_1$ which are not isomorphic. By assumption these are the only countable models of $mM$.

Now let $ov(a)$ realize $p$ in $mM_1$, then consider the theory $T' = Th(mM_1, ov(a))$. Note that each type of $S_n (T')$ is just a type in $S_n^T (ov(a))$ and thus by the reasoning in @question-2 we get that these are equivalent to types in $S_n (T)$ and vice versa. Hence $S_n (T')$ is countable for each $n$.

Now by @question-4 we get that $T'$ has a prime model, which we will name $mM_2$, since $mM_2$ realizes $p$ it cannot be isomorphic to $mM_0$, and so since $mM sat T$ it is enough to show that $mM_2$ is not isomorphic to $mM_1$ to get a contradiction.

To see that this is indeed the case note that since $S_n (T)$ is not finite for some $n$ then $S_n (T')$ is also not finite and so $T'$ has a non-isolated type $q$ which cannot be in $mM_2$. But $q$ must be realized in $mM_1$ since it is countably saturated over $T'$ as well and so $mM_2$ and $mM_1$ cannot be isomorphic. This contradicts the fact that $T$ has 2 models.

= Question
== Statement
Find a complete theory with exactly 3 countable models up to isomorphism.
== Solution
Consider $T = Th(QQ,<=,0,1,2,...)$.

Let $mM$ be a model of $T$ and let $a_n$ be the interpretations of $n$ for all $n in NN$. Consider the subset $A seq mM$ defined by
$
  A := {
    x in mM : x >= a_n, med forall n in NN
  }
$
We have 3 options for the order-theoretic properties of $A$,
+ $A$ is empty.
+ $A$ is non-empty and does not have a minimal element.
+ $A$ is non-empty and does have a minimal element.
Note that these options are invariant under isomorphisms, so two models attaining different options cannot be isomorphic.
We will show that these exactly describe the 3 models of $T$ up to isomorphism.

Since all models of $T$ are also models of $D L O_0$ we can isomorphically map them to $QQ$, then the images of $a_n$ will form an increasing sequence in $QQ$, and for the rest of this proof we will identify them with said images.

Now first let us construct 3 models attaining the 3 options we have above, we consider the 3 sequences in $QQ$
+ Model $mM_1$ with $a_n = n$.
+ Model $mM_2$ with $a_n = 1 - 1/n$.
+ Model $mM_3$ with $a_n = (1 + 1/n)^n$.
Model $mM_1$ has $A$ being empty, since the sequence is unbounded. Model $mM_2$ has $A$ having the minimal element $1$ since the sequence has a limit point $1 in QQ$. Model $mM_3$ has $A$ having no minimal element since the limit point $e$ is not in $QQ$.

Since they attain different options regarding the properties of $A$ they are all non-isomorphic. It is thus left to show that any model of $T$ is isomorphic to one of these $3$.

Let $mM$ be a model of $T$ which we want to map isomorphically to one $mM_i$, we have to map the increasing sequences to each other so we can restrict out attention to $mM backslash { a_n : n in NN }$.
Now we can split this set into subsets as follows, we define
- $S_0 := { x in mM : x <= a_0 }$.
- $S_i := { x in mM : a_(i - 1) <= x <= a_i }$ for $i >= 0$.
Then we clearly have that $mM backslash { a_n : n in NN } = A union.big_(n in NN) S_n$. Now each $S_n$ is itself a model of $D L O_0$ which one can easily check.

Now assume that $mM$ has $A$ be empty, then we want to map it isomorphically to $mM_1$, we do the same splitting $mM_1 backslash { a_n : n in NN} = union.big_(n in NN) S'_n$. Since each $S'_n$ is also a model of $D L O_0$ we can isomorphically map $S_n$ to $S'_n$ and get a complete isomorphism $mM$ to $mM_1$.

Next assume that $mM$ has $A$ be non-empty with a minimal element $x$, then we want to map it isomorphically to $mM_2$. We again map the sequences to each other and write $mM backslash { a_n : n in NN } = A union.big_(n in NN) S_n$ as well as $mM_2 backslash { a_n : n in NN } = A' union.big_(n in NN) S'_n$.
Notice then that once again each $S_n$ and $S'_n$ are models of $D L O_0$ and thus isomorphic, so it is enough to check that $A$ is isomorphic to $A'$. To see this note that
$
  A backslash {x} = {y in mM : y >= x}
$
and so $A backslash {x}$ is a model of $D L O_0$. This is also true for $A' backslash {1}$. Thus we can just map $x -> 1$ and then $A backslash {x}$ is isomorphic to $A' backslash {1}$ and so we are done.

Finally for the final case assume that $mM$ has $A$ be non-empty without a minimal element, then one can easily check that $A$ is a model of $D L O_0$, we can thus do the exact same construction as above but for $mM_3$ and map each $S_n$ to $S'_n$ and $A$ to $A'$.

This shows that each model of $T$ is isomorphic to $mM_1,mM_2,mM_3$ which are all non-isomorphic so there are exactly 3 models up to isomorphism of $T$.

= Question
== Statement
Suppose that $(ov(a)_i : i in I)$ is an infinite order-indiscernible sequence in a model of a theory $T$. Show that for any linear order $J$ there is an order-indiscernible $(ov(b)_j : j in J)$ in a model of $T$ such that for any $i_1 < ... < i_n$ and any $j_1 < ... < j_n$ we have
$
  tp(ov(a)_i_1,...,ov(a)_i_n) = tp(ov(b)_i_1,...,ov(b)_i_n).
$
== Solution
Let $mM$ be the model containing the sequence $(ov(a)_i : i in I)$, and consider adding the constants $(ov(c)_j : j in J)$ to our language and considering the theory
$
  T' = T union { phi(ov(c)_j_1,...,ov(c)_j_n) : phi in tp(ov(a)_i_1,...,ov(a)_i_n), i_1 < ... < i_n in I, j_1 < ... < j_n in J }.
$
It is enough to show that this theory is consistent, to see this note that any finite fragment of this theory is satisfied by $mM$, this is because any finite fragment only contains finitely many formulas in the right set above and thus by choosing sequences $i_1^(1),...,i^1_n_1$, $i_1^2,..,i^2_n_2$,... far enough apart from each other, we can satisfy any finite number of these formulas. Hence by compactness this theory is consistent and thus complete.

