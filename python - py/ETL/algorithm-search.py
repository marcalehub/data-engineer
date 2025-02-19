"""
####################################################################################################
##Algorithm Search##

1. Linear Search:
    - Time Complexity: O(n)
    - Space Complexity: O(1)
    - It is used to find the target in the list by iterating through each element in the list.

2. Binary Search:
    - Time Complexity: O(log n)
    - Space Complexity: O(1)
    - It is used to find the target in the list by dividing the list into half and checking the target with the midpoint.

3. Recursive Binary Search:
    - Time Complexity: O(log n)
    - Space Complexity: O(log n)
    - It is used to find the target in the list by dividing the list into half and checking the target with the midpoint recursively.

Pre-requisites:
1. Python

Steps:
1. The index position of the target will be returned
2. If the target is not found, None will be returned
3. Use the result as required
4. Run the script
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