# PillowCreate

A small Create: Aeronautics multiplayer pack. Drop in, build airships, fly stuff.

<p align="center">
  <img src="dist/icon.png" width="128" height="128" alt="PillowCreate icon">
</p>

## Install (≈5 minutes)

### 1. Get a launcher

The vanilla Minecraft launcher **won't work** for this — it doesn't understand modpacks. Use one of:

| Launcher | Link | Notes |
|---|---|---|
| **Modrinth App** *(recommended)* | [modrinth.com/app](https://modrinth.com/app) | Free, Windows/Mac/Linux. Handles Java automatically. Easiest path. |
| Prism Launcher | [prismlauncher.org](https://prismlauncher.org/) | Free, more advanced. Use if you already have it. |

### 2. Download PillowCreate

[**↓ Download the latest `.mrpack`**](https://github.com/LPettay/pillowcreate/releases/latest)

(The file is tiny — ~1 KB. The launcher fetches the actual mods on import.)

### 3. Import into your launcher

**Modrinth App:** drag the `.mrpack` file onto the app window. Or: top bar → **Add Instance** → **From File**.

**Prism Launcher:** **Add Instance** → **Import from Zip** → pick the `.mrpack`.

The launcher will fetch (~80 MB total, takes a minute):
- NeoForge 1.21.1 (mod loader, auto-installed)
- Create 6.0.10
- Sable 1.2.2
- Create Aeronautics 1.2.1 *(planes, airships, drones, balloons, ground vehicles)*
- KubeJS + Rhino *(for server-side tweaks)*

### 4. Allocate 6 GB RAM

Create + Aeronautics is heavier than vanilla. Default 2–3 GB stutters or crashes.

**Modrinth App** → click PillowCreate instance → **Options** (gear icon) → **Java and Memory** → drag **Allocated Memory** to **6144 MiB**.

**Prism Launcher** → right-click instance → **Edit Instance** → **Settings** → **Java** → check **Memory override** → **Maximum: 6144 MB**.

### 5. Connect to the server

1. Hit Play.
2. **Multiplayer** → **Add Server**.
3. Server address: *(get from Lance — usually `192.168.1.3` for LAN, otherwise his Tailscale or public IP)*
4. Join.

That's it. You're flying.

---

## Updates

When a new version drops, you'll need to redownload the `.mrpack` and reimport — sideloaded packs don't auto-update. (One known annoyance: a fresh import creates a *new* instance instead of updating the old one. Delete the previous PillowCreate instance after the new one works.)

---

## For Lance (server host)

### Start / stop

```bash
docker compose up -d
docker compose logs -f          # follow first boot
docker compose down
```

Or double-click `start-server.bat` / `stop-server.bat` from Windows.

### Op a player

```bash
docker exec pillowcreate rcon-cli op <username>
```

Or set `OPS=<username>` in `.env` for it to persist across container recreates.

### Ports

`25565/tcp` — that's it. Forward on the router for internet play, or expose via Tailscale.

### Backups

```bash
docker exec pillowcreate rcon-cli save-all flush
tar czf backup-$(date +%Y%m%d).tgz data/world
```

### Add or change a mod

Append the Modrinth slug to `MODRINTH_PROJECTS` in `docker-compose.yml`, then `docker compose up -d --force-recreate`. Also add the same mod to `scripts/modrinth.index.json`, run `bash scripts/build-mrpack.sh`, push a new release — buddies need to reimport.

### Tweaks

- Recipes / events / commands: `kubejs/server_scripts/*.js`. `/reload` in-game picks them up.
- Datapacks: drop into `data/world/datapacks/` and `/reload`.
- Mod configs: edit files under `data/config/*` then restart the container.
