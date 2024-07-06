# Lab 4: Advanced Loops, Conditional Statements, and Function Usage

## Introduction to `break` and `continue` Statements

Before we dive into nested loops and conditionals, let's understand the `break` and `continue` statements.

- The `break` statement is used to exit a loop prematurely. It terminates the loop it's currently in.
- The `continue` statement is used to skip the rest of the code inside a loop for the current iteration and proceed to the next iteration.

### Example:

```python
# Using break statement
for i in range(5):
    if i == 3:
        break
    print(i)  
# Output:
# 0
# 1
# 2

# Using continue statement
for i in range(5):
    if i == 2:
        continue
    print(i)
# Output:
# 0
# 1
# 3
# 4
```

## Nested loops and `if` Statements

We can use loops and `if` statements within other loops and conditionals. This allows for more complex and nuanced control flows in your code.

**Example:**
```python
for i in range(3):
    for j in range(2):
        if i == j:
            print(f"i = {i}, j = {j}")
```

## Using Functions Within Functions

Functions can call other functions, which helps in breaking down complex problems into simpler sub-problems.

**Example:**
```python
def add(a, b):
    return a + b

def multiply(x, y):
    return x * y

def add_and_multiply(a, b):
    sum_result = add(a, b)
    product_result = multiply(a, b)
    return sum_result, product_result

result = add_and_multiply(3, 4)
print(result)  # Output: (7, 12)
```

---

# Exercise Problems:

---

**Problem Statement 1: Sum of first N even numbers**

Calculate the sum of the first `n` even numbers(starting from 2). Write a function `sum_of_even_numbers(n)` that takes an integer `n` as input and returns the sum of the first `n` even numbers.

```python
def sum_of_even_numbers(n):
    # Fill in the code to calculate the sum of the first n even numbers
    return 0

# Test cases
print(sum_of_even_numbers(5))  # Output: 30 (2 + 4 + 6 + 8 + 10 = 30)
print(sum_of_even_numbers(10))  # Output: 110 (2 + 4 + 6 + 8 + 10 + 12 + 14 + 16 + 18 + 20 = 110)
```

---

**Problem Statement 2: Calculate the value of sin(x)**

Calculate the value of sin(x) using the Taylor series expansion upto the first n terms. The Taylor series expansion of sin(x) is given by: <br>
sin(x) = x - x^3/3! + x^5/5! - x^7/7! + ...

**Note:** for larger values of n, trying to calculate the terms individually may result in an overflow error or be inefficient in computation. To avoid this, you can use the result of the previous term to calculate the next term. For example, to calculate the 5th term, x^9/9!, you can use the result of the 4th term, x^7/7!, and multiply it by x^2/(9*8).

```python
def calculate_sin(x, n):

    # Fill in the code to calculate the value of sin(x) using the Taylor series expansion upto the first n terms
    # Return the value of sin(x) calculated using the Taylor series expansion
    pass
        

# Test case
x = 3.14
n = 5
print(calculate_sin(x, n))  # Output: 0.008479830572943103
```

---

**Problem Statement 3: Find the hidden character**
A `magic_square` is a 3x3 square with the following properties:
1. Each cell contains one of the letters 'A', 'B', 'C'
2. Each letter must appear exactly once in each row
3. Each letter must appear exactly once in each column

Now, exactly one of the characters of the magic square is hidden, the cell of the hidden character is represented by a question mark '?'. Write a function to find the hidden character.

**Note:** `magic_square` is a list of lists where each inner list represents a row of the magic square. To access the element at row `i` and column `j`, you can use `magic_square[i][j]` where `0<=i<=2` and `0<=j<=2`.

```python
def find_hidden_character(magic_square):
    # Fill in the code to find the hidden character
    # Return the hidden charactee: 'A', 'B' or 'C'
    return '?'

# Test cases
# Example 1
magic_square = [['A', 'B', 'C'], ['B', 'C', 'A'], ['C', 'A', '?']]
print(find_hidden_character(magic_square))  # Output: 'B'

```

---

**Problem Statement 4: Count the Number of Leap Years**

A leap year is a year that is divisible by 4, but if it is divisible by 100, it must also be divisible by 400 to be considered a leap year. <br>
So, all multiples of 4 which are not divisible by 100 are leap years(For Example: 1972, 2024 are leap years).<br>
But among the multiples of 100, only those which are multiples of 400 are leap years(For Example: 2000, 2400 are leap years while 1700, 1800, 1900 are not).

Write a function to determine if a given year is a leap year and another function to count the total number of leap years in a given range.

Your task is to implement two functions:
1. `check_leap_year(year)` that returns `True` if the given year is a leap year, and `False` otherwise.
2. `total_leap_years_in_range(start_year, end_year)` that returns the total number of leap years between `start_year` and `end_year` inclusive.

---

