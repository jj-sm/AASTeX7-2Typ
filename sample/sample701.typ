#import "/aastex.typ": *
#show: aastex.with(
  title: [AASTeX v7.0.1 Sample article],
  shorttitle: [AASTeX v7.0.1 Sample article],
  shortauthors: [The Terra Mater collaboration],
  authors: (
    (name: "August Muench", orcid: "0000-0003-0666-6367", affiliations: (1, 2), email: "fakeemail1@google.com", corresponding: true),
    (name: "Greg Schwarz", orcid: "0000-0001-8946-5570", affiliations: (3,), email: "fakeemail2@google.com", corresponding: true),
    (name: "Sky Oceania", affiliations: (3,), email: "fakeemail3@google.com", corresponding: true),
    (name: "River Europe", affiliations: (4,), email: "fakeemail4@google.com", corresponding: true),
    (name: "Asia Mountain", orcid: "0000-0000-0000-0003", affiliations: ("Astrosat Post-Doctoral Fellow", 5), email: "fakeemail5@google.com", corresponding: true),
    (name: "Coral Australia", orcid: "0000-0000-0000-0004", affiliations: (6,), email: "fakeemail6@google.com", corresponding: true),
    (name: "Penguin Antarctica", affiliations: (7,), email: "fakeemail7@google.com", corresponding: true),
  ),
  affiliations: (
    "American Astronomical Society \n 1667 K Street NW, Suite 800 \n Washington, DC 20006, USA",
    "AAS Journals Associate Editor-in-Chief",
    "National Optical Astronomy Observatory \n 950 N. Cherry Ave., Tucson, AZ 85719, USA",
    "University of Heidelberg",
    "Tata Institute of Fundamental Research, Department of Astronomy",
    "James Cook University, Department of Physics",
    "Amundsen–Scott South Pole Station",
  ),
  collaboration: "The Terra Mater collaboration",
  received: "February 1, 2025",
  revised: "March 1, 2025",
  accepted: "today",
  submitjournal: "PSJ",
  abstract: [
    This example manuscript is intended to serve as a tutorial and template for authors to use when writing their own AAS Journal articles. The manuscript includes a history of AASTeX and documents the new features in the previous versions as well as the new features in version 7. This manuscript includes many figure and table examples to illustrate these new features.  Information on features not explicitly mentioned in the article can be viewed in the manuscript comments or more extensive online documentation. Authors are welcome replace the text, tables, figures, and bibliography with their own and submit the resulting manuscript to the AAS Journals peer review system.  The first lesson in the tutorial is to remind authors that the AAS Journals, the Astrophysical Journal (ApJ), the Astrophysical Journal Letters (ApJL), the Astronomical Journal (AJ), and  the Planetary Science Journal (PSJ) all have a 250 word limit for the  abstract. The limit is 150 for RNAAS manuscripts. If you exceed this length  the Editorial office will ask you to shorten it. This abstract has 189 words.
  ],
  keywords: ("Galaxies (573)", "Cosmology (343)", "High Energy astrophysics (739)", "Interstellar medium (847)", "Stellar astronomy (1583)", "Solar physics (1476)"),
  style: "preprint2",
  bibliography: "sample/sample701.bib",
)

= A short history of AASTeX

LaTeX\ #footnote{#link("http://www.latex-project.org/")} is a document markup
language that is particularly well suited for the publication of
mathematical and scientific articles #citep("lamport94"). LaTeX\ was written
in 1985 by Leslie Lamport who based it on the TeX\ typesetting language
which itself was created by Donald E. Knuth in 1978.  In 1988 a suite of
LaTeX\ macros were developed to investigate electronic submission and
publication of AAS Journal articles #citep("1989BAAS...21..780H").  Shortly
afterwards, Chris Biemesdefer merged these macros and more into a LaTeX\
2.08 style file called AASTeX.  These early AASTeX\ versions introduced
many common commands and practices that authors take for granted today.
Substantial revisions
were made by Lee Brotzman and Pierre Landau when the package was updated to
v4.0.  AASTeX v5.0, written in 1995 by Arthur Ogawa, upgraded to LaTeX\ 2e
which uses the document class in lieu of a style file.  Other improvements
to version 5 included hypertext support, landscape deluxetables and
improved figure support to facilitate electronic submission.
AASTeX\ v5.2 was released in 2005 and introduced additional graphics
support plus new mark up to identifier astronomical objects, datasets and
facilities.

