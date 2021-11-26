vz-tmuxは曜日(JP)確認ができる必要最低限のシンプルなtmuxテーマです。

![tmux1](https://user-images.githubusercontent.com/50889946/142764807-d8750188-8ed9-4714-b096-c55342a73d79.png)
![tmux2](https://user-images.githubusercontent.com/50889946/142764802-bdcb13c1-9821-47bf-9762-ac0c5ecce8d6.png)
![tmux3](https://user-images.githubusercontent.com/50889946/142764805-9227923b-210c-45f8-a953-ce8eb9fb6332.png)

![vz-tmux](https://user-images.githubusercontent.com/50889946/142764664-7a1cf508-1122-4d27-85ed-e2d27caf7a99.gif)

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

## MacOS

MacOSのiterm2で使用すると文字化けしたので`nerd-fonts`のインストールしてfontを切り替える必要あり
https://github.com/ryanoasis/nerd-fonts

homebrewの場合

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```
