# Overview

Template for a paper-style thesis. This one is more involved than the classic
thesis. The Makefile produces two PDFs, the standalone paper and a longer
classic thesis PDF. If you're a TI student you can just fill out
`personal-config.tex` and start editing the contents right away. If you're a
DACS student, in `ClassicThesis.tex` uncomment the inclusion of `TitlepageDACS`
and comment `TitlepageTI` also comment `DeclarationTI`, as for the DACS
template the declaration of originality is included with the title. For a
project report do the same with `TitlepagePR`.

# Structure

The main contents are split among two folders:

- `PaperContents/` contains the individual sections of your paper.
- `ThesisAppendix/` contains extra information on your thesis like:
    - An extended background section.
    - Additional information on your implementation.
    - Additional experiments and experimental setup.
    - An extended discussion of your results and possibly future work.

Everything else is set/configured in the following files or folders:

- `ClassicThesis.tex`: The main scaffolding for your long-form thesis.
- `Data/`: Put raw data for your plots here.
- `FrontBackmatter/`: Contains titlepages, declarations, bibliographies, etc.
  Edit `Abstract.tex`!
- `Graphics/`: Contains all external graphics (has to be `.pdf`, `.png`, or
  `.jpg`)
- `Tikz/`: Put Tikz/Pgfplots code here. Because most publishers, including
  arXiv, don't accept PDF files, but require the raw TeX code, we don't want to
  compile any Tikz/Pgf graphics in the main document. For Pgf this would mean
  uploading your raw data, which might not be desired. Also, publishers often
  use ancient TeX distributions, barring us from using newer Tikz/Pgf features.
- `TikzTmp/`: Temporary directory for externalized Tikz compilations, contents
  are safe to be removed.
- `Tables/`: Put your tables here.
- `PaperThesis.tex`: The standalone paper.
- `personal-config.tex`: Edit this file with your personal information!
- `classicthesis-config.tex`: This contains the setup for the classicthesis
  package and loads packages for the classic thesis.

Style files (`.sty`) don't have to be edited.

# Compilation

You can use `make` to compile the document. If you want to use `glossaries`
uncomment line 38 in `Makefile` to invoke during compilation. `make clean` will
delete temporary files and build dependencies, and `make view` will open the
final PDFs using `open`, change to your favorite viewer if needed. By default,
this uses `biber` for the bibliography this can be changed to `biblatex` if
needed.

## Makefile

All `make` targets are shown below:

- `all`: calls `figures`, `paper`, and `classic`
- `figures`: Compiles all external Tikz/Pgf files in the `Tikz/` directory into
  standalone PDFs and moves them into the `Graphics/` directory. Tikz/Pgf files
  have to have the `.tex` extension!
- `classic`: Builds the long form thesis `ClassicThesis.pdf` and includes the
  `PaperThesis.pdf` in the first section. Note that this will not rebuild
  `PaperThesis.pdf`, so if there are changes make sure to compile that first.
  The `all` rule will compile `PaperThesis.pdf` first.
- `paper`: Builds the paper section only. Produces `PaperThesis.pdf`.
- `clean`: Removes all auxiliary files.
- `view`: Opens both `ClassicThesis.pdf` and `PaperThesis.pdf` using `open`.
  Change the `PDFVIEWER` variable to use a different program.
- `arxiv`: Some magic... This will create a directory `ax/` and expand
  `PaperThesis.tex` into `ax/main.tex`. This entails inlining all `\include{}`s
  and `\input{}`s. Additionally, this will create and inline a `.bbl` file from
  the cited entries in your bibliography because arXiv does not run `biblatex`
  on your submission. Next, it will look through `Graphics` and copy *only*
  those files that are included in `PaperThesis`. Because arXiv only allows a
  flat folder structure, it will then update the include paths by removing the
  `Graphics/` prefix (e.g. `\includegraphics{Graphics/example}` →
  `\includegraphics{example}`). For this to work, it is important that all of
  your included figures and graphics live inside the `Graphics folder`! For
  more information on TeX submissions to arXiv see
  [https://info.arxiv.org/help/submit_tex.html](https://info.arxiv.org/help/submit_tex.html).
  Once this is done make sure your paper compiles correctly by running
  `pdflatex` on `ax/main.tex` once and checking the output.
