<#-----------------------------------------------------------------------------
  PowerShell Quickstart
  A quick look at the PowerShell platform

  Author: Robert C. Cain | @ArcaneCode | arcanecode@gmail.com
          http://arcanecode.com
          https://github.com/arcanecode/PSCore-QuickStart 
 
  This sample is Copyright (c) 2016, 2018 Robert C. Cain. All rights reserved.
  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted. 
  This module may not be reproduced in whole or in part without the express
  written consent of the author. 
-----------------------------------------------------------------------------#>

#-----------------------------------------------------------------------------#
# Something useful
#-----------------------------------------------------------------------------#

# See what is running that is taking up a lot of CPU
Get-Process | Where-Object CPU -gt 25 

# Test a web api
Invoke-RestMethod 'http://feed.nashownotes.com/rss.xml'

