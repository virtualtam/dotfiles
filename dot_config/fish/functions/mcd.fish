function mcd --description 'Create a directory and change to it'
    mkdir -p $argv[1]
    and cd $argv[1]
end
