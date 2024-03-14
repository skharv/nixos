{ pkgs, username, ... }:

pkgs.writeShellScriptBin "swww-script" ''
#!/usr/bin/env bash

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 /home/${username}/Pictures/Wallpapers/"
	exit 1
fi

export SWWW_TRANSITION_FPS=144
export SWWW_TRANSITION_STEP=2

INTERVAL=300

while true; do
	find "$1" -type f \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
        swww img "$img"
			sleep $INTERVAL
		done
done
''
