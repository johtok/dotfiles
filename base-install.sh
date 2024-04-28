# installing rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#installing helix
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix

#installing pixi
curl -fsSL https://pixi.sh/install.sh | bash

$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply johtok
chezmoi update
