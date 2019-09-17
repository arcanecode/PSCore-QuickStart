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
# Logic Branching
#-----------------------------------------------------------------------------#
# if/else
$var = 2
if ($var -eq 1)  # Be sure to use -eq instead of =
{
  Clear-Host
  "If branch"
}
else
{
  Clear-Host
  "else branch"
}

# Switch statement for multiple conditions
Clear-Host
$var = 42                   # Also test with 43 and 49
switch  ($var)
{
  41 {"Forty One"}
  42 {"Forty Two"}
  43 {"Forty Three"}
  default {"default"}
}

#-----------------------------------------------------------------------------#
# Looping
#-----------------------------------------------------------------------------#
# While
Clear-Host
$i = 1
while ($i -le 5)
{
  "`$i = $i"
  $i = $i + 1
}

# Also supported:
# do while
# Do
Clear-Host
$i = 1
do
{
  "`$i = $i"
  $i++
} while($i -le 5)

# do until
Clear-Host
$i = 1
do
{
  "`$i = $i"
  $i++
} until($i -gt 5)

# for
Clear-Host
for ($f = 0; $f -le 5; $f++)
{
  "`$f = $f"
}

# foreach
Clear-Host
$array = 11,12,13,14,15   # Simple Array
foreach ($item in $array)
{
  "`$item = $item"
}

# foreach works with an array of objects
# Set the directory for your computer / OS
# Directory on Windows boxes
$dir = 'C:\Users\arcan\OneDrive\PS\PSCore-QuickStart\PSCore-QuckStart\Demos'

# Directory on Linux
$dir = '/home/arcanecode/Documents/code/PSCore-QuickStart/PSCore-QuckStart/Demos/'

# Directory on macOS
$dir = ''

Clear-Host
Set-Location $dir
foreach ($file in Get-ChildItem)
{
  $file.Name
}
