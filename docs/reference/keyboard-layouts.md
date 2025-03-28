# Keyboard Layouts

## Western European keyboard with AltGr dead keys

- [Writing non-English languages with a QWERTY keyboard](https://choam.eu/altgr-intl/)
- [Xorg: Using the US International (altgr-intl variant) Keyboard Layout](https://zuttobenkyou.wordpress.com/2011/08/24/xorg-using-the-us-international-altgr-intl-variant-keyboard-layout/)
- [cjuniet/altgr-weur](https://github.com/cjuniet/altgr-weur) version for Microsoft Keyboard Layout Editor

Related configuration files:

- `/usr/share/X11/xkb/symbols/usaltgrweur` adds the layout to X11 keyboard definitions
- `/etc/X11/xorg.conf.d/40-yd60mq.conf` provides the corresponding configuration for the YMDK YD60MQ keyboard
- `/etc/X11/xorg.conf.d/41-dz60.conf` provides the corresponding configuration for the KBDFans DZ60 keyboard
