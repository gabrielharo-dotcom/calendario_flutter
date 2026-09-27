# Ejecuta el laboratorio con el SDK configurado para este equipo.
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
$calendarSettings = Get-Content -LiteralPath '.vscode/settings.json' -Raw | ConvertFrom-Json
$calendarFlutter = Join-Path $calendarSettings.'dart.flutterSdkPath' 'bin/flutter.bat'
if (-not (Test-Path -LiteralPath $calendarFlutter)) {
    $calendarCommand = Get-Command flutter -ErrorAction SilentlyContinue
    if (-not $calendarCommand) { throw 'Configura dart.flutterSdkPath en .vscode/settings.json con la ruta de tu SDK Flutter.' }
    $calendarFlutter = $calendarCommand.Source
}
& $calendarFlutter pub get
if ($LASTEXITCODE -ne 0) { throw 'No se pudieron resolver las dependencias.' }
& $calendarFlutter run -d edge
