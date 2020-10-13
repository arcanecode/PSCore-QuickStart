<#-----------------------------------------------------------------------------------------------
  PowerShell Quickstart
  A quick look at the PowerShell platform

  Author: Robert C. Cain | @ArcaneCode | arcanecode@gmail.com
          http://arcanecode.me
          https://github.com/arcanecode/PSCore-QuckStart

  This sample is Copyright (c) 2016, 2018, 2019, 2020 Robert C. Cain.
  All rights reserved.

  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted.

  This module may not be reproduced in whole or in part without the express
  written consent of the author.
-----------------------------------------------------------------------------------------------#>

# Comments begin with a # (aka hashtag or pound sign)

<#
  Comment blocks use angle brackets with comment sign
  They can be multiline
#>

#region
  # Put your code here
#endregion

#region The Region Title is Optional

# some code here

#endregion The Region Title is Optional

<#
  Normally you can use F5 to run the entire script, or F8 to run one or
  more highlighted lines of code. This script is atypical in that it's just
  a bunch of examples we only want to run via F8. So we'll add the next line
  of code to stop running just in case someone accidentally hits F5.
#>
if ( 1 -eq 1 ) { exit }

#------------------------------------------------------------------------------------------------
# Cmdlets
#------------------------------------------------------------------------------------------------

# Verb-Noun syntax
Get-Command

Get-Help Get-Command

Get-Help Get-Command -Full

# Some popular cmdlets
Get-Process
Get-ChildItem

#------------------------------------------------------------------------------------------------
# Alias
#------------------------------------------------------------------------------------------------
#region Aliasing

# Notice how older DOS/Linux commands work in PowerShell
dir
cls

# On Windows, ls aliases, on Linux/macOS it uses the real ls command
ls

# But how? With command aliasingß
# The aliases dir and ls both point to the cmdlet Get-Childitem
Get-Alias dir

# Note ls is not aliased on Linux systems
Get-Alias ls

# We can see all of the aliases for a cmdlet
Get-Alias -Definition Get-ChildItem

# There are lots of aliases
Get-Alias

# Note: Aliases are fine for command line use or quick prototypes
# For clarity however it is a best practice to use the full cmdlet
# name in all scripts you write.

#endregion Aliasing

#------------------------------------------------------------------------------------------------
# Cmdlet Pipelining
#------------------------------------------------------------------------------------------------
Set-Location "$pwd/Demo"
Get-ChildItem | Where-Object { $_.Length -gt 1kb }

Get-ChildItem | Where-Object { $_.Length -gt 1kb } | Sort-Object Length

Get-ChildItem |
  Where-Object { $_.Length -gt 1kb } |
  Sort-Object Length
