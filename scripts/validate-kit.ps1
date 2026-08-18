[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$errors = [System.Collections.Generic.List[string]]::new()

Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.json' | ForEach-Object {
    try { Get-Content -Raw -LiteralPath $_.FullName | ConvertFrom-Json | Out-Null }
    catch { $errors.Add("Invalid JSON: $($_.FullName)") }
}

$required = @(
    'README.md', 'AGENTS.md', 'templates\CLAUDE.md',
    'scripts\audit-ai-setup.ps1', 'scripts\install-project-kit.ps1'
)
foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relative))) {
        $errors.Add("Missing: $relative")
    }
}

$secretPatterns = @(
    'gh[opsu]_[A-Za-z0-9]{20,}',
    'sk-[A-Za-z0-9_-]{20,}',
    'AKIA[0-9A-Z]{16}',
    '-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----'
)
$files = Get-ChildItem -LiteralPath $repoRoot -Recurse -File | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($file in $files) {
    $content = Get-Content -Raw -LiteralPath $file.FullName -ErrorAction SilentlyContinue
    foreach ($pattern in $secretPatterns) {
        if ($content -match $pattern) { $errors.Add("Possible secret in $($file.FullName)") }
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Output 'Validation passed: JSON, required files, and basic secret scan.'
