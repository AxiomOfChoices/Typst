#import "/Templates/generic.typ": latex,header
#import "@preview/truthfy:0.3.0": truth-table
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": MultiColumnBox
#show: latex
#show: doc => header(doc, title: "Midterm Review")
#show: symbol_replacing

#let show_answers = true
#let answer(answer) = {
  if show_answers {
    return answer
  } else {
    return []
  }
}
#set page(margin: (top: 4cm), numbering: "1")
= Topic 1 - Sets
== Question 1
For each of the following sets denoted in set builder notation, describe this set. If it is infinite write 5 of its elements, otherwise write all its elements.

#MultiColumnBox[
  + ${ 4 y + 2 : ZZ }$
  + ${ x in ZZ : -5 <= x <= -2 }$
  + ${ x in RR : x^4 = 16 }$
  + ${ x in RR : x^2 + 11 x = -28 }$
  + ${ x in RR : tan pi x = 0 }$
  + ${ x in ZZ : |x| < 6 }$
]
#answer[
== Solution
+ This set contains all integers which have remainder $2$ when dividing by $4$, elements include $-2,2,6,10,14$.
+ This set contains all integers which are larger or equal to $-5$ and smaller or equal to $-2$, its elements are $-5,-4,-3,-2$.
+ This set contains all real 4th roots of 16, its elements are $-2,2$.
+ This set contains all real roots of the quadratic equation $x^2 + 11x + 28 = 0$, its elements are $-4,-7$.
+ This set contains all real roots of $tan pi x$, $tan$ is equal to zero when its input is equal to a multiple of $pi$ and thus this set is just all integers. Some elements include $-2,-1,0,1,2$.
+ This set contains all integers who's absolute value is strictly less than $6$, its elements are $-5,-4,-3,-2,-1,0,1,2,3,4,5$.
]

== Question 2
Find the cardinalities of the following sets 

#MultiColumnBox[
  + ${{1},{2,{3,4}},nothing}$
  + ${{{1},{2,{3,4}},nothing}}$
  + ${ x in ZZ : |x| < 10 }$
  + ${ x in ZZ : x^2 < 10 }$
  + ${ x in NN : x^2 < 0 }$
  + ${ x in NN : 5x <= 20 }$
]
#answer[
== Solution
#MultiColumnBox(height: 39pt, column_number: 2)[
  + $|{{1},{2,{3,4}},nothing}| = 3$
  + $|{{{1},{2,{3,4}},nothing}}| = 1$
  + $|{ x in ZZ : |x| < 10 }| = 19$
  + $|{ x in ZZ : x^2 < 10 }| = 7$
  + $|{ x in NN : x^2 < 0 }| = 0$
  + $|{ x in NN : 5x <= 20 }| = 5$
]
]

= Topic 2 - Set Identities
== Question 3
For each of the following set equalities, prove it using set identities and then by double inclusion.

#MultiColumnBox(height: 39pt, column_number: 2)[
  + $A backslash B = A backslash (A sect B)$
  + $(A backslash B) sect C = (A sect C) backslash (B sect C)$
  + $A sect (A^c union B) = A sect B$
  + $A backslash (B union C) = (A backslash B) sect (A backslash C)$
  + $(A sect B) union (A sect B^c) = A$
  + $A backslash B = A triangle.t (A sect B)$
]

