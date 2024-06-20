#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "/Templates/monograph.typ": frontpage
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references

= Simplifications

What we want to show is the following
#conjecture("Cartan-Hadamard")[
  Let $N$ be a hypersurface in a Cartan-Hadamard manifold $M$.
  We have
  $
  Area_M (N) >= Area_(RR^n)(B)
  $
  where $B$ is the ball in $RR^n$ with
  $
  Volume_M (N) = Volume_(RR^n) (B)
  $
]<conj-cartan_hadamard>

We can make a series of simplifications due to @ghomiTotalCurvatureIsoperimetric2021.
#lemma[
  If it is known that
  $
  cal(G)(N) := integral_N sigma_n dif S >= Area_(RR^n) (S^(n-1)) = n omega_n
  $
  for all hypersurfaces surfaces $N$ encompassing an Isoperimetric region, then @conj-cartan_hadamard is true.
]<lem-topological_sigma_n>
#proof[
  @ghomiTotalCurvatureIsoperimetric2021[Page 36].
]

#lemma[
  If it is known that @lem-topological_sigma_n holds for $diff conv (Omega)$ where $conv (Omega)$ is the convex hull of the Isoperimetric region $Omega$, then @lem-topological_sigma_n holds always.
]<lem-topological_sigma_n_convex>
#proof[
  @ghomiTotalCurvatureIsoperimetric2021[Page 36].
]

We now introduce new simplifications.
#lemma[
  In a Cartan-Hadamard manifold, the normal flow with velocity $f = 1$ decreases the value of $integral_N sigma_n dif S$.
]

#lemma[
  For surfaces $N seq B_r (p)$ for some point $p in M$ we have
  $
  cal(G)(N) >= n omega_n + O(r^2)
  $
]<lem-blowup_behaviour>

#pagebreak(weak: true)
#bibliography("refrences.bib")
