\name{r2cluster}
\alias{r2cluster}
\title{Write to Cluster file format}
\description{Converting data to Cluster format}
\usage{
r2cluster(data,labels=FALSE,colname="ACC",description=FALSE,file="cluster.txt",dec='.')
}

\arguments{
  \item{file}{the path of the file}
  \item{data}{a matrix (or data frame) which provides the data to put into the file} 
  \item{labels}{a logical value indicating whether we use the frist
    column as labels (UNIQID column for cluster file)}
  \item{colname}{Should be one of: YORF,MCLID,CLID,ACC}
   \item{description}{a logical value indicating whether we use the second column as description (NAME column for cluster file)}
   \item{dec}{the character used in the file for decimal points}  
}


\note{
\emph{Cluster} is a program made by \emph{Michael Eisen} that performs
hierarchical clustering, K-means and SOM. 

\emph{Cluster} is copyrighted. 
To get or have information
about
\emph{Cluster}: \url{http://rana.lbl.gov/EisenSoftware.htm}
}

\examples{
#    Create data
.Random.seed <- c(1,  416884367 ,1051235439)
m <- matrix(rep(1,3*24),ncol=3)  
m[9:16,3] <- 3 ; m[17:24,] <- 3    #create 3 groups
m <- m+rnorm(24*3,0,0.5)           #add noise
m <- floor(10*m)/10                #just one digits

r2cluster(m)

}
\keyword{file}

\author{Antoine Lucas, \url{http://genopole.toulouse.inra.fr/~lucas/R}}
\seealso{\code{\link{xcluster}}, \code{\link{r2xcluster}}, \code{\link[mva]{hclust}}}
