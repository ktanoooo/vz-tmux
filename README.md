vz-tmuxは日本語で曜日確認ができる必要最低限のシンプルなテーマです。

https://user-images.githubusercontent.com/50889946/142764807-d8750188-8ed9-4714-b096-c55342a73d79.png
https://user-images.githubusercontent.com/50889946/142764802-bdcb13c1-9821-47bf-9762-ac0c5ecce8d6.png
https://user-images.githubusercontent.com/50889946/142764805-9227923b-210c-45f8-a953-ce8eb9fb6332.png

https://user-images.githubusercontent.com/50889946/142764664-7a1cf508-1122-4d27-85ed-e2d27caf7a99.gif


プラグインマネージャーtpmに依存していてwindowsでは正常に動きますが、macのiterm2では文字化けする可能性があります。

# 使い方

以下の行を`.tmux.conf`の末尾に追加してください。

```
set -g @plugin 'tmux-plugins/tpm'  # tmux plugin manager
set -g @plugin 'ktanoooo/vz-tmux'  # tmux theme
run '~/.tmux/plugins/tpm/tpm'
```

追加したら以下のコマンドでインストール

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh
```

# EN

vz-tmux is tmux's theme, it's depends on tpm(tmux plugin manager).
This is maked for windows, and the iterm2 was garbled.

# How to use

Add the following lines to the end of `.tmux.conf`

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
