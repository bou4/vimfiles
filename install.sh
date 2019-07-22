prefix=/usr/local

################################################################
# Install dependencies
################################################################
## This script
### To build and install a Debian compatible package
sudo apt -y install checkinstall
### Command line tool for transferring data with URLs
sudo apt -y install curl

## Vim
sudo apt -y build-dep vim

################################################################
# Clone respository
################################################################
git clone https://github.com/vim/vim.git ~/vimfiles/repo

################################################################
# Build and install
################################################################
pushd ~/vimfiles/repo

git_tag=$(git describe --abbrev=0 --tags) # e.g. v8.1.1662
vim_version=$(echo ${git_tag} | sed 's/^[^0-9]//') # e.g. 8.1.1662
vim_short_version=$(echo ${vim_version} | sed 's/^\([0-9]*\)\.\([0-9]*\).*/\1\2/') # e.g. 81

./configure \
    --enable-multibyte \
    --enable-python3interp=yes \
    --enable-gui=gtk3 \
    --prefix=${prefix}

make -j$(nproc) VIMRUNTIMEDIR=${prefix}/share/vim/vim${vim_short_version}

## Directory to store .desktop files
sudo mkdir -p /usr/local/share/applications

sudo checkinstall --default --pkgname vim-git --pkgversion "${vim_version}" --maintainer "Caro Meysmans" --provides vim

popd

################################################################
# Update alternatives
################################################################
sudo update-alternatives --install /usr/bin/editor editor ${prefix}/bin/vim 1
sudo update-alternatives --set editor ${prefix}/bin/vim

sudo update-alternatives --install /usr/bin/vi vi ${prefix}/bin/vim 1
sudo update-alternatives --set vi ${prefix}/bin/vim

sudo update-alternatives --install /usr/bin/gvim gvim ${prefix}/bin/gvim 1
sudo update-alternatives --set gvim ${prefix}/bin/gvim

################################################################
# Configure
################################################################
ln -sfn "$(pwd)" ~/.vim

mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

curl -fLsSo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

