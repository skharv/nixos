{
  programs.bash = {
    enable = true;
    shellAliases = {
      editnix = "sudo -E nvim /etc/nixos";
    };
  };
}
