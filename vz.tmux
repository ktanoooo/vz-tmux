#!/usr/bin/env bash

# ----------------------------------------
# Script
# ----------------------------------------
week=`date | cut -d " " -f1`
case $week in
  'Sun') weekJp="“ú" ;;
  'Mon') weekJp="ŒŽ" ;;
  'Tue') weekJp="‰Î" ;;
  'Wed') weekJp="…" ;;
  'Thu') weekJp="–Ø" ;;
  'Fri') weekJp="‹à" ;;
  'Sat') weekJp="“y" ;;
esac

user=`whoami`

# ----------------------------------------
# Configuration
# ----------------------------------------
tmux set -goq @weekJp $weekJp
tmux set -goq @user   $user

# update interval
tmux set -gF  status-interval 1

# ----------------------------------------
# Color Definition
# ----------------------------------------
tmux set -ga terminal-overrides ',xterm-256color:Tc'
tmux set -g  default-terminal   "tmux-256color"
tmux set -as terminal-overrides ',xterm*:sitm=\E[3m'

tmux set -goq @leftFont         colour250
tmux set -goq @leftBG           colour237
tmux set -goq @rigthFont        colour250
tmux set -goq @rightBG          colour23
tmux set -goq @marginColor      colour234
tmux set -goq @winFont          colour250
tmux set -goq @winBG            colour234
tmux set -goq @winCurrentFont   colour255
tmux set -goq @winCurrentBG     colour239
tmux set -goq @accent           colour119
tmux set -goq @copyFont         colour0
tmux set -goq @copyBG           colour2
tmux set -goq @prefix           colour226

# for i in {0..255}; do
#   printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
# done

# ----------------------------------------
# Common style
# ----------------------------------------
# copy selector color
tmux set -gwF mode-style   "fg=#{@copyFont},bg=#{@copyBG}"
# status bar margin color
tmux set -gF  status-style "fg=#{@marginColor},bg=#{@marginColor}"



# ----------------------------------------
# Side status style
# ----------------------------------------
# Format Dinifition
tmux set -goqF @datetime       "%Y-%m-%d(#{@weekJp}) %H:%M:%S"
tmux set -goq  @esessionStatus "Session:#S/#(tmux ls | wc -l | tr -d ' ')"

# Left side status
# max length
tmux set -gF status-left-length 45
tmux set -gF status-left        "#[fg=#{@leftFont},bg=#{@leftBG}] #{@esessionStatus} #[fg=#{@leftBG},bg=#{@marginColor}]?"

# Right side status
# max length
tmux set -g status-right       "#[fg=#{@rightBG},bg=#{@marginColor}]?#[fg=#{@rightBG},bg=#{@rightBG}]#{?client_prefix,#[bg=#{@prefix}] PREFIX,}#{?#{==:#{pane_mode},copy-mode},#[bg=colour208] COPY,} #[fg=#{@rigthFont},bg=#{@rightBG}] #{%Y-%m-%d(#{@weekJp}) %H:%M:%S} "

# ----------------------------------------
# Window status style
# ----------------------------------------
# window status to center
tmux set -gF  status-justify               centre
# window status (center status)
tmux set -gwF window-status-separator      "  "
tmux set -g   window-status-format         "#[fg=#{@winFont}]#I#[fg=#{@winBG}]:#[fg=#{@winFont}]#W#[fg=#{@winFont}]#F"
tmux set -g   window-status-current-format "#[fg=#{@winCurrentBG},bg=#{@marginColor}]?#[fg=#{@accent},bg=#{@winCurrentBG}] #I#[fg=#{@winCurrentFont}]:#[fg=#{@winCurrentFont}]#W #[fg=#{@winCurrentBG},bg=#{@marginColor}]?"

# Install
# "prefix + I(Shift+i)
# update
# "prefix + U(Shift+u)  => input 'all' => Enter", then restart tmux.

# ref
# https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/
