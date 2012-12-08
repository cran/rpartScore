\name{rpartScore}
\alias{rpartScore}

\title{
Classification trees for ordinal responses
}
\description{
This function allows the user to build classification trees for ordinal responses within the CART framework.
The trees are grown using the Generalized Gini impurity function, where the misclassification costs are given by the absolute or squared differences in scores assigned to the categories of the response.
Pruning is based on the total misclassification rate or on the total misclassification cost. 


}
\usage{
rpartScore(formula, data, weights, subset, na.action = na.rpart, 
 	split = "abs", prune = "mc", 
 	model = FALSE, x = FALSE, y = TRUE, 
 	control, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
a formula, as in the \code{lm} function.
}
  \item{data}{
an optional data frame in which to interpret the variables named in the formula.
}
  \item{weights}{
optional case weights. 
}
  \item{subset}{
optional expression saying that only a subset of the rows of the data should be used in the fit.
}
  \item{na.action}{
The default action deletes all observations for which \code{y} is missing, but keeps those in which one or more predictors are missing.
}
  \item{split}{
One of \code{"abs"} or \code{"quad"}.
}
  \item{prune}{
One of \code{"mc"} or \code{"mr"}.
}
  \item{model}{
if logical: keep a copy of the model frame in the result? If the input value for model is a model frame (likely from an earlier call to the \code{rpart} or \code{rpartScore} function), then this frame is used rather than constructing new data. 
}
  \item{x}{
keep a copy of the \code{x} matrix in the result. 
}
  \item{y}{
keep a copy of the dependent variable in the result. If missing and \code{model} is supplied this defaults to \code{FALSE}. 
}
  \item{control}{
options that control details of the \code{rpart} algorithm.
}
  \item{\dots}{
arguments to \code{rpart.control} may also be specified in the call to \code{rpartScore}. They are checked against the list of valid arguments. 
}
}
\details{

The use of this function is almost the same as the \code{rpart} function. \cr
It is assumed that a set of (not necessarily linear) numerical scores has been assigned to the ordered categories of the response.\cr
The main difference with respect to the \code{rpart} function is the presence of two 
arguments (\code{split} and \code{prune}) instead of the \code{method} argument.\cr
The argument \code{split} controls the splitting function used to grow the classification tree, by setting the 
misclassification costs in the generalized Gini impurity function equal to the absolute (\code{"abs"} - is the default option) or to the squared 
(\code{"quad"}) differences in scores. \cr
The argument \code{prune} allows the user to select the prediction performance measure used to prune the classification tree, 
and can take two values: \code{"mr"} (total misclassification rate) or \code{"mc"} (total misclassification cost - is the default option). 

}
\value{
An object of class \code{rpart}, a superset of class \code{tree}. 


}
\references{
Breiman L., Friedman J.H., Olshen R.A., Stone C.J. 1984 \emph{Classification and Regression Trees}. Wadsworth International. 

Galimberti G., Soffritti G., Di Maso M. 2012 Classification Trees for Ordinal Responses in \R: The \code{rpartScore} Package. 
\emph{Journal of Statistical Software}, \bold{47}(10), 1-25.
URL \url{http://www.jstatsoft.org/v47/i10/}. 

Piccarreta R. 2008 Classication Trees for Ordinal Variables. \emph{Computational Statistics}, \bold{23}, 407-427. 

Therneau T.M., Atkinson E.J. 1997 An Introduction to Recursive Partitioning Using rpart Routines. 
\emph{Technical Report 61}, Section of Biostatistics, Mayo Clinic, Rochester. URL \url{http://www.mayo.edu/hsr/techrpt/61.pdf}. 


}
\author{
Giuliano Galimberti, Gabriele Soffritti, Matteo Di Maso
}



\seealso{
\code{\link[rpart:rpart]{rpart}},\code{\link[rpart:rpart.control]{rpart.control}},
\code{\link[rpart:rpart.object]{rpart.object}},\code{\link[rpart:summary.rpart]{summary.rpart}},
\code{\link[rpart:print.rpart]{print.rpart}}
}
\examples{
data("birthwt",package="MASS")

birthwt$Category.s <- ifelse(birthwt$bwt <= 2500, 3,
 	ifelse(birthwt$bwt <= 3000, 2,
 	ifelse(birthwt$bwt <= 3500, 1, 0)))

T.abs.mc <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = birthwt)

plotcp(T.abs.mc)

T.abs.mc.pruned<-prune(T.abs.mc,cp=0.02)

plot(T.abs.mc.pruned)

text(T.abs.mc.pruned)
 
T.abs.mr <- rpartScore(Category.s ~ age + lwt + race + smoke +
 	ptl + ht + ui + ftv, data = birthwt, prune = "mr")

T.quad.mc <- rpartScore(Category.s ~ age + lwt + race + smoke + 
 	ptl + ht + ui + ftv, split = "quad", data = birthwt)

T.quad.mr <- rpartScore(Category.s ~ age + lwt + race + smoke + ptl + ht + 
 	ui + ftv, split = "quad", prune = "mr", data = birthwt)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ tree }
