local T = {
  job_id = 0
}

T.OpenTerminalInBufTab = function()
  vim.cmd.tabnew()
  vim.cmd.terminal()
  T.job_id = vim.bo.channel
end

T.NpmRunDev = function()
  -- Runs a command in the open terminal
  vim.fn.chansend(T.job_id, { "npm run dev\r" })

  -- Trying to make it open the localhost automatically but not working :(
  -- vim.fn.setcursorcharpos(1, 1)
  -- local isTerminalDoneLoading = vim.fn.searchpos("localhost")[0] == 0
  -- while not isTerminalDoneLoading do
  --   isTerminalDoneLoading = vim.fn.searchpos("localhost")[0] == 0
  -- end
  --
  -- vim.fn.setpos(".", vim.fn.searchpos("localhost"))
  -- vim.api.nvim_input("gx")
end

return T
