# create home dirs
mkdir -p \
  ~/bin \
  ~/code \
  ~/code/gls

# dotfiles
DOTFILES_REPO="https://github.com/gjbianco/dotfiles"
DOTFILES_PATH="$HOME/bin/dotfiles"
DOTFILES=(
  ".config/fish/"
  ".config/sway/"
  ".config/waybar/"
  ".config/alacritty/"
  ".gitconfig"
  ".gitignore_global"
  ".tmux.conf"
  ".vimrc"
  ".vale.ini"
)
mkdir -p .config && \
git clone $DOTFILES_REPO $DOTFILES_PATH
for i in "${DOTFILES[@]}"; do
  source_path="$DOTFILES_PATH/${i%/}"  # Remove trailing slash
  target_path="$HOME/$i"
  echo "Symlinking $target_path -> $source_path"
  ln -s -f "$source_path" "$target_path"
done

# switch to fish shell
chsh -s /usr/bin/fish

# generate SSH keypair
ssh-keygen -f ~/.ssh/id_rsa
