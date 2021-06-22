[Setup]
AppName=A-Radar
AppId=DEB2B07E-46E6-4F35-92FB-21739786925A
AppVerName=A-Radar
AppPublisher=Chensky IT-Services
AppPublisherURL=https://www.chensky.de/
AppVersion=1.1
AppCopyright=Copyright (C) 2017 - 2021 Chenskay IT-Services.

DefaultDirName={autopf}\A-Radar
DefaultGroupName=A-Radar
UninstallDisplayIcon={app}\aradar.exe
UninstallDisplayName=A-Radar
OutputDir=C:\Temp
OutputBaseFilename=aradar_setup
SourceDir="d:\Programs\A-Radar\"
ShowLanguageDialog=no
Compression=lzma2/ultra64
SolidCompression=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes

VersionInfoVersion=1.1
VersionInfoCompany=Censka IT-Services
VersionInfoCopyright=Copyright (C) 2017 - 2021 Chensky IT-Services.
VersionInfoDescription=A-Radar
VersionInfoProductName=A-Radar
VersionInfoProductVersion=1.1
VersionInfoTextVersion=1.1

MinVersion=6.0
WizardStyle=modern
WizardImageFile=compiler:WizModernImage-IS.bmp

ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64

[Messages]
BeveledLabel=  Censka IT-Services

[Files]
Source: "Win32\Release\aradar.x32.exe"; DestDir: "{app}"; DestName: "aradar.exe"; Check: not Is64BitInstallMode; Flags: ignoreversion overwritereadonly 32bit
Source: "Win64\Release\aradar.x64.exe"; DestDir: "{app}"; DestName: "aradar.exe"; Check: Is64BitInstallMode; Flags: ignoreversion overwritereadonly 64bit

[Icons]
Name: "{group}\A-Radar"; Filename: "{app}\aradar.exe"; WorkingDir: "{app}"

[Run]
Filename: "{app}\aradar.exe"; Description: "A-Radar"; WorkingDir: "{app}"; Flags: postinstall nowait

[UninstallRun]
Filename: "{app}\aradar.exe"; Parameters: "-c"; WorkingDir: "{app}"; Flags: waituntilterminated

[UninstallDelete]
Type: files; Name: "{app}\aradar.dat"
Type: files; Name: "{app}\aradar.icl"
Type: files; Name: "{app}\aradar.bak"
