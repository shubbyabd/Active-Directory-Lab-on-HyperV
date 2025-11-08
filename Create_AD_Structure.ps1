# PowerShell Script: Create Active Directory Structure (Shubby.local)

Import-Module ActiveDirectory

# Create Organizational Units
New-ADOrganizationalUnit -Name "Shubby" -Path "DC=Shubby,DC=local"
New-ADOrganizationalUnit -Name "IT" -Path "OU=Shubby,DC=Shubby,DC=local"
New-ADOrganizationalUnit -Name "Sales" -Path "OU=Shubby,DC=Shubby,DC=local"

# Create Groups
New-ADGroup -Name "IT_Admins" -GroupScope Global -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADGroup -Name "Sales_Staff" -GroupScope Global -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"

# Create Users
$Password = ConvertTo-SecureString "Pass@123" -AsPlainText -Force
New-ADUser -Name "Shubby" -AccountPassword $Password -Enabled $true -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Liz" -AccountPassword $Password -Enabled $true -Path "OU=IT,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Adam" -AccountPassword $Password -Enabled $true -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"
New-ADUser -Name "Eve" -AccountPassword $Password -Enabled $true -Path "OU=Sales,OU=Shubby,DC=Shubby,DC=local"

# Add Users to Groups
Add-ADGroupMember -Identity "IT_Admins" -Members "Shubby","Liz"
Add-ADGroupMember -Identity "Sales_Staff" -Members "Adam","Eve"

Write-Host "Active Directory OUs, users, and groups have been successfully created for Shubby.local"


// End of Script // 
