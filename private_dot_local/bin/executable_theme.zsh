#!/usr/bin/env zsh

if test "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'"; then
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark
	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
	kitty +kitten themes --reload-in=all Afterglow
	for socket in $(fd "^nvim.*.0$" /run/user/1000/); do
		sleep 0.1s
		nvim --server $socket --remote-send ":colorscheme desert<CR>" &> /dev/null
    done

else
	gsettings set org.gnome.desktop.interface color-scheme prefer-light
	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
	kitty +kitten themes --reload-in=all Catppuccin-Latte
	for socket in $(fd "^nvim.*.0$" /run/user/1000/); do
		sleep 0.1s
		nvim --server $socket --remote-send ":colorscheme delek<CR>" &> /dev/null
    done
fi
echo "Changing theme..."
