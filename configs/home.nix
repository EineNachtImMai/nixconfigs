{
  inputs,
  pkgs,
  catppuccin,
  ...
}: {
  # imports = [catppuccin.homeManagerModules.catppuccin];

  home.username = "enim";
  home.homeDirectory = "/home/enim";

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-mocha";
    };
  };

  programs.git = {
    enable = true;
    userName = "EineNachtImMai";
    userEmail = "titouan.cazaubieilh@proton.me";
  };

  /*
     xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "zathura.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/chrome" = "zen.desktop";
      "text/html" = "zen.desktop";
      "application/x-extension-htm" = "zen.desktop";
      "application/x-extension-html" = "zen.desktop";
      "application/x-extension-shtml" = "zen.desktop";
      "application/xhtml+xml" = "zen.desktop";
      "application/x-extension-xhtml" = "zen.desktop";
      "application/x-extension-xht" = "zen.desktop";
      "x-scheme-handler/magnet" = "userapp-transmission-gtk-9QZU42.desktop";
    };
  };
  */

  /*
     programs.yazi = {
    enable = true;
    catppuccin.enable = true;
  };
  */

  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        font = "JetBrains Mono 9";
        corner_radius = 20;

        frame_color = "#89b4fa";
        separator_color = "#89b4fa";
        highlight = "#89b4fa";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 5;
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 10;
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
        timeout = 15;
      };
    };
  };

  home.stateVersion = "24.11";

  /*
     programs.hyprlock = {
    catppuccin.enable = true;
  };
  */
}
