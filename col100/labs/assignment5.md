# Lab 5: Introduction to Recursion

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


**Problem Statement 2: Recursively Find the Greatest Common Divisor (GCD)**

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

---

**Problem Statement 3: Calculate the number of paths**

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