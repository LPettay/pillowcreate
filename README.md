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

### After first successful boot

1. Edit `data/automodpack/automodpack-server.json`:
   - `"modpackName": "PillowCreate"`
   - `"requireAutoModpackOnClient": true`
2. `docker compose restart`
3. Friends can now connect — AutoModpack pushes the pack to them automatically.

### Ports to forward (when ready)

- **25565/tcp** — Minecraft
- **30078/tcp** — AutoModpack download channel

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

You need NeoForge 1.21.1 + the AutoModpack mod. After that, Lance's server pushes the rest to you automatically.

**Easiest path — Prism Launcher (recommended):**

1. Install [Prism Launcher](https://prismlauncher.org/).
2. Add Instance → Custom → Minecraft 1.21.1 → NeoForge → latest 21.1.x.
3. Start the instance once so it generates the mods folder, then close.
4. Drop [AutoModpack for NeoForge 1.21.1](https://modrinth.com/mod/automodpack/versions?l=neoforge&g=1.21.1) `.jar` into the instance's `mods/` folder.
5. Launch the instance, click Multiplayer → Add Server → enter Lance's IP.
6. First connect: AutoModpack downloads everything, asks you to restart, you reconnect, you're in.

**Vanilla launcher path:** install NeoForge 1.21.1 with the official installer, drop AutoModpack into `%appdata%\.minecraft\mods\`, launch the NeoForge profile, connect. Same as above but with the official launcher.

You'll need ~4 GB of RAM allocated and a halfway recent GPU — Create + Aeronautics is heavier than vanilla.
