# https://github.com/PowerShell/PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs

# https://ohmyposh.dev/docs/installation/windows
oh-my-posh init pwsh | Invoke-Expression
