FROM atusy/tidyverse-daily:latest

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # fonts
    fonts-ipaexfont-gothic fonts-ipaexfont-mincho \
    fonts-noto-cjk fonts-noto-hinted fonts-noto-mono fonts-noto-unhinted \
    # friendly interactive shell
    fish \
    # for units required by sf
    libudunits2-dev \
    # for rgdal required by sf
    libgdal-dev \
    # for rgeos required by sf
    libgeos-dev \
    # for webshot
    phantomjs \
    # for rsvg imported by atusy/mytools
    librsvg2-dev \
  # tinytex
  && install2.r --error tinytex \
  && sudo -u rstudio Rscript -e "tinytex::install_tinytex()" \
  && install2.r --error --deps TRUE \
    # callr, forcats and remotes supposed to be installed by rocker/tidyverse
    bench \
    bookdown \
    blogdown \
    # callr \
    extrafont \
    # forcats \
    leaflet \
    microbenchmark \
    revealjs \
    webshot \
    # remotes \
  && Rscript -e "remotes::install_github(c('atusy/atusyverse', 'atusy/ggAtusy', 'atusy/mytools', 'DavisVaughan/furrr', 'thomasp85/patchwork'), upgrade = 'never')" \
  # webshot setting
  && echo "QT_QPA_PLATFORM=offscreen" >> \
    /usr/local/lib/R/etc/Renviron \
  # blogdown setting
  && echo "options(blogdown.hugo.dir = system.file(package = 'blogdown'))" >> \
    /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "blogdown::install_hugo()" \
  # extrafont setting
  && Rscript -e "extrafont::font_import(prompt = FALSE)" \
  # Let atusyverse be a default package
  && echo "if(interactive()) options(defaultPackages = c(getOption('defaultPackages'), 'atusyverse'))" >> \
    /usr/local/lib/R/etc/Rprofile.site

COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/

CMD ["/init"]
