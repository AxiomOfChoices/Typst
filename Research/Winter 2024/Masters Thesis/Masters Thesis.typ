#import "../../../Templates/generic.typ": generic
#import "../../../Templates/notes.typ": chapter_heading
#import "@preview/ctheorems:1.1.0": *
#import "../../../Templates/math.typ": *
#show: doc => generic(title: "Master's Thesis", name: "Jacob Reznikov", doc)
#show: doc => chapter_heading(doc)
#show: thmrules
#let ve = $epsilon$
#let seq = $subset.eq$
// #let Mink = math.op("Mink")
// #let fu = $frak(U)$
// #let pb() = {pagebreak(weak: true)}


