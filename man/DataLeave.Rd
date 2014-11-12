\name{DataLeave}
\docType{class}
\alias{DataLeave}

\title{Particular data source}

\description{
  This class is designed to represent a particular data source, from where one can get information.
}


\section{Methods}{

  \describe{
    
    \item{\code{getData(...)}:}{Gets the data from this data source.}
    \item{\code{openSourcePage()}:}{In case the information comes from a webpage, it opens such webpage in the browser.}
    
  }
  
}


\examples{

  \dontrun{
  
    library(BcnDataAccess)
    
    BcnDataSources$OpenData$DemografiquesSeccioCensal$openSource()
    BcnDataSources$OpenData$DemografiquesSeccioCensal$getData()
  }
  
}

\seealso{
  \code{\link{DataBranch}}
}