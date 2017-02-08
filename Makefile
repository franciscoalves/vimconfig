default:
	git submodule update --init
	echo "source ~/.vim/.vimrc" > ~/.vimrc
	brew install fzf
	./powerline-fonts/install.sh
	vim +PluginInstall +qall
	cd bundle/tern_for_vim;npm install
