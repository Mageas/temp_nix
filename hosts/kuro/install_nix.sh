nix-shell -p git nixFlakes

# Set HOST to the desired hostname of this system
HOST=nixos
# Set USER to your desired username (defaults to hlissner)
USER=nix

sudo git clone https://github.com/mageas/temp_nix --branch clean /etc/dotfiles ;
    cd /etc/dotfiles

# Create a host config in `hosts/` and add it to the repo:
sudo mkdir -p hosts/nixos ;
    sudo nixos-generate-config --root /mnt --dir /etc/dotfiles/hosts/nixos ;
    sudo rm -f hosts/nixos/configuration.nix ;
    sudo cp hosts/kuro/default.nix hosts/nixos/default.nix ;
    sudo git add hosts/nixos

# Install nixOS
sudo USER=nix nixos-install --root /mnt --impure --flake .#nixos

# If you get 'unrecognized option: --impure', replace '--impure' with 
# `--option pure-eval no`.

# Then move the dotfiles to the mounted drive!
sudo mv /etc/dotfiles /mnt/etc/dotfiles
