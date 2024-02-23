oh-my-posh init pwsh | Invoke-Expression

# https://www.techtarget.com/searchitoperations/answer/Manage-the-Windows-PATH-environment-variable-with-PowerShell
Function Add-PathVariable {
  param (
      [string]$addPath
  )
  if (Test-Path $addPath) {
      $regexAddPath = [regex]::Escape($addPath)
      $arrPath = $env:Path -split ';' | Where-Object {$_ -notMatch "^$regexAddPath\\?"}
      $env:Path = ($arrPath + $addPath) -join ';'
  } else {
      Throw "'$addPath' is not a valid path."
  }
}

# https://gist.github.com/mikepruett3/7ca6518051383ee14f9cf8ae63ba18a7
function Install-ScoopApp {
  param (
      [string]$Package
  )
  Write-Verbose -Message "Preparing to install $Package"
  if (! (scoop info $Package).Installed ) {
      Write-Verbose -Message "Installing $Package"
      scoop install $Package
  } else {
      Write-Verbose -Message "Package $Package already installed! Skipping..."
  }
}

function Install-WinGetApp {
  param (
      [string]$PackageID
  )
  Write-Verbose -Message "Preparing to install $PackageID"
  # Added accept options based on this issue - https://github.com/microsoft/winget-cli/issues/1559
  #$listApp = winget list --exact -q $PackageID --accept-source-agreements
  #if (winget list --exact --id "$PackageID" --accept-source-agreements) {
  #    Write-Verbose -Message "Package $PackageID already installed! Skipping..."
  #} else {
  #    Write-Verbose -Message "Installing $Package"
  #    winget install --silent --id "$PackageID" --accept-source-agreements --accept-package-agreements
  #}
  Write-Verbose -Message "Installing $Package"
  winget install --silent --id "$PackageID" --accept-source-agreements --accept-package-agreements
}

function Install-ChocoApp {
  param (
      [string]$Package
  )
  Write-Verbose -Message "Preparing to install $Package"
  $listApp = choco list --local $Package
  if ($listApp -like "0 packages installed.") {
      Write-Verbose -Message "Installing $Package"
      Start-Process -FilePath "PowerShell" -ArgumentList "choco","install","$Package","-y" -Verb RunAs -Wait
  } else {
      Write-Verbose -Message "Package $Package already installed! Skipping..."
  }
}

function Extract-Download {
  param (
      [string]$Folder,
      [string]$File
  )
  if (!(Test-Path -Path "$Folder" -PathType Container)) {
      Write-Error "$Folder does not exist!!!"
      Break
  }
  if (Test-Path -Path "$File" -PathType Leaf) {
      switch ($File.Split(".") | Select-Object -Last 1) {
          "rar" { Start-Process -FilePath "UnRar.exe" -ArgumentList "x","-op'$Folder'","-y","$File" -WorkingDirectory "$Env:ProgramFiles\WinRAR\" -Wait | Out-Null }
          "zip" { 7z x -o"$Folder" -y "$File" | Out-Null }
          "7z" { 7z x -o"$Folder" -y "$File" | Out-Null }
          "exe" { 7z x -o"$Folder" -y "$File" | Out-Null }
          Default { Write-Error "No way to Extract $File !!!"; Break }
      }
  }
}

function Download-CustomApp {
  param (
      [string]$Link,
      [string]$Folder
  )
  if ((curl -sIL "$Link" | Select-String -Pattern "Content-Disposition") -ne $Null) {
      $Package = $(curl -sIL "$Link" | Select-String -Pattern "filename=" | Split-String -Separator "=" | Select-Object -Last 1).Trim('"')
  } else {
      $Package = $Link.split("/") | Select-Object -Last 1
  }
  Write-Verbose -Message "Preparing to download $Package"
  aria2c --quiet --dir="$Folder" "$Link"
  Return $Package
}

function Install-CustomApp {
  param (
      [string]$URL,
      [string]$Folder
  )
  $Package = Download-CustomApp -Link $URL -Folder "$Env:UserProfile\Downloads\"
  if (Test-Path -Path "$Env:UserProfile\Downloads\$Package" -PathType Leaf) {
      if (Test-Path Variable:Folder) {
          if (!(Test-Path -Path "$Env:UserProfile\bin\$Folder")) {
              New-Item -Path "$Env:UserProfile\bin\$Folder" -ItemType Directory | Out-Null
          }
          Extract-Download -Folder "$Env:UserProfile\bin\$Folder" -File "$Env:UserProfile\Downloads\$Package"
      } else {
          Extract-Download -Folder "$Env:UserProfile\bin\" -File "$Env:UserProfile\Downloads\$Package"
      }
      Remove-Item -Path "$Env:UserProfile\Downloads\$Package"
  }
}

function Install-CustomPackage {
  param (
      [string]$URL
  )
  $Package = Download-CustomApp -Link $URL
  if (Test-Path -Path "$Env:UserProfile\Downloads\$Package" -PathType Leaf) {
      Start-Process -FilePath ".\$Package" -ArgumentList "/S" -WorkingDirectory "${Env:UserProfile}\Downloads\" -Verb RunAs -Wait #-WindowStyle Hidden
      Remove-Item -Path "$Env:UserProfile\Downloads\$Package"
  }
}

function Remove-InstalledApp {
  param (
      [string]$Package
  )
  Write-Verbose -Message "Uninstalling: $Package"
  Start-Process -FilePath "PowerShell" -ArgumentList "Get-AppxPackage","-AllUsers","-Name","'$Package'" -Verb RunAs -WindowStyle Hidden
}

function Enable-Bucket {
  param (
      [string]$Bucket
  )
  if (!($(scoop bucket list).Name -eq "$Bucket")) {
      Write-Verbose -Message "Adding Bucket $Bucket to scoop..."
      scoop bucket add $Bucket
  } else {
      Write-Verbose -Message "Bucket $Bucket already added! Skipping..."
  }
}
