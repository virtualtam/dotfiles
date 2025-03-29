set -gx GOPATH ~/.golang
set -gx GOBIN $GOPATH/bin

fish_add_path --global --move $GOBIN
