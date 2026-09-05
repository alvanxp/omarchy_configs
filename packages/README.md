# Packages and tools

`extra-packages.txt` contains explicitly installed packages detected on the
source machine that are not in Omarchy's current base package list.

Install them with:

```bash
yay -S --needed - < packages/extra-packages.txt
```

Some entries may be available from the Arch repositories and some from the
Omarchy/AUR package sources configured on the machine.

Hardware-dependent packages such as NVIDIA/AMD drivers, ASUS utilities,
fingerprint support, and laptop-specific kernel modules are intentionally not
included. Select those based on the target computer.

