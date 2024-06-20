#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#set pagebreak(weak: true)
#set page(margin: (x: 2cm, top: 2cm, bottom: 2cm), numbering: "1")
#set enum(numbering: "(1)", indent: 1em)
#outline()

#let PSH = math.op("PSH")
#let osc = math.op("osc")
#pagebreak(weak: true)

= Complex Monge-Ampere equations on compact hermitian manifolds
Let $X$ be a compact manifold with $dim_CC = n$, a form $omega_X$ is called a hermition metric on $X$ if
$
omega_x = i sum_(j, k = 1)^n g_(j ov(k)) d z_j and d ov(z)_k
$
and $g_(j ov(k)) (x)$ is positive definite.

Note that
$
omega_X "is Kahler" <=> dif omega_X = 0 <=> (diff g_(j ov(k))) / (diff z_ell) = (diff g_(ell ov(k))) / (diff z_j), quad forall j,k,ell.
$

#theorem[
  Take $f >= 0$ in $L^p
  (X, omega_x^n)$, $p > 1$. Then there exists
  $
  (phi, c) in (PSH(omega_X) sect L^infinity) times (0, infinity)
  $
  solving
  $
  (omega_X + dif dif^c phi)^n = c f omega_X^n.
  $
  
  Moreover,
  + The constant $c > 0$ is unique, $phi$ is also unique if $f >= f_0 > f$.
  + $phi$ is uniformly bounded with $osc_X phi <= A = A(||f||_p,p,x,omega_x)$
  + One can replace $omega_x$ by a semipositive $(1,1)$-form $omega$ which is big.
  + If $f = e^(psi^+ - psi^-)$ where $psi^(plus.minus) in PSH(B omega_x) and C^infinity (Omega)$ where $Omega$ is any Zariski open set, implies that $phi in C^infinity (Omega)$.
]
#remark[
  + If $X$ is Kahler then $f > 0$ and is smooth. This is a theorem by Yau's.
  + If $X$ is non-Kahler then we know by Tosiath-Wenkore also that $f > 0$ and is smooth.
  + The constant $c$ can be computed explicitly when $omega_X$ is Kahler,
    $
    integral_X omega_X^n = integral_X (
      omega_X + dif dif^c phi
    )^n = c integral_X f omega_X^n => c = (integral_X omega_X^n) / (integral_X f omega_X^n).
    $
    The first equality follows from Stoke's theorem by expanding and using $dif omega_X = 0$.
]
