source ../utils.sh

install_neovim=false

for cmd in $@; do
	if [ $cmd == "-a" ]; then
		install_neovim=true
	fi
done

if $install_neovim; then
	nvim_installer="neovim.msi"
	curl -o "$nvim_installer" -L https://github.com/neovim/neovim/releases/download/stable/nvim-win64.msi
	start neovim.msi
	rm "$nvim_installer"
fi

if isOs windows; then
	vim_plug_out_dir=~/AppData/Local/nvim-data/site/autoload/plug.vim
elif isOs linux; then
	vim_plug_out_dir=~/nvim/site/autoload/plug.vim
fi

curl -fo "${vim_plug_out_dir}" --create-dirs -L https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
