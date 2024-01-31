#! /bin/zsh

cd "${0%/*}"

# Link dotfiles
#
echo
echo Linking dotfiles
echo ----------------
echo

for dotfile in src/**/*; do
	destination=~/.${dotfile:4} # Remove src/ and prepend ~/.

	if [ -d "$dotfile" ] && [ ! -d "$destination" ]; then
		mkdir $destination
	fi

	if [ -f "$dotfile" ]; then
		echo "--- $dotfile -> $destination"
		ln -sf ${dotfile:P} "$destination"
	fi
done

echo "Setting up vimrc for Neovim"
mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# Install dependencies
#
echo
echo Installing dependencies
echo -----------------------
echo

sudo apt-get update

sudo apt-get install -y neovim
echo "--- Neovim installed"

# Installing Vim plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --update-rc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
sudo rm -rf /usr/local/bin/fzf
sudo rm -rf /usr/bin/fzf

# Install plugins
nvim -c 'PlugInstall | qa'
