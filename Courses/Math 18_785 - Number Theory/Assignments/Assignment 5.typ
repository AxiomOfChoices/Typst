#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 5", name: "Jacob Reznikov", doc)
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
Texts: Class Notes, Algebraic Number Theory by Milne, Elementary and Analytic Theory of Algebraic Numbers by Narkiewicz, Number Fields by Marcus.

= Question
== Statement
Let $n > 1$ be an integer. Show that there are infinitely many primes $p equiv 1 mod n$. 
== Solution
Assume there are finitely many, let $P$ be their product and consider $phi.alt_n$, the $n$-th cyclotomic polynomial. We know that $phi.alt_n (2 x n P)$ is a non-constant polynomial in $x$ and thus for some $x$ it gives a value which is divisible by a prime. Now $phi.alt_n (2 x n P) divides (2 x n P)^n - 1$ which is always odd so we may assume that there exists an odd prime $p$ and an $x$ such that $p divides phi_n (2 x n P)$.

Now we know that because $p divides (2 x n P)^n - 1$ then $p divides.not 2 x n P$ so we know that $(p)$ cannot be ramified in $QQ(zeta_n)$ (see Neukirch 10.4), then we know that  
$
  phi.alt_n (2 x n P) = 0 mod p.
$
and so $X - 2 x n P$ is a factor of of $phi.alt_n (X) mod p$ so $(p, zeta_n - 2 x n P)$ is a prime over $(p)$. But now the Galois group acts transitively on the primes over $(p)$ so we can generate all the primes over $(p)$. All will be of the form $(p, zeta_n^i - 2 x n P)$ and so they all have degree 1, this will then give a total splitting of $(p)$.

But again by Neukirch this would imply that $p = 1 mod n$ which is impossible because then $p divides P$ and thus $p divides 2 x n P$.

= Question
== Statement
Let $L slash K$ be a finite Galois extension of number fields. Prove that if $K$ has any inert prime, then $Gal(L slash K)$ is cyclic.
== Solution
If $frak(p)$ is inert then we get an isomorphism chain
$
  (ZZ quo n ZZ)^times iso Gal((cal(O)_L quo frak(p)) slash (cal(O)_K quo frak(p))) iso D_frak(p) iso Gal(L slash K)
$
where the second isomorphism is because of the SES
$
  0 -> I_frak(p) -> D_frak(p) -> Gal((cal(O)_L quo frak(p)) slash (cal(O)_K quo frak(p))) -> 0,
$
and the third holds because any automorphism of $L$ must map the primes over $frak(p)$ to themselves, and so every automorphism of $L$ fixes $frak(p)$ and thus is in $D_frak(p)$.

= Question
== Statement
Let $L slash K$ be a finite extension of number fields. Show that a prime of $K$ splits completely in $L$ if and only if it splits completely in the normal closure of $L slash K$.
== Solution
Lets name $N$ the normal closure of $L slash K$ and let $frak(q)$ be a prime in $N$ lying over $frak(p) := frak(q) sect cal(O)_K$. If $frak(q)$ splits completely over $N$ then we know that
$
  [cal(O)_N quo frak(q) : cal(O)_K quo frak(p)] = 1
$
but since
$
  [cal(O)_N quo frak(q) : cal(O)_K quo frak(p)] =
  [cal(O)_N quo frak(q) : cal(O)_L quo (frak(q) sect cal(O)_L)]
  [cal(O)_L quo (frak(q) sect cal(O)_L) : cal(O)_K quo frak(p)]
$
and so both these degrees are equal to $1$ and so in particular $f_(frak(q) sect cal(O)_L) = 1$. A similar argument applies to the exponents, giving us $e_(frak(q) sect cal(O)_L) = 1$. And since this applies to every prime $frak(q)'$ over $frak(p)$, we get that $frak(p)$ is split over $L$.

On the other hand assume that it is split over $L$, then set $H = Gal(N slash L)$ and consider the set of double cosets $H backslash Gal(N slash L) slash D_(frak(q))$, as in equivalence classes of the relation $x tilde h x d$ for all $h in H, d in D_(frak(q))$. This set has a natural map to the set $P$ of prime ideals of $cal(O)_L$ over $frak(p)$, given by 
$
  g : H x D_(frak(q)) |-> (x frak(q)) sect cal(O)_L
