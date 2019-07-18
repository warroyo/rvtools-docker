FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS build

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

ENV chocolateyUseWindowsCompression false

RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco feature disable --name showDownloadProgress; \
    choco install rvtools -y

FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

COPY --from=build ["C:/Program Files (x86)/Robware/RVTools", "C:/Program Files (x86)/Robware/RVTools"]

RUN [Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\\Program Files (x86)\\Robware\\RVTools', [EnvironmentVariableTarget]::Machine)

ENTRYPOINT  ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]