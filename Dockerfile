FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get -y upgrade

RUN groupadd -g 1000 challenge && useradd -g challenge -m -u 1000 challenge -s /bin/bash

ARG module
ARG flag

ADD $module/server /
ADD $module/$module.so /
ADD $flag /tmp
RUN mv /tmp/*.flag /flag.txt

WORKDIR /

CMD ["/server"]
