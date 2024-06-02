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

### Example 1: Checking for Prime Numbers in a Range
This example uses nested loops to check for prime numbers within a given range.

```python
def find_primes_in_range(start, end):
    for num in range(start, end + 1):
        if num > 1:  # All prime numbers are greater than 1
            is_prime = True
            for i in range(2, num):
                if (num % i) == 0:
                    is_prime = False
                    break
            if is_prime:
                print(num, "is a prime number")

# Test case
find_primes_in_range(10, 20)
# Output:
# 11 is a prime number
# 13 is a prime number
# 17 is a prime number
# 19 is a prime number
```

### Example 2: Taylor series
Calculate the value of $\text{sin}(x)$ using the Taylor series expansion upto the first n terms. The Taylor series expansion of $\text{sin}(x)$ is given by: <br>
$\text{sin}(x) = x - x^3/3! + x^5/5! - x^7/7! + ...$

```python
def calculate_sin(x, n):
    term = x

    sum = term

    if(n == 1):
        return sum
    
    for i in range(2, n + 1):
        term = term * x * x * (1/(2 * i - 2)) * (1/(2 * i - 1))
        if(i % 2 == 0):
            sum = sum - term
        else:
            sum = sum + term
    
    return sum
        

# Test case
x = 3.14
n = 5
print(calculate_sin(x, n))  # Output: 0.008479830572943103
```

## Using Functions Within Functions

Functions can call other functions, which helps in breaking down complex problems into simpler sub-problems.

**Example:**
```python
def add(a, b):
    return a + b

def multiply(x, y):
    return x * y

def add_and_multiply(a, b, x, y):
    sum_result = add(a, b)
    product_result = multiply(x, y)
    return sum_result, product_result

result = add_and_multiply(1, 2, 3, 4)
print(result)  # Output: (3, 12)
```

---

# Exercise Problems:

**Problem Statement 1: Maximize Your Soda Enjoyment**

Imagine you are a fan of a special energy drink called "Zippy Juice". You buy `n` full bottles of Zippy Juice. There's a special offer: for every `e` empty bottles you return, you get one full bottle of Zippy Juice for free. You can take advantage of this offer as many times as possible. Write a function to calculate the maximum number of bottles of Zippy Juice you can drink.

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

**Problem Statement 2: Count the Number of Leap Years**

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


