# Lab 3: Introduction to Loops, Conditional Statements, and Functions

## The `for` Loop
The `for` loop is used to iterate over a sequence (like a list, tuple, string) or other iterable objects.

**Example:**
```python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
# Output:
# apple
# banana
# cherry
```

## Using `range()` with `for` Loop
The `range()` function generates a sequence of numbers. When used in a `for` loop, it's commonly used to iterate a specific number of times.

**Syntax:**
```python
range(n) # Generates numbers from 0 till n-1
```

**Example:**
```python
for i in range(5):  # Generates numbers from 0 to 4
    print(i, end = " ")
# Output: 0 1 2 3 4
```

**Syntax:**
```python
range(start, end) # Generates numbers from start to end (excluding end, inclusive of start)
```

**Example:**
```python
for i in range(1, 6):  # Generates numbers from 1 to 5
    print(i)
# Output: 
# 1
# 2
# 3
# 4
# 5
```

**Syntax:**
```python
range(start, end, step) # Generates numbers from start to end (excluding end and beyond) with a step size
```

**Example:**
```python
for i in range(1, 10, 2):  # Generates odd numbers from 1 to 9
    print(i, end = " ")
# Output: 1 3 5 7 9

for i in range(10, 1, -2):  # Generates even numbers from 10 to 2
    print(i, end = " ")
# Output: 10 8 6 4 2
```





## Iterating with Index
```python
fruits = ["apple", "banana", "cherry"]
for i in range(len(fruits)):
    print(i, fruits[i])
# Output:
# 0 apple
# 1 banana
# 2 cherry
```

## The `while` Loop
The `while` loop repeatedly executes a block of code as long as a condition is true.

**Example:**
```python
count = 0
while count < 5:
    print(count)
    count += 1
# Output:
# 0
# 1
# 2
# 3
# 4
```

**Conditional Statements**

## `if`, `elif`, `else`
Conditional statements allow you to execute certain blocks of code based on whether a condition is true or false. `elif` and `else` are optional. The conditions of `if`, `elif`, `else` are checked in sequence if the previous ones are not true. `else` (if present) will execute if none of the previous `if`, `elif` conditions hold.

**Example:**
```python
number = -10
if number > 0:
    print("Positive")
elif number == 0:
    print("Zero")
else:
    print("Negative")
# Output:
# Negative
```

## Introduction to Functions
Functions are reusable blocks of code that perform a specific task. They help in making the code modular and easy to manage. Functions can have multiple parameters and return multiple values (but they must be in a single return statement), or also no parameters or no return values.

**Example Without Functions:**
```python
# Calculate the area of a circle
radius = 5
area = 3.14159 * radius ** 2
print("The area is", area)
# Output:
# The area is 78.53975
```

**Example With Functions:**
```python

def print_hello():
    print("Hello, World!")

print_hello()
# Output:
# Hello, World!

def calculate_area(radius):
    area = 3.14159 * radius ** 2
    return area

radius = 5
print("The area is", calculate_area(radius))
# Output:
# The area is 78.53975

# Function with multiple parameters and return values
def math_operations(x, y):
    addition = x + y
    subtraction = x - y
    multiplication = x * y
    division = x / y
    return addition, subtraction, multiplication, division

result = math_operations(10, 5)
print(result)  # Output: (15, 5, 50, 2.0)
```

# Exercise Problems:


**Problem Statement 1: Flight Boarding Check**

You have three bags of weights \( W1, W2, W3 \). You are allowed to check in exactly two bags and carry one bag with you. However, there are weight limits for both check-in and carrying baggage. The total weight of the bags checked in must not exceed the limit for check-in, and the weight of the bag you carry with you must not exceed the "carry on" limit. Write a function to determine if you can board the flight under these conditions.

Your task is to implement the function `can_board_flight(W1, W2, W3, check_in_limit, carry_on_limit)` that takes in the weights of the three bags \( W1, W2, W3 \), the check-in weight limit, and the carry-on weight limit. The function should return "Yes" if you can board the flight, and "No" otherwise.

---

```python
def can_board_flight(W1, W2, W3, check_in_limit, carry_on_limit):
    # Fill the code in place of ... to check if you can board the flight(check each combination of bags and limits)

    if (...):       # Check if we can check-in (W1, W2) and carry W3:
        return "Yes"
    
    elif (...):     # Check if we can check-in (W1, W3) and carry W2:
        return "Yes"
    
    elif (...):     # Check if we can check-in (W2, W3) and carry W1:
        return "Yes"
    
    else:
        return "No"

# Test cases
# Example 1
W1 = 20
W2 = 30
W3 = 20
check_in_limit = 50
carry_on_limit = 20
print(can_board_flight(W1, W2, W3, check_in_limit, carry_on_limit))  # Output: Yes

# Example 2
W1 = 20
W2 = 30
W3 = 50
check_in_limit = 50
carry_on_limit = 10
print(can_board_flight(W1, W2, W3, check_in_limit, carry_on_limit))  # Output: No
```

---

**Problem Statement 2: Magic Triangle**

You are tasked with writing a function that prints a pyramid pattern known as a "magic triangle." The magic triangle pattern consists of consecutive integers arranged in such a way that each row forms a triangle with all the previous rows. The first row contains one number (1), the second row contains two numbers (2, 3), the third row contains three numbers (4, 5, 6), and so on. Each row should be left-aligned.

Write a function `magic_triangle(n)` that takes an integer `n` as input and prints the magic triangle pattern up to the `n`th row. You do not need to return anything from the function.

Input:
```python
def magic_triangle(n):
    for i in range(1, n+1):
        start_num = ...  # Fill in the code to calculate the starting number for each row
        end_num = ...    # Fill in the code to calculate the ending number for each row
        for j in range(start_num, end_num + 1):
            print(j, end=" ")
        print()


n = 4
magic_triangle(n)
# Output:
# 1
# 2 3
# 4 5 6
# 7 8 9 10
```

--- 

**Problem Statement 3: Factorial Calculation**

You are required to write a function that calculates the factorial of a given integer $n$, denoted as $n!$, which is the product of all positive integers less than or equal to $n$. 
For example, $5! = 5 \times 4 \times 3 \times 2 \times 1 = 120$.

Write a function `calculate_factorial(n)` that takes an integer $n$ as input and returns $n!$.


```python
def calculate_factorial(n):
    factorial = 1

    # Fill the code to calculate the factorial of n

    return factorial

# Test case
n = 5
print(calculate_factorial(n))  # Output: 120
```

---
