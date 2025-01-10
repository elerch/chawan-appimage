FROM debian:bookworm-slim
LABEL maintainer "Emil Lerch <emil@lerch.org>"

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  libssh2-1-dev \
  libcurl4-openssl-dev \
  pkg-config \
  make \
  ncurses-base \
  xz-utils \
  gcc \
  git \
  && curl https://nim-lang.org/choosenim/init.sh -OsSf \
  && chmod 755 ./init.sh \
  && ./init.sh -y \
  && export PATH=$HOME/.nimble/bin:$PATH \
  && git clone --depth=1 https://git.sr.ht/~bptato/chawan \
  && cd chawan \
  && make submodule \
  && make \
  && make install \
  && mkdir -p /AppDir/usr \
  && cp -R /usr/local/* /AppDir/usr \
  && sed -i -e 's#/usr#././#g' /AppDir/usr/bin/cha \
  && curl -sLO https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage \
  && chmod 755 appimagetool-x86_64.AppImage \
  && ./appimagetool-x86_64.AppImage --appimage-extract \
  && cp squashfs-root/usr/bin/* /usr/local/bin/ \
  && apt-get install -y file \
  && cd /AppDir \
  && ln -s usr/bin/cha AppRun

COPY chawan.desktop /AppDir/
COPY icon.png /AppDir/

RUN appimagetool /AppDir

# /Chawan-x86_64.AppImage
#ENTRYPOINT [ "aws" ]
