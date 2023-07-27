\name{plot_HLA_Diversity}
\alias{plot_HLA_Diversity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
plot HLA Diversity
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
plot_HLA_Diversity(hped, gene = "A", ntop = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
  %%     ~~Describe \code{x} here~~
  hped is a HLA PED file with column names (A.1,A.2,B.1,B.2,C.1,C.2,DQA1.1,DQA1.2,DQB1.1,DQB1.2,DRB1.1,DRB1.2,DPA1.1,DPA1.2,DPB1.1,DPB1.2,Population) in tsv format.
  }
  \item{y}{
  %%     ~~Describe \code{x} here~~
  gene is a HLA gene: ("A", "B", "C", "DQA1", "DQB1", "DRB1", "DPA1", "DPB1"). It hast to be in quotes. Default is set to "A". Please change as needed.
  }
  \item{ntop}{
  %%     ~~Describe \code{x} here~~
  ntop refers to the top alleles that are plotted across all populations. Default is set to 2. Please change as needed.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The function takes in a 4digit HPED file and returns a plot showing the top 2 alleles across different population groups.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
function (hped, gene = "A", ntop = 2)

plot_HLA_Diversity(example_data,"A", 2)

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