$A triangle.t B$ is defined to be $(A backslash B) union (B backslash A)$, in other words $x in A triangle.t B$ means $x$ is in $A$ or $B$ but not both.
#answer[
== Solution
  + First with set identities we have
    $
      A backslash B = A sect B^c = A sect B^c union (A sect A^c) = A sect (B^c union A^c) = A sect (A sect B)^c = A backslash (A sect B)
    $
    Then for double inclusion assume that $x in A backslash B$, then $x in A$ and $x in.not B$, but then $x in.not A sect B$ so we have $x in A backslash (A sect B)$.
    On the other hand assume that $x in A backslash (A sect B)$, then $x in A$ and $x in.not A sect B$. But then we must have $x in.not B$ so $x in A backslash B$.
  + Again with the set identities we have
    $
      (A backslash B) sect C &= (A sect B^c) sect C = (A sect C) sect B^c
      = ((A sect C) sect B^c) union ((A sect C) sect C^c)
      \ &= (A sect C) sect (B^c union C^c) = (A sect C) sect (B sect C)^c = (A sect C) backslash (B sect C)
    $
    For double inclusion assume that $x in (A backslash B) sect C$, then $x in A, x in.not B, x in C$. But then $x in A sect C$ and $x in.not B sect C$ and thus $x in (A sect C) backslash (B sect C)$.
    On the other hand assume that $x in (A sect C) backslash (B sect C)$, we have that $x in A sect C$ and $x in.not B sect C$. Then we have that $x in A$ and $x in C$ but then this combined with $x in.not B sect C$ means that $x in.not B$. Thus $x in (A backslash B) sect C$.

  + Again with the set identities we have
    $
      A sect (A^c union B) = (A sect A^c) union (A sect B)
      = nothing union (A sect B) = A sect B.
    $
    For double inclusion assume that $x in A sect (A^c union B)$, then $x in A$ and $x in A^c union B$. But because $x in A$ we have $x in.not A^c$ so $x in B$. Thus $x in A sect B$.
    For the other direction assume that $x in A sect B$, then $x in A$ and $x in B$. Then $x in A^c union B$ since $x in B$, thus $x in A sect (A^c union B)$.
  + Again with set identities we have
    $
      A backslash (B union C) = A sect (B union C)^c = A sect B^c sect C^c
      = A sect B^c sect A sect C^c = (A backslash B) sect (A backslash C).
    $
    Now for double inclusion assume that $x in A backslash (B union C)$, then $x in A$ and $x in.not B union C$. Then we have $x in.not B$ and $x in.not C$ so we have $x in A backslash B$ and $x in A backslash C$. Thus $x in (A backslash B) sect (A backslash C)$.
    For the other direction assume that $x in (A backslash B) sect (A backslash C)$, then $x in A backslash B$ and $x in A backslash C$. Then we have $x in A$ and $x in.not B$ and $x in.not C$. Thus we have $x in.not B union C$ so $x in A backslash (B union C)$.
  + Again with set identities we have 
    $
      (A sect B) union (A sect B^c)
      =
      A sect (B union B^c) = A.
    $
    Now for double inclusion assume that $x in (A sect B) union (A sect B^c)$, then $x in A sect B$ and $x in A sect B^c$. Then we must have $x in A$.
    For the other direction assume that $x in A$, then either $x in B$ or $x in B^c$. If $x in B$ then $x in A sect B$ so $x in (A sect B) union (A sect B^c)$. On the other hand if $x in B^c$ then $x in (A sect B^c)$ so $x in (A sect B) union (A sect B^c)$.
  + Again with set identities we have by part 1
    $
      A backslash B = A backslash (A sect B)
    $
    and we also know that
    $
      (A sect B) backslash A = (A sect B) sect A^c = nothing sect B = nothing
    $
    but then
    $
      A backslash (A sect B) = A backslash (A sect B) union nothing = (A backslash (A sect B)) union ((A sect B) backslash A)
      = A triangle.t (A sect B).
    $
    Now for double inclusion assume that $x in A backslash B$, then $x in A$ and $x in.not B$. Then we have that $x in.not A sect B$ so $x$ is in $A$ but not $A sect B$ and thus $x in A triangle.t (A sect B)$.
    For the other direction assume that $x in A triangle.t (A sect B)$, then either $x in A$ or $x in A sect B$ but not both. But now if $x in A sect B$ then surely $x in A$ which would mean $x$ is in both, thus we cannot have $x in A sect B$ and so $x in A$. But now if $x in A$ but $x in.not A sect B$ then we must have that $x in.not B$ and thus $x in A backslash B$.
]
== Question 4
For each of the following pairs of sets $A,B$, list the elements of $A times B, cal(P)(A), cal(P)(B)$.
Assume that the symbols $a,b,c,x,y,z$ all represent distinct elements.

#MultiColumnBox(column_number: 2)[
  + $A = {0, 5, 7}, B = {a,b,c}$.
  + $A = {0, 1, {0,1}}, B = {{x,y}}$.
  + $A = {2, {2}}, B = {x, {y,z}}$.
  + $A = {1,{1,2}}, B = {6,4,5}$.
]
#answer[
== Solution
+ $A times B = {(0,a),(0,b),(0,c),(5,a),(5,b),(5,c),(7,a),(7,b),(7,c)}$.
  $cal(P)(A) = {{},{0},{5},{7},{0,5},{0,7},{5,7},{0,5,7}}$.
  $cal(P)(B) = {{},{a},{b},{c},{a,b},{a,c},{b,c},{a,b,c}}$.
