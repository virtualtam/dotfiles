# https://github.com/PowerShell/PSReadLine
# https://stackoverflow.com/questions/8360215/use-ctrl-d-to-exit-and-ctrl-l-to-cls-in-powershell-console
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

# https://ohmyposh.dev/docs/installation/windows
oh-my-posh init pwsh | Invoke-Expression
