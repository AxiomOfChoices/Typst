#show ref: it => {
  if it.element == none {
    return it
  }
  if it.element.func() != figure {
    return it
  }
  if it.element.kind != math.equation {
    return it
  }
  if it.element.body == none {
    return it
  }
  if it.element.body.func() != metadata {
    return it
  }
  
  let num = numbering(
    if type(it.element.numbering) == str {
      // Trim numbering pattern of prefix and suffix characters.
      let counting-symbols = (
        "1",
        "a",
        "A",
        "i",
        "I",
        "一",
        "壹",
        "あ",
        "い",
        "ア",
        "イ",
        "א",
        "가",
        "ㄱ",
        "*",
      )
      let prefix-end = it.element.numbering.codepoints().position(c => c in counting-symbols)
      let suffix-start = it.element.numbering.codepoints().rev().position(c => c in counting-symbols)
      it.element.numbering.slice(
        prefix-end,
        if suffix-start == 0 {
          none
        } else {
          -suffix-start
        },
      )
    } else {
      it.element.numbering
    },
    ..it.element.body.value,
  )
  
  let supplement = if it.supplement == auto {
    it.element.supplement
  } else {
    it.supplement
  }
  
  link(it.element.location(), [#supplement~#num])
}

#show math.equation.where(block: true): it => {
  if it.numbering == none or numbering(it.numbering, 1) == none {
    return it
  }
  
  // Main equation number.
  let number = counter(math.equation).get()
  
  // Extract lines and trim spaces.
  let lines = if it.body.has("children") {
    it.body.children.split(linebreak())
  } else {
    ((it.body,),)
  }
  
  // Trim spaces at begin and end of line.
  let lines = lines.map(line => {
    if line.first() == [ ] and line.last() == [ ] {
      line.slice(1, -1)
    } else if line.first() == [ ] {
      line.slice(1)
    } else if line.last() == [ ] {
      line.slice(0, -1)
    } else {
      line
    }
  })
  
  // Replace fake labels with real labels.
  let lines = lines.enumerate().map(((i, line)) => {
    let last = line.last()
    if last.func() == raw and last.lang == "typc" and last.text.match(
      regex("<.+>"),
    ) != none {
      // We use a figure with kind "equation" to make the sub-equation
      // referenceable with the correct supplement. The numbering is stored
      // in the figure body as metadata, as a counter would only show a
      // single number.
      let _ = if line.at(-2, default: none) == [ ] {
        line.remove(-2)
      }
      line.at(-1) = [#figure(
          metadata(number + if lines.len() > 1 {
            (i + 1,)
          }),
          kind: math.equation,
          outlined: false,
          numbering: it.numbering,
        )#label(last.text.slice(1, -1))]
    }
    line
  }).map(array.join)
  
  // Resolve text direction.
  let text-dir = if text.dir == auto {
    if text.lang in (
      "ar",
      "dv",
      "fa",
      "he",
      "ks",
      "pa",
      "ps",
      "sd",
      "ug",
      "ur",
      "yi",
    ) {
      rtl
    } else {
      ltr
    }
  } else {
    text.dir
  }
  
  // Resolve number position in x-direction.
  let number-pos = if it.number-align.x in (left, right) {
    it.number-align.x
  } else if text-dir == ltr {
    if it.number-align.x == start {
      left
    } else {
      right
    }
  } else if text-dir == rtl {
    if it.number-align.x == start {
      right
    } else {
      left
    }
  }
  
  // Location of equation block.
  let x-start = here().position().x
  
  layout(bounds => {
    // Add numbers to the equation body, so that they are aligned
    // at their respective baselines. They are wrapped in a zero-width box
    // to not mess with the center alignment.
    let body = lines.enumerate().map(((i, line)) => {
      let num = numbering(
        it.numbering,
        ..(
          number + if lines.len() > 1 {
            (i + 1,)
          }
        ),
      )
      line + box(
        width: 0pt,
        context {
          move(
            dx: x-start - here().position().x + if number-pos == right {
              bounds.width
            },
            align(number-pos, box(width: measure(num).width, num)),
          )
        },
      )
    }).join(linebreak())
    
    let max-num-width = if lines.len() == 1 {
      measure(numbering(it.numbering, ..number)).width
    } else {
      calc.max(..for i in range(lines.len()) {
        (
          measure(
            numbering(
              it.numbering,
              ..(
                number + if lines.len() > 1 {
                  (i + 1,)
                }
              ),
            ),
          ).width,
        )
      })
    }
    
    // Fake numbering taking up space and add spacing.
    let pad-key = if align.alignment.x == center {
      "x"
    } else if number-pos == left {
      "left"
    } else {
      "right"
    }
    let pad-arg = ((pad-key): max-num-width)
    
    // Step back counter to correct for additional equation.
    counter(math.equation).update(n => n - 1)
    pad(..pad-arg, math.equation(numbering: _ => none, block: true, body))
  })
}

#set page(width: 5cm, height: auto)
#set math.equation(numbering: "(1.1)")

We have
$ a + b &= c #<first> \
        &= 1, $
and
$
d + e &= f \
&= g \
&= 2,
$ <outer>
and
$ h = 3. $

See @first and @outer.
