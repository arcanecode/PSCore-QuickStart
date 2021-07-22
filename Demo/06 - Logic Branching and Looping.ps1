<#-----------------------------------------------------------------------------------------------
  PowerShell 7 Quick Start for Developers on Linux, macOS and Windows
  Logic Branching and Looping

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
# Code Formatting
#------------------------------------------------------------------------------------------------

# Note there are multiple ways to format your code. All of these are valid.
if ( 1 -eq 1 ) { exit }

if ( 1 -eq 1 )
  { exit }

if ( 1 -eq 1 )
{ exit }

if ( 1 -eq 1 ) {
  exit
}

if ( 1 -eq 1 )
{
  exit
}

# You can have multiple commands on the same line using a semicolon
$a = 'Hi'; $b = 'Mom'; "$a $b"

#------------------------------------------------------------------------------------------------
# Logic Branching
#------------------------------------------------------------------------------------------------

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

# if/elseif/else
$var = 2
if ($var -eq 1)  # Be sure to use -eq instead of =
{
  Clear-Host
  "If branch"
}
elseif ($var -eq 33)
{
  Clear-Host
  "elseif branch"
}
else
{
  Clear-Host
  "else branch"
}



#------------------------------------------------------------------------------------------------
# Switch statement for multiple conditions
#------------------------------------------------------------------------------------------------
Clear-Host
$var = 42                   # Also test with 43 and 49
switch  ($var)
{
  41 {"Forty One"}
  42 {"Forty Two"}
  43 {"Forty Three"}
  default {"default"}
}

# Beware multiple matches
Clear-Host
$var = 42                   # Also test with 43 and 49
switch  ($var)
{
  41   {"Forty One"}
  42   {"Forty Two"}
  '42' {"Forty Two"}
  43   {"Forty Three"}
  default {"default"}
}

# Avoid by using a break
Clear-Host
$var = 42                   # Also test with 43 and 49
switch  ($var)
{
  41   {"Forty One"; break}
  42   {"Forty Two"; break}
  '42' {"Forty Two"; break}
  43   {"Forty Three"; break}
  default {"default"; break}
}

"Exit to this point"

# Type coertion
$var = '42'
switch  ($var)
{
  41   {"Forty One"}
  42   {"Forty Two"}
  43   {"Forty Three"}
  default {"default"}
}

$var = '042'
switch  ($var)
{
  41   {"Forty One"}
  42   {"Forty Two"}
  43   {"Forty Three"}
  default {"default"}
}

#------------------------------------------------------------------------------------------------
# Looping
#------------------------------------------------------------------------------------------------

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
Clear-Host
$i = 33
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
# Note set your location to the demo folder with the .ps1 files
Clear-Host
foreach ($file in Get-ChildItem)
{
  $file.Name
}
