FROM rocker/tidyverse:latest

ARG pandoc="2.7.2"

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  # apt
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # for xonsh
    curl \
    python3-pip \
    python3-prompt-toolkit \
    python3-pygments \
    python3-setproctitle \
    # fonts
    fonts-ipaexfont-gothic fonts-ipaexfont-mincho \
    fonts-noto-cjk fonts-noto-hinted fonts-noto-mono fonts-noto-unhinted \
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
  # Install xonsh
  ## make sure setuptools are latest
  && pip3 install --upgrade setuptools \
  ## install wheel separately to avoid  "invalid command bdist_wheel"
  && pip3 install wheel \
  && pip3 install xonsh gnureadline \
  && curl -Lo /etc/xonshrc https://raw.githubusercontent.com/atusy/dotfiles/master/.xonshrc \
  # Install pandoc
  && rm -rf \
      /usr/lib/rstudio-server/bin/pandoc \
      /usr/local/bin/pandoc \
      /usr/local/bin/pandoc-citeproc \
  && curl -LO \
    https://github.com/jgm/pandoc/releases/download/${pandoc}/pandoc-${pandoc}-1-amd64.deb && \
    dpkg -i pandoc-${pandoc}-1-amd64.deb && \
    rm pandoc-${pandoc}-1-amd64.deb \
  # Install and configure R packages
  && install2.r --error --deps TRUE \
    tinytex \
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
  && installGithub.r --deps TRUE --update TRUE \
    atusy/atusyverse \
    atusy/ggAtusy \
    atusy/mytools \
    DavisVaughan/furrr \
    thomasp85/patchwork \
  # webshot setting
  && echo "QT_QPA_PLATFORM=offscreen" >> /usr/local/lib/R/etc/Renviron \
  # extrafont setting
  && Rscript -e "extrafont::font_import(prompt = FALSE)" \
  # Let atusyverse be a default package
  && echo "if(interactive()) options(defaultPackages = c(getOption('defaultPackages'), 'atusyverse'))" >> \
    /usr/local/lib/R/etc/Rprofile.site \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER rstudio

RUN \
  # R: install tinytex and hugo
  Rscript -e "tinytex::install_tinytex(); blogdown::install_hugo()" \

COPY user-settings /home/rstudio/.rstudio/monitored/user-settings/

USER root

CMD ["/init"]
