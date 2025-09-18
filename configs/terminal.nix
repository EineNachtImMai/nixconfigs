{pkgs, ...}: {
  # make zsh default
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = ["git"];
  };
  programs.zsh.promptInit = ''eval "$(starship init zsh)"'';
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
}
