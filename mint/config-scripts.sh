#!/usr/bin/env bash
#v1.00

DIR=$(dirname $(readlink -f $0))

if [[ "$EUID" = 0 ]]; then
  echo "This must be run as the standard user that will use the device.\nIt will prompt for sudo when it is needed."
  exit
fi

# Copy the scripts, make them executable, then move then to /usr/local/bin
sudo cp "$DIR/../scripts/lib/*.sh" /usr/local/lib

cd "$DIR/../scripts/bin/*"
for file in *.sh; do
	sudo cp "$file" "/usr/local/bin/${file%.sh}"
done
sudo chmod +x /usr/local/bin/*
