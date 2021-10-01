home_dir=~
vimrc=init.vim

out_dir=$home_dir/.config/nvim
mkdir -p $out_dir

out_vimrc=$out_dir/init.vim
echo "$vimrc -> $out_vimrc"
cp $vimrc $out_vimrc

src_include="$(pwd)/include"
out_inc_dir="$out_dir/include"
mkdir -p "$out_inc_dir"

inc_files="$src_include/*.lua"
inc_files="$inc_files $src_include/*.vim"
for f in $inc_files
do
	filename="$(basename $f)"
	out_link="$out_inc_dir/$filename"
	rm -f $out_link
	ln -s $f $out_link
	echo "$f -> $out_link"
done
