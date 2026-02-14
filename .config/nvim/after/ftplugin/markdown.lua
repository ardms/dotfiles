
vim.opt.spell = true

-- Autocmmand to alter last modified date on markdown files every time they are saved
--
vim.api.nvim_create_autocmd('bufWritePre', {pattern = '*.md',
callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    for line_num = 0, vim.api.nvim_buf_line_count(bufnr) - 1 do
	local line = vim.api.nvim_buf_get_lines(bufnr, line_num, line_num + 1, false)[1]
	if line:match 'modified:' then
	    local new_date = os.date 'modified: %Y-%m-%d'
	    vim.api.nvim_buf_set_lines(bufnr, line_num, line_num + 1, false, { new_date })
	    break
	end
    end
end,
})


