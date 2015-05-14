# Ensure we start in the user's home directory
cd ~

#
# Core Installations
#

echo -e "Installing core"

sudo xcode-select --install

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew-cask apps directory
sudo mkdir /opt

# Hide it!
sudo chflags hidden /opt

# Install homebrew-cask for easily installing application binaries
brew tap caskroom/cask

# Betas, etc
brew tap caskroom/versions
brew install brew-cask

brew cask install dropbox
echo "Open Dropbox for configuration"
read

brew cask install alfred
echo "Open Alfred Preferences and set sync folder to ~/Dropbox/Preferences/Alfred"
read

brew cask install sublime-text3

brew cask install google-chrome
echo "Open Chrome and set up accounts for syncing + extensions."
read

brew cask install google-chrome-canary
brew cask install iterm2-nightly

brew install git
brew install node
brew install trash
brew install wget
brew install z
brew install zsh

# Install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

#
# Sublime Text settings
#

echo -e "Setting up Sublime Text"

echo "Open Sublime Text to create initial library files."
read

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/

trash ./User
git clone git@github.com:hollandben/sublime-settings ./User

echo "Install Package Control: https://sublime.wbond.net/installation"
read

cd -

#
# Additional Installations
#

echo "Installing global npm packages"
npm install -g gulp bower grunt-cli jshint jscs

echo "Install VirtualBox"
brew cask install virtualbox

echo "Download VMs from http://dev.modern.ie/tools/vms/"
read

echo "All done"
