# Required packages on CRAN and GitHub

cran <- NULL

gh <- list(atusy = "atusyverse")

# Tokyo as default CRAN mirror

options(repos = c(CRAN = "https://cloud.r-project.org/"))

# Stop if callr not installed

installed <- installed <- rownames(utils::installed.packages())
if(!('callr' %in% installed)) stop('Install callr to load .Rprofile') 

# Install missing packages

invisible(callr::r(
  function(cran, gh, installed) {
  	
  	## CRAN
  	cran <- setdiff(c('remotes', cran), installed)
    if(length(cran) > 0) 
      utils::install.packages(cran)
    
    ## GitHub
    gh <- gh[!(unlist(gh, use.names = FALSE) %in% installed)]
    if(length(gh) > 0) 
      remotes::install_github(gh)
      
    pkg <- c(cran, gh)
    if(length(pkg) > 0)
      message("Installed: ", pkg)
      
    NULL
  },
  args = list(cran = cran, gh = gh, installed = installed),
  repos = getOption('repos'),
  user_profile = FALSE
))

# Done if interactive mode on RStudio

if(interactive() && "RSTUDIO" %in% names(Sys.getenv())) {
  
  ## Copy .Rprofile to project root
  if(length(dir(pattern = '\\.Rproj$')) > 0)
    invisible(file.copy('~/Documents/R/proj/dot-files/.Rprofile', '.Rprofile'))
  
  ## Set default packages
  options(defaultPackages =
    c(getOption('defaultPackages'), cran, unlist(gh, use.names = FALSE))
  )
}

# Remove variables

rm(cran, gh, installed)
