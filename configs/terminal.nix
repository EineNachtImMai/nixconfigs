{pkgs, ...}: {
  # make zsh default
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # # Enable Oh-my-zsh
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = ["git"];
  };
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
}
