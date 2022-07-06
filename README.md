# PD2-Squids-QOL
A payday 2 BLT mod that focuses on quality of life improvements

---

### Features

- Integrated with BLT keybinds and options system
- Restart mission on keypress
- Remove job heat penalty for doing the same heist multiple times in a row
- Force everyone to ready up (without losing assets)
- Transfer spending cash to offshore (useful for infamy)

### Installation

1. First you will need to download and install [SuperBLT](https://superblt.znix.xyz/) for this mod to work.
  - Click the `Latest Release DLL` to download a zip containing the DLL
  - Extract the zip and place the DLL into your Payday 2 folder (where `payday2_win32_release.exe` is)
  - Run the game so it can initialize all the required components
2. Download the zip from the [releases section](https://github.com/ElectricSquid/PD2-Squids-QOL/releases) and extract the `SquidsQOL` folder into your `Payday 2/mods` folder so that the structure looks like this:
```
Payday 2
└─ mods  
      └─ SquidsQOL
            ├─ classes
            │    ├─ globals.lua
            │    ├─ settings.lua
            |    └─ tools.lua
            ├─ hooks
            │    ├─ init.lua
            |    └─ no_job_heat.lua
            ├─ keybinds
            │    ├─ force_ready.lua
            │    ├─ job_restart.lua
            |    └─ open_menu.lua
            ├─ localization
            |    └─ qol_menu
            |           └─ en.txt
            ├─ menus
            │    ├─ menu_main.json
            |    └─ setup_menu.lua
            └─ mod.txt
```
3. Enjoy the mod

### Developer Notes

This started originally because I wanted a couple features that I couldn't find in other mods, or were done poorly. I'm unsure if I will continue to expand on this mod in the future but am welcome to community additions.

Below is a list of ideas that I had to implement but haven't gotten around to adding:

- Taser immunity
- Force objective hints to show up
- Move items in inventory without equipping them
- Removing the bulky payday cursor image and leaving it as the os default
- Auto ready up in lobby for afk-ing while with friends
