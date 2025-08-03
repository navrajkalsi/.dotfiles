#!/bin/bash
export FZF_COMPLETION_TRIGGER="''"

export FZF_DEFAULT_OPTS="\
  --style full \
  --preview 'batcat --color=always {}' \
  --border --padding 1,2 \
  --header-label ' File Type '\
  --bind 'result:transform-list-label:
        if [[ -z $FZF_QUERY ]]; then
          echo \" $FZF_MATCH_COUNT items \"
        else
          echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
        fi
        ' \
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}' \
    --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
    --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
    --color 'border:#aaaaaa,label:#cccccc' \
    --color 'preview-border:#9999cc,preview-label:#ccccff' \
    --color 'list-border:#669966,list-label:#99cc99' \
    --color 'input-border:#996666,input-label:#ffcccc' \
    --color 'header-border:#6699cc,header-label:#99ccff'
"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'batcat -n --color=always {}' "$@" ;;
  esac
}
# export FZF_MOVEMENT="--bind='ctrl-s:preview-page-down' \
#   --bind='alt-p:toggle-preview' \
#   --bind='ctrl-a:preview-page-up' \
#   --bind='ctrl-u:half-page-up+refresh-preview' \
#   --bind='alt-u:page-up+refresh-preview' \
#   --bind='ctrl-d:half-page-down+refresh-preview' \
#   --bind='alt-d:page-down+refresh-preview' \
#   --bind='alt-y:yank' \
#   --bind='ctrl-y:kill-line' \
#   --bind='alt-g:ignore' \
#   --bind='ctrl-g:top' \
#   --bind='alt-a:toggle-all' \
#   --bind='alt-s:toggle-sort' \
#   --bind='alt-h:backward-char+refresh-preview' \
#   --bind='alt-l:forward-char+refresh-preview' \
#   --bind='ctrl-l:clear-screen'"
# export FZF_DEFAULT_COMMAND="rg -uu \
#   --files \
#   -H"
# export FZF_ALT_COMMAND="fd -uu -t f"
# export FZF_DEFAULT_OPTS="$FZF_MOVEMENT \
#   --bind='ctrl-h:execute(moreman {})' \
#   --bind='ctrl-p:toggle-preview' \
#   --bind='ctrl-v:execute(nvimpager {})' \
#   --tiebreak='length,index' \
#   --preview-window 'right:100:wrap:cycle' \
#   --height=100 \
#   --exact \
#   --info='inline' \
#   --cycle \
#    --reverse \
#   --multi \
#  --ansi"

#  if [[ -z "$DISPLAY" ]]; then
#    FZF_DEFAULT_OPTS+="
#   --color=info:1 \
#         --color=prompt:2 \
#     --color=pointer:3 \
#   --color=hl+:4 \
#   --color=marker:6 \
#   --color=spinner:7 \
#   --color=header:8 \
#    --color=border:9 \
#       --color=hl:122 \
#         --color=preview-fg:11 \
#         --color=fg:13 \
#         --color=fg+:14"
#    fi
