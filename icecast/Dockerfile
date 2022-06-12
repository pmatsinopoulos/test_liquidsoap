FROM ubuntu:latest
RUN apt update -y && apt upgrade -y
RUN apt-get -yq install build-essential wget libxml2 libxslt-dev curl libvorbis-dev vorbis-tools sudo vim
RUN sudo useradd -s /bin/bash -d /home/icecast/ -m -G sudo icecast
RUN wget https://downloads.xiph.org/releases/icecast/icecast-2.4.4.tar.gz
RUN tar -xvf icecast-2.4.4.tar.gz
RUN gcc --version
WORKDIR /icecast-2.4.4
RUN ./configure
RUN make
RUN make install
WORKDIR /
RUN mkdir -p /usr/local/var/log/icecast
RUN chown icecast:icecast /usr/local/var/log/icecast
WORKDIR /usr/local/etc
COPY icecast.xml icecast.xml
# icecast binary is located at +/usr/local/bin/icecast+
# icecast configuration xml is located at +/usr/local/etc/icecast.xml+
# folder: +/usr/local/share/icecast+ contain
#   subfolders: +admin+, +doc+, +web+
CMD ["icecast", "-c", "/usr/local/etc/icecast.xml"]
