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
# Variables
#-----------------------------------------------------------------------------#
Clear-Host

# All variables start with a $. Show a simple assignment
$hi = "Hello World"

# Print the value
$hi

# This is a shortcut to Write-Host
Write-Host $hi

# Variables are objects. Show the type
$hi.GetType()

# Display all the members of this variable (object)
$hi | Get-Member

# Use some of those members
$hi.ToUpper()
$hi.ToLower()
$hi.Length

# Types are mutable
Clear-Host
$hi = 5
$hi.GetType()

$hi | Get-Member

# Variables can be strongly typed 
Clear-Host
[System.Int32]$myint = 42  
$myint
$myint.GetType()

$myint = "This won't work"

# There are shortcuts for most .net types
Clear-Host
[int] $myotherint = 42
$myotherint.GetType()

[string] $mystring="PowerShell"
$mystring.GetType()

# Others include short, float, decimal, single, bool, byte, etc

# Comparisons
$var = 33

$var -gt 30
$var -lt 30
$var -eq 33

# List is:
#   -eq        Equals
#   -ne        Not equal to
#   -lt        Less Than
#   -gt        Greater then
#   -le        Less than or equal to
#   -ge        Greater then or equal to

#   -in        See if value in an array
#   -notin     See if a value is missing from an array
#   -Like      Like wildcard pattern matching
#   -NotLike   Not Like 
#   -Match     Matches based on regular expressions
#   -NotMatch  Non-Matches based on regular expressions

# Calculations are like any other language
$var = 3 * 11  # Also uses +, -, and / 
$var

# Supports post unary operators ++ and --
$var++  
$var

# And pre unary operators as well
++$var 
$var

Clear-Host
$var = 33
$post = $var++
$post
$var

Clear-Host
$var = 33
$post = ++$var
$post
$var
