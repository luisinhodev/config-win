Import-Module posh-git
Import-Module DirColors
Import-Module -Name Terminal-Icons

#temas: bubbles, bubblesline, patriksvensson, slim, pixelrobots, craver
#Set-Theme Zash
# Set-PoshPrompt -Theme patriksvensson

oh-my-posh init pwsh --config "bubblesline" | Invoke-Expression


# Alias

Set-Alias -Name v -Value nvim
Set-Alias ll ls
Set-Alias brave 'C:\Program Files\BraveSoftware\Brave-Browser\Application/brave.exe'
Set-Alias n 'C:\Users\LUISINHO\scoop\apps\neovide\current\neovide.exe'

function ..  { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

function gs { git status }
function ga { git add . }
function gp { git push }
function gc { param($msg) git commit -m $msg }

# Autosuggestions
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f'}
# Set-PSReadLineOption -Colors @{ InlinePrediction = "`e[38;5;244m" }


Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

Set-PSReadLineKeyHandler -Key Alt+d -Function ShellKillWord
Set-PSReadLineKeyHandler -Key Alt+Backspace -Function ShellBackwardKillWord
Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+f -Function ShellForwardWord
Set-PSReadLineKeyHandler -Key Alt+B -Function SelectShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+F -Function SelectShellForwardWord

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
