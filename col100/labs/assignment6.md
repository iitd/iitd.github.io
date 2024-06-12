# Lab 6: Abstract Data Types: Stacks, Queues and Dictionaries

## Stack

A stack is a data abstraction that follows the Last In, First Out (LIFO) principle. In a stack, elements are added and removed from the same end, known as the top of the stack. You can imagine a stack to be a list which only has the functions `append(item)`, `pop()` and can only access the last index of the list. 
In a stack, the `push(item)` function adds an element to the top of the stack analogous to `append(item)` in list, while the `pop()` function removes and returns the top element of the stack (if the stack is not empty). To check if the stack is empty, you can use the `is_empty()` function similar to checking `len(lst) == 0` for a list `lst`. Here, the top element of the stack is analogous to the last element of a list.

Python does not have a default stack implementation. We implement our own stack class using lists. You can use this to solve the problems below. Feel free to skip understanding the implementation of the stack class and directly use the stack class wherever required.

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

The stack class above has the following methods:
1. `push(item)`: Adds an element to the top of the stack.
2. `peek()`: Returns the top element of the stack without removing it.
3. `pop()`: Removes and returns the top element of the stack. Returns `None` if the stack is empty.
4. `is_empty()`: Returns `True` if the stack is empty, `False` otherwise.

Example usage of the stack class:

```python
# Create a stack
stack = Stack() # Current stack: []

stack.push(1) # Current stack: [1]
stack.push(2) # Current stack: [1, 2]
stack.push(3) # Current stack: [1, 2, 3]

print(stack.peek())  # Output: 3 (Current stack: [1, 2, 3])
print(stack.pop())  # Output: 3 (Current stack: [1, 2])

stack.push(4)  # Current stack: [1, 2, 4]

print(stack.pop())  # Output: 4 (Current stack: [1, 2])
print(stack.peek())  # Output: 2 (Current stack: [1, 2])
print(stack.pop()) # Output: 2 (Current stack: [1])
print(stack.pop()) # Output: 1 (Current stack: [])

print(stack.is_empty()) # Output: True
```

## Queue

A queue is a data abstraction that follows the First In, First Out (FIFO) principle. In a queue, elements are added at the rear end and removed from the front end. You can imagine a queue to be a list which only has the functions `insert(0, item)` and `pop()` and can only access the last index of the list.

In a queue, the `enqueue(item)` function adds an element to the rear end of the queue analogous to `insert(0, item)` in list, while the `dequeue()` function removes and returns the front element of the queue (if the queue is not empty) analogous to `pop()` in list. To check if the queue is empty, you can use the `is_empty()` function similar to checking `len(lst) == 0` for a list `lst`.

Python does not have a default queue implementation. We implement our own queue class using lists. You can use this to solve the problems below. Feel free to skip understanding the implementation of the queue class and directly use the queue class wherever required.

**Optional Note:** The queue class we have described from lists uses the `insert(0, item)` function to add an element to the queue which is an inefficient operation. This is because inserting an element at the beginning of a list has a time complexity of O(n) as all the elements need to be shifted to the right. Hence, we use `collections.deque` from the `collections` module to implement a queue in Python. `collections.deque` is a double-ended queue which supports adding and removing elements from both ends in O(1) time complexity. You can use `collections.deque` to implement a queue in Python.

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

The queue class above has the following methods:
1. `enqueue(item)`: Adds an element to the rear end of the queue.
2. `peek()`: Returns the front element of the queue without removing it.
3. `dequeue()`: Removes and returns the front element of the queue. Returns `None` if the queue is empty.
4. `is_empty()`: Returns `True` if the queue is empty, `False` otherwise.

Example usage of the queue class:

