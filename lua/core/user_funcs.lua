local M = {}

M.create_func = vim.api.nvim_create_user_command

M.create_func("AutoRun", function()
    -- Get current bufnr
    local output_bufnr = vim.fn.input("Buffer for Output: ")
    if #output_bufnr.gsub(output_bufnr, "%s+", "") == 0 then
        return
    end

    local pattern = vim.fn.input("Pattern (e.g *." .. vim.bo.filetype .. "): ") or ("*." .. vim.bo.filetype)
    local command = vim.fn.input("Command: ")

    if #command.gsub(command, "%s+", "") == 0 then
        return
    end

    -- Attach autocmd to current buffer
    vim.api.nvim_create_autocmd("BufWritePost", { -- Will execute after write
        pattern = pattern,
        callback = function()
            -- Run program and place output in seperate buffer
            local append_data = function(_, data)
                vim.api.nvim_buf_set_lines(tonumber(output_bufnr), 0, -1, true, data)
            end

            vim.api.nvim_buf_set_lines(tonumber(output_bufnr), 0, -1, false,
                { vim.fn.expand("%h") .. " output:" })

            -- Run the command
            vim.fn.jobstart(vim.split(command, " "), {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end, {})
