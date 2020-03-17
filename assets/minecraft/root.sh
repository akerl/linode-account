#!/usr/bin/env bash

## Package upgrades
pacman -Syu --noconfirm

## SSH keys
curl -o /root/.ssh/authorized_keys https://id-ed25519.pub/groups/strong.txt

## Docker setup
pacman -S --noconfirm --needed docker
systemctl enable docker

## Minecraft setup
mkdir -p /opt/minecraft/data

cat <<EOF > /opt/minecraft/data/server.properties
enforce-whitelist=false
max-players=100
motd=Welcome to the virtual standup. Do you have any block-ers?
op-permission-level=4
white-list=true
EOF

cat <<EOF > /opt/minecraft/data/ops.json
[
  {
    "uuid": "fc40b0f2-3298-499e-84e6-9e6b22aaeec2",
    "name": "akerl",
    "level": 4,
    "bypassesPlayerLimit": true
    }
]
EOF

cat <<EOF > /etc/systemd/system/minecraft.service
[Unit]
Description=Minecraft container
After=docker.service
Requires=docker.service

[Service]
ExecStartPre=/usr/bin/docker pull itzg/minecraft-server
ExecStart=/usr/bin/docker run -i -p 25565:25565 -e EULA=TRUE -v /opt/minecraft/data:/data --name minecraft itzg/minecraft-server
ExecStop=/usr/bin/docker stop --time 30 minecraft
ExecStopPost=/usr/bin/docker rm minecraft

[Install]
WantedBy=multi-user.target
EOF

systemctl enable minecraft.service

## Backup setup
mkdir -p /opt/minecraft/backups

cat <<EOF > /usr/local/bin/minecraft_backup.sh
#!/usr/bin/env bash

set -euo pipefail

alias rcon="docker exec minecraft rcon-cli"

function cleanup {
    rcon save-on
}
trap cleanup EXIT

rcon save-off
rcon save-all
sleep 30
tar czvf /opt/minecraft/backups/world-$$(date "+%Y%m%d-%H%M%S").tar.gz /opt/minecraft/data/world
cleanup
EOF

chmod a+x /usr/local/bin/minecraft_backup.sh

cat <<EOF > /etc/systemd/system/backup.service
[Unit]
Description=Backup for Minecraft

[Service]
Type=oneshot
ExecStart=/usr/local/bin/minecraft_backup.sh
EOF

cat <<EOF > /etc/systemd/system/backup.timer
[Unit]
Description=Run backup once per hour

[Timer]
OnBootSec=15min
OnUnitActiveSec=1h

[Install]
WantedBy=timers.target
EOF

systemctl enable backup.timer

shutdown
