# archlinux

## kernel parameters

Quiet boot: `quiet`

Disable watchdog: `nowatchdog`

Disable Intel TCO hardware watchdog: `module_blacklist=iTCO_wdt`

### edit kernel parameters of a specific boot entry

Add kernel parameters to `/boot/loader/entries/archlinux.conf` in `options`

### edit kernel parameters of a specific unified kernel image(uki)

Add kernel parameters to `/etc/cmdline.d/my_cmdline.conf`

In `/etc/mkinitcpio.d/linux.preset` append `--cmdline /etc/kernel/cmdline` to `fallback_options` to not use the above cmdline for the fallback image (e.g. without quiet).

The uki must me rebuilt for the kernel parameters to take effect

After performing all your kernel parameter modifications, rebuild the uki

`sudo mkinitcpio -p linux`

### watchdog status

See watchdog status with `cat /proc/sys/kernel/watchdog`

See watchdog device status with `wdctl`

### bootloader display timeout

Change timeout to 0 in `/boot/loader/loader.conf` to not display the bootloader menu during boot

## ohmyzsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## intel undervolt

`sudo pacman -S intel-undervolt`

`sudo nano /etc/intel-undervolt.conf`

```
undervolt 0 'CPU' 0
undervolt 1 'GPU' 0
undervolt 2 'CPU Cache' 0
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
```

Change value for `CPU`, `GPU` and `CPU Cache` to your desired undervolt value. `-135` mv in my case.

```
undervolt 0 'CPU' -135
undervolt 1 'GPU' -135
undervolt 2 'CPU Cache' -135
undervolt 3 'System Agent' 0
undervolt 4 'Analog I/O' 0
```

`sudo intel-undervolt apply`

`sudo systemctl enable intel-undervolt.service`

For more info:

`sudo intel-undervolt measure`

`sudo intel-undervolt read`

## gnome

### gnome google account integration

Change `PresentationIdentity` in `~/.config/goa-1.0/accounts.conf` from `email address` to a general term like `Google`

## hyprland

### setup gnome keyring

#### To autounlock the login keyring for console based login

Edit `/etc/pam.d/login`

Add `auth optional pam_gnome_keyring.so` at the end of `auth` section

Add `session optional pam_gnome_keyring.so auto_start` at the end of `session` section

#### To automatically change keyring password with user password for the login keyring

Edit `/etc/pam.d/passwd`

Add `password optional pam_gnome_keyring.so`

Gnome keyring can me managed through `seahorse` gui application

### make vscode use gnome keyring

Add `"password-store": "gnome-libsecret"` to `~/.vscode/argv.json`

### edit power button action

Edit `/etc/systemd/logind.conf`

In the `[Login]` section uncomment `HandlePowerKey` and change its value to `ignore`

Reboot

Now, power button works as defined in your hyprland keybinds.
