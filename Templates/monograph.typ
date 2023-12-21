#let monograph(
  toptitle: none,
  name: none,
  middletitle: none,
  bottomtitle: none,
  info: none,
  doc
) = {
set page(margin: (x: 2.5cm, top: 4cm, bottom: 4.5cm))
set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
set text(font: "New Computer Modern", size: 12pt)
show raw: set text(font: "New Computer Modern Mono")
show par: set block(spacing: 0.55em)
show heading: set block(above: 0.9em, below: 0.7em)

v(10%)
align(center)[
#text(smallcaps(toptitle), weight: "bold", size: 20pt)
#v(10%)
#name
#v(10%)
#middletitle
#v(5%)
#datetime.today().display("[month repr:long] [day padding:none], [year]")
#v(5%)
#bottomtitle
#v(10%)
#info
]

doc
}