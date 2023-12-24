// cSpell:ignore frontpage toptitle linebreak middletitle bottomtitle datetime thmrules pagebreak ctheorems
#import "../../../Templates/monograph.typ": style, frontpage, outline_style, chapter_headings, start_outline
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#show: style
#show: doc => frontpage(
  toptitle: [Conformally Induced\ Mean Curvature Flow], 
  name: [Jacob Reznikov 
  #linebreak() 
  Master of Science
  ],
  middletitle: [
      Mathematics and Statistics \
      McGill University \
      Montreal, Quebec, Canada],
  bottomtitle: [
    A thesis submitted to McGill University in partial\ 
    fulfillment of the requirements of the degree of a\ 
    Master of Science
  ],
  info: [#sym.copyright Jacob Reznikov, #datetime.today().display("[year]")],
  doc)
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
#let ov(el) = $overline(g)$

#show: outline_style


#pagebreak(weak:true)
#show: start_outline
#pagebreak(weak:true)
= Abstract
This thesis aims to loosely cover the subject of geometric flows, and more specifically a variant of the mean curvature flow.
The subject of geometric flows uses results in PDE theory theory, more specifically parabolic PDEs, to gain new insight about Riemannian geometry. 

One of the biggest problems often tackled by mean curvature flows is the Isoperimetric problem. The Isoperimetric problem asks us to classify the spaces that minimize perimeter for a given volume (hence the name), the first use of mean curvature flows to attack this problem was due to Huisken in 1984 #cite(<huiskenFlowMeanCurvature1984>) who proved it in case of boundaries of convex domains in Euclidean, and since then there have been attempts to push his methods further. More recently, in 2013, Guan and Li #cite(<guanMeanCurvatureType2013a>) constructed a new normalized flow which allows them to prove the inequality in the case of boundaries of star-shaped domains in Space forms. Shortly after, in 2018, Guan, Li and Wang pushed this flow even further which allowed them to prove the result in a certain class of warped product spaces #cite(<guanVolumePreservingFlow2018>). 

This thesis continues the effort to use such flows, together with my collaborator Joshua Flynn we pushed the flow even further, allowing us to prove the result for far larger class of domains in an even wider class of spaces.


#pagebreak(weak:true)
= Acknowledgements
First I would like to thank my supervisor, Professor Pengfei Guan, for his regular assistance both before and after the start of my Masters program. He was always there to help me understand concepts I would otherwise spend weeks grappling with. Secondly, I would like to thank my collaborator, Doctor Joshua Flynn, without whom this project would have never happened. He would always chime in with timely ideas whenever we would get stuck. I would additionally like to thank my two good friends, Sam Zeitler and Bart Syroka for always being there to bounce ideas of or listen to my insane ramblings. 
Finally I would like to thank my family, and especially my mom, for always being there to help and support me whenever I would feel down and lost.

#pagebreak(weak:true)
= Contribution 
This thesis and each chapter within was written solely by myself, with occasional assistance from colleagues regarding phrasing. 
The body of the thesis is largely taken from the paper co-authored by myself and Joshua Flynn.



#show: chapter_headings
#pagebreak(weak:true)
= Introduction
== Background on the Isoperimetric Problem
This document assumes general knowledge of differential and Riemannian geometry, see #cite(<leeIntroductionSmoothManifolds2012>) and #cite(<leeIntroductionRiemannianManifolds2018>) for great introductions, respectively.

For the rest of this document we will use the following notation, $N$ is an $n+1$ dimensional Riemannian manifold with metric $ov(g)$ within which we have a compact domain $Omega$ with boundary $diff Omega = M$ such that $F : M -> N$ is an embedding making $M$ a Riemannian hypersurface. We then set $g := F^* ov(g)$ to be the induced metric on $M$. We will in general identify $M$ with its image $F(M)$ and use the two interchangeably.

The Isoperimetric

#pagebreak(weak: true)

#bibliography("Thesis.bib")