@echo off
set Build="%SYSTEMDRIVE%\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MsBuild.exe"
if exist publish rd /s /q publish
dotnet build "NETStandard2.0/Afx.Data.MySql.Entity/Afx.Data.MySql.Entity.csproj" -c Release
dotnet build "NET6.0/Afx.Data.MySql.Entity/Afx.Data.MySql.Entity.csproj" -c Release
cd publish
del /q/s *.pdb
del /q/s EntityFramework*
del /q/s Afx.Data.dll Afx.Data.xml Afx.Data.MySql.Entity.dll.config Afx.Data.Entity*
del /q/s BouncyCastle* Google* K4os* MySql* System* Ubiety* ZstdNet*
pause