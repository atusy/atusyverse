FROM atusy/verse-daily:latest

# Personal overides

RUN install -y --no-install-recommends fish
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update && apt-get install -y fonts-ipaexfont fonts-noto
RUN Rscript -e "source('https://install-github.me/atusy/atusyverse')"
RUN Rscript -e "blogdown::install_hugo()"