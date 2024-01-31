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

sudo apt-get update

sudo apt-get install -y neovim
echo "--- Neovim installed"
