# fix for screen readers
if grep -Fqa 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi

~/.automated_script.sh
mv /root/initramfs /lib/calamares/modules/
mv /root/initramfscfg /lib/calamares/modules/
