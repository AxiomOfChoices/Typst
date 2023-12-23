#import "../../../Templates/monograph.typ": monograph
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#show: doc => monograph(
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
// #let Mink = math.op("Mink")
// #let fu = $frak(U)$
// #let pb() = {pagebreak(weak: true)}

#pagebreak(weak:true)
#outline()

#pagebreak(weak:true)
= Abstract
This thesis aims to loosly cover the subject of geometric flows, and more specifically a variant of the mean curvature flow.
The subject of geometric flows uses results in PDE theory theory, more specifically parabolic PDEs, to gain new insight about Riemannian geometry. 
One of the biggest problems often tackled by mean curvature flows is the Isoperimetric problem. The Isoperimetric problem asks us to classify the spaces that minimize perimeter for a given volume (hence the name) 


#pagebreak(weak:true)
= Acknowledgements
First I would like to thank my supervisor, Professor Pengfei Guan, for his regular assistance both before and after the start of my Masters program. He was always there to help me understand concepts I would otherwise spend weeks grappling with. Secondly, I would like to thank my collaborator, Doctor Joshua Flynn, without whom this project would have never happened. He would always chime in with timely ideas whenever we would get stuck. I would additionally like to thank my two good friends, Sam Zeitler and Bart Syroka for always being there to bounce ideas of or listen to my insane ramblings. 
Finally I would like to thank my family, and especially my mom, for always being there to help and support me whenever I would feel down and lost.

#pagebreak(weak:true)
= Contribution 
This thesis and each chapter within was written solely by myself, with occasional assistance from colleagues regarding phrasing. 
The body of the thesis is largely taken from the paper co-authored by myself and Joshua Flynn.

#pagebreak(weak:true)
= Introuction 
This thesis covers mean 

#pagebreak(weak: true)
= Review of Literature
The field of Geometric Analysis is one vast with techniques and ideas to solve the hardest of problems relating geometric spaces and Partial Differential Equations (PDEs).
One of the most influencial techniques of the last couple of decades has been that of the geometric flow, 

#pagebreak(weak: true)
#bibliography("Thesis.bib")