+ $A times B = {(0,{x,y}),(1,{x,y}),({0,1},{x,y})}$.
  $cal(P)(A) = {{},{0},{1},{0,1},{0,{0,1}},{1,{0,1}},{0,1,{0,1}}}$.\
  $cal(P)(B) = {{},{{x,y}}}$.
+ $A times B = {(2,x),(2,{y,z}),({2},x),({2},{y,z})}$. \
  $cal(P)(A) = {{},{2},{{2}},{2,{2}}}$. \
  $cal(P)(B) = {{},{x,y}}$.
+ $A times B = {(1,6),(1,4),(1,5),({1,2},6),({1,2},4),({1,2},5)}$. \
  $cal(P)(A) = {{},{1},{1,2},{1,{1,2}}}$. \
  $cal(P)(B) = {{},{6},{4},{5},{6,4},{6,5},{4,5},{6,4,5}}$.
]

= Topic 3 - Propositional Logic

== Question 5
For each of the following formulas, write down their truth tables.

#MultiColumnBox(column_number: 2)[
  + $(not p or q) and (p or not q)$.
  + $not p => (q => p)$.
  + $(p or q) => (r and (p or q) => p and q)$
  + $(p and q) or (q and r) or (r and p)$
]
#answer[
== Solution
#box(height: 280pt)[
#columns(2)[
+ #truth-table($(not p or q) and (p or not q)$)
3. #truth-table($(p or q) => (r and (p or q) => p and q)$)
2. #truth-table($not p => (q => p)$)
4. #truth-table($(p and q) or (q and r) or (r and p)$)
]
]
]

== Question 6
For each of the following pairs of logical formulas, decide whether they are logically equivalent.

#MultiColumnBox(height: 39pt, column_number: 2)[
  + $p and q$ and $not (not p and not q)$.
  + $(p => q) or r$ and $not ((p and not q) and not r)$.
  + $not p and (p => q)$ and $not (q => p)$.
  + $not (p => q)$ and $p and not q$.
  + $p or (q and r)$ and $(p or q) and r$.
  + $p and (q or not q)$ and $not p => (q and not q)$.
]

#answer[
== Solution
+ First let us simplify the second formula using De Morgan's laws #h(1fr)
  $ not (not p and not q) = not not p or not not q = p or q $
  which we expect to not be equivalent to $p and q$. We can check this by setting $p$ to be true and $q$ to be false. Then $p and q$ is false but $not p and not q$ is also false and so $not (not p and not q)$ is true, making them not equivalent.
+ Again we simplify the second formula using De Morgan's laws
  $
    not ((p and not q) and not r) = (not (p and not q)) or (not not r)
    = (not p or q) or r
  $
  and so we see that these two are indeed equivalent since we can rewrite $p => q$ as $not p or q$.
+ First we will substitute $not p or q$ and $not q or p$ for $p => q$ and $q => p$ respectively, the two formulas then become
  $
    not p and (not p or q) quad "and" quad not (not q or p)
  $
  then using De Morgan's laws we get for the second formula
  $
    not (not q or p) = q and (not p)
  $
  and for the first formula we see that using absorption laws
  $
    not p and (not p or q) = not p
  $
  and so we expect that they should not be equivalent. We test by setting $p$ to be true and $q$ being false. Then we get for the first formula
  $
    not p and (p => q) = F and (T => F) = F
  $
  and for the second formula
  $
    not (q => p) = not (F => T) = not (F) = T
  $
  and so indeed they are not equivalent.
+ We start by simplifying the first formula
  $
    not (p => q) = not (not p or q) = p and (not q)
  $
  and so we quickly reached the second equation, thus they are equivalent.
+ These formulas are hard to simplify any further but they don't look the same and so we suspect they are not equivalent. To check this is indeed the case we need to pick a specific assignment for which they disagree, after some trial and error we can see that if $p$ is true, $q$ is false, and $r$ is false we get
  $
    p or (q and r) = T or (F and F) = T or F = T
  $
  for the first formula, and 
  $
    (p or q) and r = (T or F) and F = T and F = F
  $
  for the second formula.
