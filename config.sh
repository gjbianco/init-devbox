# create home dirs
mkdir -p \
  ~/bin \
  ~/code \
  ~/code/gls

# dotfiles
DOTFILES_REPO="https://github.com/gjbianco/dotfiles"
DOTFILES_PATH="$HOME/bin/dotfiles"
DOTFILES=(
  .config/fish
  .config/sway
  .config/waybar
  .config/alacritty
  .gitconfig
  .gitignore_global
  .tmux.conf
  .vimrc
  .vale.ini
)
mkdir -p .config && \
git clone $DOTFILES_REPO $DOTFILES_PATH
for i in $DOTFILES; do
  echo "Symlinking $HOME/$i -> $DOTFILES_PATH/$i"
  ln -s $DOTFILES_PATH/$i $HOME/$i
done

# switch to fish shell
chsh -s /usr/bin/fish

# generate SSH keypair
ssh-keygen -f ~/.ssh/id_rsa
