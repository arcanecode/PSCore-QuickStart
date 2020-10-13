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

<#
  Normally you can use F5 to run the entire script, or F8 to run one or
  more highlighted lines of code. This script is atypical in that it's just
  a bunch of examples we only want to run via F8. So we'll add the next line
  of code to stop running just in case someone accidentally hits F5.
#>
if ( 1 -eq 1 ) { exit }

#------------------------------------------------------------------------------------------------
# String Handling
#------------------------------------------------------------------------------------------------

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

#------------------------------------------------------------------------------------------------
# String Interpolation
#------------------------------------------------------------------------------------------------
# Set your directory location to the Demos folder
Clear-Host

# Take the output of Get-ChildItem, which is an object, and gets that objects count property
$items = (Get-ChildItem).Count

# Take the output of Get-Location and store it in a variable
$loc = Get-Location

# Use these variables in a string
"There are $items items are in the folder $loc."

# String interpolation only works with double quotes
'There are $items items are in the folder $loc.'

#------------------------------------------------------------------------------------------------
# Escape characters in Strings
#------------------------------------------------------------------------------------------------

# To use special characters, place a "backtick" character before it

# Tab
"`tThis is tabbed in"

# Escape characters only work in double quoted strings
'`tThis is not tabbed in'

# Carriage Return and Line Feed (aka New Line)
"Here is some text`r`nAnd some more text`r`n`r`nA blank line before this"

# Escaping a variable name
"The `$items variable is $items"

# Those are the most common, there are many other escape characters
