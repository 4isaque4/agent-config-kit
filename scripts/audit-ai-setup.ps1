[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

function Get-CommandStatus {
    param([Parameter(Mandatory)][string]$Name)
    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($null -eq $command) { return 'MISSING' }
    return "FOUND ($($command.Source))"
}

function Get-JsonShape {
    param([Parameter(Mandatory)][string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        return [pscustomobject]@{ Path = $Path; State = 'MISSING'; TopKeys = ''; McpServers = ''; EnvReadRules = 0 }
    }

    try {
        $data = Get-Content -Raw -LiteralPath $Path | ConvertFrom-Json
        $servers = if ($data.mcpServers) { $data.mcpServers.PSObject.Properties.Name -join ', ' } else { '' }
        $rules = @()
        if ($data.permissions.allow) { $rules = @($data.permissions.allow | Where-Object { $_ -match '(?i)Read\(.*\.env' }) }
        return [pscustomobject]@{
            Path = $Path
            State = 'VALID JSON'
            TopKeys = $data.PSObject.Properties.Name -join ', '
            McpServers = $servers
            EnvReadRules = $rules.Count
        }
    } catch {
        return [pscustomobject]@{ Path = $Path; State = 'INVALID JSON'; TopKeys = ''; McpServers = ''; EnvReadRules = 0 }
    }
}

$claudeDesktop = Join-Path $env:APPDATA 'Claude\claude_desktop_config.json'
$claudeSettings = Join-Path $env:USERPROFILE '.claude\settings.json'
$codexConfig = Join-Path $env:USERPROFILE '.codex\config.toml'

Write-Output 'AI setup audit (no secrets are printed)'
Write-Output "OS: $([System.Environment]::OSVersion.VersionString)"
foreach ($name in @('codex', 'claude', 'node', 'npm', 'uv', 'docker', 'git', 'gh')) {
    Write-Output ("{0}: {1}" -f $name, (Get-CommandStatus -Name $name))
}

Get-JsonShape -Path $claudeDesktop | Format-List
Get-JsonShape -Path $claudeSettings | Format-List

if (Test-Path -LiteralPath $codexConfig) {
    $text = Get-Content -Raw -LiteralPath $codexConfig
    $mcpCount = ([regex]::Matches($text, '(?m)^\s*\[mcp_servers\.(?:"[^"]+"|[^.\]]+)\]\s*$')).Count
    $pluginCount = ([regex]::Matches($text, '(?m)^\s*\[plugins\.')).Count
    Write-Output "Codex config: FOUND; MCP sections=$mcpCount; plugin sections=$pluginCount"
} else {
    Write-Output 'Codex config: MISSING'
}

Write-Output 'Note: EnvReadRules is informational. This kit supports intentional global .env access.'
