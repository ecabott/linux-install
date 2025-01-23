# archlinux

# edit kernel parameters

Add `quiet` to `/etc/kernel/cmdline` to disable verbose during the boot screen

# disable watchdog

See watchdog status with `cat /proc/sys/kernel/watchdog`

See watchdog device status with `wdctl`

Add `nowatchdog` to `/etc/kernel/cmdline` to disable watchdog

For Intel TCO hardware watchdog, blacklist the module resposible for watchdog by adding `module_blacklist=iTCO_wdt` to `/etc/kernel/cmdline`

# rebuild the uki

After performing all your kernel parameter modifications, rebuild the uki

```
sudo mkinitcpio -p linux
```
