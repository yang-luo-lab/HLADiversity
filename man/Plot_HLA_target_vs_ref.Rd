\name{Plot_HLA_target_vs_ref}
\alias{Plot_HLA_target_vs_ref}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Target vs Reference HLA frequency comparison.
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Plot_HLA_target_vs_ref(tgt_hped,ref_hped)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tgt_hped}{
%%     ~~Describe \code{tgt_hped} here~~
tgt_hped is a HLA PED file with column names (A.1,A.2,B.1,B.2,C.1,C.2,DQA1.1,DQA1.2,DQB1.1,DQB1.2,DRB1.1,DRB1.2,DPA1.1,DPA1.2,DPB1.1,DPB1.2,Population) in tsv format.
}
 \item{ref_hped}{
ref_hped is a HLA PED file with column names (A.1,A.2,B.1,B.2,C.1,C.2,DQA1.1,DQA1.2,DQB1.1,DQB1.2,DRB1.1,DRB1.2,DPA1.1,DPA1.2,DPB1.1,DPB1.2,Population) in tsv format.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
The functions takes in the target and reference 4digit HPED files and returns an allele frequency comparison plot
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
It returns a frequency comparison plot between the target and reference data
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
function (tgt_hped,ref_hped)

Plot_HLA_target_vs_ref(example_data, example_data)

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
