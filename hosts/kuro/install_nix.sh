nix-shell -p git nixFlakes

# Set HOST to the desired hostname of this system
HOST=...
# Set USER to your desired username (defaults to hlissner)
USER=...

git clone https://github.com/hlissner/dotfiles /etc/dotfiles
cd /etc/dotfiles

# Create a host config in `hosts/` and add it to the repo:
mkdir -p hosts/$HOST
nixos-generate-config --root /mnt --dir /etc/dotfiles/hosts/$HOST
rm -f hosts/$HOST/configuration.nix
cp hosts/kuro/default.nix hosts/$HOST/default.nix
vim hosts/$HOST/default.nix  # configure this for your system; don't use it verbatim!
git add hosts/$HOST

# Install nixOS
USER=$USER nixos-install --root /mnt --impure --flake .#$HOST

# If you get 'unrecognized option: --impure', replace '--impure' with 
# `--option pure-eval no`.

# Then move the dotfiles to the mounted drive!
mv /etc/dotfiles /mnt/etc/dotfiles
