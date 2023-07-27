\name{Plot_HLA_allele_frequency}
\alias{Plot_HLA_allele_frequency}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
HLA allele frequency plot
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
A function to compute HLA allele frequencies and plot the frequencies.
}
\usage{
Plot_HLA_allele_frequency(hped, minFreq = 0.05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{hped}{
  %%     ~~Describe \code{hped} here~~
  hped is a HLA PED file with column names (A.1,A.2,B.1,B.2,C.1,C.2,DQA1.1,DQA1.2,DQB1.1,DQB1.2,DRB1.1,DRB1.2,DPA1.1,DPA1.2,DPB1.1,DPB1.2,Population) in tsv format.
  }
  \item{minFreq}{
  %%     ~~Describe \code{hped} here~~
  minFreq is the minimum frequency of alleles displayed on the plot, the remaining alleles are collectively named "others". Default is set to be < than 0.05.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The functions takes in a 4digit HPED file and returns a plot of allele frequencies.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
It returns an allele frequency plot.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
Ruth Nanjala
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

## The function is currently defined as
function (hped, 0.05)

Plot_HLA_allele_frequency(example_data, 0.05)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
