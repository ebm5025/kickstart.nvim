return {
  'pocco81/auto-save.nvim',
  event = { 'InsertLeave', 'TextChanged' },
  config = function()
    require('auto-save').setup {
      enabled = true,
      execution_message = {
        message = function()
          return ('Autosaved at ' .. vim.fn.strftime '%H:%M:%S')
        end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { 'InsertLeave', 'TextChanged' },
      condition = function(buf)
        local fn = vim.fn
        return fn.getbufvar(buf, '&modifiable') == 1 and fn.getbufvar(buf, '&buftype') == ''
      end,
      write_all_buffers = false, -- set to true if you want all open files autosaved
      debounce_delay = 135,
    }
  end,
}
