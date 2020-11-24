<#-----------------------------------------------------------------------------------------------
  PowerShell 7 Quick Start for Developers on Linux, macOS and Windows
  A Few Demos for Developers

  Author: Robert C. Cain | @ArcaneCode | arcanecode@gmail.com
          http://arcanecode.me
          https://github.com/arcanecode/PSCore-QuickStart

  This sample is Copyright (c) 2016, 2018, 2019, 2020 Robert C. Cain.
  All rights reserved.

  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted.

  This module may not be reproduced in whole or in part without the express
  written consent of the author.
-----------------------------------------------------------------------------------------------#>

<#
  Normally you can use F5 to run the entire script, or F8 to run one or
  more highlighted lines of code. This script is atypical in that it's just
  a bunch of examples we only want to run via F8. So we'll add the next line
  of code to stop running just in case someone accidentally hits F5.
#>
if ( 1 -eq 1 ) { exit }

#------------------------------------------------------------------------------------------------
# Something useful
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
# Test a web api
#------------------------------------------------------------------------------------------------
Invoke-RestMethod 'http://feed.nashownotes.com/rss.xml'

$shows = Invoke-RestMethod 'http://feed.nashownotes.com/rss.xml'
$shows

$shows | Get-Member

$shows | Select-Object -Property title, pubDate, author

#------------------------------------------------------------------------------------------------
# Work with files
#------------------------------------------------------------------------------------------------

# Import a CSV (make sure you are in the Demo folder)
$co = Import-Csv 'Company.csv'
$co

# Display it as a table
$co | Format-Table

# Convert the CSV to JSON
$co | ConvertTo-Json | Out-File 'Company.json' -Force

# One Liner
Import-Csv 'Company.csv' | ConvertTo-Json #| Out-File 'Company.json' -Force

#------------------------------------------------------------------------------------------------
# Create new objects from existing ones
#------------------------------------------------------------------------------------------------

# Get the original list of properties
$co | Get-Member

# Limit the number of fields then sort them
$coShort = $co | Select-Object -Property State, Name | Sort-Object -Property State, Name
$coShort

# Can also do this with variables created from cmdlets
$files = Get-ChildItem

# See all the possible properties and methods
$files | Get-Member

# Select a few of the properties for our new object
$newFiles = $files | Select-Object -Property Name, Length | Sort-Object -Property Length, Name
$newFiles

# See the smaller list of properties
$newFiles | Get-Member
