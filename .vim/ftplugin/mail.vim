" ftplugin/mail.vim
" http://www.mdlerch.com/emailing-mutt-and-vim-advanced-config.html
function IsReply()
	if line('$') > 1
		" :g/^>\s\=--\s\=$/,$ delete
		" :%!par w72q
		:%s/^.\+\ze\n\(>*$\)\@!/\0 /e
		:%s/^>*\zs\s\+$//e
		:1
		:put! =\"\n\n\"
		:1
	endif
endfunction

augroup mail_filetype
	autocmd!
	autocmd VimEnter /tmp/mutt* :call IsReply()
	autocmd VimEnter /tmp/mutt* :exe 'startinsert'
augroup END

" setl tw=72
setl fo=aw
