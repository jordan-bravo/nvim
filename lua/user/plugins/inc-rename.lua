-- user/plugins/inc-rename.lua

return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
      vim.keymap.set("n", "<leader>ri", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    end,
  }
}

--[[
Usage:
  
Simply type :IncRename <new_name> while your cursor is on an LSP identifier. You could also create a keymap that types out the command name for you so you only have to enter the new name:

```lua
vim.keymap.set("n", "<leader>rn", ":IncRename ")
````

If you want to fill in the word under the cursor you can use the following:

```lua
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
```


--]]
