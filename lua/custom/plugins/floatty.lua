local M = {}

M.state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

M.create_floating_window = function(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Calculate the position to center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  end

  -- Define window configuration
  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal', -- No borders or extra UI elements
    border = 'rounded',
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

M.toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(M.state.floating.win) then
    M.state.floating = M.create_floating_window { buf = M.state.floating.buf }
    if vim.bo[M.state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(M.state.floating.win)
  end
end

M.floatty_test = function()
  print 'floatty test'
end

M.config = function()
  vim.api.nvim_create_user_command('FloattyTest', M.toggle_terminal, {})

  vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
  vim.keymap.set({ 'n', 't' }, '<leader>tt', ':FloattyTest<CR>', { silent = true, desc = '[T]oggle [T]erminal' })
end

return M
