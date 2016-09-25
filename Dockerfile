FROM ubuntu:14.04

USER root

ENV PATH $OPT/bin:$PATH

# setup system

RUN apt-get -yq update && \
apt-get -yq install xvfb && \
apt-get install -y wget && \
rm -rf /var/lib/apt/lists/* && \
apt-get install git && \
apt-get install build-essential && \
apt-get install cpanminus

# install hotspot3d

RUN cpanm --local-lib=~/perl5 local::lib && \
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib) \

RUN apt-get install libwww-perl

RUN wget http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Test-Most-0.34.tar.gz && \
cpanm Test-Most-0.34.tar.gz

RUN git clone https://github.com/ding-lab/hotspot3d && \
cd hotspot3d && \
cpanm HotSpot3D-#.#.tar.gz

