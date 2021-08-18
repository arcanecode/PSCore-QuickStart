<#-----------------------------------------------------------------------------------------------
  PowerShell 7 Quick Start for Developers on Linux, macOS and Windows
  Functions

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

# You can embed the call in a string
"Returned value is $(Get-AValue 33 42)"

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

# The return keyword is not required
function Get-AValue($one, $two)
{
  $one * $two
}

$returnValue = Get-AValue 33 42
"Returned value is $returnValue"

# Whatever the isn't consumed (i.e. assigned to a variable) is returned
# This can get confusing and could have odd side effects
function Get-AValue($one, $two)
{
  $one * $two
  "Hello from Get-AValue"
}

$returnValue = Get-AValue 33 42
"Returned value is $returnValue"

# Return does two things for you.
# 1. It speaks of clear intent. I didn't forget to finish some code, I've set an exit point.
# 2. I have full control over when / where code exits.

# For example, you could do this
function Get-AValue($one, $two)
{
  if ($one -eq 33)
    { return $one + $two }
  else
    { return $one + $two }

  "Hello from Get-AValue"
}

$returnValue = Get-AValue 33 42
"Returned value is $returnValue"

# Although best coding practices says you should have one exit point, so instead craft
# your function like:
function Get-AValue($one, $two)
{
  if ($one -eq 33)
    { $retVal = $one + $two }
  else
    { $retVal = $one + $two }

  return $retVal
}

$returnValue = Get-AValue 33 42
"Returned value is $returnValue"

# You can have multiple functions in the same file, and one function can call another
function Format-FileOutput($files)
{
  # Find the max length of a file name
  $maxLength = Get-MaxFileNameLength $files

  Write-Host "`r`nHere is the file output`r`n"
  $padding = (' ' * ($maxLength + 1))
  Write-Host "File Name $($padding) Size"
  Write-Host ('-' * ($maxLength + 16))

  foreach($file in $files)
  {
    Format-FileLine $file $maxLength
  }
}

function Get-MaxFileNameLength($files)
{
  $maxLength = 0

  foreach($file in $files)
  {
    if ($file.Name.Length -gt $maxLength)
      { $maxLength = $file.Name.Length }
  }

  return $maxLength
}

function Format-FileLine($file, $maxFileNameLength)
{
  # +1 will ensure there is always at least one space between
  # the file name and the size
  $spaces = ' ' * ($maxFileNameLength - $file.Name.Length + 1)
  $retVal = "$($file.Name)$($spaces){0,15:N0}" -f $file.Length

  return $retVal
}

$myfiles = Get-ChildItem
Format-FileOutput $myfiles



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

  return $one * $two

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

  process
  {
    if ($file.Name -like "*.ps1")
    {
      $retval = "  PowerShell file is $($file.Name)"
      # This is the equivalent of: return $retval
      $retval
    }
  }

  end { }
}

