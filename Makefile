default:
	git submodule update --init
	echo "source ~/.vim/.vimrc" > ~/.vimrc
	brew install fzf
	./powerline-fonts/install.sh
