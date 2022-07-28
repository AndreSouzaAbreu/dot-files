# ------------------------------------------------------------------------------
# ZSH PROMPT

# handy helpers
fg_white='%F{#fff}'
fg_green='%F{#0f0}'
username_hostname="${fg_green}%n${fg_white}@${fg_green}%m${fg_white}"

# enable prompt command substitution
setopt promptsubst

_collapsed_cwd()
{
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

# ------------------------------------------------------------------------------
# custom prompts

p0() { PROMPT="$ " }

p1() { PROMPT='[%~] ' }

p2() { PROMPT='[%3d]$ ' }

p3() { PROMPT="[%~]"$'\n'"$ " }

p4() { PROMPT="[%d]"$'\n'"$ " }

p5() { PROMPT="[${username_hostname} %2d]"$'\n'"$ " }

p6() { PROMPT="[${username_hostname} %~]"$'\n'"$ " }

p7() { PROMPT="[${username_hostname}"' $(_collapsed_cwd)]$ ' }

p8() { PROMPT="[${username_hostname}"' $(_collapsed_cwd)]'$'\n'"$ " }
