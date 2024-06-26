# Lab 8: Memoization and Dynamic Programming

## Introduction to Dynamic Programming

Dynamic programming is a method for solving complex problems by breaking them down into simpler subproblems and solving each subproblem only once. It is typically used when the subproblems overlap, i.e., when the same subproblem is encountered multiple times in the computation.

There are two main approaches to dynamic programming:

1. **Top-Down Approach (Memoization):** In this approach, we solve the problem recursively, but store the results of subproblems in a cache (memo) to avoid redundant calculations.

2. **Bottom-Up Approach (Tabulation):** In this approach, we solve the problem iteratively, starting from the smallest subproblems and building up to the final solution.

### Introduction to Memoization (Top-Down Dynamic Programming)

Memoization is an optimization technique used to store the results of expensive function calls and return the cached result when the same inputs occur again. It is a form of caching that can greatly improve the performance of recursive algorithms.

#### Example: Calculating Fibonacci Numbers with Memoization

Recall the naive version of the `fibonacci` function which returns the `n`th Fibonacci number starting from 0, 1, 1, 2, 3, 5, 8, 13, ...:

```python
def fibonacci(n):
    if n <= 1:
        return 1
    else:
    return fibonacci(n - 1) + fibonacci(n - 2)
```

Let's revisit the Fibonacci sequence and implement a memoized version of the Fibonacci function.

```python
def fibonacci(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    memo[n] = fibonacci(n - 1, memo) + fibonacci(n - 2, memo)
    return memo[n]
```

In this memoized version, we store the results of the Fibonacci function in a dictionary `memo`. If the result for a particular `n` is already computed, we return the cached result from the `memo` dictionary. This avoids redundant calculations and improves the performance of the Fibonacci function significantly.

### Bottom-Up Dynamic Programming (Tabulation)

In the bottom-up approach, we solve the problem iteratively by starting from the smallest subproblems and building up to the final solution. This approach is often more efficient than the top-down approach as it avoids the overhead of recursive function calls.

#### Example: Calculating Fibonacci Numbers with Tabulation

Let's implement the Fibonacci function using a tabulation approach:

```python
def fibonacci(n):
    if n <= 1:
        return n
    fib = [0, 1]
    for i in range(2, n + 1):
        fib.append(fib[i - 1] + fib[i - 2])
    return fib[n]
```

In this tabulation approach, we create a list `fib` to store the Fibonacci numbers iteratively. We start with the base cases `fib = [0, 1]` and calculate the Fibonacci numbers from `2` to `n` by summing the previous two numbers in the list.

## Exercise Problems

**Note:** Feel free to use additional helper functions to pass arguments like `memo` or `dp` to your functions, don't change the original function signatures.

**Example:** Fibonacci Number using Memoization without changing the original function signature `fibonacci(n)`

```python
def solve(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    memo[n] = solve(n - 1, memo) + solve(n - 2, memo)
    return memo[n]

def fibonacci(n):
    return solve(n, {})
```

**Problem Statement 1: Calculate the `n`th Lucas number**

The Lucas numbers are a series of numbers similar to the Fibonacci sequence, but with different initial values. The Lucas sequence starts as follows: 2, 1, 3, 4, 7, 11, 18, ...
Your task is to implement the function `lucas(n)` using dynamic programming. The function should return the `n`th Lucas number.

**Note: Your solution should run in O(n) time complexity and O(n) space complexity**
**Bonus: Can you do it in O(1) space complexity using bottom-up DP?**

```python
def lucas(n):
    # Fill in the code to calculate the nth Lucas number using dynamic programming
    pass

# Test cases
print(lucas(5))  # Expected output: 11

```

**Problem Statement 2: Calculate the number of ways to climb `n` stairs**

You are climbing a staircase. It takes `n` steps to reach the top. Each time you can either climb 1 or 2 or 3 steps. In how many distinct ways can you climb to the top?
Your task is to implement the function `climb_stairs(n)` using dynamic programming. The function should return the number of distinct ways to climb `n` stairs.

**Note: Your solution should run in O(n) time complexity and O(n) space complexity**
**Bonus: Can you do it in O(1) space complexity using bottom-up DP?**

```python
def climb_stairs(n):
    # Fill in the code to calculate the number of ways to climb n stairs using dynamic programming
    pass

# Test cases
print(climb_stairs(3))  # Expected output: 4
print(climb_stairs(5))  # Expected output: 13
```

**Problem Statement 3: Calculate the minimum cost to reach the bottom-right cell in a grid**

