#!/usr/bin/env bash

exec java -jar /app/share/com.teamshiginima.ShiginimaLauncherJRE8/launcher.jar $@ --workdir "$XDG_DATA_HOME/minecraft"
