#let question_heading(doc) = {
  show heading.where(level: 2) : set text(weight: "medium", style: "italic")
  show heading.where(level: 3) : set text(weight: "medium")

  doc
}