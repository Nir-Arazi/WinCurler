@echo off

mkdir C:\WinCurler_results 2>&1
mkdir C:\WinCurler_results\Host_information  2>&1
mkdir C:\WinCurler_results\Running_Processes 2>&1
mkdir C:\WinCurler_results\Installed_Software 2>&1
mkdir C:\WinCurler_results\Persistence 2>&1
mkdir C:\WinCurler_results\PowerShell_History 2>&1

echo Gathering the information...

echo.

echo [%date% %time%] > C:\WinCurler_results\analysis_time.txt

ipconfig /all >> C:\WinCurler_results\Host_information\ipconfig.txt 2>&1

ipconfig /displaydns >> C:\WinCurler_results\Host_information\displaydns.txt 2>&1

systeminfo >> C:\WinCurler_results\Host_information\systeminfo.txt 2>&1

net share >> C:\WinCurler_results\Host_information\shared_folders.txt 2>&1

net session >> C:\WinCurler_results\Host_information\Active_SMB_Sessions.txt 2>&1

net use >> C:\WinCurler_results\Host_information\Mapped_drives.txt 2>&1

netsh wlan show profiles >> C:\WinCurler_results\Host_information\wifi_profiles.txt 2>&1

arp -a >> C:\WinCurler_results\Host_information\arp_table.txt 2>&1

netstat -na >> C:\WinCurler_results\Host_information\netstat_connections.txt 2>&1

tree C:\ /f /a >> C:\WinCurler_results\Host_information\tree_full.txt 2>&1

assoc >> C:\WinCurler_results\Host_information\file_associations.txt 2>&1

tasklist /svc /fi "imagename eq svchost.exe" >> C:\WinCurler_results\Running_Processes\svchost_services.txt 2>&1

tasklist /v >> C:\WinCurler_results\Running_Processes\running_processes_verbose.txt 2>&1

wmic product get name,version >> C:\WinCurler_results\Installed_Software\installed_programs.txt 2>&1

reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot" >> C:\WinCurler_results\Persistence\safeboot_alternate_shell.txt 2>&1

reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal" /s >> C:\WinCurler_results\Persistence\safeboot_minimal.txt 2>&1

reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /s >> C:\WinCurler_results\Persistence\safeboot_network.txt 2>&1


reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell >> C:\WinCurler_results\Persistence\winlogon_shell_userinit.txt 2>&1
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit >> C:\WinCurler_results\Persistence\winlogon_shell_userinit.txt 2>&1


reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" >> C:\WinCurler_results\Persistence\runonce_hkcu.txt 2>&1

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> C:\WinCurler_results\Persistence\runonce_hklm.txt 2>&1

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" >> C:\WinCurler_results\Persistence\run_hkcu.txt 2>&1

reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> C:\WinCurler_results\Persistence\run_hklm.txt 2>&1

dir /a "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" >> C:\WinCurler_results\Persistence\startup_user.txt 2>&1

dir /a "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" >> C:\WinCurler_results\Persistence\startup_programdata.txt 2>&1

schtasks /query /fo LIST /v >> C:\WinCurler_results\Persistence\scheduled_tasks.txt 2>&1

type "%AppData%\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" >> C:\WinCurler_results\PowerShell_History\powershell_history_win.txt 2>&1
type "%AppData%\Microsoft\PowerShell\PSReadLine\ConsoleHost_history.txt" >> C:\WinCurler_results\PowerShell_History\powershell_history_core.txt 2>&1

echo      [*] Extraction Completed
echo.
echo Results saved in: C:\WinCurler_results

pause >nul
