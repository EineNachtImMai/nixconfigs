# Auto-generated using compose2nix v0.3.1.
{
  pkgs,
  lib,
  ...
}: {
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };

  # Enable container name DNS for non-default Podman networks.
  # https://github.com/NixOS/nixpkgs/issues/226365
  networking.firewall.interfaces."podman+".allowedUDPPorts = [53];

  virtualisation.oci-containers.backend = "podman";

  # Containers
  virtualisation.oci-containers.containers."caddy" = {
    image = "docker.io/library/caddy:2-alpine";
    environment = {
      "SEARXNG_HOSTNAME" = "http://localhost";
      "SEARXNG_TLS" = "internal";
    };
    volumes = [
      "/home/blackstar/dev/docker/searxng-docker/Caddyfile:/etc/caddy/Caddyfile:ro"
      "searxng_caddy-config:/config:rw"
      "searxng_caddy-data:/data:rw"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network=host"
    ];
  };
  systemd.services."podman-caddy" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-volume-searxng_caddy-config.service"
      "podman-volume-searxng_caddy-data.service"
    ];
    requires = [
      "podman-volume-searxng_caddy-config.service"
      "podman-volume-searxng_caddy-data.service"
    ];
    partOf = [
      "podman-compose-searxng-root.target"
    ];
    wantedBy = [
      "podman-compose-searxng-root.target"
    ];
  };
  virtualisation.oci-containers.containers."redis" = {
    image = "docker.io/valkey/valkey:8-alpine";
    volumes = [
      "searxng_valkey-data2:/data:rw"
    ];
    cmd = ["valkey-server" "--save" "30" "1" "--loglevel" "warning"];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=redis"
      "--network=searxng_searxng"
    ];
  };
  systemd.services."podman-redis" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-searxng_searxng.service"
      "podman-volume-searxng_valkey-data2.service"
    ];
    requires = [
      "podman-network-searxng_searxng.service"
      "podman-volume-searxng_valkey-data2.service"
    ];
    partOf = [
      "podman-compose-searxng-root.target"
    ];
    wantedBy = [
      "podman-compose-searxng-root.target"
    ];
  };
  virtualisation.oci-containers.containers."searxng" = {
    image = "docker.io/searxng/searxng:latest";
    environment = {
      "SEARXNG_BASE_URL" = "https://localhost/";
    };
    volumes = [
      "/home/blackstar/dev/docker/searxng-docker/searxng:/etc/searxng:rw"
      "searxng_searxng-data:/var/cache/searxng:rw"
    ];
    ports = [
      "127.0.0.1:8080:8080/tcp"
    ];
    log-driver = "journald";
    extraOptions = [
      "--network-alias=searxng"
      "--network=searxng_searxng"
    ];
  };
  systemd.services."podman-searxng" = {
    serviceConfig = {
      Restart = lib.mkOverride 90 "always";
    };
    after = [
      "podman-network-searxng_searxng.service"
      "podman-volume-searxng_searxng-data.service"
    ];
    requires = [
      "podman-network-searxng_searxng.service"
      "podman-volume-searxng_searxng-data.service"
    ];
    partOf = [
      "podman-compose-searxng-root.target"
    ];
    wantedBy = [
      "podman-compose-searxng-root.target"
    ];
  };

  # Networks
  systemd.services."podman-network-searxng_searxng" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "podman network rm -f searxng_searxng";
    };
    script = ''
      podman network inspect searxng_searxng || podman network create searxng_searxng
    '';
    partOf = ["podman-compose-searxng-root.target"];
    wantedBy = ["podman-compose-searxng-root.target"];
  };

  # Volumes
  systemd.services."podman-volume-searxng_caddy-config" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect searxng_caddy-config || podman volume create searxng_caddy-config
    '';
    partOf = ["podman-compose-searxng-root.target"];
    wantedBy = ["podman-compose-searxng-root.target"];
  };
  systemd.services."podman-volume-searxng_caddy-data" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect searxng_caddy-data || podman volume create searxng_caddy-data
    '';
    partOf = ["podman-compose-searxng-root.target"];
    wantedBy = ["podman-compose-searxng-root.target"];
  };
  systemd.services."podman-volume-searxng_searxng-data" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect searxng_searxng-data || podman volume create searxng_searxng-data
    '';
    partOf = ["podman-compose-searxng-root.target"];
    wantedBy = ["podman-compose-searxng-root.target"];
  };
  systemd.services."podman-volume-searxng_valkey-data2" = {
    path = [pkgs.podman];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      podman volume inspect searxng_valkey-data2 || podman volume create searxng_valkey-data2
    '';
    partOf = ["podman-compose-searxng-root.target"];
    wantedBy = ["podman-compose-searxng-root.target"];
  };

  # Root service
  # When started, this will automatically create all resources and start
  # the containers. When stopped, this will teardown all resources.
  systemd.targets."podman-compose-searxng-root" = {
    unitConfig = {
      Description = "Root target generated by compose2nix.";
    };
    wantedBy = ["multi-user.target"];
  };
}
