BcnDataSources <- DataBranch$new('BCNAnalytics data package, http://bcnanalytics.com/')

BcnDataSources$addInformationBranch( 'OpenData', 'http://opendata.bcn.cat/' )
BcnDataSources$addInformationBranch( 'Ajuntament', 'http://www.bcn.cat/estadistica/catala/dades/index.htm' )
BcnDataSources$addInformationBranch( 'Others', '' )

BcnDataSources$addInformationBranch( 'Idescat', 'http://www.idescat.cat' )
BcnDataSources$Idescat$addInformationBranch( 'Cens2001', 'http://www.idescat.cat' )
BcnDataSources$Idescat$addInformationBranch( 'Grid250_2014', 'http://www.idescat.cat' )

BcnDataSources$addInformationBranch( 'inAtlas', 'http://www.inAtlas.com' )

