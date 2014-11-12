\name{DataBranch}
\docType{class}
\alias{DataBranch}

\title{Branch of a set of data sources}

\description{
  This class is designed to represent a way of getting a particular set of data sources.
}


\section{Methods}{

  \describe{
    
    \item{\code{addInformationBranch(newName, dataSource = "")}:}{Use this method to create a new sub-branch. 'newName' should not have spaces}
    \item{\code{addInformationSource(newName, getDataFunction, dataSource = '', description = '', lastUpdate = '', fieldDescription = matrix(''), broughtBy = '')}:} Use this method to create a new information source. 
      \itemize{
        \item \code{getDatafunction} is a function (may have some parameters) that returns a data.frame. It may get data from a webpage, data base or any others. 
        \item \code{dataSource}, in case it is a webpage, the function \code{openSourcePage} will open it in the browser.
        \item \code{description, lastUpdate, broughtBy} are informative fields. \code{lastUpdate} is the last time the information was updated. \code{broughtBy} concerns who has built this particular leave.
        \item \code{fieldDescription} is a matrix where the rows are the fields of the data.frame given by the \code{getDatafunction}. 
    }
  }
  
}


\examples{
  \dontrun{
    library(BcnDataAccess)
    
    BcnDataSources$addInformationBranch( 'MyBranch', 'http://www.datawebpage.net' )
    
    BcnDataSources$Others$addInformationSource(
      newName = 'VotsBarris',
      getDataFunction = function(){
        data(votsBarris, envir = environment())
        return(votsBarris)
        },
      description = "Vots per Barris",
      lastUpdate = "October 2014",
      broughtBy = "Josep Marc Mingot"  
    )
    
  }
}

\seealso{
  \code{\link{DataLeave}}
}