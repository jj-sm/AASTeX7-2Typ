// Unofficial Typst port of the AAS Journals' LaTeX class v7 (AASTeX v7)
// API:
// #show: aastex.with(
//   title: [...],
//   shorttitle: [...],
//   shortauthors: [...],
//   authors: (
//     (name: [...], orcid: "...", affiliations: (1, 2), email: "...", corresponding: true),
//   ),
//   affiliations: (
//     [...],
//     [...],
//   ),
//   collaboration: [...],
//   abstract: [...],
//   keywords: ("Galaxies (573)", ...),
//   received: "...",
//   revised: "...",
//   accepted: "...",
//   submitjournal: "...",
//   style: "preprint2", // or "preprint"
//   bibliography: "...", // path to bib
//   cite-style: "author-year",
// )

#let _render_refs(path, cite-style, columns) = {
  let bib = {
    show bibliography: it => {
      set text(size: 9pt)
      set par(justify: false, first-line-indent: 0pt, leading: 0.45em, spacing: 0.45em)
      show block: b => {
        if type(b.body) == content and repr(b.body.func()) == "pdf-marker-tag" {
          pad(left: 1em, top: 0.1em, bottom: 0.1em, par(first-line-indent: (amount: -1em, all: true), b.body))
        } else {
          b
        }
      }
      it
    }
    bibliography(path, title: "References", style: "styles/aasjournal.csl")
  }
  bib
}

#let link-color = rgb("#3d3d9e")
#let base-size = 10pt

#let _refs-config = state("uc-refs-config", none)

