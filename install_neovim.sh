pm=apt
pm_update=update

if [ -n "$(cat /etc/os-release | egrep "fedora|Fedora")" ]
then
	pm=dnf
	pm_update=check-update
fi

sudo $pm $pm_update
sudo $pm install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl

neovim_repo=downloaded/neovim
git clone https://github.com/neovim/neovim.git "$neovim_repo"
cd "$neovim_repo"
git checkout stable

make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
sudo make install
export PATH="$HOME/neovim/bin:$PATH"