```python
# Create a queue
queue = Queue() # Current queue: []
queue.enqueue(1) # Current queue: [1]
queue.enqueue(2) # Current queue: [2, 1]
queue.enqueue(3) # Current queue: [3, 2, 1]

print(queue.peek())  # Output: 1 (Current queue: [3, 2, 1])
print(queue.dequeue())  # Output: 1 (Current queue: [3, 2])

queue.enqueue(4)  # Current queue: [4, 3, 2]

print(queue.dequeue())  # Output: 2 (Current queue: [4, 3])
print(queue.peek())  # Output: 3 (Current queue: [4, 3])
print(queue.dequeue()) # Output: 3 (Current queue: [4])
print(queue.dequeue()) # Output: 4 (Current queue: [])

print(queue.is_empty()) # Output: True
```

## Dictionary

A dictionary is a data structure that stores key-value pairs. It is an unordered collection of items where each item is stored as a key-value pair. Dictionaries are used to store data values like a map, which unlike other Data Types that hold only a single value as an element, a dictionary holds a key:value pair.

In Python, dictionaries are defined within braces `{}` with
- Each item being a pair in the form `key:value`
- The keys in a dictionary must be unique (cannot be duplicate) and immutable (Example: strings, numbers, tuples)
- The values in a dictionary can be of any data type

The dictionary data structure has the following methods:
1. `dict[key]` or `dict.get(key)`: Returns the value corresponding to the key in the dictionary. If the key is not present, it raises a `KeyError`.

2. `dict[key] = value`: Adds a new key-value pair to the dictionary. If the key is already present, it updates the value.

3. `dict.pop(key)` or `del dict[key]`: Removes the key-value pair corresponding to the key from the dictionary. If the key is not present, it raises a `KeyError`.

4. `key in dict`: Returns `True` if the key is present in the dictionary, `False` otherwise.

5. `dict.keys()`: Returns a view object that displays a list of all the keys in the dictionary.

6. `dict.values()`: Returns a view object that displays a list of all the values in the dictionary.

7. `dict.items()`: Returns a view object that displays a list of key-value pairs in the dictionary.

Example usage of dictionaries:

```python
# Create an empty dictionary
student = {}

# Create a dictionary
student = {
    'name': 'Alice',
    'age': 20,
    'courses': ['Math', 'Physics']
}

# Access the value corresponding to the key 'name'
print(student['name'])  # Output: Alice

# Add a new key-value pair to the dictionary
student['gender'] = 'Female'    
# student: {'name': 'Alice', 'age': 20, 'courses': ['Math', 'Physics'], 'gender': 'Female'}

# Update the value corresponding to the key 'age'
student['age'] = student['age'] + 1    
# student: {'name': 'Alice', 'age': 21, 'courses': ['Math', 'Physics'], 'gender': 'Female'}

# Check if the key 'courses' is present in the dictionary
print('courses' in student)  # Output: True

# Remove the key-value pair corresponding to the key 'gender'
student.pop('gender')   
# student: {'name': 'Alice', 'age': 21, 'courses': ['Math', 'Physics']}

# Print all the keys in the dictionary
print(list(student.keys()))  # Output: ['name', 'age', 'courses']

# Print all the values in the dictionary
print(list(student.values()))  # Output: ['Alice', 21, ['Math', 'Physics']]

# Print all the key-value pairs in the dictionary
print(list(student.items()))  # Output: [('name', 'Alice'), ('age', 21), ('courses', ['Math', 'Physics'])]
```

---

**Note: **Assume that all stack and queue operations are `O(1)` time complexity operations and the dictionary operations are also `O(1)` time complexity operations.

# Exercise Problems

---
**Problem Statement 1: Check balanced parenthesis**
Given a string containing only parentheses `()`, square brackets `[]`, and curly braces `{}`, write a function `is_balanced(s)` that checks if the string `s` has balanced parentheses. A string has balanced parentheses if each opening parenthesis has a corresponding closing parenthesis and they are properly nested. The function should return `True` if the string has balanced parentheses, `False` otherwise.

**Note: your algorithm should run in O(n) time complexity where n is the length of the string.**

**Hint: use stacks**

```python
def is_balanced(s):
    # Fill in the code to check if the string has balanced parentheses
    # Return True if the string has balanced parentheses, False otherwise
    return False

# Test cases
# Example 1
s = "([])[]({})"
print(is_balanced(s))  # Output: True

# Example 2
s = "([)]"
print(is_balanced(s))  # Output: False
```

