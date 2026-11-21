-- vim.pack でプラグインをインストールし、ロードは lz.n に委ねる (settings.lua の lz.n.load)

---@class configs.PluginSpec: lz.n.PluginSpec
---@field src string インストール元のリポジトリ URL
---@field build? string|fun(data: table) install/update 後の処理。文字列はプラグインディレクトリで実行するシェルコマンド

---@type table<string, configs.PluginSpec>
local specs = {}
---@type vim.pack.Spec[]
local pack_specs = {}
for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/plugins/*.lua', true)) do
  ---@type configs.PluginSpec
  local spec = require('plugins.' .. vim.fn.fnamemodify(file, ':t:r'))
  if spec.enabled ~= false then
    specs[spec[1]] = spec
    table.insert(pack_specs, { src = spec.src, name = spec[1] })
  end
end

-- lockfile からの初回インストールでも発火するよう、最初の vim.pack.add より前に登録する
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local data = ev.data
    local build = (specs[data.spec.name] or {}).build
    if not build or data.kind == 'delete' then
      return
    end

    if type(build) == 'function' then
      -- build からプラグインのモジュールを require できるよう runtimepath にだけ追加する
      vim.cmd.packadd({ data.spec.name, bang = true })
      build(data)
      return
    end

    local result = vim.system({ 'sh', '-c', build }, { cwd = data.path }):wait()
    if result.code ~= 0 then
      vim.notify(('Failed to build %s:\n%s'):format(data.spec.name, result.stderr), vim.log.levels.ERROR)
    end
  end,
})

vim.pack.add({ 'https://github.com/lumen-oss/lz.n' })
vim.pack.add(pack_specs, {
  -- ロードは lz.n が行う
  load = function() end,
})

vim.g.lz_n = {
  ---@param name string
  load = function(name)
    -- init 中の packadd は plugin/ を二重に source するため、runtimepath への追加に留めて起動処理に任せる
    if vim.v.vim_did_init == 0 then
      vim.cmd.packadd({ name, bang = true })
      return
    end

    -- 起動後の packadd は after/plugin を source しないため補う (nvim-cmp の source が依存)
    vim.cmd.packadd(name)
    local after_plugin = vim.fs.joinpath(vim.fn.stdpath('data'), 'site', 'pack', 'core', 'opt', name, 'after', 'plugin')
    for _, file in ipairs(vim.fn.globpath(after_plugin, '**/*.{vim,lua}', false, true)) do
      vim.cmd.source(file)
    end
  end,
}
