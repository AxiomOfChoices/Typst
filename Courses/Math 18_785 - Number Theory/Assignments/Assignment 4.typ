#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 4", name: "Jacob Reznikov", doc)
#show: latex
#show: NumberingAfter
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let pb() = {
  pagebreak(weak: true)
}
#set page(numbering: "1")
#let bar(el) = $overline(#el)$
#set enum(numbering: "(a)")
// #show math.equation: set text(font: "Latin Modern Math")

*Sources consulted* \
Classmates: Frank Wang, Michael Panner, Julia Meng. We discussed essentially every single problem together.\
Texts: Class Notes, Algebraic Number Theory by Milne, Elementry and Analytic Theory of Algebraic Numbers by Narkiewicz, Number Fields by Marcus.

#let r5 = $#h(-1pt) root(3,5)$
= Question
== Statement
Let $K = QQ(r5)$
+ Prove that $cal(O)_K = ZZ[r5]$.
+ Factor the primes $p = 2,3,5,7,11,13$ in $QQ(r5)$. Write the prime ideals $frak(q)$ appearing in your factorization in the form $(p, f(r5))$ where $f in ZZ[x]$ has degree at most $3$.
+ Prove that the factorization patterns you found in $(b)$ represent every possible case; that is, every possible sum $[K : QQ] = sum_(frak(q) | (p)) e_frak(q) f_(frak(q))$ that can arise for this particular field $K$. You should find that there is one numerically possible case that does not occur for $p <= 13$; you need to prove that it cannot occur for any prime $p$.
+ Find a different cubic field of the form $K = QQ(#h(-1pt) root(3,n))$ for which the one factorization pattern missing from $(c)$ does occur (demonstrate this explicitly).
== Solution
+ It is easy to see that the discriminant of $(1,r5, r5^2)$ is $-775 = -3^3 5^2$. Since $x^3 - 5$ is Eisenstein with $p = 5$ then we get that the true discriminant does include $5^2$ as a factor. Then we have $(x+5)^3 - 5 = x^3 + 15 x^2 + $.
