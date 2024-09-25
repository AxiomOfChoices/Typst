#import "/Templates/generic.typ": latex
#import "/Templates/notes.typ": chapter_heading
#import "/Templates/monograph.typ": style, frontpage, outline_style, chapter_headings, start_outline
#import "@preview/ctheorems:1.1.0": *
#import "/Templates/math.typ": *
#import "@preview/cetz:0.2.1"
#import "/Templates/i-figure.typ"
#show: latex
#show: chapter_heading
#show: thmrules
#show: symbol_replacing
#show: equation_references
#show: style
#show math.equation: i-figure.show-equation.with(
  level: 1,
  only-labeled: true,
)
#show ref: i-figure.show-equation-refrences.with(level: 1)
#show: thmrules
#show: outline_style

#show: doc => frontpage(
  toptitle: [Qualifying Exam Notes],
  name: [Jacob Reznikov],
  middletitle: [My notes for studying for the Qualifying exam at MIT in Geometric Analysis under Toby Colding],
  doc,
)
#set page(margin: (x: 1in, top: 1in, bottom: 1in))

= Riemannian Metrics
#proposition("The Fubini-Study Metric")[
  There exists a unique metric on $CC PP^(n)$ such that the map $p : SS^(2n + 1) -> CC PP^(n)$ defined by identifying $CC^n$ with $RR^(2 n)$ acts as an isometry from $(ker p_*)^perp$ to $T CC PP^(n)$.
]
#proof[
  Let $L_lambda$ be the map on $SS^(2n+1)$ acting by multiplication by $lambda in CC^times$, this map acts an isometry on $SS^(2n + 1)$, it preserves fibers over $CC PP^n$, and is transitive over them. Thus it gives us a canonical identification of all horizontal tangent spaces $(ker p_*)_x^perp$ in the same fiber, this identification then defines an inner product on the image on $T_(p(x)) CC PP^n$.
  
  Locally around the point $[Z_0,Z_1,...,Z_n]$ the metric looks like
  $
  d s^2 = (abs(Z)^2 abs(d Z)^2 - (ov(Z) dot d Z)(Z dot d ov(Z))) / abs(Z)^4
  $
]