$output = Get-ChildItem | Get-PSFiles
$output

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

  begin
  {
    Write-Host 'Here are the names!' `
      -ForegroundColor Green
    $names = @()
  }

  process
  {
    $names += $name
    "  Here is the name: $name"
  }

  end
  {
    Write-Host "Those were the names you passed in:" `
      -ForegroundColor Green
    foreach ($n in $names)
    {
       Write-Host "  You passed in " `
         -ForegroundColor White -NoNewline
      Write-Host $n -ForegroundColor Yellow
    }
  }
}

Get-ChildItem |
  Show-BName |
  Sort-Object -Descending


Get-Process | Show-BName

#------------------------------------------------------------------------------------------------
# Switches
#------------------------------------------------------------------------------------------------
Write-Host 'Hi Mom' -ForegroundColor Green -NoNewline
Write-Host ' and Dad' -ForegroundColor Yellow

function Get-RandomSouthAmericanCountry()
{
  [CmdletBinding()]
  param(
         [switch] $UpperCase
       )

  $array = (
    'Argentina', 'Bolivia', 'Brazil',
    'Chile', 'Columbia', 'Ecuador',
    'Guyana', 'Paraguay', 'Peru',
    'Suriname', 'Uruguay', 'Venezuela'
  )

  # Get an item from the array and convert from
  # a generic object to a string
  $retVal = $($array | Get-Random).ToString()

  # If user passed in upper case switch,
  # upper case return value
  if ($UpperCase.IsPresent)
  {
    $retVal = $retVal.ToUpper()
  }

  return $retVal

}

Get-RandomSouthAmericanCountry
Get-RandomSouthAmericanCountry -UpperCase

function Get-RandomSouthAmericanCountryBasic([switch] $UpperCase)
{
  $array = (
    'Argentina', 'Bolivia', 'Brazil',
    'Chile', 'Columbia', 'Ecuador',
    'Guyana', 'Paraguay', 'Peru',
    'Suriname', 'Uruguay', 'Venezuela'
  )

  # Get an item from the array and convert from
  # a generic object to a string
  $retVal = $($array | Get-Random).ToString()

  # If user passed in upper case switch,
  # upper case return value
  if ($UpperCase.IsPresent)
  {
    $retVal = $retVal.ToUpper()
  }

  return $retVal

}

Get-RandomSouthAmericanCountryBasic
Get-RandomSouthAmericanCountryBasic -UpperCase

#------------------------------------------------------------------------------------------------
# Write-Verbose
#------------------------------------------------------------------------------------------------

function Show-FileInfo ()
{
  [CmdletBinding()]
  param ( [Parameter (ValueFromPipeline)]
          $file
        )

  begin
  {
    $fn = "$($PSCmdlet.MyInvocation.MyCommand.Name)"
    $st = Get-Date
    Write-Verbose @"
  `r`n  Function: $fn
  Starting at $($st.ToString('yyyy-MM-dd hh:mm:ss tt'))
"@
  }

  process
  {
    $retVal = "$($file.Name) is {0:N0} bytes long." -f $file.Length
    $retVal
  }

  end
  {
    $et = Get-Date

    $rt = $et - $st  # Run Time

    # Format the output time
    if ($rt.TotalSeconds -lt 1)
      { $elapsed = "$($rt.TotalMilliseconds.ToString('#,0.0000')) Milliseconds" }
    elseif ($rt.TotalSeconds -gt 60)
      { $elapsed = "$($rt.TotalMinutes.ToString('#,0.0000')) Minutes" }
    else
      { $elapsed = "$($rt.TotalSeconds.ToString('#,0.0000')) Seconds" }


    Write-Verbose @"
  `r`n  Function: $fn
  Finished at $($et.ToString('yyyy-MM-dd hh:mm:ss tt'))
  Elapsed Time $elapsed
"@
  }
}

Get-ChildItem | Show-FileInfo -Verbose

#     $fn = "$($PSCmdlet.MyInvocation.MyCommand.Module) - $($PSCmdlet.MyInvocation.MyCommand.Name)"

#------------------------------------------------------------------------------------------------
# Write-Debug
#------------------------------------------------------------------------------------------------

function Show-FileInfo ()
{
  [CmdletBinding()]
  param ( [Parameter (ValueFromPipeline)]
          $file
        )

  begin
  {
    $currentDebugPreference = $DebugPreference
    $fn = "$($PSCmdlet.MyInvocation.MyCommand.Name)"
    $st = Get-Date
    Write-Verbose @"
  `r`n  Function: $fn
  Starting at $($st.ToString('yyyy-MM-dd hh:mm:ss tt'))
"@
  }

  process
  {
    if ($file.Length -gt 100000)
      { $DebugPreference = 'Inquire' }
    else 
      { $DebugPreference = 'SilentlyContinue' }

    $dbgMsg = @"
`r`n  Function.......: $fn
  File Name......: $($file.FullName)
  File Length....: $("{0:N0} bytes." -f $file.Length)
  DebugPreference: $DebugPreference
  PS Version.....: $($PSVersionTable.PSVersion.ToString())
"@

    Write-Debug -Message $dbgMsg

    $retVal = "$($file.Name) is {0:N0} bytes long." -f $file.Length
    $retVal
  }

  end
  {
    $DebugPreference = $currentDebugPreference
    $et = Get-Date
    $rt = $et - $st  # Run Time

    # Format the output time
    if ($rt.TotalSeconds -lt 1)
      { $elapsed = "$($rt.TotalMilliseconds.ToString('#,0.0000')) Milliseconds" }
    elseif ($rt.TotalSeconds -gt 60)
      { $elapsed = "$($rt.TotalMinutes.ToString('#,0.0000')) Minutes" }
    else
      { $elapsed = "$($rt.TotalSeconds.ToString('#,0.0000')) Seconds" }

    Write-Verbose @"
  `r`n  Function: $fn
  Finished at $($et.ToString('yyyy-MM-dd hh:mm:ss tt'))
  Elapsed Time $elapsed
"@
  }
}

$DebugPreference = 'Continue'
Get-ChildItem -Path 'C:\Demo' | Show-FileInfo -Verbose -Debug
$DebugPreference

Get-ChildItem -Path 'C:\Demo' | Show-FileInfo
Get-ChildItem -Path 'C:\Demo' | Show-FileInfo -Debug
Get-ChildItem -Path 'C:\Demo' | Show-FileInfo -Verbose
Get-ChildItem -Path 'C:\Demo' | Show-FileInfo -Verbose -Debug