+ We start by simplifying the first formula
  $
    p and (q or not q) = p and T = p,
  $
  and then we simplify the second formula
  $
    not p => (q and not q) = not p => T = T.
  $
  We thus get that the second formula is always true, where as the first formula could be false if $p$ is false. Thus the two are not equivalent.
]

= Topic 4 - Predicate logic
== Question 7
For each of the following logical formulas test whether it is a tautology, contradiction or neither.

#MultiColumnBox[
  + $not (p or not p)$.
  + $not (p or not not q) and (p and not q)$.
  + $(p and q) => (p => q)$.
  + $not p and not (not p or not q)$.
  + $(p <=> q) and (p => q)$.
  + $(p => (q => r)) and (r => p)$.
]

#answer[
== Solution
+ We can see that the formula simplifies as #h(1fr)
  $
    not (p or not p) = not T = F
  $
  and so is always false, thus it is a contradiction.
+ Simplifying this formula gives us
  $
    not (p or not not q) and (p and not q)
    = 
    (not p and not q) and (p and not q)
    =
    F and not q
    =
    F
  $
  and so is also a contradiction.
+ Simplifying this formula gives us
  $
    (p and q) => (p => q) = not (p and q) or (not p or q)
    = (not p or not q) or (not p or q)
    = not p or not q or q
    = T
  $
  and so this formula is always true, and thus a tautology.
+ Simplifying this formula gives us
  $
    not p and not (not p or not q)
    = 
    not p and (p and q)
  $
  which we see is a contradiction since we can't have both $not p$ and $p$ be true.
+ Note that $p <=> q = (p => q) and (q => p)$ so
  $
    (p <=> q) and (p => q) 
    = p <=> q
  $
  which can be true if $p$ and $q$ are true, or false if $p$ is true and $q$ is false. Thus it is neither a contradiction nor a tautology.
+ Finally, here we could try simplify but that would be quite long, instead we notice that if we set $p,q,r$ all to be true then the formula is true, thus it cannot be a contradiction. Now we also notice that we can easily make this sentence false by making $r => p$ false, for example by setting $r$ to be true and $p$ to be false. Then this sentence is also not a tautology and thus it is neither. 
]

== Question 8
For each of the following predicates and assignments of variables, find whether the predicate is true or false.
+ $(x + y = z) => (x - y = z)$ with $x = 5$,$y = 0$, $z = 5$.
+ $(2 x = y) or (2 x + 1 = y)$ with $x = 4$, $y = 9$.
+ $(2 x = y) or (2 x + 1 = y)$ with $x = 10$, $y = 9$.
+ $(z dot x = y) and (z + x = y)$ with $x = 2$, $y = 4$, and $z = 2$.

#answer[
== Solution
+ We check that $x + y = 5 + 0 = 5 = z$ and $x - y = 5 - 0 = 5 = z$ and so we have
  $
    (x + y = z) => (x - y = z) = T => T = T
  $
  and so this predicate is true for this variable assignment.
+ We check that $2 x = 8 != 9 = y$ but $2x + 1 = 8 + 1 = 9 = y$ and thus
  $
    (2 x = y) or (2 x + 1 = y) = F or T = T
  $
  and so this predicate is also true for this variable assignment.
+ Here we see that $2 x = 20 != 9 = y$ and also $2 x + 1 = 21 != 9 = y$ and thus
  $
    (2 x = y) or (2 x + 1 = y) = F or F = F
  $
  and so this predicate is not true for the this variable assignment.
+ Finally we have that $z dot x = 2 dot 2 = 4 = y$ as well as $z + x = 2 + 2 = 4 = y$ and thus
  $
    (z dot x = y) and (z + x = y) = T and T = T
  $
  and so this predicate is true for this variable assignment.
]

= Topic 5 - Quantifiers
== Question 9
For each of the following quantified formulas, write the formula in English, then prove whether it is true or false.

#MultiColumnBox(height: 3em+2pt, column_number: 2)[
  + $forall x in RR, x^2 > 0$.
  + $exists a in RR, forall x in R, a dot x = x$.
  + $forall n in NN, exists X in cal(P)(NN), |X| < n$.
  + $forall X in cal(P)(NN), exists n in ZZ, |X| = n$.
  + $forall n in ZZ, exists m in ZZ, m = n + 5$.
  + $forall n in NN, exists m in NN, 0 = m + n$.
]

