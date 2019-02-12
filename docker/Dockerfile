FROM atusy/verse-daily:latest

# Personal overides

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update && apt-get install -y fonts-ipaexfont fonts-noto fish phantomjs
RUN Rscript -e "source('https://install-github.me/atusy/atusyverse')"
RUN echo "options(blogdown.hugo.dir = system.file(package = 'blogdown'))" >> /usr/local/lib/R/etc/Rprofile.site \
  && Rscript -e "blogdown::install_hugo()"
