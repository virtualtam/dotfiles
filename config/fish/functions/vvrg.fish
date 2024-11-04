function vvrg --description 'run a search with ripgrep and open the results in a Vim quickfix window (vsplit)'
    nvim -q (rg --vimgrep --smart-case $argv | psub) +copen +"wincmd L"
end
