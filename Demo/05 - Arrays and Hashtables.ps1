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
# Arrays
#-----------------------------------------------------------------------------#

# Simple array
Clear-Host
$array = "Robert", "Cain"
$array
$array[0]
$array[1]

$array.GetType()
$array.Count

$array += "Arcane"
$array += "Code"
$array 
$array.Count

#-----------------------------------------------------------------------------#
# Hash tables 
#-----------------------------------------------------------------------------#

$hash = @{"Key"         = "Value"; 
          "PowerShell"  = "PowerShell.com"; 
          "Arcane Code" = "arcanecode.com"}
          
$hash                  # Display all values
$hash['PowerShell']    # Get a single value from the key

$hash.'Arcane Code'    # Get single value using object syntax

