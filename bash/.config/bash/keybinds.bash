#!/usr/bin/env bash
debug=1

# var containing only keybinds that are bound to a command
default_keybinds=$(bash --noprofile --norc -ic "bind -p | grep '^\"'") # should be running interactive mode for bind -p
# do not source bashrc as it also displays fastfetch results in the var

org_delimiter=$IFS
IFS=":" # setting field separator for loop

while read -r key cmd; do
  bash --noprofile --norc -ic 'bind -r "$key"'
done <<< $default_keybinds

IFS=$org_delimiter
