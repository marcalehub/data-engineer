"""
####################################################################################################
##Algorithm Search##
###################################################################################################
"""

from datetime import datetime
number = list(range(1, 1001))
target = 6

#linear search
def linear_search(list, target):
    """
    Return the index position of the target if found, else return none
    """
    for i in range(0, len(list)):
        if list[i] == target:
            return i
    return None

result = linear_search(number, target)
print(result)

#binary search
def binary_search (list, target):
    """
    """
    first = 0
    last = len(list)-1
    while first <= last:
        midpoint = (first + last)//2
        if list[midpoint] == target:
            return midpoint
        elif list[midpoint] < target:
            first = midpoint + 1
        else:
            last = midpoint-1
    return None
result = binary_search(number, target)
print(result)

#recursive_binary_search
def recursive_binary_search(list, target):
    if len(list) == 0:
        return False
    else:
        midpoint = (len(list)) // 2
        if list[midpoint] == target:
            return True
        else:
            if list[midpoint] < target:
                return recursive_binary_search(list[midpoint+1:], target)
            else:
                return recursive_binary_search(list[:midpoint], target)
            
result = recursive_binary_search(number, target)
print(result)