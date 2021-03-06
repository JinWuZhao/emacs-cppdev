#!/bin/sh

apk --no-cache add musl-dev
apk --no-cache add gcc
apk --no-cache add g++
apk --no-cache add clang
apk --no-cache add clang-dev
apk --no-cache add llvm
apk --no-cache add llvm3.7-dev
apk --no-cache add make
apk --no-cache add cmake
apk --no-cache add openssl
apk --no-cache add findutils
apk --no-cache add linux-headers

cd /root/

wget -c http://ftp.gnu.org/gnu/ncurses/ncurses-6.1.tar.gz
tar -xf ncurses-6.1.tar.gz
cd ncurses-6.1
./configure --with-shared --without-debug --without-ada --enable-overwrite
make
make install
cd ..
rm -rf ncurses-6.1
rm ncurses-6.1.tar.gz

wget -c https://cytranet.dl.sourceforge.net/project/cscope/cscope/15.8b/cscope-15.8b.tar.gz
tar -xf cscope-15.8b.tar.gz
cd cscope-15.8b
./configure
make
make install
cd ..
rm -rf cscope-15.8b
rm cscope-15.8b.tar.gz

wget -c https://andersbakken.github.io/rtags-releases/rtags-2.18.tar.gz
tar -xf rtags-2.18.tar.gz
cd rtags-2.18
mkdir build
cd build
cmake ..
make
make install
cd ../../
rm -rf rtags-2.18
rm rtags-2.18.tar.gz

git clone -b develop https://github.com/syl20bnr/spacemacs.git .emacs.d

emacs --daemon
emacsclient -e '(kill-emacs)'
