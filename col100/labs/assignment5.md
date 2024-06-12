# Lab 5: Abstract Data Types: Lists, Tuples, and Strings

## Lists

A list is a collection of items that are ordered, can be indexed, and are mutable. Lists are written with square brackets `[]`.

### Creating Lists

You can create a list by placing all the items (elements) inside square brackets, separated by commas.

```python
# Creating a list
fruits = ['apple', 'banana', 'cherry']
print(fruits)  # Output: ['apple', 'banana', 'cherry']

# Creating an empty list
empty_list = []

# Creating a list with different data types
mixed_list = [10, 'hello', True, 3.14]

# Nested lists
nested_list = [[1, 2, 3], ['a', 'b', 'c']]

# List with repeated elements
repeated_list = [1] * 5     # same as repeated_list = [1, 1, 1, 1, 1]

#Nested list with repeated elements
nested_repeated_list = [[0] * 3] * 4    # Same as nested_repeated_list = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]]

# List with range of numbers
numbers = list(range(1, 6))  # Output: [1, 2, 3, 4, 5]
```
### Length of list
You can find the length of a list using the len() function.

```python
# Length of list
print(len(fruits))  # Output: 3
```

### Accessing List Elements

You can access the elements of a list by indexing. The index starts at 0. You can also access elements in nested lists as shown below. <br>
You can also use negative indexing to access elements from the end of the list. The last element has an index of -1.


```python
# Accessing elements
print(fruits[0])  # Output: apple
print(fruits[1])  # Output: banana

# Accessing elements in nested list
print(nested_list[0][1])  # Output: 2
print(nested_list[1][2])  # Output: c

# Accessing elements using negative indexing
print(fruits[-1])  # Output: cherry (last element)
print(fruits[-2])  # Output: banana (second last element)

```

### Modifying List Elements

Lists are mutable, meaning you can change their elements.

```python
# Modifying elements
fruits = ['apple', 'banana', 'cherry']
fruits[1] = 'blueberry'
print(fruits)  # Output: ['apple', 'blueberry', 'cherry']
```

### Adding Elements to a List

#### `append()`

Adds a single element to the end of the list.

```python
fruits = ['apple', 'banana', 'cherry']
fruits.append('date')
print(fruits)  # Output: ['apple', 'banana', 'cherry', 'date']
```

#### `insert()`

Inserts an element at a specified position.

```python
fruits = ['apple', 'banana', 'cherry']
fruits.insert(1, 'blueberry')
print(fruits)  # Output: ['apple', 'blueberry', 'banana', 'cherry']
```

### Removing Elements from a List

#### `remove()`

Removes the first occurrence of a specified element.

```python
fruits = ['apple', 'banana', 'cherry']
fruits.remove('banana')
print(fruits)  # Output: ['apple', 'cherry']
```

#### `pop()`

Removes and returns the element at a specified position. If no index is specified, it removes and returns the last element.

```python
fruits = ['apple', 'banana', 'cherry']
fruits.pop()
print(fruits)  # Output: ['apple', 'banana']

fruits.pop(0)
print(fruits)  # Output: ['banana']
```

### Combining and Extending Lists

#### Concatenation

You can concatenate lists using the `+` operator.

```python
fruits = ['apple', 'banana']
more_fruits = ['cherry', 'date']
combined_fruits = fruits + more_fruits
print(combined_fruits)  # Output: ['apple', 'banana', 'cherry', 'date']
```

#### `extend()`

Adds all elements of an iterable to the end of the list.

```python
fruits = ['apple', 'banana']
more_fruits = ['cherry', 'date']
fruits.extend(more_fruits) # Equivalent to fruits = fruits + more_fruits
print(fruits)  # Output: ['apple', 'banana', 'cherry', 'date']
```

### Sorting Lists

#### `sorted()`

Returns a new sorted list from the elements of any iterable.

```python
fruits = ['banana', 'apple', 'cherry']
sorted_fruits = sorted(fruits)
print(sorted_fruits)  # Output: ['apple', 'banana', 'cherry']
print(fruits)  # Output: ['banana', 'apple', 'cherry']
```

#### `sort()`

Sorts the list in place.

```python
fruits = ['banana', 'apple', 'cherry']
fruits.sort()
print(fruits)  # Output: ['apple', 'banana', 'cherry']
```

