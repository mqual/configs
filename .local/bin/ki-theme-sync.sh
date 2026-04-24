#!/bin/bash

# Define paths
THEME_DIR="$HOME/.config/ki/themes"
CURRENT="$THEME_DIR/current_theme.json"
DARK="$THEME_DIR/dark.json"
LIGHT="$THEME_DIR/light.json"

# Function to update the symlink
update_theme() {
    # Get the current GNOME color scheme
    SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme)

    if [[ "$SCHEME" == *"'prefer-dark'"* ]]; then
        ln -sf "$DARK" "$CURRENT"
    else
        ln -sf "$LIGHT" "$CURRENT"
    fi
}

# Run once at startup
update_theme

# Monitor for changes using dconf
gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
    update_theme
done