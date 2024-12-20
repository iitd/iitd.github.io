## Lab 2: Introduction to Python Programming

### Objective
- Gain familiarity with Python programming fundamentals including console input/output parsing, basic arithmetic operations, and logical operators.

### Introduction to Input/Output Parsing

In Python, you can read input from the console using the `input()` function and display output using the `print()` function.

#### Example:
```python
# Reading input from the user
name = input("Enter your name: ")
age = int(input("Enter your age: "))

# Displaying output
print("Hello,", name)
print("Your age is", age)
```

### Operators

#### Arithmetic Operators:
- `+` (Addition)
- `-` (Subtraction)
- `*` (Multiplication)
- `/` (Division)
- `//` (Floor Division)
- `%` (Modulus)
- `**` (Exponentiation)

#### Logical Operators:
- `and` (Logical AND)
- `or` (Logical OR)
- `not` (Logical NOT)

#### Relational Operators:
- `>` (greater than)
- `>=` (greater than or equal to)
- `<` (less than)
- `<=` (less than or equal to)
- `==` (equal to) [*Note*: `=` is used for assignment, `==` is used for comparison]
- '!=' (not equal to)

### Examples:

#### Arithmetic Operators:

```python
# Arithmetic Operators
num1 = 10
num2 = 3

# Addition
addition = num1 + num2  # Output: 13

# Subtraction
subtraction = num1 - num2  # Output: 7

# Multiplication
multiplication = num1 * num2  # Output: 30

# Division
division = num1 / num2  # Output: 3.3333333333333335

# Floor Division
floor_division = num1 // num2  # Output: 3

# Modulus
modulus = num1 % num2  # Output: 1

# Exponentiation
exponentiation = num1 ** num2  # Output: 1000
```

#### Logical Operators:

```python
# Logical Operators
num1 = 10
num2 = 20

# Logical AND
logical_and = (num1 > 0) and (num2 < 30)  # Output: True

# Logical OR
logical_or = (num1 > 0) or (num2 > 30)  # Output: True

# Logical NOT
logical_not = not (num1 > 0)  # Output: False
```

### Exercise Problems:

1. **Problem 1: Perform Arithmetic Operations**

    Fill in the code to perform arithmetic operations on two numbers. Use the given variables `num1` and `num2` and print the results of addition, subtraction, multiplication, division, and floor division. Floor division (`//`) returns the quotient without the remainder.

    ```python
    num1 = float(input("Enter the first number: "))
    num2 = float(input("Enter the second number: "))

    # Perform arithmetic operations
    addition =  # Fill in the code here
    subtraction =  # Fill in the code here
    multiplication =  # Fill in the code here
    division =  # Fill in the code here
    floor_division =  # Fill in the code here

    print("Addition:", addition)
    print("Subtraction:", subtraction)
    print("Multiplication:", multiplication)
    print("Division:", division)
    print("Floor Division:", floor_division)
    ```

2. **Problem 2: Calculate Area of a Rectangle**

    Fill in the code to calculate the area of a rectangle. Use the given variables `length` and `width` and print the area.

    ```python
    length = float(input("Enter the length of the rectangle: "))
    width = float(input("Enter the width of the rectangle: "))

    # Calculate the area of the rectangle
    area =  # Fill in the code here

    print("Area of the rectangle:", area)
    ```

3. **Problem 3: Calculate Area of a Circle**

    Fill in the code to calculate the area of a circle. Use the given variable `radius` and print the area. Use `math.pi` for the value of pi.

    ```python
    import math

    radius = float(input("Enter the radius of the circle: "))

    # Calculate the area of the circle
    area =  # Fill in the code here

    print("Area of the circle:", area)
    ```

4. **Problem 4: Calculate Compound Interest**

    Fill in the code to calculate the compound interest. Use the given variables `principal`, `rate`, `time`, and `n` (number of times interest applied per time period) and print the compound interest.

    ```python
    principal = float(input("Enter the principal amount: "))
    rate = float(input("Enter the annual interest rate (in decimal): "))
    time = float(input("Enter the time period (in years): "))
    n = float(input("Enter the number of times interest is compounded per year: "))

    # Calculate the compound interest
    amount =  # Fill in the code here
    compound_interest =  # Fill in the code here

    print("Amount:", amount)
    print("Compound interest:", compound_interest)
    ```

### Additional Exercise Problems:

5. **Problem 5: Check if a Number is Positive or Negative**

    Fill in the code to check if a number is positive, negative, or zero. Use the given variable `number` and print the result.

    ```python
    number = float(input("Enter a number: "))

    # Check if the number is positive, negative, or zero
    is_positive = # Fill in the code here
    is_negative = # Fill in the code here

    if is_positive:
        print(f"{number} is positive.")
    elif is_negative:
        print(f"{number} is negative.")
    else:
        print(f"{number} is zero.")
    ```

6. **Problem 6: Coin change calculator**

    Calculate the minimum number of coins of each denomination needed to have at least X cents (quarters: 25 cents, dimes: 10 cents, nickels: 5 cents, and pennies: 1 cent)

    ```python
    X = float(input("Enter change value in cents: "))

    # Check how many minimum coins of each denomination is needed individually to make the change
    quarters =  # Fill in the code here
    dimes =  # Fill in the code here
    nickels =  # Fill in the code here
    pennies =  # Fill in the code here


    print(f"Minimum quarters needed for {X} cents: {quarters}")
    print(f"Minimum dimes needed for {X} cents: {dimes}")
    print(f"Minimum nickels needed for {X} cents: {nickels}")
    print(f"Minimum pennies needed for {X} cents: {pennies}")

7. **Problem 7: Calculate the letter grade for given marks**

    Calculate the letter grade for a given percentage of marks. The grading system is as follows:
    - A: 80-100
    - A-: 72-79
    - B: 64-71
    - B-: 56-63
    - C: 48-55
    - D: 40-47
    - E: 30-39
    - F: 0-29

    ```python
    marks = float(input("Enter the percentage of marks: "))
    grade = ""

    # Calculate the letter grade based on the marks, replace the ... with appropriate conditions
    if ...:
        grade = "A"
    elif ...:
        grade = "A-"
    elif ...:
        grade = "B"
    elif ...:
        grade = "B-"
    elif ...:
        grade = "C"
    elif ...:
        grade = "D"
    elif ...:
        grade = "E"
    elif ...:
        grade = "F"
    else:
        grade = "Invalid"

    if grade != "Invalid":
        print(f"Grade for {marks}%: {grade}")
    else:
        print("Invalid percentage entered.")
    ```

8. **Problem 8: Swap three numbers**

    Swap the values of three variables `a`, `b`, and `c` to `b`, `c`, and `a` respectively. For example, if initially a = 11, b = 21, c = 31, after swapping, a = 21, b = 31, c = 11 must hold.

    **Hint**: You can use temporary variables to store the values during swapping.


    ```python
    a = input("Enter the first number: ")
    b = input("Enter the second number: ")
    c = input("Enter the third number: ")

    # Write the code to swap the values of a, b, and c

    print(f"After swapping, a = {a}, b = {b}, c = {c}")
    ```