$
this map is certainly a surjection because $N$ is normal, any prime over $frak(p)$ can be mapped to any other. On the other hand, it is also an injection, since if $(x frak(q)) sect cal(O)_L = (y frak(q)) sect cal(O)_L$ then since they are two primes in $cal(O)_L$ by normality of $N$ we know that for some $z in H$ we have $z x frak(q) = y frak(q)$. Then $y^(-1) z x$ clearly fixes $frak(q)$ so it is contained in $D_frak(q)$. We now know that $x = z^(-1) y (y^(-1) z x)$ and so $x tilde y$.

Now since we assumed that $frak(p)$ is totally split over $cal(O)_L$ then we must have
$
  H backslash Gal(N slash L) slash D_frak(q) = abs(P) = [L : K] 
$
but we know that every double coset of $H backslash Gal(N slash L) slash D_frak(q)$ is union of cosets of $H backslash Gal(N slash L)$ which itself has cardinality $[G : H] = [L : K]$ by Galois theory. Thus every double coset is in fact a single right coset of $H$ which implies that for every $h x d$ there exists some $h' in H$ such that 
$
  h x d = h' x => x d x^(-1) = h^(-1) h'
$
so $H$ contains all conjugates of $D_frak(q)$, and hence the set of conjugates of $D_frak(q)$ is a subgroup of $G$ contained in $H$. Hence $H$ contains some normal subgroup $H'$, but such a normal subgroup would correspond to a normal field extension of $L$ but is strictly contained in $N$ if $H'$ is non-trivial. This is not possible, however, because this contradicts the assumption that $N$ is the normal closure. We thus must have $H'$ be trivial and hence $D_frak(q)$ must be trivial. This then implies that $frak(p)$ splits completely over $N$.

= Question
== Statement
Let $L slash K$ be a finite Galois extension of number fields. For a prime $frak(q)$ of $cal(O)_L$, let $frak(p)$ be the unique prime of $cal(O)_K$ below $frak(q)$. Suppose that $frak(q)$ is unramified.
+ Show that there is a unique element $Frob_(frak(q), L quo K) in Gal(L slash K)$, called the Frobenius automorphism associated to $frak(q)$, such that
  $
    Frob_(frak(q), L slash K) (x) equiv x^(p^m) mod frak(q)
  $
  holds for all $x in cal(O)_L$, where $p^m$ is the number of elements in the residue field $cal(O)_K quo frak(p)$. Show that the decomposition group of $frak(q)$ is the cyclic group generated by $Frob_(frak(q), L quo K)$.
+ Let $M$ be a subfield extension of $L slash K$, Galois over $K$. Let $frak(q)_M$ be the prime $frak(q) sect cal(O)_M$. Then show that $Frob_(frak(q)_M, M slash K)$ is the image of the restriction of $Frob_(frak(q), L slash K)$ to $M$.
== Solution
We have, since $frak(q)$ is unramified, 
$
  D_frak(q) iso Gal((cal(O)_L quo frak(q)) slash (cal(O)_K quo frak(q)))
$
and we also have the injection
$
  D_frak(q) into Gal(L slash K).
$
Now $Gal((cal(O)_L quo frak(q)) slash (cal(O)_K quo frak(q)))$ is generated by $x |-> x^(p^m)$ because this is the smallest iterate of the Frobenius map that that fixes all elements of $cal(O)_K quo frak(q)$. Then the image of this map under the injection is exactly the map $Frob_(q, L quo K)$ we are looking for. Uniqueness is immediate since $x |-> x^(p^m)$ is the only element of $Gal((cal(O)_L quo frak(q)) slash (cal(O)_K quo frak(q)))$ that acts this way.

Next assume that $M$ is a Galois subfield extension of $L slash K$. We have that since $M$ is Galois, any element of $Gal(L slash K)$ must fix $M$, hence must fix $cal(O)_M$. We thus know that $Frob_(frak(q), L slash K)$ restricted to $M$ is an element of $Gal(M slash K)$, and we clearly also have
$
  Frob_(frak(q), L slash K)|_(M) (x) equiv x^(p^m) mod M sect frak(q)
