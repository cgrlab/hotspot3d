FROM ubuntu:14.04

WORKDIR /opt

ENV PATH $OPT/bin:$PATH

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    xvfb \
    wget \
    curl \
    unzip \
    git \
    libcurl4-gnutls-dev \
    libgnutls-dev \
    cpanminus \
    libwww-perl

RUN cpanm --local-lib=~/perl5 local::lib && \
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

RUN wget http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Test-Most-0.34.tar.gz && \
cpanm Test-Most-0.34.tar.gz

RUN git clone https://github.com/ding-lab/hotspot3d && \
cd hotspot3d && \
cpanm HotSpot3D-0.6.3.tar.gz

