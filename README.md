# ScanVul: User-Friendly Nmap Scanning Bash Script

ScanVul is a bash script that simplifies the process of scanning networks and hosts using the powerful `nmap` tool. It provides an interactive and user-friendly interface, allowing users to select from various scanning options to suit their needs.

## Features

- **Ping Scan**: Discover live hosts in a given IP range or network, identifying which systems are online and responsive.
- **Basic Scan**: Detect open ports and services on a target host or network, providing essential information about device accessibility.
- **Aggressive Scan**: Perform a thorough scan that includes OS detection, version detection, script scanning, and traceroute, offering a detailed profile of the target system and its vulnerabilities.
- **Custom Port Scan**: Target specific ports on a host or network for more focused assessments, helping users pinpoint open services and potential security risks.

## Requirements

- Bash shell
- Nmap tool

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/LynxAlcyoneus/ScanVul.git
2. Run it using bash command:
   ```bash
   bash ./ScanVul.sh
OR 
3. Give permission for execution:
  ```bash
   chmod +x ./ScanVul.sh
   ./ScanVul.sh

