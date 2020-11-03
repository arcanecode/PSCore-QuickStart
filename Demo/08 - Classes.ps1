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

#region Enum

#------------------------------------------------------------------------------------------------
# Show Enums in PS
#------------------------------------------------------------------------------------------------

# Define the valid values for the enum
Enum MyTwitters
{
  ArcaneCode
  ArcaneTC
  N4IXT
}

# Get a list of the names
[MyTwitters].GetEnumNames()

# Note when typing the last : will trigger intellisense!
$tweet = [MyTwitters]::ArcaneCode
$tweet

# See if they picked something valid
[enum]::IsDefined(([MyTwitters]), $tweet)

# Set it to something invalid and see if it passes as an enum
$tweet = 'Invalid'
[enum]::IsDefined(([MyTwitters]), $tweet)

# It's also possible to assign values
Enum MyColors
{
  Red = 1
  Blue = 2
  Green = 3
}

# As before you can list the names
[MyColors].GetEnumNames()

# Now if you use the get values, it looks like it returns the labels too...
[MyColors].GetEnumValues()

# But when you assign a value to a label, it's the value returned, i.e.:
[MyColors]::Green -eq 3      # should be true

# You can assign the same value to several enums if you need to
Enum Folks
{
  Adam = 1
  John = 1
  Robert = 2
  Alma = 2
  Raven = 3
  Anna = 3
  Jack = 3
}

# All True
[Folks]::Adam -eq 1
[Folks]::John -eq 1
[Folks]::Adam -eq [Folks]::John

#endregion Enum

#region Basic Class

#------------------------------------------------------------------------------------------------
# Basic Class
#------------------------------------------------------------------------------------------------
  
Class Twitterer
{
  # Create a property
  [string]$TwitterHandle
  
  # Create a property and set a default value
  [string]$Name = 'Robert C. Cain'

  # Function that returns a string
  [string] TwitterURL()
  {
    $url = "https://twitter.com/$($this.TwitterHandle)"
    return $url
  }

  # Function that has no return value
  [void] OpenTwitter()
  {
    Start-Process $this.TwitterURL()
  }

}

$twit = [Twitterer]::new()
$twit.TwitterHandle = 'ArcaneCode'
$twit.TwitterHandle
  
# See default property value
$twit.Name

# Override default value
$twit.Name = 'Mr. Code'
$twit.Name

$myTwitter = $twit.TwitterURL()
$myTwitter

$twit.OpenTwitter()

#endregion Basic Class


#region Advanced Class

#------------------------------------------------------------------------------------------------
# Advanced Class
#   Constructors
#   Overloaded Methods
#------------------------------------------------------------------------------------------------

Class TwittererRedux
{
  # Default Constructor
  TwittererRedux ()
  {
  }

  # Constructor passing in Twitter Handle
  TwittererRedux ([string]$TwitterHandle)
  {
    $this.TwitterHandle = $TwitterHandle
  }

  # Constructor passing in Twitter Handle and Name
  TwittererRedux ([string]$TwitterHandle, [string]$Name)
  {
    $this.TwitterHandle = $TwitterHandle
    $this.Name = $Name
  }

  # Create a property
  [string]$TwitterHandle
  
  # Create a property and set a default value
  [string]$Name = 'Robert C. Cain'

  # Static Properties
  static [string] $Version = '2020.10.31.001'

  # Function that returns a string
  [string] TwitterURL()
  {
    # Call the function to build the twitterurl
    # passing in the property we want
    $url = $this.TwitterURL($this.TwitterHandle)

    return $url
  }

  # Overloaded Function that returns a string
  [string] TwitterURL($twitterHandle)
  {
    $url = "http://twitter.com/$($twitterHandle)"
    return $url
  }

  # Function that has no return value
  [void] OpenTwitter()
  {
    Start-Process $this.TwitterURL()
  }

  # Can launch a twitter page without instantiating the class
  static [void] OpenTwitterPage([string] $TwitterHandle)
  {
    # Note here we cannot call the $this.TwitterUrl function
    # because no object exists (hence no $this)
    $url = "http://twitter.com/$($TwitterHandle)"
    Start-Process $url
  }

}

# Create a class using default constructor
$twitDefault = [TwittererRedux]::new()

# Display without assigning
"TwitterHandle = $($twitDefault.TwitterHandle)"

# Now assign and display again
$twitDefault.TwitterHandle = 'ArcaneMining'
"TwitterHandle = $($twitDefault.TwitterHandle)"

# Show version one of TwitterURL
"URL = $($twitDefault.TwitterURL())"

# Show overloaded version
"URL = $($twitDefault.TwitterURL('ArcaneCode'))"

# Create a new instance using the second constructor
$twitAdvanced = [TwittererRedux]::new('N4IXT')

# Display without assigning - Should have what was passed in constructor
"TwitterHandle = $($twitAdvanced.TwitterHandle)"

# Create yet another instance using the third constructor
$twitAdvanced2 = [TwittererRedux]::new('ArcaneMining', 'R Cain')
$twitAdvanced2.TwitterHandle
$twitAdvanced2.Name

# Static Value - Can be called without initializing the class
[TwittererRedux]::Version

# Use the static method
[TwittererRedux]::OpenTwitterPage('N4IXT')

#endregion Advanced Class
