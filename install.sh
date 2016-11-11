# check for sudo
	test "$(whoami)" != 'root' && (echo "please run with sudo"; exit 1)

# installing NeoVim
	# test for Debian/Ubuntu
		test "$(lsb_release -si)" != 'Debian' && (
		# if Ubuntu:
			apt-get install software-properties-common;
			add-apt-repository ppa:neovim-ppa/unstable;
			apt-get update;)
	apt-get install neovim

# install urxvt (terminal)
	# installing AnonymousPro Powerline font
		mkdir /usr/share/fonts/truetype/AnonymousPro
		wget "https://github.com/powerline/fonts/blob/5ab87ea663d60ea49afdc5cc772e99bcceb4a128/AnonymousPro/Anonymice%20Powerline.ttf?raw=true"
		chown root /usr/share/fonts/truetype/AnonymousPro/*.ttf
		fc-cache
	apt-get install rxvt-unicode
	# configuration file
		mv ./Xresources ~/.Xresources

# installing zsh
	# getting dircolors
		wget "https://raw.githubusercontent.com/seebi/dircolors-solarized/e18f60bae38d71c74f028ca5199fc63fe1690f74/dircolors.256dark" -O ~/.dircolors.256dark
	# getting zsh
		apt-get install zsh
	# installing oh-my-zsh
		sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	# installing plugins
		git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	# install fzf
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
		~/.fzf/install
		set rtp+=~/.fzf
	# installing zsh config
		mv ./zshrc ~/.zshrc