---

**Problem Statement 2: Remove duplicate characters**
Given a string `s`, write a function `remove_duplicates(s)` that repeatedly performs the following operation until no adjacent duplicate characters are left in the string:

- Remove the leftmost adjacent pair of duplicate characters.

The function should return the final string after removing all the adjacent duplicate characters.

**Note: your algorithm should run in O(n) time complexity where n is the length of the string.**

**Hint: use stacks**

```python
def remove_duplicates(s):
    # Fill in the code to remove the adjacent duplicate characters
    # Return the final string after removing all the adjacent duplicate characters
    return ""

# Test cases
# Example 1
s = "abbaca"
print(remove_duplicates(s))  # Output: "ca"
```


---

**Problem Statement 3: Merge 2 queues**
Given two queues `queue1` and `queue2`, such that `queue1` is filled with integers in non-decreasing order and `queue2` is filled with integers in non-decreasing order. Write a function `merge_queues(queue1, queue2)` that merges the two queues into a single queue such that the resulting queue is filled with integers in non-decreasing order.
A queue being filled in non-decreasing order means that elements were added to the queue in non-decreasing order and hence, the front element of the queue is the smallest element in the queue.

**Note: your algorithm should run in O(n) time complexity where n is the total number of elements in both the queues.**

```python
def merge_queues(queue1, queue2):
    final_queue = Queue()

    # Fill in the code to merge the two queues into a single queue
    # Return the resulting queue filled with integers in non-decreasing order

    return final_queue

# Test cases
# Example 1
queue1 = Queue()
queue1.enqueue(1)
queue1.enqueue(3)
queue1.enqueue(5)

queue2 = Queue()
queue2.enqueue(2)
queue2.enqueue(4)
queue2.enqueue(4)

final_queue = merge_queues(queue1, queue2)
while not final_queue.is_empty():
    print(final_queue.dequeue(), end=" ")  # Output: 1 2 3 4 4 5
```

---

**Problem Statement 4: Pairs with difference k**
Given a list of integers `nums` and an integer `k`, write a function `pairs_with_difference_k(nums, k)` that returns the number of pairs of numbers in the list `nums` that have an absolute difference of `k`. Assume the pairs are unordered i.e. `(nums[i], nums[j])` is the same as `(nums[j], nums[i])`.

**Note: your algorithm should run in O(n) time complexity where n is the length of the list `nums`. Note that sorting algorithms in general are O(nlogn) in time complexity and hence, can't be used here**

**Hint: use dictionaries**

```python
def pairs_with_difference_k(nums, k):
    count = 0
    # Fill in the code to find the number of pairs of numbers in the list nums that have an absolute difference of k
    # Return the number of pairs

    return count

# Test cases
# Example 1
nums = [ 3, 3, 3, 3, 1, 1, 1, 2, 2, 4, 4, 4, 5, 5, 5, 5]
k = 2
print(pairs_with_difference_k(nums, k))  # Output: 34

```



---

# Additional Exercise Problems

**Problem Statement 5: Number of monsters**
We have a battlefield where monsters are fighting. At each time step `i` where `0 <= i < n`, a monster of strength `strength[i]` appears on the battlefield and kills all the monsters with strength less than `strength[i]` currently on the battlefield. The monster with strength `strength[i]` survives and remains on the battlefield but becomes dormant and will not kill any other monsters as future monsters arrive.
Write a function `number_of_monsters(strength)` that takes a list `strength` as input and returns a list `result` where `result[i]` is the number of monsters remaining on the battlefield after the `i-th` time step.

**Note: your algorithm should run in O(n) time complexity where n is the length of the list `strength`.**

