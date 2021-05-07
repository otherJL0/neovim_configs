vim.cmd [[packadd vimball]]

function has(x)
  return vim.fn.has(x) == 1
end

return require('packer').startup {
  function(use)
    use 'wbthomas/packer.nvim'
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  }
}
