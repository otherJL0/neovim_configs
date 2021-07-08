local tmux = {}
if vim.env.TMUX then
  local tmux_socket_path = vim.split(vim.env.TMUX, ',', true)[1]
  vim.g.tmux_socket_channel = vim.fn.sockconnect('pipe', tmux_socket_path)
  vim.g.tmux_job = vim.fn.jobstart('tmux -C attach')
end

if vim.g.tmux_job then
  vim.notify('Tmux is attached')
end

return tmux
