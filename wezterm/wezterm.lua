local merge = require 'utils.merge'

local keys = require 'config.keys'
local ui = require 'config.ui'

-- require('config.status-right').setup()
require('config.right-status')
require('config.tab-title-new')

local other_opts = {
  -- use_ime = true,
  -- macos_forward_to_ime_modifier_mask = 'SHIFT',
  check_for_updates_interval_seconds = 30 * 24 * 60 * 60
}

return merge.merge({other_opts,keys, ui})
