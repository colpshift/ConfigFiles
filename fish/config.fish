if status is-interactive
    # abbreviations
    abbr --add ll 'lsd -lh --group-dirs first'
    abbr --add ls lsd
    abbr --add l 'ls -l'
    abbr --add la 'ls -a'
    abbr --add lla 'ls -la'
    abbr --add lt 'ls --tree'
    abbr --add dir 'dir --color'
    abbr --add grep rg
    abbr --add dmesg 'dmesg --color'
    abbr --add df duf
    abbr --add du dust
    abbr --add ps procs
    abbr --add su 'sudo -i'
    abbr --add vi nvim
    abbr --add vim nvim
    abbr --add gvim nvim
    abbr --add fd fdfind
    abbr --add cat 'bat --theme Nord'
    abbr --add bat 'bat --theme Nord'
    abbr --add gitu 'git add . && git commit -S && git push && gh pr create -w'
    abbr --add gitb 'git add . && git commit -S -m 'backup' && git push && gh pr create -w'
    abbr --add giti 'clear && onefetch --no-color-palette'
    abbr --add apt 'sudo apt'
    abbr --add aptu 'sudo apt update && sudo apt full-upgrade && sudo apt autoremove'
    abbr --add nala 'sudo nala'
    abbr --add nalau 'sudo nala update && sudo nala full-upgrade && sudo nala autoremove && sudo nala autopurge'
    abbr --add cls clear
    abbr --add myip 'curl http://ipecho.net/plain; echo'
    abbr --add ports 'sudo ss -tulanp'
    abbr --add ubui 'clear && fastfetch'
    abbr --add cmatrix '$HOME/.scripts/cmatrix_run.sh'
    abbr --add systemctl_error 'sudo systemctl --failed'
    abbr --add journal_error 'sudo journalctl -p 3 -xb'
    abbr --add poshthemes 'bash -c "$(wget -qO- https://git.io/vQgMr)"'
end
# prompt oh my posh
oh-my-posh init fish --config '/home/colps/.config/fish/themes_ohmyposh/powerlevel10k_rainbow.omp.json' | source
