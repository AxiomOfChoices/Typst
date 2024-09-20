#import "/Templates/generic.typ": latex, header
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/assignment.typ": *
#show: doc => header(title: "Assignment 2", name: "Jacob Reznikov", doc)
#let lecture = counter("lecture")
#lecture.step()
#let update_lecture = () => {
  lecture.step()
  counter(heading).update(0)
}
#let bonus_problem = {
  pagebreak()
  block(text([*Bonus Exercise*], size: 17pt))
}
#show: latex
#let NumberingAfter(doc) = {
  let level = 1
  set heading(
    numbering: (..numbers) => if numbers.pos().len() <= level {
      return context numbering(
        "1.1",
        lecture.get().first(),
        ..numbers,
      )
    },
    supplement: "Exercise",
  )
  show heading: it => {
    if (it.numbering == none) {
      return it
    }
    if (it.level > 1) {
      return text(it, size: 14pt)
    }
    let numbers = counter(heading).at(it.location())
    let display-number = numbering(it.numbering, ..numbers)
    let body = it.body
    // if (numbers.last() > 1) {
    pagebreak(weak: true)
    // }
    block(text([*#body #display-number*], size: 17pt))
  }
  doc
};
#show: thmrules
#let col(x, clr) = text(fill: clr)[$#x$]
#let bar(el) = $overline(#el)$
#show: NumberingAfter
#set enum(numbering: "(a)")

*Sources consulted* \
Classmates: Julia Meng. \
Texts: Class Notes.
#update_lecture()
#update_lecture()
#update_lecture()
= Exercise
== Statement
Show that the Lie algebras $(B_d)_- = frak(b)_d$ and $(N_d)_- = frak(n)_d$ satisfy $frak(n)_d = [frak(b)_d, frak(b)_d]$.
== Solution
Let $X,Y$ be two matrices in $frak(b)_d$, then we know by definition that $X$ and $Y$ preserve a flag $0 = V_0 subset V_1 subset ... subset V_n$. Now fix a $j >= 1$ and note that since both $X$ and $Y$ preserve $V_j$ and $V_(j-1)$ then we can quotient their actions as $X,Y : V_j quo V_(j-1) -> V_j quo V_(j-1)$. But this is a one dimensional vector space so both $X$ and $Y$ act as scalers so we have $[X,Y] : V_j quo V_(j-1) -> V_j quo V_(j-1)$ is in fact the zero map.

We can now unwind this fact to get that $[X,Y](V_j) seq V_(j-1)$ which shows that $[X,Y] in frak(n)_d$ for all $X,Y in frak(b)_d$.

On the other hand $frak(n)_d$ is spanned by matrices $a^((i j))$ for $i < j$ where $(a^((i j)))_(k ell) = delta_(i k) delta_(j ell)$. But we have
$
[a^((i i)), a^((i j))]
= a^((i i)) a^((i j)) - a^((i j)) a^((i i))
= a^((i j)).
$
and clearly both $a^((i i))$ and $a^((i j))$ are upper triangular so they are in $frak(b)_d$, thus $frak(n)_d$ is spanned by elements $[X,Y]$ for $[X,Y] in frak(b)_d$.

= Exercise
== Statement
Show that $frak(b)_d$ is a solvable Lie algebra and that $frak(n)_d$ is a nilpotent Lie algebra.
== Solution
Let $X in frak(n)_d^(d)$, clearly by definition $X$ is a sum of matrix products each involving $d$ matrices in $frak(n)_d$, and thus all satisfy $A V_n seq V_0$ and thus are all zero. Hence $X = 0$ and so $frak(n)_d^d$ is nilpotent.

Now since it is nilpotent it is also solvable, but we know that $[frak(b)_d, frak(b)_d] = frak(n)_d$ so $frak(b)_d$ is clearly also solvable.

= Exercise
== Statement
Let $frak(g)$ be a Lie algebra and $frak(h)$ be its ideal. Prove that if $frak(h)$ and $frak(g) quo frak(h)$ are solvable Lie algebras, then $frak(g)$ is solvable too.
== Solution
Let $n$ be such that $(frak(g) quo frak(h))^((n)) = 0 seq frak(g) quo frak(h)$. Then we have by definition of the quotient $frak(g)^((n)) seq frak(h)$. But then since $frak(h)$ is also solvable we have $frak(h)^((m)) = 0$ so we get $frak(g)^((n + m)) = 0$ and hence $frak(g)$ is solvable.

= Exercise
== Statement
#let heis = math.op("heis")
Prove that any 2-step finite dimensional nilpotent Lie algebra with $1$-dimensional center is isomorphic to $heis_(2 n + 1)$ for some integer $n >= 1$.
== Solution
Let $frak(g)$ be the Lie algebra and let $H$ be a generator for its center. Since $frak(g) quo span(H)$ is abelian we know that $[a,b] in span(H)$ for all $a,b in frak(g)$, we also know that for each $a in frak(g) backslash span(H)$ there exists some $b in frak(g)$ so that $[a,b] != 0$, otherwise it would be in the center.

We now perform the following procedure, pick an arbitrary element $a$ not in the center of $frak(g)$, and then pick an element $b$ such that $[a,b] != 0$. Then consider $W := ker ad a sect ker ad b$, this is an $n - 2$ dimensional subspace because it does not contain $span(a,b)$. We now assume by induction that $W$ is isomorphic to $heis_(2 m + 1)$ for some $m >= 1$, then we have
$
[a, e_i] = [a, f_i] = [a,H] = [b, e_i] = [b, f_i] = [b, H] = 0
$
where $e_i, f_i, H$ is the standard basis on $heis_(2 m + 1)$. Thus adding $a,b$ to that basis we get all the relations of $heis_(2 m + 3)$ and thus $frak(g)$ is isomorphic to that.

= Exercise
== Statement
Prove that $frak(g)_B$ is a Lie algebra and that $frak(g)_B tilde.equiv frak(g)_(B_1)$ if and only if $B tilde.equiv B_1$ are isomorphic bilinear forms.
== Solution
Let $f$ be an isomorphism $f : frak(g)_B -> frak(g)_(B_1)$, $f$ must fix the center since its preserves the bracket, so since $frak(g)_B = V_B plus.circle Z$ and $frak(g)_(B_1) = V_(B_1) plus.circle Z$ thus can write $f : V_B -> V_(B_1)$. Now we have
$
B(f(a),f(b))
= [f(a),f(b)]_(frak(g)_B) #h(-5pt)
= [a,b]_(frak(g)_(B_1)) #h(-5pt)
= B_1(a,b),
$
so $f$ becomes an isomorphism of bilinear forms. An identical argument shows that an isomorphism of bilinear forms becomes an isomorphism of Lie algebras.

#update_lecture()
= Exercise
== Statement
Show that Lie's lemma holds if $char F > dim V$.
== Solution
We repeat the proof as is until we reach $tr_(W_n)(pi([h,a])) = tr_(W_n) [pi(h),pi(a)] = N lambda ([h,a])$. From there we note that $N <= dim V$ because $W_n$ is a subspace of $dim V$. Thus $N <= char F$ and thus cannot be zero. We thus reach the same conclusion, namely that $lambda ([h,a]) = 0$. From there the proof continues as is and so we get the same result.

= Exercise
== Statement
Consider the following representation of $heis_3 = {p,q,c}$ on $FF[x]$,
$
c dot f(x) = f(x), quad p dot f(x) = d / (d x) f(x), quad q dot f(x) = x f(x)
$
Show that $x^p FF[x]$ is an invariant subspace for $heis_3$ if $char FF = p$, and that $heis_3$ has no weight in $V = FF[x] quo x^p FF[x]$.

Explain why this example shows that Lie's lemma fails over fields of characteristic $p$.
== Solution
Let $f(x) in x^p FF[x]$, then we have $f(x) = x^p dot g(x)$ for some polynomial $g(x)$. We then have
$
c dot f(x) = f(x) in x^p FF[x], \
p dot f(x) = d / (d x) x^p g(x)
= p x^(p-1) g(x) + x^p (d / (d x) g(x)) = x^p d / (d x) g(x) in x^p FF[x], \
q dot f(x) = x^(p+1) g(x) = x^p (x g(x)) in x^p FF[x].
$
and so the subspace $x^p FF[x]$ is preserved.

Now consider the representation of $heis_3$ on $FF[x] quo x^p FF[x]$, assume that it has a weight $lambda : heis_3 -> FF$ and let $f(x)$ be an element with that weight, then we have
$
d / (d x) f(x) = p dot f(x) = lambda(p) f(x)
$
so $f(x)$ is an eigenvalue of the derivative. But in polynomials there is only one such eigenvalue, namely the eigenvalue $0$ over the constant polynomials.
Thus we must have $V_lambda^(heis_3) = span(1)$. But now $1$ is not an eigenvalue of $q$ because $q dot 1 = x$, this contradicts the assumption that this representation had a weight.

Now consider the ideal $frak(h) = span(c, p)$ in $heis_3$, as we saw before we have a weight $lambda(c) = 1, lambda(p) = 0$ with $V_lambda^(frak(h)) = span(1)$. As this span is not invariant under $frak(g)$ this would contradict Lie's lemma if its condition's applied.

= Exercise
== Statement
Prove the following two corollaries of Lie's Theorem.
+ For any representation $pi$ of a solvable Lie algebra $frak(g)$ in a finite-dimensional vector space $V$ over an algebraically closed field of characteristic $0$ there exists a basis of $V$ for which the matrices of $pi(frak(g))$ are upper triangular.
+ Under the same assumption on $V$ and $FF$, a subalgebra of $gl_V$ is solvable iff it is contained in a subalgebra of upper triangular matrices for some basis of $V$.
== Solution
+ We induct on the dimension of $V$. Assume this is true for all dimensions $< n$ and that $V$ is of dimension $n$. By Lie's Theorem there exists a weight $lambda$ such that $V_lambda^(frak(g)) != 0$, so this subspace is invariant under $pi(frak(g))$ and thus we can consider the representation of $frak(g)$ on $V quo V_lambda^(frak(g))$. By inductive hypothesis we know that there is a basis $e_1,...,e_k$ of $V quo V_lambda^(frak(g))$ for which $tilde(pi)(g)$ is upper triangular and we know that $pi(g)$ is diagonal on $V_lambda^(frak(g))$. So for any basis we pick of $V_lambda^(frak(g))$ we get
  $
  pi(X) = mat(lambda(X) I, *; 0, tilde(pi)(X))
  $
  which is upper triangular, which finishes the proof.
+ Assume that a subalgebra $frak(g) seq gl_V$ is solvable, then it has a canonical representation on $V$, by the previous result we know that in some basis that representation consists solely of upper triangular matrices and thus $frak(g)$ is contained within the algebra of upper triangular matrices in some basis. On the other hand assume that it is contained within the algebra of upper triangular matrices, then we know that $frak(g)^((n)) seq frak(b)_d^((d)) = 0$ so $frak(g)$ is solvable.

= Exercise
== Statement
Prove that $[frak(g), frak(g)]$ is a nilpotent Lie algebra if $[frak(g) quo Z(frak(g)), frak(g) quo Z(frak(g))]$ is.
== Solution
First note that $[frak(g) quo Z(frak(g)), frak(g) quo Z(frak(g))] = [frak(g), frak(g)] quo Z(frak(g))$, one can check this very easily. Assume then, that $[frak(g) quo Z(frak(g)), frak(g) quo Z(frak(g))]$ is nilpotent, then for some $n$ we have
$
[x_1, [x_2,[x_3,...[x_(n-1),x_n]...]]] = 0
$
for all $x_i in [ frak(g) quo Z(frak(g)), frak(g) quo Z(frak(g)) ]$. We then must have for any $x_i in [frak(g), frak(g)] quo Z(frak(g))$, that the same equation holds. But since elements in the center will vanish after being put in a bracket then we have for $x_i in [frak(g), frak(g)]$ we have
$
[x_1, [x_2,[x_3,...[x_(n-1),x_n]...]]] = c
$
for some $c in Z(frak(g))$. In other words, we have $[frak(g), frak(g)]^(n) seq Z(frak(g))$ so then
$
[[frak(g), frak(g)], [frak(g), frak(g)]^n]
= [[frak(g), frak(g)], Z(frak(g))] = 0.
$

