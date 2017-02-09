default:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	git submodule update --init
	echo "source ~/.vim/.vimrc" > ~/.vimrc
	brew install fzf
	./powerline-fonts/install.sh
	vim +PlugInstall +qall
