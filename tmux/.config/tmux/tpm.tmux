# TPM, installed originally via: 'https://github.com/tmux-plugins/tpm'
# Do prefix + I to install plugins & prefix + U to update
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.config/tmux/plugins/tpm/tpm'
