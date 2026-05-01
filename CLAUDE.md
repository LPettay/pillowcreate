# PillowCreate

Containerized Create: Aeronautics server for Lance + friends. Creative mode, NeoForge 1.21.1.

## Stack

- `itzg/minecraft-server:java21` (TYPE=NEOFORGE, VERSION=1.21.1)
- Mods declared in `docker-compose.yml` under `MODRINTH_PROJECTS` — itzg fetches NeoForge 1.21.1 builds on first boot. To add a mod: append its Modrinth slug to the list and recreate the container.
- Distribution: AutoModpack (server pushes pack to clients on connect).
- Tweak layer: `kubejs/` (git-tracked, hot-reload with `/reload`) and `datapacks/`.

## Layout

- `kubejs/` — KubeJS scripts. Source of truth, mounted at `/data/kubejs`.
- `data/` — runtime state (world, mod jars, configs, logs). Gitignored.
- `datapacks/` — staging dir; copy specific packs into `data/world/datapacks/` after first boot.
- `*.bat` — Windows launchers that shell into WSL and run docker compose.

## Don't

- Don't merge with `pillowcraft/` (Paper plugin server, different stack).
- Don't commit `data/` — it has the world save and downloaded mod jars.
- Don't pin `NEOFORGE_VERSION` unless a specific mod requires it; let itzg pick latest stable.

## Custom Aeronautics fork

Deferred. Most tweaks should go through KubeJS / datapacks / config files first. Only fork the source if you hit something configs cannot reach. License is likely ARR like the rest of the Create ecosystem — private use only.
