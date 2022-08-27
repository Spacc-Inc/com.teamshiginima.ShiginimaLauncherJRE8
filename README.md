# 📦 Unofficial Shiginima Launcher Flatpak

📦 Unofficial Java 8 Flatpak Build of Shiginima Launcher.  
Forked from <https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher>, which instead provides a launcher with Java 17.

## About

*Shiginima Launcher: Sponge Edition* is an alternative Minecraft Launcher.  
The files in this git repository allows us to create a [Flatpak build](https://flatpak.org/) of it, based on Java 8.

### FAQ

**Q: Why a Flatpak build of Shiginima Launcher?**  
A: Flatpak allows us to provide a better desktop integration for Java programs, while also improving security by running the launcher in a sandboxed environment, e.g. preventing mods from accessing sensitive files and folders on your computer.

**Q: Are you a member of Team Shiginima?**  
A: No, not at all. I also don't know anyone who's part of the team. I simply like the launcher for its simplicity and wanted to make a Flatpak build of it.

**Q: Do you have the source-code of Shiginima Launcher?**  
A: Nope.

**Q: Minecraft doesn't seem to open anymore, what to do?**  
A: Try running `flatpak update`, then re-open the launcher.

**Q: Why Java 8 instead of the latest?**  
A: Minecraft versions prior to Release 1.13 won't start on Java versions higher than 8. Thus, Java 8 is needed to play on those.  
If you need to play on a newer Minecraft version, you can install the Flatpak from [the original repo](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher) to additionally get a launcher with Java 17.

## Installing

1. [Set up Flatpak](https://flatpak.org/setup/);
2. Download the [latest bundle release](https://github.com/Spacc-Inc/com.teamshiginima.ShiginimaLauncherJRE8/releases/latest) of the launcher;
3. In a terminal, run:
    ```bash
    flatpak install ShiginimaLauncherJRE8-v4.400-*-x86_64.flatpak
    ```

You're good to go! You can find `Shiginima Launcher (Java 8)` under `Applications` > `Games`.

**IMPORTANT**: Your game files, including worlds, mods, shaders, etc. will be in `~/.var/app/com.teamshiginima.ShiginimaLauncherJRE8/data/minecraft/`, **not** in `~/.minecraft/`!

### Uninstalling

In a terminal, run:
```bash
flatpak uninstall com.teamshiginima.ShiginimaLauncherJRE8
```

Additionally, if you want to delete the Minecraft files themselves, including worlds, mods, shaders, etc. you'll have to delete this folder as well: `~/.var/app/com.teamshiginima.ShiginimaLauncherJRE8/`.

### Building & bundling (advanced)

1. [Set up Flatpak](https://flatpak.org/setup/);
2. Install `flatpak-builder`;
3. Install SDK dependencies:
    ```bash
    flatpak install org.freedesktop.Sdk/x86_64/21.08 org.freedesktop.Sdk.Extension.openjdk8/x86_64/21.08
    ```
4. Clone this repository;
5. Then build:
    ```bash
    flatpak-builder --user --arch=x86_64 --force-clean --repo=repo/ --sandbox build com.teamshiginima.ShiginimaLauncherJRE8.yaml
    ```
6. After it succeeds building, you can then create a [single-file bundle](https://docs.flatpak.org/en/latest/single-file-bundles.html) (where `ShiginimaLauncherJRE8.flatpak` is the output file):
    ```bash
    flatpak build-bundle --arch=x86_64 repo/ ShiginimaLauncherJRE8.flatpak com.teamshiginima.ShiginimaLauncherJRE8 stable
    ```
At the end of that, you can just [install](#installing) the new bundle.

## TODO

- Porting to other architectures (i386, armhf, arm64)