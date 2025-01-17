@echo off
:: Script to install multiple winget packages
:: Ensure the script is run as administrator
setlocal

echo ======================================
echo Installing selected winget packages...
echo ======================================

:: List of packages to install
set packages=(
    "Bitwarden.Bitwarden"
    "Mozilla.Firefox"
    "Google.Chrome"
    "Telegram.TelegramDesktop"
    "Discord.Discord"
    "qBittorrent.qBittorrent"
    "Anki.Anki"
    "Obsidian.Obsidian"
    "Xournal++.Xournal++"
    "calibre.calibre"
    "TheDocumentFoundation.LibreOffice"
    "Notion.Notion"
    "Valve.Steam"
    "EpicGames.EpicGamesLauncher"
    "ElectronicArts.EADesktop"
    "Blizzard.BattleNet"
    "GOG.Galaxy"
    "Amazon.Games"
    "Guru3D.Afterburner"
    "Ryochan7.DS4Windows"
    "PCSX2Team.PCSX2"
    "PPSSPPTeam.PPSSPP"
    "Cemu.Cemu"
    "Microsoft.VisualStudioCode"
    "Microsoft.VisualStudio.2022.Community"
    "Microsoft.AzureDataStudio"
    "dbeaver.dbeaver"
    "Postman.Postman"
    "Unity.UnityHub"
    "Git.Git"
    "7zip.7zip"
    "EliasFotinis.DeskPins"
    "RamenSoftware.Windhawk"
    "RustDesk.RustDesk"
    "Oracle.VirtualBox"
    "OBSProject.OBSStudio"
    "Audacity.Audacity"
    "CodecGuide.K-LiteCodecPack.Standard"
    "SMPlayer.SMPlayer"
    "KDE.Kdenlive"
    "GIMP.GIMP"
    "Upscayl.Upscayl"
)

:: Install packages
for %%p in %packages% do (
    echo Installing %%p...
    winget install -e --id %%p
    if errorlevel 1 (
        echo Failed to install %%p
    ) else (
        echo Successfully installed %%p
    )
)

echo ======================================
echo Configuring Context Menu...
echo ======================================

:: Add registry key for context menu configuration
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
if errorlevel 1 (
    echo Failed to add registry key
) else (
    echo Context m