$
so by uniqueness above we get that $Frob_(frak(q), L slash K)|_M = Frob_(frak(q)_M, M slash K)$.

= Question
== Statement
+ Let $p$ be an odd prime, and define $p^* := (-1)^((p-1)/2) p$. Prove that $QQ(sqrt(p^*))$ is the unique quadratic subfield of $QQ(zeta_p)$. 
+ Let $n > 1$ be an integer, let $p$ be a prime that does not divide $n$. Prove that the Frobenius automorphism for any prime above $p$ is the class $p mod n in (ZZ quo n ZZ)^times$ under _the_ canonical isomorphism $(ZZ quo n ZZ)^times iso Gal(QQ(zeta_n) quo QQ)$.
+ Deduce the quadratic reciprocity: for any odd prime $p != q$, we have
  $
    (p/q) (q/p) = (-1)^((p-1)/2 (q-1)/2).
  $
== Solution
+ We know that the discriminant of $QQ(zeta_p)$ is  $p^(p-2)$, so if $QQ(alpha)$ is a quadratic subfield its discriminant must be divide $p^(p-2)$. Now let $K = QQ(sqrt(n))$ be a quadratic field, we either have $Delta_K = n$ if $n = 1 mod 4$ or $Delta_K = 4 n$ if $n = 2,3 mod 4$. So since $p$ is odd we may assume that $n = 1 mod 4$, and that $n divides p^(p-2)$. Now since $n$ is square free this means $n = plus.minus p$. Now if $p = 1 mod 4$ then we must have $n = p$, and if $p = 3 mod 4$ then we have $n = -p$ and it is easy to see that $(-1)^((p-1)/2) p$ matches both cases.

  It remains to show that $QQ(sqrt(p^*))$ is indeed a quadratic subfield, we saw in the previous assignment that $sqrt(plus.minus p)$ is contained in $QQ(zeta_p)$ so the result follows immediately.
+ We know that elements $sigma$ of the Galois group $Gal(QQ(zeta_n) slash QQ)$ are uniquely determined by where they send $zeta_n$, namely $sigma |-> k in (ZZ quo n ZZ)^times$ if and only if $sigma(zeta_n) = sigma(zeta_n^k)$. Now we can check that for the case $k = p$ the action can be computed as
  $
    sigma(sum_(i=0)^(n-1) a_i zeta_n^i) = sum_(i=0)^(n-1) a_i zeta_n^(p i) 
  $
  but also
  $
    (sum_(i=0)^(n-1) a_i zeta_n^i)^p = sum_(i=0)^(n-1) a_i^p zeta^(p i)_n  + p dot (...)
  $
  and so for any prime $frak(p)$ lying above $(p)$ we get that these two are equal, and so the Frobenius element of $frak(p)$ is indeed the one corresponding to $p$ in $(ZZ quo n ZZ)^times$.
+ Consider the field extension $K = QQ(sqrt(p^*))$, a question in assignment 1 shows that $(q)$ splits inside $cal(O)_K$ if and only if $(p^* /q) = 1$. On the other hand we know that $L = QQ(zeta_p)$ is an extension of $K$, so $(q)$ splits in $K$ if and only if the decomposition group $D_(L slash QQ, (q))$ fixes $K$. Now since $K$ is quadratic, it is fixed by an element $sigma in Gal(L slash QQ)$ if and only if $sigma$ is a square, so since $D_(L slash QQ, (q)) = gen(q mod p)$ we get that this group consists solely of squares if and only if $q$ is a square $mod p$, which is equivalent to $(q/p) = 1$.
  This shows that
  $
    (p^* /q) = 1 <=> (q/p) = 1 
  "which implies"
    (p^* /q) (q/p) = 1
  $
  and expanding the definition of $p^*$ we get
  $
    1 = (p^* /q) (q/p)
    = (-1/q)^((p-1)/2) (p/q) (q/p)
    = ((-1)^((q-1)/2))^((p-1)/2) (p/q) (q/p)
    = (-1)^( (q-1)/2 (p-1)/2 ) (p/q) (q/p)
  $

