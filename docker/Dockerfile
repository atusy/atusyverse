FROM atusy/atusydown:latest

RUN set -x \
  # apt
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # for xonsh
    # curl \
    python3-pip \
    python3-prompt-toolkit \
    python3-pygments \
    python3-setproctitle \
    # for units required by sf
    libudunits2-dev \
    # for rgdal required by sf
    libgdal-dev \
    # for rgeos required by sf
    libgeos-dev \
    # for rsvg imported by atusy/mytools
    librsvg2-dev \
    # for pdftools suggested by magick
    libpoppler-cpp-dev \
    # for tesseract
    libtesseract-dev \
    libleptonica-dev \
    tesseract-ocr-eng \
    # for gifski by pdftools
    cargo \
    # for av imported by pdftools
    libavfilter-dev \
    # for magick
    libmagick++-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  # Install xonsh
  ## make sure setuptools are latest
  && pip3 install --upgrade setuptools \
  ## install wheel separately to avoid  "invalid command bdist_wheel"
  && pip3 install wheel \
  && pip3 install xonsh gnureadline \
  # && curl -Lo /etc/xonshrc \
  #   https://raw.githubusercontent.com/atusy/dotfiles/master/.xonshrc
  && wget https://raw.githubusercontent.com/atusy/dotfiles/master/.xonshrc \
  && mv .xonshrc /etc/xonshrc

RUN set -x \
  # Install and configure R packages
  && r -e "options(Ncpus = max(1L, parallel::detectCores())); remotes::install_github('atusy/atusyverse', upgrade = 'always', dependencies = TRUE)" \
  # atusyverse as a default package, and prettycode in default
  && echo \
    "options(defaultPackages = c(getOption('defaultPackages'), 'atusyverse'[interactive()])); prettycode::prettycode()" \
    >> /usr/local/lib/R/etc/Rprofile.site

CMD ["/init"]
