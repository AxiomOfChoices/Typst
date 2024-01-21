#import "@preview/outrageous:0.1.0"


#let style(doc) = {
  show heading.where(level: 1): set text(size: 24pt)
  show heading.where(level: 2): set text(size: 18pt)
  show heading.where(level: 3): set text(size: 18pt)
  set text(size: 12pt)
  show heading: set block(above: 0.9em, below: 1em)

  
  doc
}

#let start_outline(doc) = {
  outline()
  set page(numbering: "i")
  counter(page).update(1)

  doc
}

#let chapter_headings(doc) = {
  set heading(numbering: "1.1")
  set page(numbering: "1")
  counter(page).update(1)

  show heading.where(level: 1): it => { 
  if it.numbering == "1.1" {
  [
    #set text(size: 24pt)
    Chapter #counter(heading).display() #block(it.body) 
  ]
  } else {
    it
  }
  }

  doc
}

#let outline_style(doc) = {
  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.typst,
    fill: (none, none),
  )

  show outline.entry: it => {
    if it.element.numbering == "1.1" {
      show outline.entry: outrageous.show-entry.with(
      // the typst preset retains the normal Typst appearance
      ..outrageous.presets.typst,
        // we only override a few things:
        // level-1 entries are italic, all others keep their font style
      font-weight: ("bold", auto),
      // no fill for level-1 entries, a thin gray line for all deeper levels
      fill: (none, line(length: 100%, stroke: gray + .5pt)),
      )
      it
    }
    else {
      it
    }
  }
  set outline(indent: auto)

  doc
}


#let frontpage(
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

pagebreak(weak: true)
doc
}
