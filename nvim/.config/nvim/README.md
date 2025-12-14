`after` contains plugin configs & does not need `init.lua`, this is cause:
`$XDG_CONFIG_DIR/nvim/after` is automatically sourced by __nvim__

`lua` contains the user specific options and remaps, these are to be sourced by `init.lua`
