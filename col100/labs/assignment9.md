# Lab 9: Introduction to Recursion

Recursion is a programming technique where a function makes calls to itself to solve a problem. It's a powerful tool for breaking down complex problems into simpler sub-problems.

### Example: Calculating Factorial Using Recursion

One classic example of recursion is calculating the factorial of a number. The factorial of a non-negative integer `n`, denoted as `n!`, is the product of all positive integers less than or equal to `n`.

The factorial function can be defined recursively as follows:
- Base case: `0! = 1`
- Recursive case: `n! = n * (n-1)!` for `n > 0`

Here's how you can implement the factorial function using recursion in Python:

```python
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n - 1)

# Test
print(factorial(5))  # Output: 120
```

In this example, the function `factorial` calls itself with a smaller value (`n - 1`) until it reaches the base case (`n == 0`). Then, it returns values back up the call stack, multiplying each returned value by `n` to compute the factorial of `n`.

---

# Exercise Problems:

**Problem Statement 1: Recursively Calculate the nth Fibonacci Number**

The Fibonacci series is a sequence of numbers where each number is the sum of the two preceding ones, starting from 0 and 1. The sequence starts as follows: 1, 1, 2, 3, 5, 8, 13, 21, ...

Write a recursive function `fibonacci(n)` that calculates the `n`th Fibonacci number.

Your task is to implement the function `fibonacci(n)` using recursion. The function should return the `n`th Fibonacci number without using lists.

---

```python
def fibonacci(n):
    # Fill in the code to calculate the nth Fibonacci number recursively
    pass

# Test cases
print(fibonacci(6))  # Expected output: 8
print(fibonacci(8))  # Expected output: 21
```

---

**Problem Statement 2: Recursively Check if a String is a Palindrome**

Given a string, write a recursive function `is_palindrome(s)` that checks if the string `s` is a palindrome. A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization). **You cannot use loops**, and should only use recursion. **You cannot use any string methods other than string slicing**.

```python
def is_palindrome(s):
    # Fill in the code to check if the string is a palindrome recursively
    # The function should return True if the string is a palindrome, False otherwise
    pass

# Test cases
print(is_palindrome("racecar"))  # Expected output: True
print(is_palindrome("hello"))  # Expected output: False
```

---

**Problem Statement 3: Recursively Reverse a List**

Reverse a list using recursion. Write a recursive function `reverse_list(lst)` that takes a list `lst` as input and returns the reversed list. **You cannot use loops. You cannot use any list methods other than list concatenation (`+`) and list slicing**.

```python
def reverse_list(lst):
    # Fill in the code to reverse the list recursively
    # The function should return the reversed list
    pass

# Test cases
print(reverse_list([1, 2, 3, 4, 5]))  # Expected output: [5, 4, 3, 2, 1]
```

---

**Problem Statement 4: Minimum number of steps to reach the top**

You are standing on the ground floor and in front of you is a staircase with `n` steps. You can take either 1 step, 2 steps, or 3 steps at a time. Write a recursive function `num_steps(n)` that calculates the minimum number of steps required to reach the top of the staircase.

Your task is to implement the function `num_steps(n)` using recursion. The function should return the minimum number of steps required to reach the top of the staircase.

---

```python
def num_steps(n):
    # Fill in the code to calculate the minimum number of steps recursively
    pass

# Test cases
print(num_steps(3))  # Expected output: 4
print(num_steps(5))  # Expected output: 13
```

---

# Additional Exercise Problems

**Problem Statement 5: Flattening a Nested List**

You are given a nested list of integers. Write a function `flatten_list(nested_list)` that flattens the nested list into a single list by removing the nesting. Your task is to implement the function `flatten_list(nested_list)` that takes a nested list as input and returns a single flattened list. You can assume that the input list will only contain integers and other nested lists.

```python
def flatten_list(nested_list):
    """
    Flatten a nested list into a single list.
    Example Input: [1, [2, [3, 4], 5], 6, [7, 8, [9, 10]]]
    Example Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    """

    # Fill in the code to flatten the nested list here, the function should return a single list
    pass
```

---

**Problem Statement 6: Calculate the number of paths**

You are given a grid with cells from `(0, 0)` to `(m, n)`. **You can only move either down or right at any point in time**. Write a recursive function `num_paths(m, n)` that calculates the number of unique paths to reach the bottom-right corner `(m, n)` of the grid from the top-left corner `(0, 0)`. Try to solve this question without using hints first. If you get stuck, you can refer to the hints below.

**Hint 1:** Be very careful with the base cases, you should not make calls to num_paths with negative values or values that are out of the grid.<br><br>
**Hint 2:** You should think about `num_paths(i, j)` as the number of total_paths from `(0, 0)` to `(i, j)`. Can you use this to calculate `num_paths(m, n)`?<br><br>
**Hint 3:** There is only 1 path to reach `(0, j)` from `(0, 0)`. Similarly, there is only 1 path to reach `(i, 0)` from `(0, 0)` <br><br>
**Hint 4:** For any cell `(i, j)` where `i>0` and `j>0`, the number of paths to reach it is the sum of the number of paths to reach the cell above it and the cell to the left of it. <br><br>




---

```python
def num_paths(m, n):
    # Fill in the code to calculate the number of paths recursively
    pass

# Test cases
print(num_paths(3, 4))  # Expected output: 35
print(num_paths(5, 2))  # Expected output: 21
```

---

**Problem Statement 7: Find the minimum number of tiles**

You have an unlimited supply of square tiles of size `2^i x 2^i` such as `1x1`, `2x2`, and `4x4`, `8x8` and so on. You want to tile a floor of size `n x m`. Write a function `min_tiles(n, m)` that calculates the minimum number of tiles required to tile the floor of size `n x m`.

```python
def min_tiles(n, m):
    # Fill in the code to calculate the minimum number of tiles required
    pass

#Test cases
print(min_tiles(3, 3))  # Expected output: 6 (5 1x1 tiles and 1 2x2 tile)
print(min_tiles(2, 4))  # Expected output: 2 (2 2x2 tiles)
print(min_tiles(5, 2))  # Expected output: 4 (2 1x1 tiles, 2 2x2 tiles)
```

---

**Problem Statement 8: Recursively Find the Greatest Common Divisor (GCD)**

Write a recursive function `gcd(a, b)` that calculates the greatest common divisor (GCD) of two positive integers `a` and `b`.

Your task is to implement the function `gcd(a, b)` using recursion. The function should return the GCD of `a` and `b`. Try to solve this question without using hints first. If you get stuck, you can refer to the hints below.

**Hint 1:** The Euclidean algorithm for finding the GCD of two numbers states that the GCD of `a` and `b` is the same as the GCD of `b` and `a % b`.<br><br>
**Hint 2:** You should ensure that recursion makes subproblems that are smaller than the original problem. One way to help with this is to always keep the smaller number as the first argument of the recursive calls. <br><br>
**Hint 3:** We already know that the gcd of 0 and a number is the number itself. This can be used as the base case. <br><br>

---

```python
def gcd(a, b):
    # Fill in the code to calculate the GCD recursively
    pass

# Test cases
print(gcd(24, 36))  # Expected output: 12
print(gcd(81, 153))  # Expected output: 9
```

