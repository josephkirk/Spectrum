Push-Location $PSScriptRoot\..
pyenv exec python -m pipenv install -d --skip-lock

#Set-ExecutionPolicy RemoteSigned -scope CurrentUser
# try {
#     Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
# } catch {

# }

if (!(Test-Path bin)) {
    New-Item -ItemType Directory bin
}

$dependencies = @(
    "rethinkdb",
    "nomad",
    "ffmpeg"
)

$dependencies | Foreach-Object {
    scoop install $_
    scoop which $_ | Copy-Item -Force -Destination bin\

}
