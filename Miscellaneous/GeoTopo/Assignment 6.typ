#import "../../Templates/generic.typ": generic
#import "../../Templates/question.typ": question_heading
#import "@preview/cetz:0.1.2"
#show: doc => generic(title: "Assignment 6", name: "Jacob Reznikov", question_heading(doc))
#let ve = $epsilon$
#let ip(..x) = $lr(angle.l #x.pos().join(",") angle.r)$

= Question 5
== Statement
Let $Gamma$ be a finite connected graph with vertex set $V$ and edge set $E$. Our goal is to construct a graph $tilde(Gamma)$ whose geometric realization is the universal cover of the geometric realization of $Gamma$. Figure out how to define $tilde(Gamma)$ be mimicking the construction of the universal cover of a topological space. (Warning: it may have infinitely many vertices.) Once you have constructed $tilde(Gamma)$ do the following.

+ Prove that $tilde(Gamma)$ is a tree.
+ Prove that if $Gamma$ is a tree, then $Gamma$ is isomorphic to $tilde(Gamma)$
+ If $Gamma$ is the dumbell graph, then find $tilde(Gamma)$.

== Solution
Fix some vertex $v_0 in V$. We will define the vertex set of $tilde(Gamma)$ to be the set of oriented edge walks $(e_1,...,e_n)$ with $e_i eq.not e_(i+1)$, that is no consecutive repeated edges. Then two walks are related if one is the extension of the other by one edge.

We can then map each vertex to the final vertex where the walk ends up and map each edge with the appropriate orientation to get our covering map $q : tilde(Gamma) -> Gamma$. 

Now by construction any simple cycle (no repeating vertices) in $tilde(Gamma)$ must be a sequence of walks $w_1,...,w_n$ that are monotonic with respect to extensions. But this is a contradiction since this means the length of $w_1$ cannot be the same as $w_n$. Thus we cannot have any cycles in $tilde(Gamma)$.

Next assume that $Gamma$ is a tree, then for every vertex $v_i in V$ we have exactly one path between $v_0$ and $v_i$ and so there is exactly one vertex in $tilde(Gamma)$ that gets mapped to $v_i$ through $q$. We can also easily see that the copies of $v_i$ and $v_j$ in $tilde(Gamma)$ are adjaceny if and only if they are adjacent in $Gamma$. Thus $Gamma$ and $tilde(Gamma)$ are isomorphic.

If $Gamma$ is the dumbell graph then we it is homotopic to two loops at a point. We know then that the vertices of $tilde(Gamma)$ are in bijection to $pi_1(Gamma,v_0) tilde.equiv ZZ * ZZ$. Now two vertices are related if and only if one is an extension of another by one cycle. This corresponds to adjoining $a,b,a^(-1),b^(-1)$ in $ZZ * ZZ$ and so we get exactly the Cayley graph of $ZZ * ZZ$.

