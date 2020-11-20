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
# Basic Functions
#------------------------------------------------------------------------------------------------
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

#------------------------------------------------------------------------------------------------
# Advanced Functions
#------------------------------------------------------------------------------------------------

# Demonstrate parameters ------------------------------------------------------------------------
function Get-BValue()
{
  [CmdletBinding()]
  param (
          [Parameter( Mandatory = $true
                    , HelpMessage = 'Please enter value one.'
                   )
          ]
          [int] $one
        , [Parameter( Mandatory = $false
                    , HelpMessage = 'Please enter value two.'
                   )
          ]
          [int] $two = 42
        )

  begin { }

  process {
            return $one * $two
          }

  end { }

}

# Example 1 pass in values
Get-BValue -one 33 -two 42

# Example 2 pass in value for one, take default for two
Get-BValue -one 33

# Example 3 no params, will prompt for one and take default for two
Get-BValue

# Example 4, use a string for one (generates error)
Get-BValue -one "x"

# Doing something useful with pipeline enablement -----------------------------------------------
function Get-PSFiles ()
{
  [CmdletBinding()]
  param ( [Parameter (ValueFromPipeline)]
          $file
        )

  begin  { }

  process {
            if ($file.Name -like "*.ps1")
            {
              $retval = "`tPowerShell file is $($file.Name)"
              $retval  # This is the equivalent of: return $retval
            }
          }

  end { }
}

$output = Get-ChildItem | Get-PSFiles
$output.GetType()

# Passing in just a single property from the pipeline -------------------------------------------
function Get-AName ()
{
  [CmdletBinding()]
  param ( [Parameter (ValueFromPipelineByPropertyName)]
          $Name
        )

  begin  { }

  process {
            $retval = "`tYou passed in $Name"
            return $retval
          }

  end { }
}

Get-ChildItem | Get-AName
Get-Process | Get-AName

# Using the pipeline to format text, demo the begin and end -------------------------------------
function Show-BName ()
{
  [CmdletBinding()]
  param ( [Parameter (ValueFromPipelineByPropertyName)]
          $Name
        )

  begin  { Write-Host 'Here are the names!' -ForegroundColor Green }

  process {
            Write-Host "`tYou passed in " -ForegroundColor White -NoNewline
            Write-Host $Name -ForegroundColor Yellow
          }

  end { Write-Host 'Those were the names you passed in' -ForegroundColor Green }
}

Get-ChildItem | Show-BName
Get-Process | Show-BName