```python
def check_leap_year(year):
    # Fill in the code to check if a year is a leap year
    return False

def total_leap_years_in_range(start_year, end_year):
    # Initialize a counter for leap years
    leap_years_count = 0

    # Fill in the code here to count the total number of leap years in the given range (inclusive)
    # Hint: Use the check_leap_year function

    return leap_years_count

# Test cases
# Example 1
start_year = 2000
end_year = 2020
print(total_leap_years_in_range(start_year, end_year))  # Expected output: 6

# Example 2
start_year = 1800
end_year = 1900
print(total_leap_years_in_range(start_year, end_year))  # Expected output: 24
```

---

**Problem Statement 5: Check if a number is prime**
Given a number n, check if it is prime or not. A prime number is a number that is greater than 1 and has no divisors other than 1 and itself. Complete the function `is_prime(n)` that returns `True` if the number is prime and `False` otherwise.

```python
def is_prime(n):
    # Fill in the code to check if a number is prime
    # Return True if the number is prime, False otherwise
    return False

# Test case
# Example 1
print(is_prime(7))  # Output: True

# Example 2
print(is_prime(10))  # Output: False
```

# Additional Exercise Problems

---

**Problem 6: Divide gold nuggets**

You are a treasure hunter who has found a treasure chest containing lump weighing `n` units of gold . However, to bring your treasure home, you need to give a lump of exactly `m` units of gold to the guards at the gate. You have a magical device that can divide any lump of gold into two smaller lumps such that one lump is exactly twice the weight of the other, however the device cannot divide gold in fractional units of weight(For example, a lump of 6 units can be divided into 2 units + 4 units, but a lump of 7 units cannot be split by the machine). You can use this device as many times as you want.

Your task is to determine if it is possible for you to bring the treasure home by obtaining a lump of `m` units of gold from the original lump of `n` units of gold.

**Note:**this question has a simple recursive solution, but since we haven't covered recursion yet, you should solve it using loops and conditionals.

```python
def divide_gold(n, m):
    # Fill in the code to check if it is possible to obtain a lump of m units of gold from the original lump of n units of gold
    return False

# Test cases
# Example 1
n = 12
m = 8
print(divide_gold(n, m))  
# Output: True
# Explanation: 12 = 8 + 4

# Example 2
n = 9
m = 2
print(divide_gold(n, m))  
# Output: True
# Explanation: 
# 9 = 3 + 6
# 6 = 2 + 4



# Example 1
n = 12
m = 2
print(divide_gold(n, m))  
# Output: False
# Explanation: It is not possible to obtain a lump of 2 units of gold from the original lump of 12 units of gold as after dividing 12 into 4 and 8 units, we cannot further divide.


```

**Problem 7: Make equal numbers**

You are given a list three positive integers `A`, `B` and `C`. You can perform the following 2-step operation **at most 3 times**:
1. Choose any number and split it into two numbers such that the sum of the two numbers is equal to the original number.
2. Remove the original number from your list and add the two new numbers to the list.

Your task is to determine if it is possible to make all the numbers in the list equal by performing the above operation at most 3 times.

```python
def make_equal_numbers(A, B, C):
    # Fill in the code to check if it is possible to make all the numbers in the list equal
    return False

# Test cases
# Example 1
print(make_equal_numbers(1, 3, 2))  # Output: True

# Example 2
print(make_equal_numbers(99999999, 99999999, 99999999))  # Output: True

# Example 3
print(make_equal_numbers(5, 5, 15))  # Output: True
```
---

**Problem Statement 8: Maximize Your Soda Enjoyment**

Imagine you are a fan of a special energy drink called "Zippy Juice". You buy `n` full bottles of Zippy Juice. There's a special offer: for every `e` empty bottles you return, you get one full bottle for free. You can take advantage of this offer as many times as possible. Write a function to calculate the maximum number of bottles of Zippy Juice you can drink.

Your task is to implement the function `max_bottles_drunk(n, e)` that takes the number of full bottles `n` and the number of empty bottles required for a new full bottle `e` as inputs. The function should return the maximum number of bottles you can drink.

**Hint: use a while loop when you don't know the exact number of iterations to be performed**

---

```python
def max_bottles_drunk(n, e):
    total_drunk = 0
    # Fill in the code to calculate the maximum number of bottles you can drink
    
    return total_drunk

# Test cases
# Example 1
n = 9
e = 3
print(max_bottles_drunk(n, e))  # Output: 13

# Example 2
n = 15
e = 4
print(max_bottles_drunk(n, e))  # Output: 19
```

---

**Problem Statement 9:**

All natural numbers starting from 1 are written in order in a single infinite line as "123456789101112131415..." Write a function `find_digit(n)`to find the `n`th digit in this sequence of natural numbers.

```python
def find_digit(n):
    # Fill in the code to find the nth digit in the sequence of natural numbers
    # Return the nth digit which is an integer between 0 and 9
    return -1

# Test cases
# Example 1
n = 5
print(find_digit(n))  # Output: 5

# Example 2
n = 11
print(find_digit(n))  # Output: 0

```






