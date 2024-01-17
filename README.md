# Description

Prac is an anti-cheat system developed by Program with the primary objective of identifying and preventing cheating activities on Roblox games.
Its purpose is to detect the usage of unauthorized clients and ensure fair gameplay.
Prac offers a configurable setup, allowing administrators to selectively disable its features for specific players, such as moderators or individuals with special permissions
(e.g., those utilizing flight capabilities).

# Configuration

- `config.lua` configuration for a player (server side)
- `manager.lua` global configuration, actions from RE & RF (server side)
- `checker.lua` checker for hacks (client side)

# Detection

- Speedhack
- HealthHack
- Fly
- NoClip
- Wallhack

# Installation

Place scripts:
- `config.lua`, `manager.lua` in ServerScriptService
- `checker.lua` in StarterPlayer

Create RF in ReplicatedStorage :
- `isSpeedHack`
- `isHealthHack`
- `aimingAtPlayer`
- `isNoClip`

Create RE in ReplicatedStorage :
- `kick`
- `warnings`

# Links

[Forum Link](https://devforum.roblox.com/t/prac-little-anti-cheat/2796942)