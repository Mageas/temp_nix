nix-shell -p git nixFlakes

# Set HOST to the desired hostname of this system
HOST=nixos
# Set USER to your desired username (defaults to hlissner)
USER=nix

sudo git clone https://github.com/mageas/temp_nix /etc/dotfiles \
    cd /etc/dotfiles

# Create a host config in `hosts/` and add it to the repo:
sudo mkdir -p hosts/$HOST \
    sudo nixos-generate-config --root /mnt --dir /etc/dotfiles/hosts/$HOST \
    sudo rm -f hosts/$HOST/configuration.nix \
    sudo cp hosts/kuro/default.nix hosts/$HOST/default.nix \
    sudo vim hosts/$HOST/default.nix \  # configure this for your system; don't use it verbatim!
    sudo git add hosts/$HOST

# Install nixOS
USER=$USER sudo nixos-install --root /mnt --impure --flake .#$HOST

# If you get 'unrecognized option: --impure', replace '--impure' with 
# `--option pure-eval no`.

# Then move the dotfiles to the mounted drive!
sudo mv /etc/dotfiles /mnt/etc/dotfiles
