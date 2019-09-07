<#-----------------------------------------------------------------------------
  PowerShell Quickstart
  A quick look at the PowerShell platform

  Author: Robert C. Cain | @ArcaneCode | arcanecode@gmail.com
          http://arcanecode.com
          https://github.com/arcanecode/PSCore-QuckStart 
 
  This sample is Copyright (c) 2016, 2018 Robert C. Cain. All rights reserved.
  The code herein is for demonstration purposes. No warranty or guarentee
  is implied or expressly granted. 
  This module may not be reproduced in whole or in part without the express
  written consent of the author. 
-----------------------------------------------------------------------------#>

#-----------------------------------------------------------------------------#
# String Handling
#-----------------------------------------------------------------------------#

# String Quoting 
Clear-Host
"This is a string"
'This is a string too!'

# Here Strings - for large blocks of text ------------------------------
Clear-Host
$heretext = @"
Some text here
Some more here
     a bit more

a blank line above
"@
     
$heretext

# the @ and quote must be last on starting line then first on ending line
# also works with single quotes
$moreheretext = @'
Here we go again
another line here
   let's indent this
   
a blank line above
'@

# Without here strings
$sql = 'SELECT col1' `
     + '     , col2' `
     + '     , col3' `
     + '  FROM someTable ' `
     + ' WHERE col1 = ''a value'' '

# With here strings
$sql = @'
SELECT col1
     , col2
     , col3
  FROM someTable
 WHERE col1 = 'a value'
'@

# String Interpolation ---------------------------------------------------------------------------------------------------
# Set the directory for your computer / OS

# Directory on Windows boxes
$dir = 'C:\Users\arcan\OneDrive\PS\PSCore-QuickStart\PSCore-QuckStart\Demos'

# Directory on Linux
$dir = '/home/arcanecode/Documents/code/PSCore-QuickStart/PSCore-QuckStart/Demos/'

# Directory on macOS
$dir = ''

Set-Location $dir
Clear-Host

# Take the output of Get-ChildItem, which is an object, and gets that objects count property
$items = (Get-ChildItem).Count

# Take the output of Get-Location and store it in a variable
$loc = Get-Location

# Use these variables in a string
"There are $items items are in the folder $loc."

# String interpolation only works with double quotes
'There are $items items are in the folder $loc.'
