
sudo pacman -S --noconfirm ripgrep graphviz
./setup-init.sh

# clone and update plugins
# clone lazy first
nvim --headless "+q" +qa
# call init command
nvim --headless "+InitMoeNvim" +qa

