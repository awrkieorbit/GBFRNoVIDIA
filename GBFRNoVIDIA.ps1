$svc = @('NVDisplay.ContainerLocalSystem', 'NvContainerLocalSystem') | Where-Object { Get-Service $_ -ErrorAction SilentlyContinue}
$procs = @('NVIDIA Overlay', 'NVIDIA Share', 'NVIDIA App')

foreach ($n in $procs) { Get-Process $n -ErrorAction SilentlyContinue | Stop-Process -Force }
$states = @{}
foreach ($s in $svc) {
    $states[$s] = Get-Service $s
    Set-Service $s -StartupType Disabled
    Stop-Service $s -Force -ErrorAction SilentlyContinue
    "stopped $s"
}

Start-Process 'steam://rungameid/881020'
"launched granblue without nvidia overlay/capture hooks"

try {
    while (-not (Get-Process granblue_fantasy_relink -ErrorAction SilentlyContinue)) { Start-Sleep 2 }
    "game running..."
    while (Get-Process granblue_fantasy_relink -ErrorAction SilentlyContinue) { Start-Sleep 5 }
} finally {
    foreach ($s in $svc) {
        Set-Service $s -StartupType $states[$s].StartType
        Start-Service $s -ErrorAction SilentlyContinue
        "$s relaunched"
    }
}