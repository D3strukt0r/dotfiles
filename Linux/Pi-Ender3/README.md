# Ender 3

## Setup

Raspberry Pi 3 Model B Plus Rev 1.3

Install OctoPi (which is currently on bookworm)

To fix `W: http://raspbian.raspberrypi.com/raspbian/dists/bookworm/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.`:

```shell
sudo sed -i 's|\[ arch=armhf \]|[arch=armhf signed-by=/usr/share/keyrings/raspbian-archive-keyring.gpg]|' /etc/apt/sources.list
sudo rm /etc/apt/trusted.gpg
```

Then update the package lists and upgrade the system (~15min, needs 2 interventions).:

Note: `--allow-releaseinfo-change` is required to fix `N: Repository 'http://raspbian.raspberrypi.com/raspbian bookworm InRelease' changed its 'Suite' value from 'stable' to 'oldstable'`

```shell
sudo apt update --allow-releaseinfo-change
sudo apt full-upgrade --auto-remove
```

During Upgrade, it asks about updating `/etc/initramfs-tools/initramfs.conf`. Choose `No` to keep the local version.

It will also ask about updating `/etc/ssh/sshd_config`. Choose `keep the local version currently installed`, to keep the IPQoS settings.

`install the package maintainer's version`

```shell
~/oprint/bin/python -m pip install --upgrade pip
~/oprint/bin/pip install pybind11 # for printoid
```

**Important**: Do not upgrade to Trixie (Debian 13) yet, as OctoPrint is not compatible with Python 3.12+ at the moment.

Then restore OctoPrint in the Web UI (~10 min).

Including Plugins (18):

- bedlevelvisualizer
- BLTouch
- cancelobject
- DisplayLayerProgress
- excluderegion
- firmwareupdater
- gcodebar
- GcodeEditor
- navbartemp
- octoeverywhere
- octolapse
- printoid
- PrintTimeGenius
- simpleemergencystop
- taborder
- themeify
- toptemp
- touchui

Add self-signed certificate for OctoPrint access over HTTPS

https://community.octoprint.org/t/setup-a-new-self-signed-ssl-certificate-on-octoprint-enable-https/30256

```shell
# Generate private key
sudo openssl genrsa -out /etc/ssl/octopi.key 2048

# Generate certificate (replace STATIC_IP)
sudo openssl req -new -x509 -sha256 -days 365 \
  -key /etc/ssl/octopi.key \
  -out /etc/ssl/octopi.cer \
  -subj "/CN=ender3-octopi.local" \
  -addext "subjectAltName=DNS:ender3-octopi.local,DNS:ender3-octopi"

# Combine into .pem
sudo bash -c 'cat /etc/ssl/octopi.key /etc/ssl/octopi.cer > /etc/ssl/octopi.pem'

# Change certificate path from snakeoil.pem to octopi.pem
sudo sed -i 's|/etc/ssl/snakeoil.pem|/etc/ssl/octopi.pem|g' /etc/haproxy/haproxy.cfg

# Add HTTPS redirect
sudo sed -i '/option forwardfor except 127.0.0.1/a\        redirect scheme https if !{ hdr(Host) -i 127.0.0.1 } !{ ssl_fc }' /etc/haproxy/haproxy.cfg

# Restart HAProxy
sudo systemctl restart haproxy
```

## Non-functional upgrade to Trixie (Debian 13)

https://forums.raspberrypi.com/viewtopic.php?t=392376

````bash
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list
sudo sed -i 's/bookworm/trixie/g' /etc/apt/sources.list.d/*.list   

sudo apt update

sudo apt purge -y raspberrypi-ui-mods
sudo apt autoremove -y

# ~40min
sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" --purge --auto-remove

sudo reboot

sudo apt modernize-sources

lsb_release -c
# Should output "Codename:	trixie"
```

Change `IPQoS 0x00` to `IPQoS lowdelay throughput` in `/etc/ssh/sshd_config` to fix slow SSH connections after upgrade.

```bash
curl -LO https://get.octoprint.org/octoprint-venv-tool && chmod +x octoprint-venv-tool
sudo systemctl stop octoprint

~/oprint/bin/python -m ensurepip --upgrade
~/oprint/bin/python -m pip install --upgrade pip

octoprint-venv-tool recreate-venv /home/<user>/oprint --python /usr/bin/python3
# if plugins misbehave, you can try:
octoprint-venv-tool recreate-venv /home/<user>/oprint --python /usr/bin/python3 --ignore-plugin-errors
sudo systemctl start octoprint
```

Octolapse only supports up to Python 3.11, so no need to upgrade anything there.
