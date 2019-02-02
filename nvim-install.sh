#!/usr/bin/env bash

#Build and install neovim for Debian
#See: https://neovim.io/
#See: https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start

#Save current dir
pushd .

#Install dependencies
sudo apt-get update
sudo apt-get install -y \
  autoconf \
  automake \
  cmake \
  g++ \
  libncurses5-dev \
  libtool \
  libtool-bin \
  libunibilium-dev \
  libunibilium0 \
  pkg-config \
  python-pip \
  software-properties-common \
  unzip

#Get or update neovim github repo
mkdir -p ~/src
cd ~/src || exit
if [ ! -e ~/src/neovim ]; then
  git clone https://github.com/neovim/neovim
else
  cd neovim || exit
  git pull origin
fi

cd ~/src/neovim || exit
git checkout master
#Remove old build dir and .deps dir
rm -rf build/
rm -rf .deps/

# Build and install neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/usr/local/"
make install

# Enable use of python plugins
pip2 install --user --upgrade neovim

# Enable use of ruby plugins
# sudo gem install neovim

#Restore dir
popd

echo "nvim command: $(which nvim)"
echo "nvim command: $(ls -al "$(which nvim)")"
