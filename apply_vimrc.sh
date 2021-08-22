#!/bin/bash
create_links()
{
	src_dir="$1"
	out_dir="$2"

	mkdir -p "$out_dir"

	for f in $src_dir/*.vim
	do
		out_file="$out_dir/$(basename $f)"
		echo "$out_file linked as $f"
		rm -rf "$out_file"
		ln -s "$f" "$out_file" 
	done
}

copy_vimrc()
{
	outdir="$1"
	outfile="$1/$2"
	mkdir -p "$outdir"
	echo "./init.vim -> $outfile"
	cp ./init.vim "$outfile"
}

if [ "`nvim --version`" ]
then
	echo "nvim is installed"
	copy_vimrc ~/.config/nvim "init.vim"
	create_links `pwd`/include ~/.config/nvim/include
else
	echo "nvim not installed"
fi