#answer[
== Solution
First we will write the English interpretation, then discuss whether it is true or false.
+ For every real number, its square is strictly positive. This is false since $0 in RR$ and $0^2 = 0$.
+ There exists a real number $a$, such that for every real number $x$, their product is $x$. This is true since we can pick $a = 1$ then for any $x in RR$ we have $1 dot x = x$.
+ For every natural number $n$ there is a subset $X$ of the natural numbers who's cardinality is strictly less than $n$. This is false, since $0 in NN$ and there is no subset of the natural numbers who's cardinality is strictly less than $0$, the lowest it can be is $0$.
+ For every subset $X$ of the natural numbers, there is a natural number $n$ which is equal to the cardinality of $X$. This is not true, since $NN seq NN$ then $NN in cal(P)(NN)$, but there is no natural number such that the cardinality of $NN$ is equal to that number.
+ For every integer $n$ there is an integer $m$ which is equal to $n$ plus $5$. This is true since the addition of two integers is still an integer and so setting $m = n + 5$ gives us exactly what we want.
+ For every natural number $n$, there is a natural number $m$ such that their sum is zero. This is false, if $n = 1$ then there is no natural number which adds to $1$ to give zero.
]

== Question 10
For each of the following English sentences, translate it into a logical formula.

+ If $x$ is a prime, then $sqrt(x)$ is not a rational number.
+ For every positive number $epsilon$, there is a positive number $delta$ for which $|x-a| < delta$ implies $|f(x) - f(a)| < epsilon$.
+ If $x$ is a rational number and $x != 0$ then $tan(x)$ is not a rational number.
+ If $sin(x) < 0$ then it is not the case that $0 <= x <= pi$.
+ For every prime number $p$, there is another prime number $q$ with $q > p$.

#answer[
== Solution
We will use $P$ to denote the set of prime numbers.

+ "If $x$ is a prime" implicitly quantifies over all primes, then $sqrt(x)$ not being a rational number can be written as $sqrt(x) in.not QQ$. Together this gives us
  $
    forall x in P, sqrt(x) in.not QQ
  $
+ To quantify over a positive number, we can quantify over all real numbers then include $epsilon > 0$ as 'assumption' as you will see later. Then the existence of $delta$ can be written as $exists delta in RR, delta > 0$. The last part of the sentence is a standard implication. Together this then gives us
  $
    forall epsilon in RR, (epsilon > 0 => exists delta, delta > 0 and (forall x in RR, |x - a| < delta => |f(x) - f(a)| < epsilon))
  $
+ Again "If $x$ is a rational number" implicitly quantifies over all rational numbers, then we will again use $x != 0$ as an 'assumption' and then $tan(x)$ being not a rational number can be written as we did in part 1. All Together this gives us
  $
    forall x in QQ, (x != 0 => tan(x) in.not QQ)
  $
+ We are again implicitly quantifying over all $RR$, then we will use $sin(x) < 0$ as our 'assumption'. Then "it is not the case that $0 <= x <= pi$" can be written as $not (0 <= x <= pi)$ but this is a sort of shorthand, really we need to write $not (0 <= x and x <= pi)$. Together this gives
  $
    x in RR, (sin(x) < 0 => not (0 <= x and x<= pi))
  $
+ We are clearly quantifying over all primes, then we claim existence, so this easily translates to
  $
    forall p in P, exists q in P, q > p
  $
]

= Topic 6 - Contrapositive and Contradiction
== Question 11
Prove the following statements using a contrapositive proof.

+ Suppose $a,b in ZZ$. If $a^2(b^2 - 2b)$ is odd, then $a$ and $b$ are odd.
+ Suppose $x in RR$. If $x^3 - x > 0$ then $x > -1$.
+ Suppose $n in ZZ$. If $3$ does not divide $n^2$, then $3$ does not divide $n$.
+ Suppose $a in ZZ$. If $a^2$ is not divisible by 4, then $a$ is odd.
+ Suppose $a,b in ZZ$. If both $a b$ and $a+b$ are even, then both $a$ and $b$ are even.
+ Suppose $x,y,z in ZZ$ and $x != 0$. If $x$ does not divide $y z$, then $x$ does not divide $y$ and also does not divide $z$.

