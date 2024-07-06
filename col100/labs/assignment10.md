# Lab 10: More on Recursion

Recursion and backtracking can often be used to solve complex problems by breaking them down into simpler subproblems. In this lab, you will practice writing recursive functions to solve various problems.

## Example problem
Given a list of `n` integers, write a function which calculates all possible distinct sums that can be obtained by adding some `k` integers in the list. The function should return a list of all distinct sums in ascending order.

```python
def distinct_sums(numbers, k):
    """
    Calculate all possible distinct sums by adding k integers from the list.
    """
    # We observe the following while creating our subproblem:
    # 1. In the collection of all possible sums, we have the sums which do not include the 1st element of the list, and the sums which include the 1st element of the list.
    # 2. The sums which do not include the 1st element of the list are the same as the sums obtained by adding k integers from the remaining list.
    # 3. The sums which include the 1st element of the list are the sums obtained by adding (k-1) integers from the remaining list, plus the 1st element of the list.
    # 4. We can use the above observations to create our recursive function.

    #Note the base case is when the list is empty, the answer is [0]
    def distinct_sums_helper(numbers, start_index, k):
        if k == 0: # when we add k = 0 integers, there is one value for sum of k integers which is 0
            return [0]
        if(len(numbers) - start_index == k): # when the number of integers in the list is equal to k, the sum of k integers is the sum of all integers in the list
            return [sum(numbers)]

        # Sums without the first element, we recursively calculate the sums of k integers from the remaining list and add it to our final list of sums
        sums = distinct_sums_helper(numbers, start_index+1, k)
        
        # Sums with the first element, we recursively calculate the sums of (k-1) integers from the remaining list and add the first element to it, adding this new list to our final list of sums
        sums += [numbers[0] + x for x in distinct_sums_helper(numbers, start_index+1, k - 1)]
        return list(set(sums)) # remove duplicate sums and sort the list

    return sorted(distinct_sums_helper(numbers, 0, k))
```

---

# Exercise Problems:

**Problem Statement 1: Calculate the power of a to the exponent x**

Write a recursive function `power(a, x)` that calculates the value of `a` raised to the power of `x`. Your task is to implement the function `power(a, x)` using recursion. The function should return the value of `a` raised to the power of `x`.

---

```python
def power(a, x):
    # Fill in the code to calculate the power recursively(you cannot use loops or the ** operator)
    pass
```

---

**Problem Statement 2: A more efficient way to calculate the power of a to the exponent x**

Write a recursive function `power(a, x)` that calculates the value of `a` raised to the power of `x`. Your task is to implement the function `power(a, x)` using recursion. The function should return the value of `a` raised to the power of `x`. Since here we are expecting efficiency, the values of x can be very large (upto 10^18). Return the remainder of the answer with 1000000007.

This time you can use the following property to calculate the power more efficiently:

- If `x` is even, then `a^x = (a^(k))^2` where `k = x/2`
- If `x` is odd, then `a^x = a * (a^(k))^2` where `k = (x-1)/2`


```python
def power(a, x):
    # Fill in the code to calculate the power recursively(you cannot use loops or the ** operator)
    pass
```

---

**Problem Statement 3:** Letter Combinations of a Phone Number: Given a string containing digits from 2-9, return all possible letter combinations that the number could represent. We note that on a phone, the digits 2-9 each have a set of characters associated with them, as in the following mapping:

```python
mapping = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz'
}

def letter_combinations(digits):
    """
    Given a string containing digits from 2-9, return all possible letter combinations that the number could represent.
    """
    # Fill in the code to calculate the letter combinations recursively
    pass
```

---

**Problem Statement 4:** Combination Sum: Given an array of distinct integers and a target number, return all unique combinations that sum to the target. The same number may be chosen from the array any number of times. The solution set must not contain duplicate combinations.

```python
def combination_sum(candidates, target):
    """
    Given an array of distinct integers and a target number, return all unique combinations that sum to the target.
    """
    # Fill in the code to calculate the combinations recursively
    pass
```

---

**Problem Statement 5:** Generate Parentheses: Given `n` pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

```python
def generate_parentheses(n):
    """
    Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
    """
    # Fill in the code to generate the parentheses recursively
    pass
```

---

**Problem Statement 6: Letter Tile Possibilities:** You have a set of tiles, where each tile has one letter `tiles[i]` printed on it. Return the number of possible non-empty sequences of letters you can make. For example for tiles = ['A', 'A', 'B'], the output is 8 as the possible sequences are ['A', 'A', 'B'], ['A', 'B', 'A'], ['B', 'A', 'A'], ['A', 'A'], ['A', 'B'], ['B', 'A'], ['A'], ['B'].

```python
def num_tile_possibilities(tiles):
    """
    Given a set of tiles, where each tile has one letter tiles[i] printed on it, return the number of possible non-empty sequences of letters you can make.
    """
    # Fill in the code to calculate the number of tile possibilities recursively
    pass
```

---

**Problem Statement 6: Print All Subsets: Write a recursive function to print all subsets of a set of a set of integers. Return your output as a list of list.

```python
def num_tile_possibilities(tiles):
    """
    Given a set of tiles, where each tile has one letter tiles[i] printed on it, return the number of possible non-empty sequences of letters you can make.
    """
    # Fill in the code to calculate the number of tile possibilities recursively
    pass
```

---

**Problem Statement 7:** You are given a 0-indexed integer array `nums` and an integer `k`. You are initially standing at index 0. In one move, you can jump at most `k` steps forward without going outside the boundaries of the array. That is, you can jump from index `i` to any index in the range `[i+1, min(n-1, i+k)]` inclusive. You want to reach the last index of the array. Find the minimum number of jumps required to reach the last index.

```python
def jump_game(nums, k):
    """
    Given a 0-indexed integer array nums and an integer k, find the minimum number of jumps required to reach the last index.
    """
    # Fill in the code to calculate the minimum number of jumps recursively
    pass
```

---

**Problem Statement 8:** Given a string `s`, with characters `(`, `)`, and `*`, return the number of ways to form a valid parenthesis string by replacing `*` with `(` or `)`

```python
def valid_parenthesis(s):
    """
    Given a string s, with characters (, ), and *, return the number of ways to form a valid parenthesis string by replacing * with ( or )
    """
    # Fill in the code to calculate the number of valid parenthesis recursively
    pass
```






