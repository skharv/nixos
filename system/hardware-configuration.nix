{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/f54ff3d8-4529-4328-b9fe-eafac01ae997";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2858-531A";
      fsType = "vfat";
    };

  fileSystems."/home" = 
    { device = "/dev/disk/by-uuid/21a17577-c8f0-4a07-8899-ed73821749bb";
      fsType = "ext4";
    };

  fileSystems."/windows" =
    { device = "/dev/disk/by-uuid/30EE162AEE15E93C";
      fsType = "ntfs";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/5ecb5fa8-4aa1-49ac-8895-d28c4fa2133a"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

