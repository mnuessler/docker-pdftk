FROM ubuntu:xenial

MAINTAINER Matthias Nüßler <m.nuessler@web.de>

ENV PDFTK_VERSION 2.02

# The directory containing the PDF files to be processed is expected to be mounted here
# as a docker volume when running the container.
RUN mkdir /work
WORKDIR /work
VOLUME ["/work"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip build-essential gcj-jdk && \
    apt-get clean

ADD https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-${PDFTK_VERSION}-src.zip /tmp/
RUN unzip /tmp/pdftk-${PDFTK_VERSION}-src.zip -d /tmp && \
    sed -i 's/VERSUFF=-4.6/VERSUFF=-5/g' /tmp/pdftk-${PDFTK_VERSION}-dist/pdftk/Makefile.Debian && \
    cd /tmp/pdftk-${PDFTK_VERSION}-dist/pdftk && \
    make -f Makefile.Debian && \
    make -f Makefile.Debian install && \
    rm -Rf /tmp/pdftk-*

ENTRYPOINT ["/usr/local/bin/pdftk"]