#answer[
== Solution
The strategy here is quite simple, first we will rewrite the sentence as a logical formula, then we will apply the contrapositive rule to that formula which we will then try to prove.

+ We can rewrite this as #h(1fr)
  $
    forall a in ZZ, forall b in ZZ, (a^2(b^2 - 2b) "is odd" => a "is odd" and b "is odd")
  $
  then by the contrapositive rule this is equivalent to
  $
    forall a in ZZ, forall b in ZZ, (not (a "is odd" and b "is odd") => not (a^2(b^2 - 2b) "is odd") )
  $
  which simplifies
  $
    forall a in ZZ, forall b in ZZ, (a "is even" or b "is even" => a^2(b^2 - 2b) "is even" )
  $
  which we can write as: "Suppose $a,b in ZZ$, if $a$ is even or $b$ is even, then $a^2(b^2-2b)$ is even."
  This we is quite simple to prove, if $a$ is even then $a = 2k$ for some integer $k$ so 
  $
  a^2(b^2 - 2b) = 2 (2k^2 (b^2 - 2b)).
  $ 
  Then since $2 k^2 (b^2 - 2b)$ is an integer then $a^2 (b^2 - 2b)$ is even. On the other hand if $b$ is even then $b = 2k$ for some integer $k$ and so 
  $
  a^2(b^2 - 2b) = a^2 (4k^2 - 4k) = 2(a^2 (2k^2 - 2k))
  $
  and so since $a^2 (2k^2 - 2k)$ is an integer then $a^2(b^2 - 2b)$ is even. Thus we have proved the contrapositive and thus also the original statement.
+ We can rewrite this statement as
  $
    forall x in RR, (x^3 - x > 0 => x > -1)
  $
  then by contrapositive this is equivalent to
  $
    forall x in RR, (x <= -1 => x^3 - x <= 0).
  $
  Now this is a true statement, to see this factorize $x^3 - x$ as $x(x^2 - 1)$, if $x<=-1$ then $x^2 >= 1$ and $x <= 0$ so $x$ is non-positive and $x^2 - 1$ is non-negative, thus their product is non-positive, which is exactly $x^3 - x <= 0$.
+ We can rewrite this statement as
  $
    forall n in ZZ, (n^2 "not divisible by" 3 => n "not divisible by" 3)
  $
  and so by contrapositive this is equivalent to
  $
    forall n in ZZ, (n "divisible by" 3 => n^2 "divisible by" 3).
  $
  Now this is clearly true since if $n$ is divisible by 3 then $n = 3k$ for some integer $k$ and so $n^2 = 9k^2 = 3(3k^2)$. But now $3k^2$ is an integer and so $n^2$ is divisible by $3$.
+ This is solved exactly as the above part.
+ We can rewrite this statement as
  $
    forall a in ZZ, forall b in ZZ, (a b "is even" and a + b "is even" => a "is even" and b "is even")
  $
  and so by contrapositive this is equivalent to
  $
    forall a in ZZ, forall b in ZZ, (a "is odd" or b "is odd" => a b "is odd" or a + b "is odd").
  $
  This is a true statement, if $a$ is odd and $b$ is odd then $a b$ is also odd. On the other hand if $a$ is odd and $b$ is even, then $a + b$ is also odd. If $a$ is even and $b$ is odd then $a + b$ is also odd.
+ We can rewrite this statement as
  $
    forall x in ZZ backslash {0}, y in ZZ, z in ZZ, (x "does not divide" y z => x "does not divide" y and x "does not divide" z).
  $
  then by contrapositive this is equivalent to
  $
    forall x in ZZ backslash {0}, y in ZZ, z in ZZ, (x "divides" y or x "divides" z => x "does divide" y z).
  $
  This is again true since if $y = x(k)$ for some integer $k$ then $y z = x (z k)$ and since $z k$ is an integer then $y z$ is divisible by $x$. Similarly if $z = x(k)$ for some integer $k$ then $y z = x (y k)$ and since $y k$ is an integer then $y z$ is divisible by $x$.
]

== Question 12
Prove the following statements using contradiction.