### Copying Lists

#### `copy()`

Returns a shallow copy of the list.

```python
fruits = ['apple', 'banana', 'cherry']
fruits_copy = fruits.copy()
print(fruits_copy)  # Output: ['apple', 'banana', 'cherry']
```

### Slicing Lists

You can slice a list to get a subset of elements.

```python
numbers = [4, 7, 8, 2, 6, 5, 1]
print(numbers[1:3])  # Output: [7, 8]
print(numbers[:3])  # Output: [4, 7, 8]
print(numbers[3:])  # Output: [2, 6, 5, 1]
print(numbers[:])  # Output: [4, 7, 8, 2, 6, 5, 1]

#We can also use the slicing syntax start:stop:step to get elements at a specific step size from start/end
print(numbers[1:6:2])  # Output: [7, 2, 5] 
print(numbers[::2])  # Output: [4, 8, 6, 1] (prints the list starting at index 2 with step size 2)
print(numbers[::-1])  # Output: [1, 5, 6, 2, 8, 7, 4] (prints the reverse of the list)
print(numbers[5:1:-1])  # Output: [5, 6, 2, 8] (reverses the list from index 5 to 1)
print(numbers[6:0:-2]) # Output: [1, 6, 8] (reverses the list from index 6 to 0 with step size 2)
print(numbers[6:-1:-2]) # Output: [] (indices are out of bounds)
print(numbers[6::-2]) # Output: [1, 6, 8, 4] (reverses the list from index 6 to 0 with step size 2) 
```
---

## Tuples

A tuple is a collection of items that are ordered and unchangeable. Tuples are written with round brackets `()`.

### Creating Tuples

You can create a tuple by placing all the items (elements) inside round brackets, separated by commas.

```python
# Creating a tuple
colors = ('red', 'green', 'blue')
print(colors)  # Output: ('red', 'green', 'blue')
```

### Accessing Tuple Elements

You can access the elements of a tuple by indexing. The index starts at 0.

```python
# Accessing elements
print(colors[0])  # Output: red
print(colors[1])  # Output: green
```

### Tuples are Immutable

Once a tuple is created, you cannot change its elements.

```python
# Trying to modify elements will raise an error
# colors[1] = 'yellow'  # TypeError: 'tuple' object does not support item assignment
```

### Tuple Methods

Most of the methods between lists and tuples are similar. However, tuples have fewer methods compared to lists. Tuples do not have methods like `append()`, `insert()`, `remove()`, `pop()`, `extend()`, `sort()`, which attempt to modify the tuple as tuples are immutable.

---

## Strings

A string is a sequence of characters enclosed in single, or double quote

### Creating Strings

You can create a string by enclosing characters in quotes.

```python
# Creating a string
text = "Hello, world!"
print(text)  # Output: Hello, world!

text = 'Hello, world!'
print(text)  # Output: Hello, world!
```

### Accessing String Characters

You can access the characters of a string by indexing. The index starts at 0.

```python
# Accessing characters
print(text[0])  # Output: H
print(text[1])  # Output: e
```

### String Methods

Strings come with a variety of built-in methods.

```python
# String methods
print(text.upper())  # Output: HELLO, WORLD!
print(text.lower())  # Output: hello, world!
print(text.replace('world', 'Python'))  # Output: Hello, Python!
print(text.split(','))  # Output: ['Hello', ' world!']
print(text.startswith('Hel'))  # Output: True
print(text.endswith('world!'))  # Output: True
print(len(text))  # Output: 13

#String slicing is similar to list slicing
print(text[3:6]) # Output: lo,

```

### String Concatenation

You can concatenate strings using the `+` operator.

```python
# Concatenating strings
greeting = "Hello"
name = "Alice"
message = greeting + ", " + name + "!"
print(message)  # Output: Hello, Alice!
```

---

## Interconversion between Lists, Tuples, and Strings

The datatypes are easily interconvertible in Python. Given any iterable `x`, you can convert it to a list using `list(x)`, to a tuple using `tuple(x)`. The simplest way to make a string is to iterate over the elements of x and add it to a string
    
```python
x = ['ab', 'c', 'def', 4, 2]
string_x = ""
for i in x:
    string_x += str(i)
print(string_x)  # Output: 'abcdef42'
```

---

# Exercise Problems:

**Problem Statement 1: Matrix Transpose**

