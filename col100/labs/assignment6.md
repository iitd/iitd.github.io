# Lab 6: Introduction to Lists, Tuples, and Strings

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

**Problem Statement 1: Matrix Multiplication**

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

    Example:
    # Each inner list in the matrix represents a row.
    A = [[1, 2, 3], [4, 5, 6]]
    B = [[7, 8], [9, 10], [11, 12]]
    print(matrix_multiplication(A, B))  # Output: [[58, 64], [139, 154], [220, 244]]
    """



    # Fill in the code to multiply the matrices A and B here
    pass
```

---

**Problem Statement 2: Flattening a Nested List**

You are given a nested list of integers. Write a function `flatten_list(nested_list)` that flattens the nested list into a single list by removing the nesting. Your task is to implement the function `flatten_list(nested_list)` that takes a nested list as input and returns a single flattened list.

**Hint:** think of recursion.

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
```