+ $root(3,2)$ is irrational.
+ If $a,b in ZZ$, then $a^2 - 4b - 2 != 0$.
+ Suppose $a,b in RR$. If $a$ is rational and $a b$ is irrational, then $b$ is irrational.
+ For every positive $x in QQ$, there is a positive $y in QQ$ for which $y < x$.
+ If $b in ZZ$ and $b$ does not divide $k$ for every $k in NN backslash {0}$, then $b = 0$.
+ Suppose $a,b in ZZ$. If $4$ does divide $a^2 + b^2$, then $a$ and $b$ are not both odd.

#answer[
== Solution
+ Assume that $root(3,2)$ is rational, then we can write $root(3,2) = p/q$ with $p,q$ integers, $q != 0$ and $gcd(p,q) = 1$. Now since this is true we have that
  $
    2 = (p/q)^3 = p^3/q^3 "and so" 2 q^3 = p^3
  $
  Now this means that $p^3$ is even and so $p$ must be even, since if $p$ was odd then $p^3$ would also be odd. But then $p = 2k$ for some integer $k$ and so $q^3 = 4 k^3$, but then $q^3$ is also even and so $q = 2 ell$ for some integer $ell$. But then $gcd(p,q) >= 2$ which contradicts our assumption. Thus by contradiction $root(3,2)$ is irrational.
+ Assume that there exists $a,b in ZZ$ with $a^2 - 4 b - 2 = 0$. Then we have $a^2 = 4b + 2$ and so $a^2$ is even, but now again if $a^2$ is even then $a$ is even. But then for some $k$ we have $a = 2k$ and so $a^2 = 4k^2$. But now we have $4 k^2 = 4 b + 2$.

  Now we can rearrange this to give us that $2 = 4(k^2 - b)$ and so $4$ divides $2$ since $k^2 - b$ is an integer. But this is a contradiction since $4$ does not divide $2$.
+ Suppose for a contradiction that there exist $a,b in RR$ with $a$ rational, $a b$ irrational, and $b$ rational. Now $a b$ is then a product of two rational numbers, and is thus rational. But we assumed it is irrational, this is a contradiction, thus the statement holds.
+ Assume there exists a positive $x in QQ$ such that for every $y in QQ$ which is positive, $y >= x$. Then $x/2$ is a positive rational number but $x/2 < x$ since $x$ is positive, but also $x/2 >= x$ since it is a positive rational. This is a contradiction and so the statement holds.
+ Assume there exists a $b in ZZ$ which is not zero and does not divide any non-zero natural number $k in NN backslash {0}$. Then if $b$ is positive, then it is also a natural number and it divides itself, which is a contradiction. On the other hand if $b$ is negative, then $-b$ is positive and so $b$ divides $-b$ which is a natural number, this is also a contradiction. Thus the statement holds.
+ Assume that there exists $a,b in ZZ$ with $4$ dividing $a^2 + b^2$ and both $a$ and $b$ odd. Then since $a$ is odd it is equal to $2k + 1$ for some integer $k$, and $b = 2 ell + 1$ for some integer $ell$. Now from this we know that
  $
    a^2 + b^2 = (2k+1)^2 + (2ell+1)^2 = 4k^2 + 4k + 1 + 4ell^2 + 4ell +1
    = 4(k^2 + k + ell^2 + ell) + 2.
  $
  But then if $a^2 + b^2$ divides 4 then since
  $
    2 = a^2 + b^2 - (4k^2 + k + ell^2 + ell)
  $
  then $2$ also divides $4$. This is a contradiction and thus the statement holds.
]

= Topic 7 - Induction and Functions
== Question 13
Prove the following statements using induction.

+ If $n in NN$, then $2^1 + 2^2 + 2^3 + dots.c + 2^n = 2^(n+2) - 2$.
+ Prove that $24 | (5^(2n) - 1)$ for every integer $n >= 0$.
+ Prove that $2^n + 1 <= 3^n$ for every positive integer $n$.
+ Suppose that $A_1,A_2,...,A_n$ are sets in some universal set $U$, and $n >= 2$. Prove that $overline(A_1 union A_2 union ... union A_n) = overline(A_1) sect overline(A_2) sect ... sect overline(A_n)$.
+ If $n in NN$, then $1+1/4 +1/9 + ... + 1/n^2 <= 2 - 1/n$ for every $n in NN$.

