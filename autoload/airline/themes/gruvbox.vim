function! airflow#themes#gruvbox#refresh()
    lua require("gruvbox.plugins.airline").refresh()
endfunction

call airflow#themes#gruvbox#refresh()
