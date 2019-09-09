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
# Functions
#-----------------------------------------------------------------------------#
function Get-AValue($one, $two)
{
  return $one * $two
}

# To pass parameters, simply list the values with no commas
Get-AValue 33 42

# You can place the return value in a variable
$returnValue = Get-AValue 33 42
"Returned value is $returnValue"

# Functions also support passing by name. Use the name of the variable
# with a dash in front
$returnValue = Get-AValue -one 11 -two 13
"Returned value is $returnValue"

# Using named parameters the order is not important
$returnValue = Get-AValue -two 13 -one 11 
"Returned value is $returnValue"

