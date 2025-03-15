{
  inputs,
  pkgs,
  ...
}: {
  home.username = "blackstar";
  home.homeDirectory = "/home/blackstar";

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

  /*
     home.file."/home/blackstar/.config/hypr/hyprland.conf".text = ''

    #
    # Please note not all available settings / options are set here.
    # For a full list, see the wiki
    #


    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor=eDP-1,1920x1080@60,0x0,1

    # See https://wiki.hyprland.org/Configuring/Keywords/ for more

    # Execute your favorite apps at launch
    # exec-once = waybar & hyprpaper & firefox

    # Source a file (multi-file configs)
    # source = ~/.config/hypr/myColors.conf

    # Set programs that you use
    $terminal = kitty
    $fileManager = thunar
    $browser = zen
    $menu = wofi --show=drun -I
    $help = /home/blackstar/.config/hypr/scripts/hints.sh

    # Some default env vars.
    env = XCURSOR_THEME,catppuccin-mocha-dark-cursors
    env = XCURSOR_SIZE,24

    env = HYPRCURSOR_THEME,catppuccin-mocha-dark-cursors
    env = HYPRCURSOR_SIZE,24


    env = WLR_NO_HARDWARE_CURSORS,1

    exec-once = hyprpaper
    exec-once = waybar
    exec-once = hyprctl setcursor catppuccin-mocha-dark-cursors 24

    # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    input {
        kb_layout =fr
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =
        numlock_by_default = true

        follow_mouse = 1

        touchpad {
            natural_scroll = yes
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(f88379ee) # rgba(f88379ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
    }

    decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 10

        blur {
            enabled = true
            size = 3
            passes = 1
        }

        # shadow = yes
        # shadow_range = 4
        # shadow_render_power = 3
        # col.shadow = rgba(1a1a1aee)
    }

    animations {
        enabled = yes

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
    }

    dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
    }

    gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = on
    }

    misc {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
        # font_family = JetBrainsMonoNF
    }

    windowrule = noborder, wofi
    windowrule = noshadow, wofi


    # See https://wiki.hyprland.org/Configuring/Keywords/ for more
    $mainMod = SUPER

    # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
    bind = $mainMod, Q, exec, $terminal # Ouvre le terminal
    bind = $mainMod SHIFT, COMMA, exec, $help # Ouvre cette fenêtre d'aide
    bind = $mainMod, C, killactive # Ferme la fenêtre actuelle
    bind = $mainMod, E, exec, $fileManager # Ouvre l'explorateur de fichiers
    bind = $mainMod, V, togglefloating # Alterne entre fenêtre flottante et grand écran
    bind = $mainMod, R, exec, $menu # Ouvre l'outil pour chercher des programmes
    # bind = $mainMod, P, pseudo # dwindle
    bind = $mainMod, J, togglesplit # Alterne entre séparation verticale et horizontale des fenêtres
    bind = $mainMod, B, exec, $browser # Ouvre firefox

    bind = $mainMod ALT, left, workspace, -1 # Bureau précédent
    bind = $mainMod ALT, right, workspace, +1 # Bureau suivant


    bind = $mainMod, X, exec, grim -l 0 -g "$(slurp)" - | wl-copy # Capture d'écran (sélectionner une  partie de l'écran)

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l # sélectionne la fenêtre à gauche
    bind = $mainMod, right, movefocus, r # sélectionne la fenêtre à droite
    bind = $mainMod, up, movefocus, u # sélectionne la fenêtre en haut
    bind = $mainMod, down, movefocus, d # sélectionne la fenêtre en bas

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1 # Saute au bureau numéro 1
    bind = $mainMod, 2, workspace, 2 # Saute au bureau numéro 2
    bind = $mainMod, 3, workspace, 3 # Saute au bureau numéro 3
    bind = $mainMod, 4, workspace, 4 # Saute au bureau numéro 4
    bind = $mainMod, 5, workspace, 5 # Saute au bureau numéro 5
    bind = $mainMod, 6, workspace, 6 # Saute au bureau numéro 6
    bind = $mainMod, 7, workspace, 7 # Saute au bureau numéro 7
    bind = $mainMod, 8, workspace, 8 # Saute au bureau numéro 8
    bind = $mainMod, 9, workspace, 9 # Saute au bureau numéro 9
    bind = $mainMod, 0, workspace, 10 # Saute au bureau numéro 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1 # Déplace la fenêtre au bureau numéro 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2 # Déplace la fenêtre au bureau numéro 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3 # Déplace la fenêtre au bureau numéro 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4 # Déplace la fenêtre au bureau numéro 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5 # Déplace la fenêtre au bureau numéro 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6 # Déplace la fenêtre au bureau numéro 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7 # Déplace la fenêtre au bureau numéro 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8 # Déplace la fenêtre au bureau numéro 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9 # Déplace la fenêtre au bureau numéro 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10 # Déplace la fenêtre au bureau numéro 10

    # bring up the power off menu
    bind = $mainMod, A, exec, wlogout # Menu pour déconnecter / éteindre / verrouiller

    # Example special workspace (scratchpad)
    bind = $mainMod, S, togglespecialworkspace, magic # Bureau magique (se met par dessus le reste)
    bind = $mainMod SHIFT, S, movetoworkspace, special:magic # Déplacer vers le bureau magique

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod SHIFT CTRL, right, movetoworkspace, e+1 # Déplace la fenêtre vers le bureau précédent
    bind = $mainMod SHIFT CTRL, left, movetoworkspace, e-1 # Déplace la fenêtre vers le bureau précédent

    # █▀▄▀█ █▀█ █░█ █▀▀
    # █░▀░█ █▄█ ▀▄▀ ██▄
    bind = $mainMod SHIFT, left, movewindow, l # Déplace la fenêtre vers la gauche
    bind = $mainMod SHIFT, right, movewindow, r # Déplace la fenêtre vers la droite
    bind = $mainMod SHIFT, up, movewindow, u # Déplace la fenêtre vers le haut
    bind = $mainMod SHIFT, down, movewindow, d # Déplace la fenêtre vers le bas

    # █▀█ █▀▀ █▀ █ ▀█ █▀▀
    # █▀▄ ██▄ ▄█ █ █▄ ██▄
    bind = $mainMod CTRL, left, resizeactive, -20 0 # Elargit la fenêtre vers la gauche
    bind = $mainMod CTRL, right, resizeactive, 20 0 # Elargit la fenêtre vers la droite
    bind = $mainMod CTRL, up, resizeactive, 0 -20 # Elargit la fenêtre vers le haut
    bind = $mainMod CTRL, down, resizeactive, 0 20 # Elargit la fenêtre vers le bas

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow # Déplace la fenêtre avec la souris
    bindm = $mainMod, mouse:273, resizewindow # Elargit la fenêtre avec la souris

    # HYPRTASKING
    # bind = $mainMod, tab, hyprtasking:toggle, cursor
    # bind = $mainMod, space, hyprtasking:toggle, all
    #
    # bind = $mainMod SHIFT, X, hyprtasking:killhovered
    #
    # bind = $mainMod, H, hyprtasking:move, left
    # bind = $mainMod, J, hyprtasking:move, down
    # bind = $mainMod, K, hyprtasking:move, up
    # bind = $mainMod, L, hyprtasking:move, right
    #
    # plugin {
        # hyprtasking {
            # layout = grid
    #
            # gap_size = 20
            # bg_color = 0xff26233a
            # border_size = 4
            # exit_behavior = active interacted original hovered
    #
            # gestures {
                # enabled = true
                # open_fingers = 3
                # open_distance = 300
                # open_positive = true
            # }
    #
            # grid {
                # rows = 3
                # cols = 3
            # }
    #
            # linear {
                # height = 400
                # scroll_speed = 1.1
                # blur = 0
            # }
        # }
    # }
  '';
  */
  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";

  home.packages = [
  ];

  wayland.windowManager.hyprland = {
    /*
       enable = true;
    settings = {
      kb_layout = "fr";
    };
    */
    /*
       plugins = [
      inputs.hyprtasking.packages."x86_64-linux".hyprtasking
    ];
    */
  };
}
