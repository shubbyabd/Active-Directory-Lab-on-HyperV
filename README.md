# 🖥️ Practicing Active Directory on Hyper-V

![Platform](https://img.shields.io/badge/Platform-Windows_11-blue)
![Virtualization](https://img.shields.io/badge/Virtualization-Hyper--V-green)
![ActiveDirectory](https://img.shields.io/badge/Service-Active_Directory-orange)

This project documents the setup and configuration of a virtual lab environment for **Active Directory (AD)** practice using **Microsoft Hyper-V** on **Windows 11**.  
The lab simulates a small Windows network consisting of a domain controller, a file server, and client machines.

---

## 🧩 Lab Overview

![Active Directory Lab Diagram](AD_Lab_Diagram.png)

| Role | Hostname | OS | IP Address | Memory | Storage |
|------|-----------|----|-------------|---------|----------|
| Domain Controller | `DC01` | Windows Server (2022/2019) | 192.168.1.1 | 2048 MB | 40 GB |
| File Server | `FS01` | Windows Server (2022/2019) | 192.168.1.2 | 2048 MB | 40 GB |
| Client 1 | `CL1` | Windows 10/11 | 192.168.1.10 | 2048 MB | 40 GB |
| Client 2 | `CL2` | Windows 10/11 | 192.168.1.11 | 2048 MB | 40 GB |

---

## 🧠 Summary of Lab Tasks
1. Enable and configure **Hyper-V**
2. Create a **Private Switch**
3. Create four **Virtual Machines**
4. Assign static IP addresses
5. Rename VMs and disable firewalls
6. Test connectivity
7. Deploy and promote **Active Directory Domain Services (AD DS)**
8. Create OUs, Users, and Security Groups
9. Join all systems to the domain
10. Configure and share folders with permissions on the file server

---

## ⚡ PowerShell Automation (Create OUs, Users & Groups)

This script helps automate OU, user, and group creation within the **Shubby.local** domain.

```powershell
# Create Organizational Units
New-ADOrganizationalUnit -Name "Shubby" -Path "DC=Shubby,DC=local"
New-ADOrganizationalUnit -Name "IT" -Path "OU=Shubby,DC=Shubby,DC=local"
New-ADOrganizationalUnit -Name "Sales" -Path "OU=Shubby,DC=Shubby,DC=local"

# Create Groups
New-ADGroup -Name "IT_Admins" -GroupScope Global -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADGroup -Name "Sales_Staff" -GroupScope Global -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"

# Create Users
New-ADUser -Name "Shubby" -AccountPassword (ConvertTo-SecureString "Pass@123" -AsPlainText -Force) -Enabled $true -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Liz" -AccountPassword (ConvertTo-SecureString "Pass@123" -AsPlainText -Force) -Enabled $true -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Adam" -AccountPassword (ConvertTo-SecureString "Pass@123" -AsPlainText -Force) -Enabled $true -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Eve" -AccountPassword (ConvertTo-SecureString "Pass@123" -AsPlainText -Force) -Enabled $true -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"

# Add Users to Groups
Add-ADGroupMember -Identity "IT_Admins" -Members "Shubby","Liz"
Add-ADGroupMember -Identity "Sales_Staff" -Members "Adam","Eve"
```

Save this as `Scripts/Create_AD_Structure.ps1` and run it on your domain controller (DC01) using **PowerShell (Run as Administrator)**.

---

## 🧠 Summary
This Hyper-V lab demonstrates:
- Installing and configuring a complete Windows AD environment  
- Promoting a Domain Controller  
- Managing users, groups, and OUs  
- Joining servers and clients to a single domain  
- Configuring and securing shared folders based on group permissions  

---

**Author:** Shubby Abd  
**Platform:** Windows 11 + Hyper-V  
**Focus:** Active Directory Domain Services & File Server Practice Lab  
