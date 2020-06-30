# !Dont move this section.
## Key Bindings
bind-key -n 0   selectw -t :=albums                         # show album list                
bind-key -n 1   selectw -t :=tracks                         # show tracks
bind-key -n 2   selectw -t :=latest                         # show album list (latest first)
bind-key -n 3   selectw -t :=playlists                      # load playlist
bind-key -n 4   selectw -t :=queue                          # show queue
bind-key -n F1 run-shell '$CLERKBIN --instaact=help_pane'   # show help
bind-key -n F2 run-shell 'mpc prev --quiet'               # previous song
bind-key -n F3 run-shell 'mpc toggle --quiet'             # toggle playback
bind-key -n F4 run-shell 'mpc stop > /dev/null'           # stop playback
bind-key -n F5 run-shell 'mpc next --quiet'               # next song
bind-key -n F6 run-shell '$CLERKBIN --instaact=rand_pane' # play random album/songs
bind-key -n C-q  kill-session -t music                      # quit clerk

# Status bar
set-option -g status-position top
set -g status-interval 30
set -g status-justify centre
set -g status-left-length 40
set -g status-left ''
set -g status-right ''

# Colors
set -g status-bg colour235
set -g status-fg default
# setw -g window-status-current-bg default
# setw -g window-status-current-fg default
# setw -g window-status-current-attr dim
# setw -g window-status-bg default
# setw -g window-status-fg white
# setw -g window-status-attr bright
# setw -g window-status-format ' #[fg=colour243,bold]#W '
# setw -g window-status-current-format ' #[fg=yellow,bold]#[bg=colour235]#W '

# tmux options
# set -g set-titles on
# set -g set-titles-string '#T'
# set -g default-terminal "screen-256color"
# setw -g mode-keys vi
# set -sg escape-time 1
# set -g repeat-time 1000
# set -g base-index 1
# setw -g pane-base-index 1
# set -g renumber-windows on
# unbind C-b
# set -g prefix C-a
# unbind C-p
# bind C-p paste-buffer

