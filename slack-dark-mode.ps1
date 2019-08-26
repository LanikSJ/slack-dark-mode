Param(
    [string] $CSSUrl = "https://raw.githubusercontent.com/LanikSJ/slack-dark-mode/master/dark-theme.css",
    [string] $SlackBase = $null,
    [switch] $UpdateOnly,
    [switch] $LightMode
)

if (-not (Get-Command -Name "npx" -ErrorAction SilentlyContinue)) {
    throw "npx is required to unpack slack. Please install Node for your OS."
}

$latestPath = $SlackBase
if ([string]::IsNullOrWhiteSpace($SlackBase)) {
    Write-Output "Locating Slack"
    $SlackBase = Join-Path -Path $env:LOCALAPPDATA -ChildPath slack

    if (-not (Test-Path -Path $SlackBase)) {
        Write-Output "Checking for MSI-based installations"
        $latestPath = Join-Path -Path $env:ProgramFiles -ChildPath "Slack"
        if (-not (Test-Path -Path $latestPath)) {
            throw "It doesn't look like slack is installed"
        }

        Write-Output "Found Slack MSI Install"
    } else {
        $latestPath = Get-ChildItem -Path $SlackBase -Directory -Filter "app*" | Sort-Object -Descending | Select-Object -First 1 -ExpandProperty FullName
        Write-Output "Found Slack $($latestPath.Name) in AppData"
    }
} elseif (-not (Test-Path -Path $SlackBase)) {
    throw "Could not find $SlackBase"
}

$resources = Join-Path -Path $latestPath -ChildPath "resources"
$themeFile = Join-Path -Path $resources -ChildPath "custom_theme.css"

if ($LightMode -eq $true) {
    Write-Output "Removing Dark Theme.."
    Write-Output "Please refresh Slack (ctrl + R)"
    Remove-Item $themeFile -Force
    exit
}

Write-Output "Stopping Slack"
Get-Process *slack* | Stop-Process -Force

Write-Output "Updating Theme File"
if (-not (Test-Path -Path $themeFile)) {
    New-Item -ItemType File -Path $themeFile | Out-Null
}

Write-Output "Fetching Theme from $CSSUrl"
Get-Content ./dark-theme.css | Set-Content -Path $themeFile # add the theme from the repo

if (Test-Path ./custom-dark-theme.css) {
    Get-Content ./custom-dark-theme.css | Add-Content $themeFile
}

if (-not $UpdateOnly) {
    $asar = Join-Path -Path $resources -ChildPath "app.asar"
    $unpacked = Join-Path -Path $resources -ChildPath "app.asar.unpacked"

    Write-Output "Unpacking asar archive"
    &npx asar extract "$asar" "$unpacked"

    Write-Output "Adding Hook"
    $ssbInterop = Join-Path -Path "$unpacked" -ChildPath "dist" | Join-Path -ChildPath "ssb-interop.bundle.js"
    $src = Get-Content -Raw $ssbInterop

    if ($src.Contains("// BEGIN CUSTOM THEME")) {
        Write-Output "Replacing Old Hook"
        $src = $src.Substring(0, $src.IndexOf("// BEGIN CUSTOM THEME"))
    }

    $patch = Get-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath "event-listener.js") -Raw
    $patch = $patch.Replace("SLACK_DARK_THEME_PATH", $themeFile.Replace("\", "/"))

    $src.Trim() + @"


// BEGIN CUSTOM THEME
$patch
// END CUSTOM THEME
"@ | Set-Content -Path $ssbInterop

    Write-Output "Packing asar archive"
    &npx asar pack "$unpacked" "$asar"

    Write-Output "Adding workaround to ensure theme boots"
    $localSettingsPath = Join-Path -Path $env:APPDATA -ChildPath "Slack" | Join-Path -ChildPath "local-settings.json"
    $localSettings = Get-Content -Raw -Path $localSettingsPath | ConvertFrom-Json

    if (-not ($localSettings | Get-Member -Name "bootSonic")) {
        $localSettings | Add-Member -MemberType NoteProperty -Name "bootSonic" -Value "never"
    } else {
        $localSettings.bootSonic = "never"
    }

    Set-ItemProperty -Path $localSettingsPath -Name IsReadOnly -Value $false
    $localSettings | ConvertTo-Json -Compress | Set-Content -Path $localSettingsPath
    Set-ItemProperty -Path $localSettingsPath -Name IsReadOnly -Value $true
}
