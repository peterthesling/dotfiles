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

# Install dependencies
#
echo
echo Installing dependencies
echo -----------------------
echo

function install {
  if ! command -v name &> /dev/null; then
    if command -v apt-get &> /dev/null; then
      sudo apt-get install -y $1
    elif command -v brew &> /dev/null; then
      brew install $1
    fi
  fi
  echo "--- $1 installed"
}

# Prezto (https://github.com/sorin-ionescu/prezto)
if [ ! -d "$HOME/.zprezto" ]; then
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
fi
echo --- Prezto installed
echo

# LS_COLORS (https://github.com/trapd00r/LS_COLORS)
curl -so ~/.LS_COLORS https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS
echo --- LS_COLORS definitions downloaded
echo

# Neovim
curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall
echo --- nvim configured
echo

install bat

# bat uses a different name on Ubuntu
if [ -f /usr/bin/batcat ]; then
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
fi

install hub
