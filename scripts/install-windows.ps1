# Installs or updates the clean-prose plugin for Antigravity on Windows.
# Usage: powershell -ExecutionPolicy Bypass -File scripts\install-windows.ps1
$ErrorActionPreference = 'Stop'
$repo = 'https://github.com/isjati/clean-prose.git'
$dest = Join-Path $env:USERPROFILE '.gemini\config\plugins\clean-prose'

if (Test-Path (Join-Path $dest '.git')) {
    git -C $dest pull --ff-only
    Write-Host "Updated $dest"
} else {
    New-Item -ItemType Directory -Force -Path (Split-Path $dest) | Out-Null
    git clone $repo $dest
    Write-Host "Installed to $dest"
}
Write-Host 'Start a new Antigravity conversation to load the plugin.'
