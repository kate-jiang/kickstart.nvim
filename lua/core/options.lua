local opt = vim.opt

vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

opt.exrc = true
opt.secure = true

opt.rnu = true
opt.nu = true
opt.scrolloff = 10
opt.cursorline = true
opt.guicursor = table.concat({
  'n-v-c:block-blinkon0-Cursor/lCursor',
  'i-ci-ve:ver25-blinkwait250-blinkon250-blinkoff250',
  'r-cr:hor20-blinkwait250-blinkon250-blinkoff250',
  'o:hor50-blinkwait250-blinkon250-blinkoff250',
}, ',')

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.undofile = true

opt.splitright = true
opt.splitbelow = true

opt.mouse = 'a'
opt.updatetime = 250
opt.timeoutlen = 500

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.fillchars = { eob = '·' }
opt.signcolumn = 'yes'
opt.background = 'dark'
opt.backspace = 'indent,eol,start'
opt.showmode = false
