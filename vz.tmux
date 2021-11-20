#!/usr/bin/env bash

# ----------------------------------------
# Script
# ----------------------------------------
week=`date | cut -d " " -f1`
case $week in
  'Sun') weekJp="日" ;;
  'Mon') weekJp="月" ;;
  'Tue') weekJp="火" ;;
  'Wed') weekJp="水" ;;
  'Thu') weekJp="木" ;;
  'Fri') weekJp="金" ;;
  'Sat') weekJp="土" ;;
esac

user=`whoami`

sessionCount=$((`tmux display-message -p '#S'` + 1))

# ----------------------------------------
# Configuration
# ----------------------------------------
tmux set -goq @weekJp         $weekJp
tmux set -goq @user           $user
tmux set -goq @sessionCount   $sessionCount

# update interval
tmux set -gF status-interval  1
tmux set -g  renumber-windows on
tmux set -g  mouse            on

# ----------------------------------------
# Color Definition
# ----------------------------------------
tmux set -g  default-terminal "tmux-256color"

tmux set -goq @leftFont         colour33
tmux set -goq @leftBG           colour232
tmux set -goq @rigthFont        colour33
tmux set -goq @rightBG          colour232
tmux set -goq @rightPrefixBG    colour1
tmux set -goq @rightCopyBG      colour226
tmux set -goq @marginColor      colour234
tmux set -goq @winFont          colour255
tmux set -goq @winBG            colour239
tmux set -goq @winCurrentFont   colour33
tmux set -goq @winCurrentBG     colour232
tmux set -goq @accent           colour119
tmux set -goq @copyFont         colour33
tmux set -goq @copyBG           colour232

# for i in {0..255}; do
#   printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
# done

# ----------------------------------------
# Common style
# ----------------------------------------
# copy selector color
tmux set -gwF mode-style "fg=#{@copyFont},bg=#{@copyBG}"
# status bar margin color
tmux set -gF  status-style "fg=#{@marginColor},bg=#{@marginColor}"

# ----------------------------------------
# Side status style
# ----------------------------------------
# Format Dinifition
tmux set -goqF @datetime "%Y-%m-%d(#{@weekJp}) %H:%M:%S"
tmux set -goq  @esessionStatus "Session:#{@sessionCount}/#(tmux ls | wc -l | tr -d ' ')"

# Left side status
# max length
tmux set -gF status-left-length 45
tmux set -gF status-left "#[fg=#{@leftFont},bg=#{@leftBG}] #{@esessionStatus} #[fg=#{@leftBG},bg=#{@marginColor}]"

# Right side status
# max length
tmux set -g status-right "#[fg=#{@rightBG},bg=#{@marginColor}]#[fg=#{@rightBG},bg=#{@rightBG}]#{?client_prefix,#[bg=#{@rightPrefixBG}] PREFIX ,}#{?#{==:#{pane_mode},copy-mode},#[bg=#{@rightCopyBG}] COPY ,}#[fg=#{@rigthFont},bg=#{@rightBG}] #{%Y-%m-%d(#{@weekJp}) %H:%M:%S} "

# ----------------------------------------
# Window status style
# ----------------------------------------
# window status to center
tmux set -gF  status-justify centre
# window status (center status)
tmux set -gwF window-status-separator ""
tmux set -g   window-status-format "#[fg=#{@winBG},bg=#{@marginColor}]#[fg=#{@winFont},bg=#{@winBG}] #I#[fg=#{@winFont}]:#[fg=#{@winFont}]#W #[fg=#{@winBG},bg=#{@marginColor}]"
tmux set -g   window-status-current-format "#[fg=#{@winCurrentBG},bg=#{@marginColor}]#[fg=#{@accent},bg=#{@winCurrentBG}] #I#[fg=#{@winCurrentFont}]:#[fg=#{@winCurrentFont}]#W #[fg=#{@winCurrentBG},bg=#{@marginColor}]"

# Install
# "prefix + I(Shift+i)
# update
# "prefix + U(Shift+u)  => input 'all' => Enter", then restart tmux.

# ref
# https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/
