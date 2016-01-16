FROM ubuntu:trusty

MAINTAINER Matthias Nüßler <m.nuessler@web.de>

ENV PDFTK_VERSION 2.02

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip build-essential gcj-jdk

ADD https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-${PDFTK_VERSION}-src.zip /tmp
RUN unzip /tmp/pdftk-${PDFTK_VERSION}-src.zip
RUN sed -i 's/VERSUFF=-4.6/VERSUFF=-4.8/g' pdftk-2.02-dist/pdftk/Makefile.Debian
RUN cd pdftk-2.02-dist/pdftk && \
    make -f Makefile.Debian && \
    make -f Makefile.Debian install

ENTRYPOINT ["/usr/local/bin/pdftk"]
