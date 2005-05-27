\name{read.eisen}
\alias{read.eisen}
\title{Read expression data from a file formatted for Eisen clustering}
\description{
  The input for Eisen-clustering is a slight variation of a tab 
delimited file. This method reads the expression data from such files as 
a matrix and provides optional additional information on the experiments 
as attributes.
}
\usage{
    read.eisen(file,sep="\t",dec=".", format.check = TRUE)
}
\arguments{
  \item{file}{The relative or absolute path to the file to be read, as 
internally forwarded to the read.table function. }
  \item{sep}{Separator of fields, passed on to read.table. }
  \item{dec}{Passed on to read.table. This is particulary helpful for 
    the interpretation of data from localised spreadsheet programs.}
  \item{format.check}{TRUE or FLASE: to disable file format check.}
}
\details{
The software of Michael Eisen and its plain tab separated format for
the presentation of gene expression data prior to their clustering is
supported by many hard- and software providers, both as an input for
their tools and as resulting from the analysis and normalisation of the
chip images. To be able to read and write this format, the Bioconductor
suite is enabled to easily reanalyse or extend older experiments that
might have been analysed with the Eisen tools before.
}
 
\value{
  A numerical matrix is returned. It is a complete analogue of the 
Eisen-format,
except the descriptions, weights and other information being passed to 
attributes.
The first row will be the column names, the first column will be the 
respective row name.
A second row that has a first empty field is referred to via the 
attribute "second.row".
A column NAME is stored in the attribute "NAME".
}

\author{Steffen Moeller}

\references{Michael Eisen Lab http://rana.lbl.gov/

Michael Hoon's Cluster 3.0  
http://bonsai.ims.u-tokyo.ac.jp/~mdehoon/software/cluster/

Eisen M.B., P.T. Spellman, P.O. Brown, and D. Botstein.   1998.   
Cluster analysis and display of genome-wide expression patterns.   
/Proc. Natl. Acad. Sci. USA /, 95:14863-14868.

De Hoon M.J.L., S. Imoto, J. Nolan, and S. Miyano. Open source 
clustering software.   Bioinformatics *20* (9): 1453--1454 (2004).

}

\keyword{cluster}

