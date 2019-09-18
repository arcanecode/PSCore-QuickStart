<#-----------------------------------------------------------------------------
  PowerShell Quickstart
  A quick look at the PowerShell platform

  Author: Robert C. Cain | @ArcaneCode | arcanecode@gmail.com
          http://arcanecode.me
          https://github.com/arcanecode/PSCore-QuckStart 
 
  This sample is Copyright (c) 2016, 2018 Robert C. Cain. All rights reserved.
  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted. 
  This module may not be reproduced in whole or in part without the express
  written consent of the author. 
-----------------------------------------------------------------------------#>

#-----------------------------------------------------------------------------#
# Providers
#-----------------------------------------------------------------------------#

#List default Providers
Clear-Host
Get-PSProvider

# Now show how these providers equate to "drives" we can navigate
Clear-Host
Get-PSDrive

# Move to the ENV (environmental variables) drive
Clear-Host
Set-Location env:
Get-ChildItem

# Set the location back to the drive from the env provider

# Directory on Windows boxes
$dir = 'C:\Users\arcan\OneDrive\PS\PSCore-QuickStart\PSCore-QuckStart\Demos'

# Directory on Linux
$dir = '/home/arcanecode/Documents/code/PSCore-QuickStart/PSCore-QuckStart/Demo/'

# Directory on macOS
$dir = '~/Documents/code/PSCore-QuickStart/PSCore-QuickStart/Demos'

Set-Location $dir
