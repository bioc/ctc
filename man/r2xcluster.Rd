\name{r2xcluster}
\alias{r2xcluster}
\title{Write to Xcluster file format}
\description{Converting data to Xcluster format}
\usage{
r2xcluster(data,labels=FALSE,description=FALSE,file="xcluster.txt")
}

\arguments{
  \item{file}{the path of the file}
  \item{data}{a matrix (or data frame) which provides the data to put into the file} 
   \item{labels}{a logical value indicating whether we use the frist column as labels (NAME column for cluster file)}
   \item{description}{a logical value indicating whether we use the second column as description (DESCRIPTION column for cluster file)}
}


\note{
\emph{Xcluster} is a C program made by \emph{Gavin Sherlock} that performs
hierarchical clustering, K-means and SOM. 

\emph{Xcluster} is copyrighted. 
To get or have information
about
\emph{Xcluster}: \url{http://genome-www.stanford.edu/~sherlock/cluster.html}
}

\examples{
#    Create data
.Random.seed <- c(1,  416884367 ,1051235439)
m <- matrix(rep(1,3*24),ncol=3)  
m[9:16,3] <- 3 ; m[17:24,] <- 3    #create 3 groups
m <- m+rnorm(24*3,0,0.5)           #add noise
m <- floor(10*m)/10                #just one digits

r2xcluster(m)

# And once you have Xcluster program:

#system('Xcluster -f xcluster.txt -e 0 -p 0 -s 0 -l 0')
#h <- xcluster2r('xcluster.gtr')
#library(mva)
#plot(h,hang=-1)
}
\keyword{file}

\author{Antoine Lucas, \url{http://genopole.toulouse.inra.fr/~lucas/R}}
\seealso{\code{\link{xcluster}}, \code{\link{xcluster2r}}, \code{\link[mva]{hclust}}}
