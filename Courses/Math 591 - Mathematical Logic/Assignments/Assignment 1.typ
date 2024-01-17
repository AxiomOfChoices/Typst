#import "../../../Templates/generic.typ": generic
#import "../../../Templates/math.typ": *
#import "../../../Templates/assignment.typ": *
#let ve = $epsilon$
#let seq = $subset.eq$
#let Mink = math.op("Mink")
#let fu = $frak(U)$
#let pb() = {pagebreak(weak: true)}
#let sat = $tack.r.double$
#let satn = $tack.r.double.not$
#let proves = $tack.r$
#let subm = $lt.curly$
#let Th = math.op("Th")
#let mM = $cal(M)$
#let mN = $cal(N)$
#let bar(el) = $overline(#el)$
#let subs(a, b) = { return $attach(slash, tl: #a, br: #b)$ }
#show: doc => generic(title: "Mathematical Logic Notes", name: "Jacob Reznikov", doc)
#show: doc => NumberingAfter(doc)
= Question
== Statement
A language is functional if it has no relational symbols. Find an example of two structures $mM$, $mN$ in a functional language such that $mM equiv mN$, $mM seq mN$ but $mM$ is not an elementary substructure of $mN$.

== Solution
Consider for the language $L = (+)$ the two $L$-structures $mM = (ZZ, +)$ and $mN = (ZZ / 2, +)$, it is clear that $mM seq mN$ and since $mM tilde.eq mN$ by the function $g(x) : |mN| -> |mM|$ defined by $g(x) = 2x$ then we have that $mM equiv mN$. 

To see that it is not an elementary substructure consider the formula $ phi(y) = exists x thin (x + x = y) $
then we have $mN sat phi(1)$ but $mM satn phi(1)$, and so $mM$ is not an elementary substructure of $mN$.


