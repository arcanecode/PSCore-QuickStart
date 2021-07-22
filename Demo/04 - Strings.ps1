<#-----------------------------------------------------------------------------------------------
  PowerShell 7 Quick Start for Developers on Linux, macOS and Windows
  Strings

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
# Embedded Quote Marks
#------------------------------------------------------------------------------------------------
# You can embed quotation marks in a string by doubling them up

"ArcaneCode said ""PowerShell is awesome!"" and the crowd applauded."

'You shouldn''t miss the blog posts at arcanecode.com'

#------------------------------------------------------------------------------------------------
# String Interpolation
#------------------------------------------------------------------------------------------------
# Set your directory location to the Demo folder
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

#------------------------------------------------------------------------------------------------
# Bonus - Special String Formatting
#------------------------------------------------------------------------------------------------

# String Formatting - C# like syntax is supported
#   In C you'd use:
[string]::Format("There are {0} items.", $items)

# Powershell shortcut
"There are {0} items." -f $items

"There are {0} items in the location {1}." -f $items, $loc

"There are {0} items in the location {1}. Wow, {0} is a lot of items!" -f $items, $loc

# Predefined formats
# N - Number
"N0 {0:N0} formatted" -f 12345678.119    # N0 12,345,678 formatted
"N1 {0:N1} formatted" -f 12345678.119    # N1 12,345,678.1 formatted
"N2 {0:N2} formatted" -f 12345678.119    # N2 12,345,678.12 formatted
"N2 {0:N9} formatted" -f 12345678.119    # N2 12,345,678.12 formatted
"N0 {0:N0} formatted"   -f 123.119       # N0 123 formatted
"N0 {0,8:N0} formatted" -f 123.119       # N0      123 formatted

# C - Currency
"C0 {0:C0} formatted" -f 12345678.1234      # C0 $12,345,678 formatted
"C1 {0:C1} formatted" -f 12345678.1234      # C1 $12,345,678.1 formatted
"C2 {0:C2} formatted" -f 12345678.1234      # C2 $12,345,678.12 formatted
"C2 {0,20:C2} formatted" -f 12345678.1234   # C2       $12,345,678.12 formatted

# P - Percentage
"P0 {0:P0} formatted" -f 0.1234          # P0 12% formatted
"P2 {0:P2} formatted" -f 0.1234          # P2 12.34% formatted
"P2 {0,8:P2} formatted" -f 0.1234        # P2   12.34% formatted

# X - Hex
"X0 0x{0:X0} formatted" -f 1234          # X0 0x4D2 formatted
"X0 0x{0:X0} formatted" -f 0x4D2         # X0 0x4D2 formatted

# D - Decimal
"D0 {0:D0} formatted"   -f 123           # D0 123 formatted
"D8 {0:D8} formatted"   -f 123           # D8 00000123 formatted
"D0 {0,9:D0} formatted" -f 123           # D0       123 formatted
"D0 {0,9:D6} formatted" -f 123           # D0   0000123 formatted

# Note, decimal only supports ints. This causes an error:
"D0 {0:D0} formatted"   -f 123.1


# Custom formatting
$items = 1234
"There are {0:#,#0} items." -f $items    # There are 1,234 items.

"Custom 0, 25 $ #,##0.0000  = {0,25:$ #,##0.0000} " -f 123456789.012000005   # Custom 0, 25 $#,##0.0000  =        $ 123,456,789.0120
"Custom 0, 25 $ #,##0.0000  = {0,25:$ #,##0.00} "   -f 123456789.012000005   # Custom 0, 25 $#,##0.0000  =          $ 123,456,789.01
"Custom 0, 25 $ #,##0.0000  = {0,25:$ ##0.00} "   -f 123456789.012000005     # Custom 0, 25 $#,##0.0000  =          $ 123456789.01

"Custom 0, 10 #,##0%    = {0,10:#,##0%} "    -f 0.125                       # Custom 0, 10 #,##0%    =        13%
"Custom 0, 10 #,##0.00% = {0,10:#,##0.00%} " -f 0.125                       # Custom 0, 10 #,##0.00% =     12.50%

# Custom date formatting. Note MM is Month, mm is minute
"Today is {0:M/d/yyyy}. Be well."               -f $(Get-Date)              # Today is 3/13/2014. Be well.
"Today is {0,10:MM/dd/yyyy}. Be well."          -f $(Get-Date)              # Today is 03/13/2014. Be well.
"Today is {0,10:yyyyMMdd}. Be well."            -f $(Get-Date)              # Today is   20140313. Be well.
"Today is {0,10:MM/dd/yyyy hh:mm:ss}. Be well." -f $(Get-Date)              # Today is 03/13/2014 01:21:19. Be well.
"Today is {0,10:MM/dd/yyyy HH:mm:ss}. Be well." -f $(Get-Date)              # Today is 03/13/2014 13:21:19. Be well.

# Calculations can be passed in as the item to be formatted
"The 20% tip of a 33.33 dollar bill is {0} dollars" -f (33.33 * 0.20)       # The 20% tip of a 33.33 dollar bill is 6.666 dollars

"The 20% tip of a 33.33 dollar bill is {0:0.00} dollars" -f (33.33 * 0.20)  # The 20% tip of a 33.33 dollar bill is 6.67 dollars

# Custom formats to a variable

# Visits
$vTday = "{0,8:N0}" -f 134567
$vYest = "{0,8:N0}" -f 23546

$tday = "{0:MM/dd/yyyy}" -f $(Get-Date)
$yest = "{0:MM/dd/yyyy}" -f $((Get-Date).AddDays(-1))

$output = "Visitors to ArcaneCode.com`r`n"
$output += "$tday had $vTday visitors`r`n"
$output += "$yest had $vYest visitors"
$output

##
