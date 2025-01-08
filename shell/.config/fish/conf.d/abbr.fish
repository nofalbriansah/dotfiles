if status is-interactive
   # terminal
   abbr --add . "cd /home/nbs/dotfiles"
   abbr --add ff fastfetch
   abbr --add du "sudo dnf update && sudo dnf upgrade"
   abbr --add fu "flatpak update"
   abbr --add cl clear
   abbr --add treed "tree -d -a -L 5"
   abbr --add edit gnome-text-editor
   abbr --add vim nvim
	
   # dev
   abbr --add hg "bunx blowfish-tools"
   abbr --add fld "flutter doctor -v"
   abbr --add cdev "cd /mnt/Data/development/coding"
   abbr --add cebook "cd /mnt/Data/development/research/ebooks"
end
