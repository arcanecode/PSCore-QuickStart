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
# Arrays
#------------------------------------------------------------------------------------------------

# Simple array
Clear-Host
$array = 'Robert', 'Cain'
$array
$array[0]
$array[1]

$array.GetType()
$array.Count

$array += 'Arcane'
$array += 'Code'
$array
$array.Count

# Declare an empty array
$empty = @()
$empty    # Nothing in it

$empty += 'Arcane'
$empty += 'Code'
$empty

#------------------------------------------------------------------------------------------------
# Hash tables
#------------------------------------------------------------------------------------------------
Clear-Host

$hash = @{"Key"         = "Value";
          "PowerShell"  = "PowerShell.com";
          "Arcane Code" = "arcanecode.com"}

$hash                  # Display all values
$hash['PowerShell']    # Get a single value from the key

$hash.'Arcane Code'    # Get single value using object syntax

# Empty Hashtable
$empty = @{}
$empty

$empty['Pluralsight'] = 'pluralsight.com'
$empty['DataFabricator'] = 'datafabricator.com'
$empty