Given a matrix `A` of dimensions `m x n`, the transpose of the matrix `A` is a matrix `B` of dimensions `n x m` such that `B[i][j] = A[j][i]` for all `0 <= i < n` and `0 <= j < m`. Write a function `matrix_transpose(A)` that returns the transpose of the matrix `A`.

**Hint:** you can get the size of a matrix `A` using `len(A)` and `len(A[0])` to get the number of rows and columns respectively.

```python
def matrix_transpose(A):
    """
    Find the transpose of the given matrix A.
    
    Parameters:
    A (list of list of int/float): The input matrix with dimensions m x n.
    
    Returns:
    list of list of int/float: The transpose of the matrix A with dimensions n x m.
    """

    # Fill in the code to find the transpose of the matrix A
    pass

# Test cases
A = [[1, 2, 3], [4, 5, 6]]
print(matrix_transpose(A))  # Output: [[1, 4], [2, 5], [3, 6]]
```

---

**Problem Statement 2: Remaining Stone Weight**

You are given a list of integers `stones` representing the weights of stones. Each turn, you choose the two heaviest stones and smash them together. Suppose the stones have weights `x` and `y` with `x <= y`. The result of this smash is:
1. If `x == y`, both stones are destroyed, and removed from the list
2. If `x != y`, the stone of weight `x` is destroyed, and the stone of weight `y - x` is left in the list.

At the end of the game, there is at most one stone left. Return the weight of the remaining stone or 0 if there are no stones left.

Write a function `last_stone_weight(stones)` that takes a list of integers `stones` as input and returns the weight of the remaining stone.

```python
def remaining_stone_weight(stones):
    """
    Find the weight of the remaining stone after smashing the stones together.
    
    Parameters:
    stones (list of int): A list of integers representing the weights of stones.
    
    Returns:
    int: The weight of the remaining stone after smashing the stones together.

    """
    return -1

# Test cases
stones = [2, 7, 4, 1, 8, 1]
print(remaining_stone_weight(stones))  # Output: 1

```


---

**Problem Statement 3: Counting Vowels and Consonants in a String**

Write a function `count_vowels_consonants(text)` that takes a string `text` as input and returns a tuple containing the count of vowels and consonants in the text. The function should ignore case(treat uppercase and lowercase characters identically) and consider only alphabets as vowels/consonants. The tuple should contain the count of vowels followed by the count of consonants.

```python
def count_vowels_consonants(text):
    """
    Count the number of vowels and consonants in a given text.
    
    Parameters:
    text (str): A string containing alphabets.
    
    Returns:
    tuple: A tuple (vowels, consonants) containing the count of vowels and consonants in the text.
    """

    # Change the code below to count the number of vowels and consonants in text
    vowels = 0, consonants = 0
    return (vowels, consonants)

# Test cases
text = "Hello, World!"
print(count_vowels_consonants(text))  # Output: (3, 7)

```

**Problem Statement 4: Minimum Operations to make strings similar**
Two strings `s1` and `s2` are similar if you can make `s1` equal to `s2` by rearranging the letters of `s1`. You are given two strings `s1` and `s2`. Write a function `min_operations_to_make_similar(s1, s2)` that returns the minimum number of operations required to make `s1` and `s2` similar. The operations allowed are:
1. Add a character to `s1`
2. Remove a character from `s1`
3. Replace a character in `s1` with another character

```python
def min_operations_to_make_similar(s1, s2):
    """
    Find the minimum number of operations required to make s1 and s2 similar.
    
    Parameters:
    s1 (str): The first string.
    s2 (str): The second string.
    
    Returns:
    int: The minimum number of operations required to make s1 and s2 similar.
    """

    # Fill in the code to find the minimum number of operations required to make s1 and s2 similar
    pass

# Test cases
s1 = "abc"
s2 = "bca"
print(min_operations_to_make_similar(s1, s2))  # Output: 0

s1 = "abc"
s2 = "def"
print(min_operations_to_make_similar(s1, s2))  # Output: 3

s1 = "police"
s2 = "plantation"
print(min_operations_to_make_similar(s1, s2))  # Output: 6
```

---

# Additional Exercise Problems

---

**Problem Statement 5: Matrix Multiplication**

