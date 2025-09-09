# 📦 WinCurler

**Windows forensic collection script** — gathers key triage artifacts for rapid incident response.  
Automates the extraction of host data, running processes, persistence mechanisms, and PowerShell history.

## 🔍 Features
- 📁 Collects basic host information (IP config, systeminfo, etc.)
- 🧠 Extracts running processes
- 🛠️ Identifies persistence (Run keys, Startup folders, SafeBoot configs)
- 📜 Captures PowerShell history
- 📅 Dumps scheduled tasks
- 🗃️ Structures results into categorized folders for easy review

## 🚀 Use Case
Ideal for:
- SOC triage & investigation
- Malware infection response
- Forensics collection before disk imaging
- Quick scans on suspected endpoints

## 🧰 Output Structure

WinCurler_results/ ├── Host_information/ ├── Running_Processes/ ├── Installed_Software/ ├── Persistence/ ├── PowerShell_History/ └── analysis_time.txt

## 💡 Author
[Nir Arazi](https://github.com/Nir-Arazi) — Tier-1 SOC Analyst | Malware Analyst | Blue Teamer

## 🛡️ Disclaimer
This tool is provided for **educational and forensic use**. Use it responsibly.


