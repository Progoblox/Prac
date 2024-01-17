# Description

Prac is an anti-cheat created by Program, the goal is to detect cheaters and check if players are using some clients.
You can add a configuration to disable Prac on some players, like on Moderators or you (if you're flying for example).

# Configuration

If a player in your game is a moderator, you have values to disable the verifications on the players you want.

- `config.lua` configuration for a player (server side)
- `manager.lua` global configuration, actions from RE & RF (server side)
- `checker_speed-health.lua` checker for speed & health hack (client side)

# Detection

- Speedhack
- HealthHack
- Fly (WIP)
- Wallhack (WIP)
- Aimbot (WIP)

# Installation

Place scripts:
- `config.lua` in ServerScriptService
- `manager.lua` in ServerScriptService
- `checker_speed-health.lua` in StarterPlayer

Create RF in ReplicatedStorage :
- `plrIsModerator`
- `isSpeedHack`
- `isHealthHack`

Create RE in ReplicatedStorage :
 - `kick`