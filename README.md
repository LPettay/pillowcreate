# PillowCreate

Create: Aeronautics server. Creative mode. NeoForge 1.21.1.

## Run it (Lance)

One-time:

```bash
cp .env.example .env
# edit .env — set OPS to your Minecraft username
```

Start:

```bash
docker compose up -d
docker compose logs -f          # watch first boot — itzg downloads mods, takes a few minutes
```

Or double-click `start-server.bat` from Windows.

Stop:

```bash
docker compose down
```

### Ports to forward (when ready)

- **25565/tcp** — Minecraft (only)

### Backups

```bash
docker compose exec pillowcreate rcon-cli save-all flush
tar czf backup-$(date +%Y%m%d).tgz data/world
```

### Tweaks

- Recipes / events / commands → `kubejs/server_scripts/*.js`. `/reload` in-game picks them up.
- Datapacks → drop into `data/world/datapacks/` and `/reload`.
- Mod configs → first boot generates `data/config/*`. Edit there; restart container.
- Add a mod → append its Modrinth slug to `MODRINTH_PROJECTS` in `docker-compose.yml`, then `docker compose up -d --force-recreate`.

---

## For your buddies

Grab `dist/PillowCreate-1.0.2.mrpack` and import it.

1. Install [Modrinth App](https://modrinth.com/app) (or [Prism Launcher](https://prismlauncher.org/) — either works).
2. Drag `PillowCreate-1.0.2.mrpack` onto the launcher window — it auto-installs NeoForge 1.21.1 + Create + Sable + Aeronautics + KubeJS + Rhino into a fresh instance.
3. Set RAM to 6 GB in the instance settings.
4. Click Play.
5. Multiplayer → Add Server → `192.168.1.3` (or whatever IP Lance gives you).
6. Connect — fly stuff.

The `.mrpack` does NOT work with the vanilla Minecraft launcher — that launcher doesn't speak the modpack format. Use Modrinth App or Prism.
