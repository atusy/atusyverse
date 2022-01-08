FROM atusy/atusydown:latest

RUN set -x \
  # apt
  && apt-get install -y --no-install-recommends gnupg \
  && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
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
  && rm -rf /var/lib/apt/lists/*

RUN set -x \
  # Install and configure R packages
  && r -e "options(Ncpus = max(1L, parallel::detectCores())); remotes::install_github('atusy/atusyverse', upgrade = 'always', dependencies = TRUE)" \
  # atusyverse as a default package, and prettycode in default
  && echo \
    "if (interactive()) prettycode::prettycode()" \
    >> /usr/local/lib/R/etc/Rprofile.site

CMD ["/init"]
