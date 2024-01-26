#let latex(
  doc
) = {
set page(margin: (x: 2cm, top: 4cm, bottom: 2cm),
header-ascent: 18%)
set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
set text(font: "New Computer Modern", size: 12pt)
show raw: set text(font: "New Computer Modern Mono")
show par: set block(spacing: 0.55em)
show heading: set block(above: 0.9em, below: 0.7em)

doc
}

#let header(
  title: none,
  name: none,
  doc
) = {
set page(header: [
  #text(name) #h(1fr) *#text(size: 18pt,title)* #h(1fr) #datetime.today().display("[month repr:long] [day padding:none], [year]")
  #v(5pt, weak: true)
  #line(length: 100%, stroke: 0.5pt)
],
)
doc
}
