# Overview

Template for classic long-form thesis. If you're a TI student you can just fill
out `classicthesis-config.tex` and start editing the chapters right away. If
you're a DACS student uncomment the inclusion of `TitlepageDACS` and comment
`TitlepageTI` also comment `DeclarationTI`, as for the DACS template the
declaration of originality is included with the title. For a project report do
the same with `TitlepagePR`.

# Structure

- `Chapters`: Main body of your text lives here.
- `FrontBackmatter`: Contains titlepages, declarations, bibliographies, etc.
  Edit `Abstract.tex`!
- `Graphics`: Contains all non-plot graphics.
- `Plots`: Contains plot files.
- `Tables`: Put your tables here.
- `Data`: Put raw data for your plots here.
- `classicthesis-config`: Edit this file with your information!

# Compilation

You can use `make` to compile the document. If you want to use `glossaries`
uncomment line 12 in `Makefile` to invoke during compilation. `make clean` will
delete temporary files and build dependencies, and `make view` will open the
final PDF using `open`, change to your favorite viewer if needed. By default,
this uses `biber` for the bibliography this can be changed to `biblatex` if
needed.