#let aastex(
  title: none,
  shorttitle: none,
  shortauthors: none,
  authors: (),
  affiliations: (),
  collaboration: none,
  abstract: none,
  keywords: (),
  received: none,
  revised: none,
  accepted: none,
  submitjournal: none,
  style: "preprint2",
  bibliography: none,
  cite-style: "author-year",
  body,
) = {
  assert(style in ("preprint2", "preprint"), message: "style must be preprint2 or preprint")

  set document(title: title, author: authors.map(a => if type(a.name) == str { a.name } else { "" }))
  _refs-config.update((path: bibliography, cite-style: cite-style))

  set page(
    paper: "us-letter",
    margin: (x: 0.75in, top: 0.85in, bottom: 0.85in),
    columns: if style == "preprint2" { 2 } else { 1 },
    header-ascent: 35%,
    header: context {
      let p = counter(page).get().first()
      if p == 1 { return }
      let head = if calc.even(p) { shortauthors } else { shorttitle }
      if head == none { return }
      block(width: 100%, stroke: (bottom: 0.4pt), inset: (bottom: 4pt), grid(
        columns: (1fr, auto, 1fr),
        align: (left, center, right),
        if calc.even(p) [#p], smallcaps(head), if calc.odd(p) [#p],
      ))
    },
  )
  if style == "preprint2" {
    set columns(gutter: 0.3in)
  }

  set text(font: "New Computer Modern", size: base-size, lang: "en")
  set smartquote(quotes: ("“", "”"))
  set par(justify: true, leading: 0.55em, spacing: 0.55em, first-line-indent: (amount: 1.5em, all: true))

  set footnote.entry(separator: none, indent: 0pt)
  show footnote.entry: it => {
    let loc = it.note.location()
    let num = numbering(it.note.numbering, ..counter(footnote).at(loc))
    set par(first-line-indent: 0pt)
    block(above: 0.4em, below: 0.2em, text(size: 8pt)[#super[#num] #it.note.body])
  }

  set heading(numbering: "1.1.")
  show heading: it => {
    let sz = if it.level >= 3 { 10pt } else { base-size }
    let num-sz = if it.level == 1 or it.level >= 3 { 10pt } else { base-size }
    let num = if it.numbering != none {
      text(size: num-sz, style: "normal", counter(heading).display(it.numbering)) + h(0.4em)
    }
    let title = if it.level == 1 { smallcaps(it.body) } else { emph(it.body) }
    set text(size: sz, weight: "regular")
    set par(first-line-indent: 0pt)
    block(width: 100%, above: 1.2em, below: 0.8em, align(center, num + title))
  }

  set math.equation(numbering: "(1)")
  show ref: it => {
    let el = it.element
    if el == none or el.func() != math.equation { return it }
    let loc = el.location()
    let eq = counter(math.equation).at(loc).first()
    let n = if type(el.numbering) == function {
      numbering("A", counter(heading).at(loc).first()) + str(eq)
    } else { str(eq) }
    link(loc, n)
  }
  show math.equation.where(block: true): set block(above: 0.8em, below: 0.8em)
  show figure: set block(above: 1em, below: 1em)
  show figure.where(kind: image): set figure(supplement: "Figure", placement: auto)
  show figure.where(kind: table): set figure(supplement: "Table")
  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption: it => context {
    if it.numbering == none or it.supplement == none { return align(center, text(size: 9pt, it.body)) }
    let cap = text(size: 9pt)[*#it.supplement #it.counter.display(it.numbering).* #it.body]
    layout(size => {
      if measure(cap).width <= size.width {
        align(center, cap)
      } else {
        align(left, par(justify: true, first-line-indent: 0pt, leading: 0.48em, cap))
      }
    })
  }

  show link: set text(fill: link-color)
  show cite: set text(fill: link-color)
  show ref: set text(fill: link-color)

  // Front matter block
  place(top, scope: "parent", float: true, {
    set par(justify: false, first-line-indent: 0pt)

    // Notes block
    block(width: 100%, text(size: 8pt)[
      #if submitjournal != none [
        *Draft version #datetime.today().display("[month repr:long] [day], [year]")* \
        Typeset using Typst preprint2 style in AASTeX7-2Typ \
        Submitted to #submitjournal
      ] else [
        Typeset using Typst preprint2 style in AASTeX7-2Typ
      ]
    ])

    v(0.5in)

    align(center, text(size: 14pt, weight: "bold", title))

    v(0.3in)

    // Authors
    let author-lines = ()
    let current-emails = ()
    for a in authors {
      let name-part = if "orcid" in a and a.orcid != none {
        link("https://orcid.org/" + a.orcid)[#a.name#h(0.5mm)#box(
            image("sample/orcid-ID.png", height: 0.8em),
            baseline: 10%,
          )]
      } else {
        a.name
      }

      let affil-marks = ()
      if "affiliations" in a and a.affiliations != none {
        for aff in a.affiliations {
          if type(aff) == int {
            affil-marks.push(str(aff))
          } else if type(aff) == str {
            // Find index of string in affiliations array
            let idx = affiliations.position(x => x == aff)
            if idx != none {
              affil-marks.push(str(idx + 1))
            } else {
              affil-marks.push(aff)
            }
          }
        }
      }

      if affil-marks.len() > 0 {
        name-part += super(affil-marks.join(","))
      }

      if "corresponding" in a and a.corresponding and "email" in a and a.email != none {
        name-part += footnote(a.email)
      }

      author-lines.push(name-part)
    }

    align(center, text(size: 11pt, author-lines.join([, ])))

    if collaboration != none {
      v(0.1in)
      align(center, text(size: 11pt, collaboration))
    }

    v(0.2in)

    // Affiliations
    if affiliations.len() > 0 {
      set text(size: 9pt, style: "italic")
      for (i, aff) in affiliations.enumerate() {
        align(center)[#super(str(i + 1))#aff]
      }
    }

    v(0.2in)

    if abstract != none {
      block(width: 100%, stroke: (top: 0.5pt, bottom: 0.5pt), inset: (top: 10pt, bottom: 10pt))[
        #set par(first-line-indent: 1.5em)
        #align(center, text(weight: "bold", "Abstract"))
        #v(0.5em)
        #abstract

        #if keywords.len() > 0 [
          #v(0.5em)
          #par(first-line-indent: 0pt, hanging-indent: 1.5em)[_Keywords:_ #keywords.join(", ")]
        ]
      ]
    }
    v(0.2in)
  })

  body

  if bibliography != none {
    context if query(<uc-refs-here>).len() == 0 {
      _render_refs(bibliography, cite-style, 2)
    }
  }
}

#let references-here() = {
  [#metadata("uc-refs-here") <uc-refs-here>]
  context {
    let c = _refs-config.get()
    if c != none and c.path != none {
      _render_refs(c.path, c.cite-style, 2)
    }
  }
}

// Helpers
#let _labelled(label, items) = context block(above: 0.8em, below: 0.8em)[
  #text(size: 10pt, style: "italic")[#label:] #items.pos().join(", ")
]
#let facilities(..items) = _labelled("Facilities", items)
#let software(..items) = _labelled("Software", items)
#let dataset(..items) = _labelled("Data Used", items)

#let acknowledgments(body) = {
  heading(level: 1, numbering: none)["Acknowledgments"]
  body
}

