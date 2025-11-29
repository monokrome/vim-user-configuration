local ok, colortils = pcall(require, "colortils")
if not ok then
  return
end

colortils.setup({
    register = "+",
    color_preview =  " %s",
    default_format = "hex",
    border = "none",
    mappings = {
        increment = "l",
        decrement = "h",
        increment_big = "L",
        decrement_big = "H",
        min_value = "0",
        max_value = "$",
        set_register_default_format = "<cr>",
        set_register_choose_format = "g<cr>",
        replace_default_format = "<m-cr>",
        replace_choose_format = "g<m-cr>",
        export = "E",
        set_value = "c",
        transparency = "T",
        choose_background = "B",
    }
})
