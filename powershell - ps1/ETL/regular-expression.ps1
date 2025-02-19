
"""
####################################################################################################
##Regular Expression##

#Regular Expression is a sequence of characters that forms a search pattern.
#When you search for data in a text, you can use this search pattern to describe what you are searching for.

#Example:
#1. ^[A-Za-z] | \d{2} - This regular expression will match the first character of the string to be an alphabet and the next two characters to be a digit.
#2. (\d)(\d{2})(\d{2})(\d{2}) - This regular expression will match the first digit and then the next two digits, then the next two digits and then the next two digits.

#Syntax:
#1. -match - This operator is used to match the regular expression.
#2. -replace - This operator is used to replace the regular expression.

#Note: Regular Expression is case-sensitive.

###################################################################################################
"""
$regexp1 = "Hello World 09/27/2024" -match "^[A-Za-z] | \d{2}"
$regexp2 = get-date('1240601' -replace "(\d)(\d{2})(\d{2})(\d{2})", '$3/$4/$2')
write-host $regexp1, $regexp2