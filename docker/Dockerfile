FROM atusy/verse-daily:latest

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
    # for rgdal required by sd
    libgdal-dev \
    # for rgeos required by sd
    libgeos-dev \
    # for webshot
    phantomjs \
  # callr, forcats and remotes supposed to be installed by rocker/tidyverse
  && install2.r --error --deps TRUE \
    bench \
    blogdown \
    # callr \
    # forcats \
    leaflet \
    microbenchmark \
    webshot \
    # remotes \
  && Rscript -e "remotes::install_github(c('atusy/atusyverse', 'atusy/ggAtusy', 'atusy/mytools', 'DavisVaughan/furrr', 'thomasp85/patchwork'), upgrade = 'never')" \
  # webshot setting
  && echo "QT_QPA_PLATFORM=offscreen" >> \
    /usr/local/lib/R/etc/Renviron \
  # blogdown setting
  && echo "options(blogdown.hugo.dir = system.file(package = 'blogdown'))" >> \
    /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "blogdown::install_hugo()"
