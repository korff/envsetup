#!/bin/sh
# Per-launch ReGreet wrapper:
#   - substitutes the host name into the greeting message
#   - picks a random background image from /usr/share/backgrounds
#   - writes the generated config to a directory the greeter user can write
template="/etc/greetd/regreet.toml"
config="/var/lib/regreet/regreet.toml"

bg="$(find /usr/share/backgrounds -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | shuf -n 1)"
[ -n "$bg" ] || bg="/usr/share/backgrounds/login.jpg"

sed -e "s|@HOSTNAME@|$(hostnamectl hostname)|g" \
    -e "s|@BACKGROUND@|$bg|g" \
    "$template" > "$config"

exec regreet --config "$config"
