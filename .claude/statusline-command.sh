#!/usr/bin/env bash
# Claude Code status line - Powerlevel10k-inspired: user, cwd, git branch+dirty
input=$(cat)

user=$(whoami)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
# Shorten home directory to ~
home="$HOME"
display_cwd="${cwd/#$home/\~}"

# Git branch and dirty status
git_info=""
if git_branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null); then
  dirty=""
  if ! GIT_OPTIONAL_LOCKS=0 git -C "$cwd" diff --quiet 2>/dev/null || \
     ! GIT_OPTIONAL_LOCKS=0 git -C "$cwd" diff --cached --quiet 2>/dev/null; then
    dirty=" ●"
  fi
  git_info=" | ${git_branch}${dirty}"
fi

printf "⚡ %s | %s%s" "$user" "$display_cwd" "$git_info"
