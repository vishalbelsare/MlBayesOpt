% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/svm_opt.R
\name{svm_opt}
\alias{svm_opt}
\title{Bayesian Optimization for SVM}
\usage{
svm_opt(train_data, train_label, test_data, test_label,
  gamma_range = c(10^(-3), 10^1), cost_range = c(10^(-2), 10^2),
  svm_kernel = "radial", degree_range = c(3L, 10L),
  coef0_range = c(10^(-1), 10^1), init_points = 4, n_iter = 10,
  acq = "ei", kappa = 2.576, eps = 0, optkernel = list(type =
  "exponential", power = 2))
}
\arguments{
\item{train_data}{A data frame for training of SVM}

\item{train_label}{The column of class to classify in the training data}

\item{test_data}{A data frame for training of SVM}

\item{test_label}{The column of class to classify in the test data}

\item{gamma_range}{The range of gamma. Default is c(10 ^ (-3), 10 ^ 1)}

\item{cost_range}{The range of C(Cost). Default is c(10 ^ (-2), 10 ^ 2)}

\item{svm_kernel}{Kernel used in SVM. You might consider changing some of the following parameters, depending on the kernel type.
\itemize{
  \item \strong{linear:} \eqn{u'v}
  \item \strong{polynomial:} \eqn{(\gamma u'v +coef0)^{degree}}
  \item \strong{radial basis:} \eqn{exp(-\gamma|u-v|^2)}
  \item \strong{sigmoid:} \eqn{tanh(\gamma u'v + coef0)}
}}

\item{degree_range}{Parameter needed for kernel of type polynomial. Default is c(3L, 10L)}

\item{coef0_range}{parameter needed for kernels of type \code{polynomial} and \code{sigmoid}. Default is c(10 ^ (-1), 10 ^ 1)}

\item{init_points}{Number of randomly chosen points to sample the
target function before Bayesian Optimization fitting the Gaussian Process.}

\item{n_iter}{Total number of times the Bayesian Optimization is to repeated.}

\item{acq}{Acquisition function type to be used. Can be "ucb", "ei" or "poi".
\itemize{
  \item \code{ucb} GP Upper Confidence Bound
  \item \code{ei} Expected Improvement
  \item \code{poi} Probability of Improvement
}}

\item{kappa}{tunable parameter kappa of GP Upper Confidence Bound, to balance exploitation against exploration,
increasing kappa will make the optimized hyperparameters pursuing exploration.}

\item{eps}{tunable parameter epsilon of Expected Improvement and Probability of Improvement, to balance exploitation against exploration,
increasing epsilon will make the optimized hyperparameters are more spread out across the whole range.}

\item{optkernel}{Kernel (aka correlation function) for the underlying Gaussian Process. This parameter should be a list
that specifies the type of correlation function along with the smoothness parameter. Popular choices are square exponential (default) or matern 5/2}
}
\value{
The test accuracy and a list of Bayesian Optimization result is returned:
\itemize{
  \item \code{Best_Par} a named vector of the best hyperparameter set found
  \item \code{Best_Value} the value of metrics achieved by the best hyperparameter set
  \item \code{History} a \code{data.table} of the bayesian optimization history
  \item \code{Pred} a \code{data.table} with validation/cross-validation prediction for each round of bayesian optimization history
}
}
\description{
This function estimates parameters for SVM(Gaussian Kernel) based on bayesian optimization
}
\examples{
library(MlBayesOpt)

set.seed(71)
res0 <- svm_opt(train_data = iris_train,
                train_label = Species,
                test_data = iris_test,
                test_label = Species,
                svm_kernel = "polynomial",
                init_points = 10,
                n_iter = 1)

}
