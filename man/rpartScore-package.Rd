\name{rpartScore-package}
\alias{rpartScore-package}
\docType{package}
\title{
Classification trees for ordinal responses
}
\description{
This package contains functions that allow the user to build classification trees for ordinal responses within the CART framework.\cr 
The trees are grown using the Generalized Gini impurity function, where the misclassification costs are given by 
the absolute or squared differences in scores assigned to the categories of the response.\cr 
Pruning is based on the total misclassification rate or on the total misclassification cost. 
}
\details{
\tabular{ll}{
Package: \tab rpartScore\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-11-07\cr
License: \tab GPL (>=2)\cr
LazyLoad: \tab yes\cr
}
This package contains functions that allow the user to build classification trees for ordinal responses within the CART framework.\cr 
It is assumed that a set of numerical scores has been assigned to the ordered categories of the response. \cr
Two splitting functions are implemented, both based on the generalized Gini impurity function. They use the absolute 
and the squared differences in scores, respectively, as misclassification costs. \cr
In order to select the optimal tree size, pruning can be performed, using two different measures of prediction performance: 
the total misclassification rate or the total misclassification cost.\cr
This package requires the \code{rpart} package. The main function in this package is \code{rpartScore}. 
The use of this function is almost the same as the \code{rpart} function. The main difference is the presence of two 
arguments (\code{split} and \code{prune}) instead of the \code{method} argument.\cr
The argument \code{split} controls the splitting function used to grow the classification tree, by setting the 
misclassification costs equal to the absolute (\code{"abs"} - default option) or to the squared 
(\code{"quad"}) differences in scores. \cr
The argument \code{prune} allows the user to select the prediction performance measure used to prune the classification tree, 
and can take two values: \code{"mr"} (total misclassification rate) or \code{"mc"} (total misclassification cost - default option). 


}
\author{
Giuliano Galimberti, Gabriele Soffritti, Matteo Di Maso 


Maintainer: Giuliano Galimberti <giuliano.galimberti@unibo.it> 
}
\references{
Breiman L., Friedman J.H., Olshen R.A., Stone C.J. 1984 \emph{Classification and Regression Trees}. Wadsworth International. 

Galimberti G., Soffritti G., Di Maso M. 2012 Classification trees for ordinal responses in \R: the \code{rpartScore} package. 
\emph{Journal of Statistical Software}. Submitted. 

Piccarreta R. 2008 Classication Trees for Ordinal Variables. \emph{Computational Statistics}, \bold{23}, 407-427. 

Therneau T.M., Atkinson E.J. 1997 An Introduction to Recursive Partitioning Using rpart Routines. 
\emph{Technical Report 61}, Section of Biostatistics, Mayo Clinic, Rochester. URL \url{http://www.mayo.edu/hsr/techrpt/61.pdf}. 


}

\keyword{ tree }
\seealso{
\code{\link[rpart:rpart]{rpart}}
}
\examples{
require("rpartOrdinal")

data("lowbwt")

lowbwt$Category.s <- ifelse(lowbwt$bwt <= 2500, 3,
 	ifelse(lowbwt$bwt <= 3000, 2,
 	ifelse(lowbwt$bwt <= 3500, 1, 0)))

T.abs.mc <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = lowbwt)

plotcp(T.abs.mc)
 
T.abs.mr <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = lowbwt, prune = "mr")

T.quad.mc <- rpartScore(Category.s ~ age + lwt + race + smoke + 
 	ptl + ht + ui + ftv, split = "quad", data = lowbwt)

T.quad.mr <- rpartScore(Category.s ~ age + lwt + race + smoke + ptl + ht + 
 	ui + ftv, split = "quad", prune = "mr", data = lowbwt)

}
