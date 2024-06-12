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

for i in range(1, 10, 1):  # Generates all numbers from 1 to 9
    print(i, end = " ")
# Output: 1 2 3 4 5 6 7 8 9

for i in range(1, 10, 2):  # Generates odd numbers from 1 to 9
    print(i, end = " ")
# Output: 1 3 5 7 9

for i in range(10, 1, -1):  # Generates all numbers from 10 to 2
    print(i, end = " ")
# Output: 10 9 8 7 6 5 4 3 2

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

**Example:**
```python
fruits = ["apple", "banana", "cherry"]
i = 0
while i < len(fruits):
    print(fruits[i])
    i += 1
# Output:
# apple
# banana
# cherry
```

**Conditional Statements**

## `if`, `elif`, `else`
Conditional statements allow you to execute certain blocks of code based on whether a condition is true or false. `elif` and `else` are optional. The conditions of `if`, `elif`, `else` are checked in sequence if the previous ones are not true. `else` (if present) will execute if none of the previous `if`, `elif` conditions hold. At most one block of code will execute among all the blocks for a single if-elif-else chain.

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

**Problem Statement 4: Pascal's Triangle**

Complete the function below to print Pascal's Triangle up to the row `n`. Pascal's Triangle is a triangular array of binomial coefficients. Row `n` of Pascal's Triangle contains `n` elements, which are the coefficients of the binomial expansion `(a + b)^n`. The k-th element in the `n`-th row is given by the formula `n! / (k! * (n-k)!)`. You can use the calculate_factorial(n)` function from the previous problem to calculate the factorial.



```python
def pascal_triangle(n):

    # Fill the code to print pascal_triangle till row n

# Test case
n = 5
pascal_triangle(n)
# Output:
# 1
# 1 1
# 1 2 1
# 1 3 3 1
# 1 4 6 4 1

```

---

# Additional Exercise Problems:

---

**Problem Statement 5: Constrained Multiple Sum**

Write a function `constrained_sum(start_num, end_num, L)` that calculates the maximum number of distinct integers in the inclusive range `[start_num, end_num]` which are multiples of either 3 or 5 but not both such that the sum of these integers is less than or equal to `L`. The function should return the number of distinct integers and the sum of these integers as a tuple `(num_distinct, sum_distinct)`.

```python
def constrained_sum(start_num, end_num, L):

    num_distinct = 0
    sum_distinct = 0

    # Fill the code to calculate the number of distinct integers and their sum

    return num_distinct, sum_distinct

# Test case
start_num = 1
end_num = 1000
L = 1000
print(constrained_sum(start_num, end_num, L))  # Output: (28, 983)
```

---

**Problem Statement 6: Fibonacci Series**
Write a function `fibonacci_series(n)` that prints the first `n` terms of the Fibonacci series. The Fibonacci series is a sequence of numbers in which each term is the sum of the two preceding terms, starting with 0 and 1. The first few terms of the Fibonacci series are 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.

```python
def fibonacci_series(n):

    # Fill the code to print the first n terms of the Fibonacci series starting at 0
    # You can print multiple values in a single line by printing each value using print(value, end = " ")

    if(n==1):
        print(0)
    elif(n==2):
        print(0, end = " ")
        print(1)
    else:
        a = 0
        b = 1
        print(a, end = " ")
        print(b, end = " ")
        for i in range(2, n):
            #Complete the code here

# Test case
n = 10
fibonacci_series(n)
# Output:
# 0 1 1 2 3 5 8 13 21 34
```

---

**Problem Statement 7: Alice and Bob play a game**
Alice and Bob are playing a game. Alice has `a` coins and Bob has `b` coins in their respective wallets intially. 
Each player performs the following moves in his/her turn(they alternate turns):
1. The player can keep their own wallet, or exchange their wallet with the other player.
2. The player must remove 1 coin from the wallet they have.
If a player is unable to perform any of the above moves, he loses the game. For example, if the player's current wallet has 0 coins, he loses the game as he cannot remove a coin from his/her wallet. 
Alice always starts the game. Assume that Bob and Alice are playing optimally(each player's moves maximize their chances of winning, keeping in mind that the other player is also playing to win). Write a function `game(a, b)` that determines the winner of the game. The function should return "Alice" if Alice wins, and "Bob" if Bob wins.



```python
def game(a, b):
    # Fill the code to determine the winner of the game
    # Return "Alice" if Alice wins, "Bob" if Bob wins

# Test cases
a = 5
b = 3
print(game(a, b))  # Output: Bob

a = 663
b = 812
print(game(a, b))  # Output: Alice
```

---

**Problem Statement 8: Collatz sequence**
A very famous unsolved problem in mathematics is the Collatz conjecture. The Collatz conjecture states that for any positive integer `n`, the following sequence will always reach 1:
1. If `n` is even, divide it by 2.
2. If `n` is odd, multiply it by 3 and add 1.
3. Repeat the process with the new value of `n`.

Task1: Write a function `collatz_sequence(n)` that prints the Collatz sequence starting from the positive integer `n` and ending when the sequence reaches 1.

Task2: Write a function `collatz_length(n)` that returns the length of the Collatz sequence starting from the positive integer `n` and ending when the sequence reaches 1. The length of the sequence is the number of terms in the sequence. You should be able to reuse most of the code in the `collatz_sequence(n)` function here as well.

Task3: Write a function `longest_collatz_sequence(start_num, end_num)` that returns the positive integer in the inclusive range `[start_num, end_num]` that has the longest Collatz sequence. If there are multiple integers with the longest Collatz sequence, return the smallest one. The function should return the integer with the longest Collatz sequence and the length of the sequence as a tuple `(num, length)`. You can use the `collatz_length(n)` function to calculate the length of the Collatz sequence for a given integer `n`.

```python
def collatz_sequence(n):
    # Fill the code to print the Collatz sequence starting from n and ending at 1
    # Print all the values from n to 1 of the Collatz sequence in a single line as space separated values

def collatz_length(n):
    # Fill the code to calculate the length of the Collatz sequence starting from n and ending at 1
    # Return the length of the sequence
    # You can reuse the code from collatz_sequence(n) here, but should not print anything and modify the code to return the length

def longest_collatz_sequence(start_num, end_num):
    longest_length = 0
    longest_num = 0
    
    # Fill the code to find the integer in the range [start_num, end_num] with the longest Collatz sequence
    # Return the integer with the longest Collatz sequence and the length of the sequence as a tuple

    return longest_num, longest_length

# Test cases
start_num = 1
end_num = 10
longest_num, longest_length = longest_collatz_sequence(start_num, end_num)
print(longest_num, longest_length)  # Output: 9 20
collatz_sequence(longest_num)  # Output: 9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
```









