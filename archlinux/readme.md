# archlinux

# edit kernel parameters for specific preset

Append `--quiet` to `/etc/mkinitcpio.d/linux.preset` in `default_options` to disable verbose during the boot screen for that uki only

# disable watchdog

See watchdog status with `cat /proc/sys/kernel/watchdog`

See watchdog device status with `wdctl`

Add `nowatchdog` to `/etc/kernel/cmdline` to disable watchdog

For Intel TCO hardware watchdog, blacklist the module resposible for watchdog by adding `module_blacklist=iTCO_wdt` to `/etc/kernel/cmdline`

# bootloader display timeout

Change timeout to 0 in `/boot/loader/loader.conf` to not display the bootloader menu during boot

# rebuild the uki

After performing all your kernel parameter modifications, rebuild the uki

```
sudo mkinitcpio -p linux
```
