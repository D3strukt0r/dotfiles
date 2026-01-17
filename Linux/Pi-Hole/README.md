# Pi-Hole

## Setup

Install latest headless version of Debian/Raspian 64 Bit

```shell
sudo apt update
sudo apt full-upgrade
```

Set static ip as recommended by setup tool either in Router or in CLI on the Pi

```shell
# Check your current connection name
nmcli con show

# Set static IP (adjust values to your network)
sudo nmcli con mod "netplan-eth0" \
  ipv4.addresses 192.168.1.10/24 \
  ipv4.gateway 192.168.1.1 \
  ipv4.dns "192.168.1.1" \
  ipv4.method manual
sudo nmcli con mod "netplan-wlan0-M&R WLAN" \
  ipv4.addresses 192.168.1.11/24 \
  ipv4.gateway 192.168.1.1 \
  ipv4.dns "192.168.1.1" \
  ipv4.method manual

# eth0 preferred (lower metric)
sudo nmcli con mod "netplan-eth0" ipv4.route-metric 100
# wlan0 as fallback (higher metric)
sudo nmcli con mod "netplan-wlan0-M&R WLAN" ipv4.route-metric 600

# Apply changes
sudo nmcli con up "netplan-eth0"
sudo nmcli con up "netplan-wlan0-M&R WLAN"
```

```shell
curl -sSL https://install.pi-hole.net | bash
```

Add current user to `pihole` group to access more easily

```shell
sudo usermod -aG pihole $USER
```

Choose `Quad9 (filtered, DNSSEC)` Quad9 is Swiss based and privacy focused.

https://docs.pi-hole.net/main/post-install/

Create self-signed certificate for web interface

```shell
sudo pihole-FTL --config webserver.domain pi-hole.local

sudo pihole-FTL --gen-x509 /etc/pihole/tls.pem pi-hole.local
# or
sudo rm /etc/pihole/tls*

sudo systemctl restart pihole-FTL
```

And import into browsers https://docs.pi-hole.net/api/tls/

Option 1: Via Windows (works for all browsers)

1. Double-click the tls_ca.crt file
2. Click Zertifikat installieren...
3. Select Lokaler Computer → Weiter
4. Alle Zertifikate in folgendem Speicher speichern → Durchsuchen
5. Select Vertrauenswürdige Stammzertifizierungsstellen
6. Weiter → Fertig stellen

Option 2: Via Brave directly
Click on "Von dir installiert" under "Benutzerdefiniert" — there should be an import option there.