```python
def number_of_monsters(strength):
    result = [0]*len(strength)
    # Fill in the code to find the number of monsters remaining on the battlefield
    # Return a list where result[i] is the number of monsters remaining after the i-th time step

    return result

# Test cases
# Example 1
strength = [2, 4, 1, 3, 5]
print(number_of_monsters(strength))  # Output: [1, 1, 2, 2, 1]
# Explanation:
# At time step 0, monster with strength 2 appears, 1 monster remains.
# At time step 1, monster with strength 4 appears, kills the monster with strength 2, 1 monster remains.
# At time step 2, monster with strength 1 appears, 2 monsters remain.
# At time step 3, monster with strength 3 appears, kills the monster with strength 1, 2 monsters remain.
# At time step 4, monster with strength 5 appears, kills the monsters with strength 3 and 4, 1 monster remains.
```

---

**Problem Statement 6: TwoSum**
Given a list of integers `nums` and an integer `target`, write a function `two_sum(nums, target)` that returns the number of pairs of numbers in the list `nums` that sum up to the target. Assume the pairs are unordered i.e. `(nums[i], nums[j])` is the same as `(nums[j], nums[i])`.

**Note: your algorithm should run in O(n) time complexity where n is the length of the list `nums`. Note that sorting algorithms in general are O(nlogn) in time complexity and hence, can't be used here**

```python
def two_sum(nums, target):
    count = 0
    # Fill in the code to find the number of pairs of numbers in the list nums that sum up to the target
    # Return the number of pairs

    return count

# Test cases
# Example 1
nums = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]
target = 6
print(two_sum(nums, target))  # Output: 9
```

---

**Problem Statement 7: Evaluate postfix expression**
Given a string `s` representing a postfix expression, write a function `evaluate_postfix(s)` that evaluates the postfix expression and returns the result. The postfix expression consists of integers and the operators `+`, `-`, `*`, `/`. The operators `+`, `-`, `*`, `/` represent addition, subtraction, multiplication, and division respectively. 

A postfix expression is an expression in which the operators come after the operands. For example, the postfix expression `2 3 +` is equivalent to the infix expression `2 + 3`. Similarly, the postfix expression `2 3 4 + *` is equivalent to the infix expression `2 * (3 + 4)`.

**Note: your algorithm should run in O(n) time complexity where n is the length of the string `s`.**


```python
def evaluate_postfix(s):
    # Fill in the code to evaluate the postfix expression
    # Return the result

    return 0

# Test cases
# Example 1
s = "2 3 +"
print(evaluate_postfix(s))  # Output: 5

s = "2 3 * 0 5 / +"
print(evaluate_postfix(s))  # Output: 6
# Explanation: 
# s = "2 3 * 0 5 / +" 
# s = "6 0 5 / +"
# s = "6 0 +"
# s = "6"
```

---

** Problem Statement 8: Implement a stack using two queues**
Given two queues `queue1` and `queue2`, write a function `Stack` that implements a stack using the two queues. The stack should support the following operations:
- `push(item)`: Adds an element to the top of the stack.
- `pop()`: Removes and returns the top element of the stack. Returns `None` if the stack is empty.
- `is_empty()`: Returns `True` if the stack is empty, `False` otherwise.

Complete the implementation of the class `QStack` below that implements a stack using two queues. You can use the `Queue` class described above to implement the stack.

**Note: your algorithm should run in O(1) time complexity for the `push()` and `is_empty()` operations and O(n) time complexity for the `pop()` operation where n is the number of elements in the stack. Assume all operations for the queue are O(1). You cannot use any other data structures other than the 2 queues**

```python
class QStack:
    def __init__(self):
        self.queue1 = Queue()
        self.queue2 = Queue()

    def push(self, item):
        # Fill in the code to add an element to the top of the stack
        pass

    def pop(self):
        # Fill in the code to remove and return the top element of the stack
        pass

    def is_empty(self):
        # Fill in the code to check if the stack is empty
        pass

# Test cases
stack = QStack()
stack.push(1)
stack.push(2)
stack.push(3)

print(stack.is_empty())  # Output: False

print(stack.pop())  # Output: 3

stack.push(4)

print(stack.pop())  # Output: 4
print(stack.pop())  # Output: 2
print(stack.pop())  # Output: 1
print(stack.pop())  # Output: None

print(stack.is_empty())  # Output: True
```















