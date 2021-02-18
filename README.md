# Shiginima Launcher (NOT OFFICIAL)

## About

*Shiginima Launcher: Sponge Edition* is an alternative Minecraft Launcher. The files in this git repository allows us to create a [Flatpak build](https://flatpak.org/) of it.

## FAQ

**Q: Why a Flatpak build of Shiginima Launcher?**

A: Flatpak allows us to provide a better desktop integration for Java programs, while also improving security by running the launcher in a sandboxed environment, e.g. preventing mods from accessing sensitive files and folders on your computer.

**Q: Are you a member of Team Shiginima?**

A: No, not at all. I also don't know anyone who's part of the team. I simply like the launcher for its simplicity and wanted to make a Flatpak build of it.

**Q: Do you have the source-code of Shiginima Launcher?**

A: Nope.

**Q: Will this work on Windows?**

A: No, sorry. This is only intended for Linux distributions.

**Q: Minecraft doesn't seem to open anymore, what to do?**

A: Try running `flatpak update`, then re-open the launcher. If that doesn't work, feel free to [open an issue](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/issues).

## Installing

1. [Set up Flatpak](https://flatpak.org/setup/).
2. Download the [latest release](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/releases) of the launcher.
3. Open a terminal window and run:

    ```bash
    flatpak install Shiginima_Launcher_v4.400-x86_64.flatpak
    ```

4. You're good to go! You can find the Shiginima Launcher under `Applications` > `Games`.

**IMPORTANT**: Your game files, including worlds, mods, shaders, etc. will be in `~/.var/app/com.teamshiginima.ShiginimaLauncher/data/minecraft/` and **not** in `~/.minecraft/`!

## Uninstalling

In a terminal window, run:

```bash
flatpak uninstall com.teamshiginima.ShiginimaLauncher
```

Additionally, if you want to delete Minecraft itself, including worlds, mods, shaders, etc. you'll have to delete this folder as well: `~/.var/app/com.teamshiginima.ShiginimaLauncher/`.

## Building & bundling (advanced)

1. [Set up Flatpak](https://flatpak.org/setup/).
2. Install `flatpak-builder` (and optionally `qemu-user-static` if you want to cross-compile for `ARM64`).
3. Clone this repository.
4. Download the ZIP file of the launcher from the [official website](https://web.archive.org/web/20201101050543/https://teamshiginima.com/update/).
5. Place the zip file (`ShiginimaSE_v4400.zip`) inside the cloned repository.
6. Then build:

    ```bash
    flatpak-builder --user --arch=x86_64 --force-clean --install-deps-from=flathub --repo=repo/ --sandbox build com.teamshiginima.ShiginimaLauncher.yaml
    ```

    6.1. **(Optional)** To cross-compile for `ARM64`, just replace `--arch=x86_64` by `--arch=aarch64`.

7. After it succeeds building, you can then create a [single-file bundle](https://docs.flatpak.org/en/latest/single-file-bundles.html) (where `Shiginima_Launcher.flatpak` is the output file):

    ```bash
    flatpak build-bundle --arch=x86_64 repo/ Shiginima_Launcher.flatpak com.teamshiginima.ShiginimaLauncher stable
    ```

    7.1. **(Optional)** To create a bundle for `ARM64`, just replace `--arch=x86_64` by `--arch=aarch64`.

## About fix_jvm_args.patch

This patch file simply removes `-XX:+CMSIncrementalMode` from Minecraft's launch options. Although this patch file is not mandatory to make the launcher itself work, it *is* required to make Minecraft run out-of-the-box. That's because we're using JRE (Java Runtime Environment) version 11 to run the game, and that option is only compatible with JRE version 8 and older.

That being said, an un-patched build of the launcher is also available from the [Releases page](https://github.com/guihkx/com.teamshiginima.ShiginimaLauncher/releases) for your convenience.
