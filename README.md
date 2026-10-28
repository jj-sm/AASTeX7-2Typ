# AASTeX7-2Typ

Unofficial Typst port of the AAS Journals' LaTeX class v7 (AASTeX v7).

This template aims to stay as close as possible to the original LaTeX template: it has the same files' purpose, the same sample paper, and the same look (using the preprint2 style by default), but it is written entirely in Typst.

Original repository: [AASJournals/AASTeX7](https://github.com/AASJournals/AASTeX7). Credit goes to the AAS Journals and the original AASTeX authors.

## Requirements

- Typst 0.15+

## How to compile the sample

To compile the sample document, run:

```bash
typst compile --root . sample/sample701.typ
```

## API

The main entry point is `#show: aastex.with(...)`. It accepts the following arguments:

- `title`: Document title (content)
- `shorttitle`: Short title for the running head (content)
- `shortauthors`: Short authors list for the running head (content)
- `authors`: Array of dictionaries. Each dictionary can have:
  - `name`: Author name (content)
  - `orcid`: ORCID ID (string)
  - `affiliations`: Array of affiliation indices (integers) or affiliation strings
  - `email`: Email address (string)
  - `corresponding`: Boolean indicating if this is the corresponding author
- `affiliations`: Array of affiliation strings
- `collaboration`: Optional collaboration name (content)
- `abstract`: Document abstract (content)
- `keywords`: Array of UAT keyword strings (e.g., `("Galaxies (573)", ...)`)
- `received` / `revised` / `accepted` / `submitjournal`: Optional date/journal strings
- `style`: "preprint2" (two columns, default) or "preprint" (one column)
- `bibliography`: Path to the `.bib` file
- `cite-style`: Only `author-year` is supported to match AAS guidelines.

## Unimplemented Features

The following LaTeX constructs do not have a reasonable equivalent in Typst and are not implemented in this port:

- Line numbers
- Track changes (`\added`, `\deleted`)
- `\watermark`
- Interactive figures
