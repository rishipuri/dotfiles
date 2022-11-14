vim.cmd [[
    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%', '?'),
        \   <bang>0)

    function! RgFzf(query, fullscreen)
        let cmd = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
        let initial_cmd = printf(cmd, shellescape(a:query))
        let reload_cmd = printf(cmd, '{q}')
        let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_cmd]}

        call fzf#vim#grep(
            \ initial_cmd, 1,
            \ a:fullscreen ? fzf#vim#with_preview(spec, 'up:60%')
            \              : fzf#vim#with_preview(spec, 'right:50%'),
            \ a:fullscreen)
    endfunction

    command! -bang -nargs=* RG call RgFzf(<q-args>, <bang>0)
]]
