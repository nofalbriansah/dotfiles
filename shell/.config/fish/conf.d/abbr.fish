if status is-interactive
   # terminal
   abbr --add . "cd /home/nbs/dotfiles"
   abbr --add ff fastfetch
   abbr --add du "sudo dnf update && sudo dnf upgrade"
   abbr --add fu "flatpak update"
   abbr --add cl clear
   abbr --add treed "tree -a -L 5"
   abbr --add edit gnome-text-editor
   abbr --add vim nvim
	
   # .
   abbr --add .kitty "nano ~/dotfiles/terminal/.config/kitty/kitty.conf"
   abbr --add .abbr "nano ~/dotfiles/shell/.config/fish/conf.d/abbr.fish"
   abbr --add .fish "nano ~/dotfiles/shell/.config/fish/config.fish"
   abbr --add .bash "nano ~/dotfiles/shell/.bash_paths"

   # dev
   abbr --add hg "bunx blowfish-tools"
   abbr --add fld "flutter doctor -v"
   abbr --add cdev "cd /mnt/Data/development/coding"
   abbr --add cebook "cd /mnt/Data/development/research/ebooks"
end
