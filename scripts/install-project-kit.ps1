[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory)]
    [string]$Target
)

$ErrorActionPreference = 'Stop'
$resolvedTarget = (Resolve-Path -LiteralPath $Target).Path
if (-not (Test-Path -LiteralPath $resolvedTarget -PathType Container)) {
    throw "Target is not a directory: $resolvedTarget"
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$operations = @(
    @{ Source = Join-Path $repoRoot 'templates\AGENTS.single-agent.md'; Destination = Join-Path $resolvedTarget 'AGENTS.md' },
    @{ Source = Join-Path $repoRoot 'templates\CLAUDE.md'; Destination = Join-Path $resolvedTarget 'CLAUDE.md' }
)

$skillRoot = Join-Path $resolvedTarget '.claude\skills'
foreach ($skill in @('diagnosticar', 'planejar-correcao', 'executar-etapa', 'extrair-com-rastreabilidade')) {
    $operations += @{
        Source = Join-Path $repoRoot "skills\$skill\SKILL.md"
        Destination = Join-Path $skillRoot "$skill\SKILL.md"
    }
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
foreach ($operation in $operations) {
    $destination = $operation.Destination
    if ($PSCmdlet.ShouldProcess($destination, 'Install agent configuration')) {
        $parent = Split-Path -Parent $destination
        if (-not (Test-Path -LiteralPath $parent)) {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
        if (Test-Path -LiteralPath $destination) {
            Copy-Item -LiteralPath $destination -Destination "$destination.bak-$stamp"
        }
        Copy-Item -LiteralPath $operation.Source -Destination $destination
    }
}

if ($WhatIfPreference) {
    Write-Output "Simulation completed for $resolvedTarget"
} else {
    Write-Output "Installed agent kit in $resolvedTarget"
}
