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

if (Get-Alias gp -ErrorAction SilentlyContinue) { Remove-Item Alias:gp -Force }
function gp { git push }
# function gc { param($msg) git commit -m $msg }

if (Get-Alias gc -ErrorAction SilentlyContinue) { Remove-Item Alias:gc -Force }
function gc {
    param([string]$msg)
    git commit -m "$msg"
}

# 1. Importar el módulo (PSReadLine maneja los atajos y predicciones)
Import-Module PSReadLine

# 2. Activar el modo Emacs para usar Ctrl+A, Ctrl+E, etc. (como en Linux)
Set-PSReadLineOption -EditMode Emacs

# 3. Configurar la fuente de las predicciones (Historial de comandos)
Set-PSReadLineOption -PredictionSource History

# 4. Cambiar el color de la sugerencia (Tu línea corregida con ANSI)
# Nota: En versiones modernas, es mejor usar secuencias ANSI para mayor compatibilidad
Set-PSReadLineOption -Colors @{ InlinePrediction = '#5f5f5f' }
# Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f'}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
