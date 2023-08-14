# install choco
$chocoInstall = Get-Command -Name choco.exe -ErrorAction SilentlyContinue
if($chocoInstall){
    $title    = "Choco installed $($chocoInstall.Version)"
    $question = 'Try and upgrade chocolatey?'
    $Choices = @(
        [System.Management.Automation.Host.ChoiceDescription]::new("&Yes", "Try and install latest version")
        [System.Management.Automation.Host.ChoiceDescription]::new("&No", "Ignore")
    )
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if(0 -eq $decision){
        choco upgrade chocolatey
    }
} else {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Install golang
choco install -y golang