You are given a grid with cells from `(0, 0)` to `(m, n)`. **You can only move either down or right at any point in time**. Write a function `num_paths(m, n)` that calculates the number of unique paths to reach the bottom-right corner `(m, n)` of the grid from the top-left corner `(0, 0)` using dynamic programming.

**Note: This question was part of the additional exercises for Lab 7(Recursion). You can use the hints from that question here as well. However your solution should not be recursive**

```python
def num_paths(m, n):
    # Fill in the code to calculate the number of unique paths using dynamic programming
    pass

# Test cases
print(num_paths(3, 3))  # Expected output: 6
print(num_paths(7, 3))  # Expected output: 28


```

**Problem Statement 4: Robbing houses I**

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged **in a single row**. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers `nums` representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

Your task is to implement the function `rob(nums)` using dynamic programming. The function should return the maximum amount of money you can rob without alerting the police.

```python
def rob(nums):
    # Fill in the code to calculate the maximum amount of money you can rob without alerting the police using dynamic programming
    pass

# Test cases
print(rob([2, 3, 2]))  # Expected output: 4
print(rob([1, 2, 3, 1]))  # Expected output: 4
```

# Additional Exercise Problems

**Problem Statement 5: Robbing houses II**

After robbing those houses on the same street, the thief has found himself a new place for his thievery so that he will not get too much attention. This time, all houses at this place are arranged **in a circle**. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given a list of non-negative integers `nums` representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

Your task is to implement the function `rob_circle(nums)` using dynamic programming. The function should return the maximum amount of money you can rob without alerting the police.

```python
def rob_circle(nums):
    # Fill in the code to calculate the maximum amount of money you can rob without alerting the police using dynamic programming
    pass

# Test cases
print(rob_circle([2, 3, 2]))  # Expected output: 3
print(rob_circle([1, 2, 3, 1]))  # Expected output: 4
```

**Problem Statement 6: Number of ways to make `target` from coins of different denominations**

You are given an integer array `coins` representing coins of different denominations and an integer `target` representing a total amount of money you need to make using these coins. Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return `0`. You may assume that you have an infinite number of each kind of coin.
Your task is to implement the function `coin_change(coins, target)` using dynamic programming. The function should return the number of combinations that make up the target amount.

**Note: Your solution should run in O(n * target) time complexity**
```python
def coin_change(coins, target):
    # Fill in the code to calculate the number of combinations that make up the target amount using dynamic programming
    pass

# Test cases
coins = [1,2,5]
target = 10
print(coin_change(coins, target))  # Expected output: 10
```

**Problem Statement 7: Game of stones**

Alice and Bob are playing a game. They have `n` piles of stones in front of them arranged in a row from left to right. **Assume that `n` is even**. The game is played as follows with players alternating turns:
In each turn, the player can remove the leftmost pile of stones or the rightmost pile of stones in the current row and capture all the stones in that pile for himself. The player with the most stones collected at the end wins. Both players play optimally. **Assume Alice always has the first turn**

Given an integer array `piles` representing the number of stones in each pile, return the maximum number of stones Alice can collect. Your task is to implement the function `stone_game(piles)` using dynamic programming. The function should return the maximum number of stones Alice can collect assuming Bob plays optimally as well.

```python
def stone_game(piles):
    # Fill in the code to calculate the maximum number of stones Alice can collect using dynamic programming
    pass

# Test cases
print(stone_game([5, 3, 4, 5]))  # Expected output: 9
#Explanation: Alice can start by taking the 5 stones from the left. Then Bob will take the 5 stones from the right to minimise Alice's score. Alice can then take the 4 stones from the left and Bob will take the 3 stones from the right. Hence, Alice's best score will be 5 + 4 = 9
```

**Problem Statement 8: Longest common subsequence**

Given two strings `s1` and `s2`, return the length of their longest common subsequence. A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

**Hint:** to find the longest common subsequence among s1[i:] and s2[j:], if s1[i] == s2[j], then the longest common subsequence among s1[i:] and s2[j:] is 1 + the longest common subsequence among s1[i+1:] and s2[j+1:], otherwise, it is the maximum of the longest common subsequence among s1[i+1:] and s2[j:] and the longest common subsequence among s1[i:] and s2[j+1:]

```python
def longest_common_subsequence(s1, s2):
    # Fill in the code to calculate the length of the longest common subsequence using dynamic programming
    return -1

# Test cases
print(longest_common_subsequence("abcde", "ace"))  # Expected output: 3
print(longest_common_subsequence("abc", "def"))  # Expected output: 0
print(longest_common_subsequence("abcde","afedce"))  # Expected output: 3
```
