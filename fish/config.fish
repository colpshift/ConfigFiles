if status is-interactive
end

#abbreviations
abbr --add ll 'exa -1Glmu --git --icons --extended --group-directories-first'
abbr --add ls 'exa -1Glmu --git --icons --extended --group-directories-first'
abbr --add la 'exa -1Glmua --git --icons --extended --group-directories-first'
abbr --add lt 'exa -1GlmuT --git --icons --extended --group-directories-first'
abbr --add dir 'dir --color'
abbr --add grep rg
abbr --add dmesg 'dmesg --color'
abbr --add df duf
abbr --add du dust
abbr --add ps procs
abbr --add su 'sudo -i'
abbr --add vi '/home/colp/.local/bin/nvim'
abbr --add vim '/home/colp/.local/bin/nvim'
abbr --add gvim '/home/colp/.local/bin/nvim'
abbr --add fd fdfind
abbr --add cat 'bat --theme Nord'
abbr --add bat 'bat --theme Nord'
#abbr --add gitu 'git add . && git commit -S && git push && gh pr create -w'
#abbr --add gitb 'git add . && git commit -S -m 'backup' && git push && gh pr create -w'
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

# Fish syntax highlighting
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# prompt oh my posh
#oh-my-posh init fish --config '/home/colps/.config/fish/themes_ohmyposh/powerlevel10k_rainbow.omp.json' | source

# starship prompt
starship init fish | source
