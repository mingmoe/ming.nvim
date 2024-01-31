
sudo pacman -S --noconfirm ripgrep
./compile.sh
./upinit.sh

# clone and update plugins
nvim --headless "+q" +qa
nvim --headless "+Lazy! sync" +qa

