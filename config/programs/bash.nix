{ hostname, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      nixedit = "sudo -E nvim /etc/nixos";
      nixrb = "sudo nixos-rebuild switch --flake /etc/nixos/#${hostname}";
    };
  };
}
