FROM atusy/verse-daily:latest

# Personal overides

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apt-get update && apt-get install -y fonts-ipaexfont fonts-noto fish phantomjs \
  && Rscript -e "source('https://install-github.me/atusy/atusyverse')" \
  && echo "QT_QPA_PLATFORM=offscreen" >> /usr/local/lib/R/etc/Rprofile.site \
  && echo "options(blogdown.hugo.dir = system.file(package = 'blogdown'))" >> /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "blogdown::install_hugo()"
