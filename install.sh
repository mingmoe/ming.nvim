
sudo pacman -S --noconfirm ripgrep
./setup-init.sh

# clone and update plugins
nvim --headless "+q" +qa
nvim --headless "+Lazy! sync" +qa

