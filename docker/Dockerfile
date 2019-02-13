FROM atusy/verse-daily:latest

# Personal overides

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apt-get update \
  && apt-get install -y fonts-ipaexfont fonts-noto fish phantomjs \
  # atusyverse: contains webshot and blogdown
  && Rscript -e "source('https://install-github.me/atusy/atusyverse')" \
  # webshot (required to run webshot::webshot and subsequent phantomjs)
  && echo "QT_QPA_PLATFORM=offscreen" >> /usr/local/lib/R/etc/Renviron \
  # blogdown
  && echo "options(blogdown.hugo.dir = system.file(package = 'blogdown'))" >> /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "blogdown::install_hugo()"
