# Lab 7: More on Abstract Data Types

```python
class Stack:
    def __init__(self):
        self.stack = []

    def push(self, item):
        self.stack.append(item)

    def pop(self):
        if len(self.stack) == 0:
            return None
        return self.stack.pop()

    def is_empty(self):
        return len(self.stack) == 0

    def peek(self):
        if len(self.stack) == 0:
            return None
        return self.stack[-1]

# Do not worry about the implementation of the Stack class above, you can copy the Stack class code as it is and use it to solve the problems below.
```

```python
from collections import deque

class Queue:
    def __init__(self):
        self.queue = deque()

    def enqueue(self, item):
        # Add an item to the end of the deque
        self.queue.append(item)

    def dequeue(self):
        # Remove and return an item from the front of the deque
        if self.is_empty():
            return None
        return self.queue.popleft()

    def is_empty(self):
        # Check if the deque is empty
        return len(self.queue) == 0

    def peek(self):
        # Return the front item of the deque without removing it
        if self.is_empty():
            return None
        return self.queue[0]

# Do not worry about the implementation of the Queue class above, you can copy the Queue class code as it is and use it to solve the problems below.

```

## Exercise Problems

**Problem Statement 1:** Given a list of positive integers `nums` of size `2n`, we call an integer `x` the majority elemeent if it appears at least n times in the list. Write a function `find_majority_element(nums)` that returns the majority element `x`. If there is no majority element, return -1.

```python
def find_majority_element(nums):
    """
    Given a list of positive integers nums of size 2n, return the majority element x.
    If there is no majority element, return -1.
    """
    # Fill in the code to find the majority element
    pass
```

**Problem Statement 2:** You are given a 2D list `groceries` where each list is a pair `[item, quantity]` representing the name of an item and its quantity. There may be multiple entries with the same item name. Write a function `combine_items(groceries)` that combines all the quantities of the same item into a single entry. The function should return a new 2D list with unique items and their combined quantities.

```python
def combine_items(groceries):
    """
    Given a 2D list groceries where each list is a pair [item, quantity], combine all the quantities of the same item into a single entry.
    Return a new 2D list with unique items and their combined quantities.
    """
    # Fill in the code to combine the items
    pass
```

**Problem Statement 3:**Given a list of `n` integers `nums`, and an integer `k`, write a function to return the maximum sum of `k` consecutive elements in the list.

**Note: Your code should run in O(n) time complexity**

```python
def max_sum(nums, k):
    """
    Given a list of n integers nums, and an integer k, return the maximum sum of k consecutive elements in the list.
    """
    # Fill in the code to find the maximum sum of k consecutive elements
    pass

```

**Problem Statement 4:** Given a list of integers `nums`, write a function `next_greater_element(nums)` that returns a list of the next greater element for each element in the list. If there is no greater element, return -1. A next greater element is the first element to its right that is greater than the current element.

**Note: Your code should run in O(n) time complexity**

**Hint: Use stacks**

```python
def next_greater_element(nums):
    """
    Given a list of integers nums, return a list of size len(nums) which gives the next greater element for each element in the list.
    If there is no greater element, return -1.
    """
    # Fill in the code to find the next greater element for each element
    pass
```

**Problem Statement 5:** Given a string `s`, find the length of the longest substring that contains at most k distinct characters.

**Note: Your code should run in O(n) time complexity**

**Hint: Use sets**

```python
def longest_substring_with_k_distinct(s, k):
    """
    Given a string s, find the length of the longest substring that contains at most k distinct characters.
    """
    # Fill in the code to find the length of the longest substring
    pass
```

**Problem Statement 6:** Given a string which is a valid arithmetic expression, write a function `evaluate_expression(s)` that evaluates the expression and returns the result. The expression contains the operators `+`, `-`, `*`, `/` and the operands are positive integers. Follow the precedence rule of operators(`/` > `*` > `+` > `-`). The string is a list of integers and operators separated by spaces.

```python
def evaluate_expression(s):
    """
    Given a string which is a valid arithmetic expression, evaluate the expression and return the result.
    The expression contains the operators +, -, *, / and the operands are positive integers.
    """
    # Fill in the code to evaluate the expression
    pass

# Example: 4 * 22 - 3 + 5 / 2
# Output: 87.5
```

**Problem Statement 7:** We define 2 strings as isomorphic if there is a one-to-one mapping of characters between the two strings. For example: "babca" and "ebeab" are isomorphic with a mapping from 'b' to 'e', 'a' to 'b', 'c' to 'a'.

Given a list of n strings, combine all the strings isomorphic to each other into a single list. Return a list of lists where each list contains all the isomorphic strings with the same pattern.

```python
def isomorphic_strings(strings):
    """
    Given a list of n strings, combine all the strings isomorphic to each other into a single list.
    Return a list of lists where each list contains all the isomorphic strings with the same pattern.
    """
    # Fill in the code to combine the isomorphic strings
    pass

# Example: ["babca", "ebeab", "abc", "def", "xyz", "ghi", "ccd", "tts]
# Output: [['babca', 'ebeab'], ['abc', 'def', 'xyz', 'ghi'], ["ccd", "tts"]]
```

**Problem Statement 8:** Given a string `pattern` and a string `s`, write a function `is_subsequence` that returns `True` if the string `pattern` is a subsequence of the string `s`, `False` otherwise. A string `s1` is a subsequence of `s2` if some number of characters (may be zero) can be deleted from `s2` to form `s1`.

```python
def is_subsequence(pattern, s):
    """
    Given a string pattern and a string s, return True if the string pattern is a subsequence of the string s, False otherwise.
    """
    # Fill in the code to check if pattern is a subsequence of s
    pass

# Example: pattern = "abc", s = "ahbgdc"
# Output: True

# Example: pattern = "agb", s = "ahbgdc"
# Output: False
```

