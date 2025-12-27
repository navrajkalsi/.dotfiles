#!/usr/bin/env bash

# readline bindings
bind -f ~/.inputrc

bind -m emacs -x '"\C-s": tmux-sessionizer'
bind -m vi-insert -x '"\C-s": tmux-sessionizer'
bind -m vi-command -x '"\C-s": tmux-sessionizer'