In 1996 Maxim Markevitch modified the AAS preprint style file, aaspp4.sty,
to closely emulate the very tight, two column style of a typeset
Astrophysical Journal article.  The result was emulateapj.sty. A year
later Alexey Vikhlinin took over development and maintenance#footnote{#link("https://hea-www.harvard.edu/~alexey/emulateapj/")}. In 2001 he
converted emulateapj into a class file in LaTeX\ 2e and in 2003 Vikhlinin
completely rewrote emulateapj based on the APS Journal's REVTEX class.

During this time emulateapj gained growing acceptance in the astronomical
community as it filled an author need to obtain an approximate number of
manuscript pages prior to submission for cost and length estimates. The
tighter typeset also had the added advantage of saving paper when printing
hard copies.




#figure(image("AuthorChargeInfographic.png", width: 100%), caption: [The AAS journals are operated as a nonprofit venture, and author charges fairly recapture costs for the services provided in the publishing process. The chart above breaks down the services that author charges go toward. The AAS Journals' Business Model is outlined in a #link("https://aas.org/posts/news/2023/08/aas-open-access-publishing-model-open-transparent-and-fair")[2023 post].
]) <general>

Even though author publication charges were no longer based on print pages
#footnote{see Section @sec:pubcharge in the Appendix for more details
about how current article costs are calculated. Figure @general shows
how author publication charges are currently spent.} the emulateapj class file
proved to be extremely popular with AAS Journal authors.  An
analysis of submitted LaTeX\ manuscripts in 2015 revealed that $ tilde $30%
either called emulateapj or had a commented emulateapj classfile call
indicating it was used at some stage of the manuscript construction.
Clearly authors wanted to have access to a tightly typeset version of the
article when editing with co-authors and for preprint submissions.

When planning the next AASTeX\ release the popularity of emulateapj played
an important roll in the decision to drop the old base code and adopt and
modify emulateapj for AASTeX\ v6.+.  Those changes brought AASTeX\
inline with what the majority of authors were already using while still
delivering new and improved features.  AASTeX\ v6.0 through v6.31 were
developted by Amy Hendrickson#footnote{#link("https://www.texnology.com/about.htm")}.
The release dates for the AASTeX 6 versions were January 2016 (v6.0),
October 2016 (v6.1), January 2018 (v6.2), June 2019 (v6.3), and March 2020
(v6.3.1), respectively.

AASTeX\'s reliance on REVTeX, specifically v4-1, proved to be problematic when it was superseded in in January 2019. Rather than continue with REVTeX v4-2 as the base package of AASTeX, Aptara#footnote{#link("https://www.aptaracorp.com")} was hired to rewrite AASTeX from scratch while keeping the core functionality in early 2024. This new version, v7.0, was released in January 2025. The first bug fix was release in May 2025 as v7.0.1. Users of v6.3.1 will have little difficulty migrating to this new version with the core difference being that an email address is required for each author in v7+.

The rest of this article provides information and examples on how to create
your own AAS Journal manuscript with v7+.  Special emphasis is placed on
how to use the full potential of AASTeX. Note that some of the examples are commented out in this latex manuscript. The next section describes
the different manuscript styles available.
Section @sec:floats describes table and figure placement.
Specific examples of different tables are provided,  Section
@subsec:tables.
Section @sec:highlight
discusses how to properly highlight text added during revisions.
The last section,
@sec:cite, shows how to recognize software and external data as first
class references in the manuscript bibliography.  An appendix is included
for additional information readers might find useful.
More documentation is embedded in the comments of this LaTeX\ file and in the online documentation at
#link("http://journals.aas.org/authors/aastex.html").

= Manuscript styles <sec:style>

The default style in AASTeX\ v7+ is a tight single column style, e.g. 10
point font, single spaced.  The single column style is very useful for
articles with wide equations. It is also the easiest style to work with
since figures and tables, see Section @sec:floats, will span the
entire page, reducing the need for address float sizing.

