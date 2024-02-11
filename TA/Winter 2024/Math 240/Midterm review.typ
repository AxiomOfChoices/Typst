#import "/Templates/generic.typ": latex,header
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
#set page(margin: (top: 4cm))
= Section 1 - Sets
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

= Section 2 - Set Identities
== Question 3
For each of the following set equalities, prove it using set identities and then by double inclusion.

#MultiColumnBox(height: 39pt, column_number: 2)[
  + $A backslash B = A backslash (A sect B)$
  + $(A backslash B) sect C = (A sect C) backslash (B sect C)$
  + $A sect (A^c union B) = A sect B$
  + $A backslash (B union C) = (A backslash B) sect (A backslash C)$
  + $(A sect B) union (A sect B^c) = A$
  + $A backslash B = A triangle.stroked.t (A sect B)$
]
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
    For double inclusion assume that $x in (A backslash B) sect C$, then $x in A, x in.not B, x in C$. But then $x in A sect C$
]



// Let $f(x) = product_i g_i (x)$ where each $g_i (x)$ is a polynomial, then let $p$ be a singular point of $f(x)$ which is not a singular point of any $g_i (x)$, then $m u l t_p (x) = n$ where $n$ is the number of irreducible components that $p$ is contained in.
//
// To see this consider the partial derivatives of $f$ at $p$ of degree $k$, by product rule if $k < n$ then we will have at least one $g_i$ left over in the derivative which vanishes. Hence the multiplicity is at least $n$. Now since $p$ is not a singular point of any $g_i (x)$ then none of the derivatives of $g_i (x)$ vanish and so at the $n$-th derivative we get exactly one non-zero term hence $p$ has multiplicity $n$.

