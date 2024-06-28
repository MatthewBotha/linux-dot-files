return {
    'f-person/git-blame.nvim',
    config = function()
        require('gitblame').setup {
            enabled = true,
            -- message_template = '  <author> • <date> • <summary>',
            date_format = '%r, %x',
        }
    end,
}