To invoke a two column style similar to what is produced in
the published PDF copy use:

 `documentclass[twocolumn]\{aastex701\`}.

 Note that in the two column style figures and tables will only
span one column unless specifically ordered across both with the `*` flag,
e.g.

`begin\{figure*\`} ... `end\{figure*\`},
`begin\{table*\`} ... `end\{table*\`}, and
`begin\{deluxetable*\`} ... `end\{deluxetable*\`}.

 This option is ignored in the `\ onecolumn` style.

All authors should have the `\ linenumbers` style included so that
the compiled PDF has each row numbered in the left margin. Line numbering
is mandatory as it helps reviewers quickly identify locations in the text.

The `\ anonymous` option will prevent the author and affiliations
from being shown in the compiled pdf copy. This option allows the author
to keep this critical information in the latex file but prevent the reviewer
from seeing it during peer review if dual anonymous review (DAR) is requested.
Likewise, acknowledgments and author contributions can also be hidden if placed in the `begin\{acknowledgments\`} ... `end\{acknowledgments\`} and `begin\{contribution\`} ... `end\{contribution\`} environments. The use of this option is highly recommended for PSJ submissions. Advice for anonymizing your manuscript for DAR is provided at
#link("https://journals.aas.org/manuscript-preparation/#dar").

Another reason to use the `begin\{acknowledgments\`} ... `end\{acknowledgments\`} and `begin\{contribution\`} ... `end\{contribution\`} environments is that the word counter in our peer review system will *not* count the contents of these environments. If authors put acknowledgments and contribution text in other locations, these words will be counted and authors may be overcharged on their author publication charges.

Multiple style options are allowed, e.g.

 `documentclass[linenumbers,trackchanges,anonymous]\{aastex701\`}.

= Floats <sec:floats>

Floats are non-text items that generally cannot be split over a page.  They also have captions and can be numbered for reference.  Primarily these are figures and tables but authors can define their own. LaTeX\ tries to place a float where indicated in the manuscript but will move it later if there is not enough room at that location, hence the term "float".

Authors are encouraged to embed their tables and figures within the text as they are mentioned.  Editors and the vast majority of referees find it much easier to read a manuscript with embedded figures and tables.

Depending on the number of floats and the particular amount of text and equations present in a manuscript the ultimate location of any specific float can be hard to predict prior to compilation. It is recommended that authors *not* spend significant time trying to get float placement perfect for peer review.  The AAS Journal's publisher has sophisticated typesetting software that will produce the optimal layout during production.

Note that authors of Research Notes are only allowed one float, either one table or one figure.

For authors that do want to take the time to optimize the locations of their floats there are some techniques that can be used.  The simplest solution is to place a float earlier in the text to get the position right but this option will break down if the manuscript is altered.  A better method is to force LaTeX\ to place a float in a general area with the use of the optional `[placement specifier]` parameter for figures and tables. This parameter goes after `\begin{figure}`, `\begin{table}`, and `\begin{deluxetable}`.  The main arguments the specifier takes are "h", "t", "b", and "!".  These tell LaTeX\ to place the float here (or as close as possible to this location as possible), at the top of the page, and at the bottom of the page.  The last argument, "!", tells LaTeX\ to override its internal method of calculating the float position.  A sequence of rules can be created by using multiple arguments.  For example, `\begin{figure}[htb!]` tells LaTeX\ to try the current location first, then the top of the page and finally the bottom of the page without regard to what it thinks the proper position should be.  Many of the tables and figures in this article use a placement specifier to set their positions.

Note that the LaTeX\ `\ tabular` environment is not a float.  Only when a `\ tabular` is surrounded by `begin\{table\`} ...  `end\{table\`} is it a true float and the rules and suggestions above apply.

In AASTeX all deluxetables are float tables and thus if they are longer than a page will spill off the bottom. Long deluxetables should begin with the `startlongtable` command. This initiates a longtable environment.  Authors might have to use `clearpage` to isolate a long table or optimally place it within the surrounding text.

== Tables <subsec:tables>

Tables can be constructed with LaTeX's standard table environment or the AASTeX's deluxetable environment. The deluxetable construct handles long tables better but has a larger overhead due to the greater amount of defined mark up used to set up and manipulate the table structure.  The choice of which to use is up to the author.  Examples of both environments are used in this manuscript.

Tables longer than 200 data lines and complex tables should only have a short example table with the full data set available in the machine readable format.  The machine readable table will be available in the HTML version of the article with just a short example in the PDF. Authors are required to indicate in the table comments that the data is in machine readable format in the full article.  Authors are encouraged to create their own machine readable tables using the online tool at #link("http://authortools.aas.org/MRT/upload.html").

AASTeX\ v6 introduced five new table features that were designed to make
table construction easier and the resulting display better for AAS Journal
authors. The items are:


+  Declaring math mode in specific columns,
+  Column decimal alignment,
+  Automatic column header numbering,
+  Hiding columns, and
+  Splitting wide tables into two or three parts.


Full details on how to create each of these special table types are given in the guidelines at #link("http://journals.aas.org/authors/aastex.html").

=== Extremely wide tables

Since the AAS Journals are now all electronic with no print version there is no reason why tables can not be as wide as authors need them to be. For wide tables, the full table will almost always be available in machine readable format with just an example in the article but how is an example created for a wide table?

There are two ways to create examples for wide tabular data sets. The first is to to break a table into two or three components so that it flows down a page by invoking a new table type, splittabular or splitdeluxetable. Within these tables a new `"B"` column separator is introduced.  Much like the vertical bar option, $|$, that produces a vertical table lines the new `"B"` separator indicates where to break a table.  Up to two `"B"` s may be included.

Table 1 shows how to split a wide deluxetable into three parts with
the `splitdeluxetable` command.  The `colnumbers`
option is on to show how the automatic column numbering carries through the
second table component.



The second way is to create a "descriptive" table instead. This type of table only provides information about the columns rather than the data itself. Table 2 shows an example of this type of table using the same columns as in Table 1. Since these types of tables always have a machine readable component, this table uses the `\ digitalasset`\ command to highlight this fact.



== Figures<subsec:figures>

Authors can include a wide number of different graphics with their articles.
These range from general figures all authors are familiar with
to new enhanced graphics that can only be fully experienced in HTML.  The
later include figure sets, animations and interactive figures.  All
enhanced graphics require a static two dimensional representation in the
manuscript to serve as the example for the reader. All figures should
include detailed and descriptive captions.  These captions are absolutely
critical for readers for whom the enhanced figure is inaccessible either
due to a disability or offline access.  This portion of the article
provides examples for setting up all these types in with the latest version
of AASTeX.

== General figures<subsec:general>

AASTeX\ has a `plotone` command to display a figure consisting
of one figure file.  Figure @general is an example which shows
how AAS Publishing spends author publication charges. For a general figure
consisting of two figure files the `plottwo` command can be
used to position the two image files side by side.

Both `plotone` and `plottwo` take a
`caption` and an optional `figurenum` command to
specify the figure number#footnote{It is better to not use
`figurenum` and let LaTeX\ auto-increment all the figures. If you
do use this command you need to mark all of them accordingly.}.  Each is
based on the `\ graphicx` package command,
`includegraphics`.  Authors are welcome to use
`includegraphics` along with its optional arguments that control
the height, width, scale, and position angle of a file within the figure.
More information on the full usage of `includegraphics` can be
found at
#link("https://en.wikibooks.org/wiki/LaTeX/Importing\_Graphics\#Including\_graphics").

== Enhanced graphics

Enhanced graphics have an example figure to serve as an example for the
reader and the full graphical item available in the published HTML article.
This includes Figure sets, animations, and interactive figures. The
Astronomy Image Explorer (#link("http://www.astroexplorer.org/")) provides
access to all the figures published in the AAS Journals since they offered
an electronic version which was in the mid 1990s. You can filter image
searches by specific terms, year, journal, or type. The type filter is
particularly useful for finding all published enhanced graphics. As of
August 2024 there are over 5600 videos, 2200 figure sets, and 200 interactive
figures. The next sections describe how to include these types of graphics
in your own manuscripts.

= Revision tracking and color highlighting <sec:highlight>

The `{<text>\`} command should be used to highlight new text in bold for revised manuscripts. To activate this command, the `\ trackchanges` option must be used in the `documentclass` call.  When compiled this will produce the marked text in bold font. Take out the `\ trackchanges` option if you want the bold to disappear.

{This text was specifically added to feature this reborn functionality. Notice how the bold goes away when you remove the 'trackfeatures' option.}

= Software and third party data repository citations <sec:cite>

The AAS Journals would like to encourage authors to change software and
third party data repository references from the current standard of a
footnote to a first class citation in the bibliography.  As a bibliographic
citation these important references will be more easily captured and credit
will be given to the appropriate people.

The first step to making this happen is to have the data or software in
a long term repository that has made these items available via a persistent
identifier like a Digital Object Identifier (DOI).  A list of repositories
that satisfy this criteria plus each one's pros and cons are given at
#link("https://github.com/AASJournals/Tutorials/tree/master/Repositories").

In the bibliography the format for data or code follows this format:

 author year, title, version, publisher, prefix:identifier

#citet("2015ApJ...805...23C") provides a example of how the citation in the
article references the external code at
#link("https://doi.org/10.5281/zenodo.15991")[10.5281/zenodo.15991].  Unfortunately, bibtex does
not have specific bibtex entries for these types of references so the
`@misc` type should be used.  The Repository tutorial explains how to
code the `@misc` type correctly.  The most recent .bst file, aasjournalv7.bst, will output bibtex `@misc` type properly.

Authors can also use the website #link("https://www.doi2bib.org/") to create a BIBTeX entry for any DOI. Please check the output from this site carefully as its output is only as good as the DOI metadata. Some DOI creators do not provide enough metadata to construct an adequate citation.


#acknowledgments[
We thank all the people that have made this AASTeX what it is today.  This
includes but not limited to Bob Hanisch, Chris Biemesderfer, Lee Brotzman,
Pierre Landau, Arthur Ogawa, Maxim Markevitch, Alexey Vikhlinin and Amy
Hendrickson. Also special thanks to David Hogg and Daniel Foreman-Mackey
for the new `\ modern` style design. Considerable help was provided via bug
reports and hacks from numerous people including Patricio Cubillos, Alex
Drlica-Wagner, Sean Lake, Michele Bannister, Peter Williams, Jonathan
Gagne, Arthur Adams, Nicholas Wogan, Aaron Pearlman, Jeff Mangum, Mark Durre, Joel Ong, and Stephen Thorp.
]

#contribution[


All authors contributed equally to the Terra Mater collaboration.












]









#facilities("HST(STIS), Swift(XRT and UVOT), AAVSO, CTIO:1.3m, CTIO:1.5m, CXO")




software{astropy #citep("2013A&A...558A..33A,2018AJ....156..123A,2022ApJ...935..167A"),
          Cloudy #citep("2013RMxAA..49..137F"),
          Source Extractor #citep("1996A&AS..117..393B")
          }









#show: appendix

= Appendix information

Appendices can be broken into separate sections just like in the main text.
The only difference is that each appendix section is indexed by a letter
(A, B, C, etc.) instead of a number.  Likewise numbered equations have
the section letter appended.  Here is an equation as an example.
$
I = (1)/(1 + d_{1)^{P (1 + d_{2} )}}
$
Appendix tables and figures should not be numbered like equations. Instead
they should continue the sequence from the main article body.

= Author publication charges <sec:pubcharge>

In April 2011 the traditional way of calculating author charges based on
the number of printed pages was changed.  The reason for the change
was due to a recognition of the growing number of article items that could not
be represented in print. Now author charges are determined by a number of
digital "quanta".  A single quantum is defined as 350 words, one figure, one table,
and one digital asset.  For the latter this includes machine readable
tables, data behind a figure, figure sets, animations, and interactive figures.  The current cost
for the different quanta types is available at
#link("https://journals.aas.org/article-charges-and-copyright/#author_publication_charges").
Authors may use the ApJL length calculator to get a `rough` estimate of
the number of word and float quanta in their manuscript. The calculator
is located at #link("https://authortools.aas.org/ApJL/betacountwords.html").

= Rotating tables <sec:rotate>

To place a single page table in a landscape mode start the table portion with `begin\{rotatetable\`} and end with `end\{rotatetable\`}.

Tables that exceed a print page take a slightly different environment since both rotation and long table printing are required. In these cases start with `begin\{longrotatetable\`} and end with `end\{longrotatetable\`}. The `movetabledown` command can be used to help center extremely wide, landscape tables. The command `movetabledown=1in` will move any rotated table down 1 inch.

A handy "cheat sheet" that provides the necessary LaTeX\ to produce 17
different types of tables is available at #link("http://journals.aas.org/authors/aastex/aasguide.html#table_cheat_sheet").

= Using Chinese, Japanese, and Korean characters

Authors have the option to include names in Chinese, Japanese, or Korean (CJK)
characters in addition to the English name. The names will be displayed
in parentheses after the English name. The way to do this in AASTeX is to
use the CJK package available at #link("https://ctan.org/pkg/cjk?lang=en").
Further details on how to implement this and solutions for common problems,
please go to #link("https://journals.aas.org/nonroman/").









{}
