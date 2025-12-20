# binds done with no flag are set to prefix table
# binds done with -n are set to root table and do not require prefix
#
# bind is alias to bind-key
# unbind is alias to unbind-key
#
# confirm-before does what it says
# -y accepts with just pressing enter
# -p prints a custom prompt
# -c changes accept key
#
# display message is used for logging
#
# command prompt with -p is used to excute something and show prompt

# unbind all
unbind-key -T prefix -a
unbind-key -T root -a
unbind-key -T copy-mode -a
unbind-key -T copy-mode-vi -a

# set prefix
unbind C-b
set-option -g prefix M-m
bind M-m send-prefix

# reload config
unbind r
bind r source-file ~/.config/tmux/tmux.conf \; display-message "Reloaded Config"

# list keybinds
bind ? list-keys

# server
bind Q confirm-before -c Y -p "Kill Server?" kill-server

# session
bind q confirm-before -c Y -p "Kill Session?" kill-session
bind d detach-client
bind : command-prompt -p "Rename Session: " "rename-session '%%'"

# window
bind c new-window
bind X confirm-before -y -p "Kill Window?" kill-window
bind \; command-prompt -p "Rename Window: " "rename-window '%%'"
bind m copy-mode
bind b split-window -v
bind v split-window -h
bind l select-window -l # last window
bind -n M-n next-window
bind -n M-p previous-window
bind 1 select-window -t 1
bind 2 select-window -t 2
bind 3 select-window -t 3
bind 4 select-window -t 4
bind 5 select-window -t 5
bind 6 select-window -t 6
bind 7 select-window -t 7
bind 8 select-window -t 8
bind 9 select-window -t 9

# panes
# pane navigation is handled by vim-tmux-navigator
bind x confirm-before -y -p "Kill Pane?" kill-pane


# copy mode
# quitting copy mode
# for copy mode vi (not emacs) and used without prefix
# commands are sent to copy-mode with send-keys(alias send) -X
bind -T copy-mode-vi q send -X cancel
bind -T copy-mode-vi C-c send -X cancel

# cursor nav
bind -T copy-mode-vi h send -X cursor-left
bind -T copy-mode-vi j send -X cursor-down
bind -T copy-mode-vi k send -X cursor-up
bind -T copy-mode-vi l send -X cursor-right
bind -T copy-mode-vi 0 send -X start-of-line
bind -T copy-mode-vi $ send -X end-of-line
bind -T copy-mode-vi C-d send -X halfpage-down
bind -T copy-mode-vi C-u send -X halfpage-up
bind -T copy-mode-vi G send -X history-bottom
bind -T copy-mode-vi g send -X history-top
bind -T copy-mode-vi b send -X previous-word
bind -T copy-mode-vi w send -X next-word
bind -T copy-mode-vi e send -X next-word-end

# actual copying
bind -T copy-mode-vi Space send -X begin-selection
bind -T copy-mode-vi Escape send -X clear-selection
bind -T copy-mode-vi Y send -X copy-line-and-cancel
bind -T copy-mode-vi Enter send -X copy-selection-and-cancel
bind -T copy-mode-vi V send -X select-line