You are given two matrices `A` and `B` of dimensions `m x n` and `n x p` respectively. Write a function `matrix_multiplication(A, B)` that returns the product of the two matrices. The product matrix will have dimensions `m x p`. The matrices are represented as lists of lists. You can assume that the dimensions of the input matrices are such that the multiplication is possible.

**Hint:** you can get the size of a matrix `A` using `len(A)` and `len(A[0])` to get the number of rows and columns respectively.

```python
def matrix_multiplication(A, B):
    """
    Multiply two matrices A and B and return the result.
    
    Parameters:
    A (list of list of int/float): The first matrix with dimensions m x n.
    B (list of list of int/float): The second matrix with dimensions n x p.
    
    Returns:
    list of list of int/float: The product matrix with dimensions m x p.

    """



    # Fill in the code to multiply the matrices A and B here
    pass

# Test cases
A = [[1, 2, 3], [4, 5, 6]]
B = [[7, 8], [9, 10], [11, 12]]
print(matrix_multiplication(A, B))  # Output: [[58, 64], [139, 154], [220, 244]]
```

---

**Problem Statement 6: Checking Balanced Parenthesis**

Write a function `check_balanced_parenthesis(text)` that takes a string `text` as input and returns True if the string is a balanced parenthesis expression, and False otherwise. A balanced parenthesis expression is one where each opening parenthesis has a corresponding closing parenthesis and the pairs are properly nested with no isolated parentheses. The function should ignore all characters other than parentheses. Ignore all characters apart from parentheses `(` and `)`.

```python
def check_balanced_parenthesis(text):
    """
    Check if the given text has balanced parenthesis.
    
    Parameters:
    text (str): A string containing parentheses (and other characters which should be ignored)
    
    Returns:
    bool: True if the text has balanced parenthesis, False otherwise.
    """

    # Fill in the code to check if the text has balanced parenthesis
    pass

# Test cases
text = "(c((b)))d"
print(check_balanced_parenthesis(text))  # Output: True

text = "a(()s))"
print(check_balanced_parenthesis(text))  # Output: False

```

**Problem Statement 7: Match String Pattern**
Given a list of strings `L` and a pattern string `p`, write a function `match_string_pattern(L, s)` that returns a list of boolean values where the `i-th` element is `True` if the `i-th` string in the list `L` contains the pattern string `p`, and `False` otherwise.
A string `s` is said to contain a pattern string `p` if `p` is a subsequence of `s`. A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

```python
def match_string_pattern(L, p):
    """
    Check if the pattern string p is a subsequence of each string in the list L.
    
    Parameters:
    L (list of str): A list of strings.
    p (str): The pattern string to check.
    
    Returns:
    list of bool: A list of boolean values of the same length as L where the i-th element is True if the i-th string in the list L contains the pattern string p, and False otherwise.
    """

    # Fill in the code to check if the pattern string p is a subsequence of each string in the list L

    pass

# Test cases
L = ["hello", "world", "python", "programming"]
p = "on"
print(match_string_pattern(L, p))  # Output: [False, False, True, True]

L = ["travel", "timetable", "tickets", "hotel", "tolerance"]
p = "tel"
print(match_string_pattern(L, p))  # Output: [True, True, False, True, False]
```

**Problem Statement 8: Similar word strings**
A word string is a string that contains only alphabets and spaces and contains no leading or trailing spaces. The words in a word string are separated by one or more spaces. Two word strings `s1` and `s2` are said to be similar if I can find a word string `s3` and insert it into `s1` such that the result is identical to `s2` or vice versa. The entire string `s3` must be inserted without breaking it into separate parts. Write a function `similar_word_strings(s1, s2)` that returns True if the two word strings `s1` and `s2` are similar, and False otherwise. 

Treat the strings as case-sensitive.

```python
def similar_word_strings(s1, s2):
    """
    Check if the two word strings s1 and s2 are similar.
    
    Parameters:
    s1 (str): The first word string.
    s2 (str): The second word string.
    
    Returns:
    bool: True if the two word strings s1 and s2 are similar, False otherwise.
    """

    # Fill in the code to check if the two word strings s1 and s2 are similar
    pass

# Test cases
s1 = "hello world"
s2 = "world hello"
print(similar_word_strings(s1, s2))  # Output: False

s1 = "Hello My name is Alice"
s2 = "Hello Alice"
print(similar_word_strings(s1, s2))  # Output: True
```

