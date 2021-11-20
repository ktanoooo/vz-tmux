vz-tmux is tmux's theme, it's depends on tpm(tmux plugin manager).

# How to use

Add the following lines to the end of .tmux.conf

```
set -g @plugin 'tmux-plugins/tpm'  # tmux plugin manager
set -g @plugin 'ktanoooo/vz-tmux'  # tmux theme
run '~/.tmux/plugins/tpm/tpm'
```

then installs the plugins.

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
```
