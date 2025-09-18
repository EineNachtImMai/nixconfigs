{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        /*
           devices = [
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.2:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.3:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:03:00.4-usbv2-0:2.4:1.0-event-kbd"
        ];
        */
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
          )

          (defvar
              tap-time 150
              hold-time 200
          )

          (defalias
            cmd-lyr (layer-toggle command-layer)
          )

          (defalias
            game (layer-switch gaming)
            normal (layer-switch base)
          )

          (defalias
            gaming-mode (tap-hold $tap-time $hold-time ' @game)
            normal-mode (tap-hold $tap-time $hold-time ' @normal)
          )

          (defalias
            mouse-lyr (layer-toggle mouse-layer)
          )

          (defalias
            msup (movemouse-up 4 4)
            msdown (movemouse-down 4 4)
            msleft (movemouse-left 4 4)
            msright (movemouse-right 4 4)
          )

          (defalias
            e (tap-hold $tap-time $hold-time e @mouse-lyr)
          )

          (defalias
            fst (movemouse-speed 200)
            slw (movemouse-speed 50)
            vsl (movemouse-speed 25)
          )

          (defalias
              caps (tap-hold 150 200 esc @cmd-lyr)
              a (tap-hold $tap-time $hold-time a lsft)
              s (tap-hold $tap-time $hold-time s lctl)
              d (tap-hold $tap-time $hold-time d lmet)
              f (tap-hold $tap-time $hold-time f lalt)

              m (tap-hold $tap-time $hold-time ; lsft)
              l (tap-hold $tap-time $hold-time l lctl)
              k (tap-hold $tap-time $hold-time k lmet)
              j (tap-hold $tap-time $hold-time j ralt)
          )

          (deflayer base
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    @e    _    _    _    _    _    _    _    _    _    _
          @caps @a    @s    @d    @f    _    _    @j    @k    @l    @m    @gaming-mode    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )

          (deflayer empty-layer
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )

          (deflayer command-layer
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _    ret    _    _    _    _    _    _    _    _    _    _
          @caps _    _    _    _    _    left    down    up    right    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           _            _ _ _
          )

          (deflayer mouse-layer
          _  _    _    _    _    _    _    _    _    _    _    _    _    _
          _  mrgt    mmid    @e    mlft    _    _    _    _    _    _    _    _    _
          _ _    _    _    @slw    _    @msleft    @msdown    @msup    @msright    _    _    _
          _ _    _    _    _    _    _    _    _    _    _    _
          _ _ _           @vsl            _ _ _
          )


          (deflayer gaming
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    @normal-mode    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
          )
        '';
      };
    };
  };
}
