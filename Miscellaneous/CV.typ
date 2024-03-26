#let name = "Jacob Reznikov"
#set document(
  title: "Curriculum Vitae", author: name, keywords: ("Mathematics", "Analysis", "Geometry", "Geometric Analysis"),
)
#set text(size: 11pt, font: ("EB Garamond", "Tex Gyre Adventor"))
#set page(margin: (x: 1.0in, y: 1.0in), width: 7.5in, height: 9.0in)
#set par(first-line-indent: 0cm, leading: (0.9 * 0.65em), justify: true)

#let tab_width = 1.7cm
#let list_spacing = 1em
#let title(it) = text(weight: "bold", size: 25pt)[#it]

#set list(marker: [], body-indent: 0pt, tight: false, spacing: list_spacing)
#set terms(separator: context(h(1em, weak: true)))

#let tabbed_list = table.with(
  inset: 0pt, column-gutter: 1em, row-gutter: 1em, stroke: none, columns: 2,
)

#let date = datetime.today()
#let month_year_date = date.display("[month repr:long] [year]")

#title(name)
#v(1em)
#table(
  columns: 2, stroke: none, inset: 0pt, block(width: 70%)[
    Department of Mathematics\
    McGill University
  ], block(
    width: auto,
  )[
    #set align(end)
    #link("mailto:yakov.reznikov@mail.mcgill.ca")[yakov.reznikov\@mail.mcgill.ca]\
    \+1~514~443~4196\
    // TODO: INSERT WEBSITE LINK HERE
  ],
)

= Education
