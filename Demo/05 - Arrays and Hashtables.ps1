<#-----------------------------------------------------------------------------------------------
  PowerShell 7 Quick Start for Developers on Linux, macOS and Windows
  Arrays and Hash Tables

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

Clear-Host

# Simple array
# The formal array creation syntax is:
$array = @('Robert', 'Cain')

# However for a simple array you can omit the @()
$array = 'Robert', 'Cain'

# To show the contents simply call the variable
$array

# If you have a long list of items you can wrap by having a comma as the last thing on the line
$array = 'Robert',
         'Cain'
$array



# Using GetType will show this is a System.Array variable
$array.GetType()

# You can address individual elements using positional notation
$array[0]
$array[1]

# Of course you can use variables for the postion
$x = 1
$array[$x]

# You can see how many items are in the array
$array.Count

# You have to be careful though, as array counting is 0 based
# Thus you want the last time you have to use count - 1
$array[$array.Count - 1]

# There's actually a short cut, you can pass in -1 to get the last item
$array[-1]

# You can add items to an existing array using +=
$array += 'Arcane'
$array += 'Code'
$array
$array.Count

# To update an item, simply assign a new value to the place you want it
$array[0] = "Mr."
$array

# You can declare an empty array using @()
$empty = @()
$empty    # Nothing in it

# You can then add items to it
$empty += 'Arcane'
$empty += 'Code'
$empty

# Iterate over an array
foreach($item in $array)
{
  "The current item is $item"
}

# You can also pipeline arrays
$array | ForEach-Object { "Current Value: $PSItem"}

# Finally the array itself has a foreach method.
$array.ForEach({ "Current Value: $_"})

# Wipe out what's in the array
$array.Clear()
$array          # Nothing there

# Fun with positional notation

# Did you know you can pass in multiple numbers and get 
# back multiple elements from the array in one command?
$array = 'Zero', 'One', 'Two', 'Three',
         'Four', 'Five', 'Six', 'Seven'
$array[2, 4, 6]

# If you pass in the same number twice, you'll get that
# array item back twice in the results.
$array[2, 4, 2]

# Finally, you can use PowerShell's range operator to
# return a series of values.
$array[1..4]

# Arrays can have mixed items
$array = 'Arcane', 'Code', 33, 42,
         'Alabama', 3.14, 'In the Morning'

# You can see if an array contains an item using -in, which will return True or False
'Alabama' -in $array

# As an alternate syntax you can use -contains
$array -contains 'Alabama'

# Index tricks

# You can return multiple values
$array[2, 4, 6]

# If you repeat a value, you'll get it back twice
$array[2, 4, 2]

# You can get a range of values using the range operator
$array[1..4]

# Works backwards too
$array[4..1]

# Removing items in arrays
# There's no real way to remove an item in an array. You have to build a new array.
# An easy way is to use another operator, -ne or Not Equal
$newArray = $array | Where-Object { $PSItem -ne 'Alabama' }
$newArray

# There are a few other useful operators. First, you can use -join to take all elements of
# an array and make a single string. You pass in a parameter that indicates the value
# to insert between each value
$array = 1, 3, 5, 7, 9
$result = $array -join ' '
$result

# You can use any value for the join parameter
$result = $array -join '-'
$result

$result = $array -join ','
$result

$result = $array -join ''
$result

$result = $array -join ', '
$result

# Replace is another useful method
$servers = 'HOLD-001', 'HOLD-002', 'SQL-001', 'SQL-002'
$newServers = $servers -replace 'HOLD', 'TEST'
$newServers

# You can use Split to break the components into new individual array items
$servers = 'SRV-001', 'SRV-002', 'SQL-001', 'SQL-002'
$newServers = $servers -split '-'
$newServers

# You can use Match to filter the array for specific values
$servers = 'SRV-001', 'SRV-002', 'SQL-001', 'SQL-002'
$newServers = $servers -match 'SQL'
$newServers

# Arrays of Objects
# Whenver you return a collection from a cmdlet its in the form of an array
Set-Location "C:\Temp"
$files = Get-ChildItem
$newFiles = @()
foreach($file in $files)
{
  $newFiles += "The file $($file.Name) is $($file.Length) in size"
}
$newFiles

#------------------------------------------------------------------------------------------------
# Hash tables
#------------------------------------------------------------------------------------------------
Clear-Host

$hash = @{'Key'                 = 'Value'
          'PowerShell'          = 'PowerShell.com'
          'Arcane Code'         = 'arcanecode.com'
          'Pluralsight'         = 'pluralsight.com'
          'GitHub - ArcaneCode' = 'github.com/arcanecode'
         }
$hash                  # Display all values

$hash['PowerShell']    # Get a single value from the key

$hash.PowerShell       # Get single value using object syntax
$hash.'Arcane Code'

$hash.'Arcane Code' = 'arcanecode.me'

# Add a new key/value
$hash.Ubuntu = 'Ubuntu.com'
$hash

# Get all the keys and values
$hash.Keys
$hash.Values

# The Count property tells you how manu items are in the hash table
$hash.Count

# Checking to see if the hash table contains a key or value
$hash.ContainsKey('Arcane Code')

$hash.ContainsValue('arcanecode.me')

# Removing a value from the hash table
$hash.Remove('Ubuntu')
$hash

# Clearing a hash table
$hash.Clear()
$hash

# Empty Hashtable
$empty = @{}
$empty

$empty['Pluralsight'] = 'pluralsight.com'
$empty['DataFabricator'] = 'datafabricator.com'
$empty


# Let's reset the hash table
$hash = @{'Key'                 = 'Value'
          'PowerShell'          = 'PowerShell.com'
          'Arcane Code'         = 'arcanecode.com'
          'Pluralsight'         = 'pluralsight.com'
          'GitHub - ArcaneCode' = 'github.com/arcanecode'
         }
$hash

# Note the hash table does not display in the same order it was created
# You can force it by adding an [ordered] when creating it
$hash = [ordered]@{
  'Key'                 = 'Value'
  'PowerShell'          = 'PowerShell.com'
  'Arcane Code'         = 'arcanecode.com'
  'Pluralsight'         = 'pluralsight.com'
  'GitHub - ArcaneCode' = 'github.com/arcanecode'
}
$hash


# Option 1 - GetEnumerator()
foreach($item in $hash.GetEnumerator())
{
  "$($item.Name) has a value of $($item.Value)"
}

# Option 2 - Iterate over Keys
foreach($key in $hash.Keys)
{
  "$key value is $($hash.Item($key))"
}

# Splattng
# Hash tables can also be used for "splatting". It allows you
# to pass in multple paramters at once
Get-ChildItem -Directory D:\ |
  Join-String -Property Name -Separator ', '


$splat = @{Property = 'Name'
           Separator = ', '
          }

Get-ChildItem -Directory D:\ | Join-String @splat

$splat.Separator = ' - '
Get-ChildItem -Directory D:\ | Join-String @splat

$splat = @{Property = 'Name'
           Separator = ', '
          }

Get-ChildItem -Directory D:\ | Join-String @splat -SingleQuote


$splat = @{Property = 'Name'
           Separator = ', '
           SingleQuote = $True
          }
Get-ChildItem -Directory D:\ | Join-String @splat
