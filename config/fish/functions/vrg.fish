function vrg --description 'run a search with ripgrep and open the results in a neovim quickfix window'
    nvim -q (rg --vimgrep --smart-case $argv | psub) +"copen 15"
end