#let contribution(body) = {
  heading(level: 1, numbering: none)["Author contributions"]
  body
}

#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1.")
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    it
  }
  set math.equation(numbering: n => {
    context {
      let h = counter(heading).get().first()
      "(" + numbering("A", h) + str(n) + ")"
    }
  })
  context block(sticky: true, width: 100%, above: 1.5em, below: 1em, align(center, smallcaps("Appendix")))
  body
}

// Table helpers
#let headgroup(body) = (is-headgroup: true, body: body)
#let deluxetable(caption: none, columns: (), header: (), rows: (), comments: none, wide: false) = {
  let processed-rows = ()
  for row in rows {
    if type(row) == dictionary and "is-headgroup" in row {
      processed-rows.push(table.cell(colspan: columns.len(), align: center, row.body))
      processed-rows.push(table.hline(stroke: 0.5pt))
    } else if type(row) == array {
      processed-rows += row
    } else {
      processed-rows.push(row)
    }
  }

  let aligns = columns.map(c => if type(c) == alignment { c } else {
    (l: left, c: center, r: right).at(c, default: center)
  })
  let raw-table = table(
    columns: columns.len(),
    align: aligns,
    inset: (x: 5pt, y: 3pt),
    stroke: none,
    table.hline(stroke: 0.6pt),
    ..header,
    table.hline(stroke: 0.5pt),
    ..processed-rows,
    table.hline(stroke: 0.6pt)
  )
  let styled-table = text(size: 9pt, box(stroke: (top: 0.6pt), inset: (top: 1.5pt), raw-table))

  let content = if comments == none {
    styled-table
  } else {
    layout(size => context {
      let tw = calc.min(measure(styled-table).width, size.width)
      let note-prefix = smallcaps("Note") + [—]
      block(width: if tw > 0pt { tw } else { 100% })[
        #align(center, styled-table)
        #v(2pt)
        #set text(size: 9pt)
        #set par(justify: true, first-line-indent: 0pt, hanging-indent: 6pt, leading: 0.45em)
        #align(left)[#note-prefix#comments]
      ]
    })
  }

  if wide {
    figure(kind: table, caption: caption, placement: top, scope: "parent", content)
  } else {
    figure(kind: table, caption: caption, content)
  }
}

#let object(name, id: none) = link(
  "https://simbad.cds.unistra.fr/simbad/sim-id?Ident=" + if id == none { name } else { id },
  name,
)

// Figures
#let fig(img, width: 100%, caption: none) = box(width: width, {
  set align(center)
  block(width: 100%, img)
  if caption != none {
    v(0.3em)
    text(size: 9pt, caption)
  }
})
#let gridline(..figs) = block(width: 100%, align(center, stack(dir: ltr, spacing: 2em, ..figs.pos())))

// Citations
#let citet(key) = {
  if type(key) == str and "," in key {
    return key.split(",").map(k => cite(label(k.trim()), form: "prose")).join([, ])
  }
  let l = if type(key) == str { label(key) } else { key }
  cite(l, form: "prose")
}

#let citep(key) = {
  if type(key) == str and "," in key {
    return key.split(",").map(k => cite(label(k.trim()), form: "normal")).join([, ])
  }
  let l = if type(key) == str { label(key) } else { key }
  cite(l, form: "normal")
}
