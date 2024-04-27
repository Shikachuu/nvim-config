-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/shika/.cache/nvim/packer_hererocks/2.1.1707061634/share/lua/5.1/?.lua;/home/shika/.cache/nvim/packer_hererocks/2.1.1707061634/share/lua/5.1/?/init.lua;/home/shika/.cache/nvim/packer_hererocks/2.1.1707061634/lib/luarocks/rocks-5.1/?.lua;/home/shika/.cache/nvim/packer_hererocks/2.1.1707061634/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/shika/.cache/nvim/packer_hererocks/2.1.1707061634/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["adwaita.nvim"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\ny\0\0\4\0\3\0\a5\0\0\0006\1\1\0009\1\2\1\21\3\0\0B\1\2\0028\1\1\0L\1\2\0\vrandom\tmath\1\v\0\0\nbÃ³br\rpoczekaj\fratatuj\fpingwin\npanda\nhomik\vjeÅ¼ek\vskunks\nuÅ¾ik\vjeleÅ„Š\5\1\0\t\0\26\00226\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3B\3\1\0A\1\0\0013\1\6\0009\2\a\0009\2\b\0025\3\n\0=\3\t\0029\2\a\0009\2\v\0024\3\4\0009\4\f\0'\6\r\0'\a\14\0'\b\15\0B\4\4\2>\4\1\0039\4\f\0'\6\16\0'\a\17\0'\b\18\0B\4\4\2>\4\2\0039\4\f\0'\6\19\0'\a\20\0'\b\21\0B\4\4\0?\4\0\0=\3\t\0029\2\a\0009\2\22\0024\3\3\0\18\4\1\0B\4\1\0?\4\1\0=\3\t\0026\2\0\0'\4\23\0B\2\2\0029\2\24\0029\4\25\0B\2\2\1K\0\1\0\topts\nsetup\nalpha\vfooter\f:qa<CR>\tquit\6q\28:Telescope oldfiles<CR>\vrecent\6r\18<cmd>ene <CR>\bnew\6n\vbutton\fbuttons\1\b\0\0'                      _           '                     (_)          ' _ __   ___    __   ___ _ __ ___  '| '_ \\ / _ \\   \\ \\ / / | '_ ` _ \\ '| | | | (_) |   \\ V /| | | | | | |'|_| |_|\\___( )   \\_/ |_|_| |_| |_|'           |/                     \bval\vheader\fsection\0\ttime\aos\15randomseed\tmath\27alpha.themes.dashboard\frequire\a€€À™\4\3€€À™\4\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\ng\0\1\5\1\5\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3B\1\2\1K\0\1\0\0À\17capabilities\1\0\1\17capabilities\0\nsetup\14lspconfig\frequireÞ\1\1\0\6\0\n\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0023\1\3\0006\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\a\0005\5\6\0=\5\b\0044\5\3\0>\1\1\5=\5\t\4B\2\2\0012\0\0€K\0\1\0\rhandlers\21ensure_installed\1\0\2\rhandlers\0\21ensure_installed\0\1\3\0\0\ngopls\vlua_ls\nsetup\20mason-lspconfig\0\25default_capabilities\17cmp_nvim_lsp\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¸\2\1\0\n\0\19\0\0306\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\0039\4\n\0009\4\v\0049\4\f\0045\6\15\0009\a\n\0009\a\r\a5\t\14\0B\a\2\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\6B\4\2\2=\4\n\3B\1\2\1K\0\1\0\14<C-Space>\rcomplete\t<CR>\1\0\2\t<CR>\0\14<C-Space>\0\1\0\1\vselect\1\fconfirm\vinsert\vpreset\fmapping\fsources\1\0\1\tname\rnvim_lsp\fsnippet\1\0\3\fsources\0\fsnippet\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n±\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\16\0\0\rmarkdown\bvim\vvimdoc\tbash\blua\ago\ngomod\ngosum\nproto\15dockerfile\15javascript\15typescript\thtml\tjson\tyaml\1\0\5\14highlight\0\nbuild\14:TSUpdate\17auto_install\2\17sync_install\2\21ensure_installed\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/shika/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/shika/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¸\2\1\0\n\0\19\0\0306\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\3\0005\5\b\0>\5\1\4=\4\t\0039\4\n\0009\4\v\0049\4\f\0045\6\15\0009\a\n\0009\a\r\a5\t\14\0B\a\2\2=\a\16\0069\a\n\0009\a\17\aB\a\1\2=\a\18\6B\4\2\2=\4\n\3B\1\2\1K\0\1\0\14<C-Space>\rcomplete\t<CR>\1\0\2\t<CR>\0\14<C-Space>\0\1\0\1\vselect\1\fconfirm\vinsert\vpreset\fmapping\fsources\1\0\1\tname\rnvim_lsp\fsnippet\1\0\3\fsources\0\fsnippet\0\fmapping\0\vexpand\1\0\1\vexpand\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\14log_level\nerror\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\ng\0\1\5\1\5\0\n6\1\0\0'\3\1\0B\1\2\0028\1\0\0019\1\2\0015\3\3\0-\4\0\0=\4\4\3B\1\2\1K\0\1\0\0À\17capabilities\1\0\1\17capabilities\0\nsetup\14lspconfig\frequireÞ\1\1\0\6\0\n\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0023\1\3\0006\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\a\0005\5\6\0=\5\b\0044\5\3\0>\1\1\5=\5\t\4B\2\2\0012\0\0€K\0\1\0\rhandlers\21ensure_installed\1\0\2\rhandlers\0\21ensure_installed\0\1\3\0\0\ngopls\vlua_ls\nsetup\20mason-lspconfig\0\25default_capabilities\17cmp_nvim_lsp\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\ny\0\0\4\0\3\0\a5\0\0\0006\1\1\0009\1\2\1\21\3\0\0B\1\2\0028\1\1\0L\1\2\0\vrandom\tmath\1\v\0\0\nbÃ³br\rpoczekaj\fratatuj\fpingwin\npanda\nhomik\vjeÅ¼ek\vskunks\nuÅ¾ik\vjeleÅ„Š\5\1\0\t\0\26\00226\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0016\3\4\0009\3\5\3B\3\1\0A\1\0\0013\1\6\0009\2\a\0009\2\b\0025\3\n\0=\3\t\0029\2\a\0009\2\v\0024\3\4\0009\4\f\0'\6\r\0'\a\14\0'\b\15\0B\4\4\2>\4\1\0039\4\f\0'\6\16\0'\a\17\0'\b\18\0B\4\4\2>\4\2\0039\4\f\0'\6\19\0'\a\20\0'\b\21\0B\4\4\0?\4\0\0=\3\t\0029\2\a\0009\2\22\0024\3\3\0\18\4\1\0B\4\1\0?\4\1\0=\3\t\0026\2\0\0'\4\23\0B\2\2\0029\2\24\0029\4\25\0B\2\2\1K\0\1\0\topts\nsetup\nalpha\vfooter\f:qa<CR>\tquit\6q\28:Telescope oldfiles<CR>\vrecent\6r\18<cmd>ene <CR>\bnew\6n\vbutton\fbuttons\1\b\0\0'                      _           '                     (_)          ' _ __   ___    __   ___ _ __ ___  '| '_ \\ / _ \\   \\ \\ / / | '_ ` _ \\ '| | | | (_) |   \\ V /| | | | | | |'|_| |_|\\___( )   \\_/ |_|_| |_| |_|'           |/                     \bval\vheader\fsection\0\ttime\aos\15randomseed\tmath\27alpha.themes.dashboard\frequire\a€€À™\4\3€€À™\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n±\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\16\0\0\rmarkdown\bvim\vvimdoc\tbash\blua\ago\ngomod\ngosum\nproto\15dockerfile\15javascript\15typescript\thtml\tjson\tyaml\1\0\5\14highlight\0\nbuild\14:TSUpdate\17auto_install\2\17sync_install\2\21ensure_installed\0\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
