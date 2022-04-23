FROM alpine:3.15

MAINTAINER sbh

ENV SYSTEMC_VERSION 2.3.3

ENV CXX g++

ENV SYSTEMC_HOME /usr/local/systemc-$SYSTEMC_VERSION

ENV LD_LIBRARY_PATH /usr/local/systemc-$SYSTEMC_VERSION/lib-linux64

RUN apk --no-cache add build-base cmake bash nano automake m4 perl autoconf texinfo libtool
RUN apk --no-cache add --virtual build-deps tar zip

RUN mkdir -p /usr/local/
WORKDIR /usr/local/

COPY systemc-$SYSTEMC_VERSION.tar.gz systemc-$SYSTEMC_VERSION.tar.gz
RUN tar -xzf systemc-$SYSTEMC_VERSION.tar.gz

RUN mkdir /usr/local/systemc-$SYSTEMC_VERSION/objdir
WORKDIR /usr/local/systemc-$SYSTEMC_VERSION/objdir

RUN ../configure --prefix=/usr/local/systemc-$SYSTEMC_VERSION CXXFLAGS="-DSC_CPLUSPLUS=201103L"

RUN make
RUN make install

RUN apk del build-deps

WORKDIR /usr/
CMD sh
