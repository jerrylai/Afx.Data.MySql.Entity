@echo off
set Build="%SYSTEMDRIVE%\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MsBuild.exe"
if exist publish rd /s /q publish
%Build% "NET40/Afx.Data.MySql.Entity/Afx.Data.MySql.Entity.csproj" /t:Rebuild /p:Configuration=Release
%Build% "NET452/Afx.Data.MySql.Entity/Afx.Data.MySql.Entity.csproj" /t:Rebuild /p:Configuration=Release
dotnet build "NETStandard2.0/Afx.Data.MySql.Entity/Afx.Data.MySql.Entity.csproj" -c Release 
cd publish
del /q/s *.pdb
del /q/s EntityFramework*
del /q/s Afx.Data.dll Afx.Data.Entity.dll Afx.Data.Entity.dll.config Afx.Data.Entity.xml MySql.Data.xml
del /q/s Afx.Data.xml MySql.Data.dll MySql.Data.Entity.EF6.dll Afx.Data.MySql.Entity.dll.config MySql.Data.Entity.EF6.xml
pause