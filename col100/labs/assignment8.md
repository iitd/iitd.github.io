# Lab 7: File and Directory Operations, File I/O, and Reading Input

## File and Directory Operations

### Creating a Directory

To create a directory, use the `os.mkdir()` function. This function creates a new directory at the specified path.

```python
import os

# Create a directory named "example_dir"
os.mkdir("example_dir")
```

If you need to create multiple nested directories, use `os.makedirs()`.

```python
import os

# Create nested directories
os.makedirs("parent_dir/child_dir")
```

### Renaming a Directory

To rename a directory, use the `os.rename()` function. This function renames the directory from the old name to the new name.

```python
import os

# Rename the directory from "example_dir" to "new_example_dir"
os.rename("example_dir", "new_example_dir")
```

### Moving a Directory

To move a directory, use the `shutil.move()` function from the `shutil` module. This function moves the directory to the specified destination.

```python
import shutil

# Move the directory to a new location
shutil.move("new_example_dir", "moved_example_dir")
```

### Checking if a Directory Exists

To check if a directory exists, use the `os.path.exists()` function. This function returns `True` if the directory exists, and `False` otherwise.

```python
import os

# Check if the directory exists
if os.path.exists("moved_example_dir"):
    print("Directory exists")
else:
    print("Directory does not exist")
```

### Listing Directories

To list all directories in a given path, use the `os.listdir()` function. This function returns a list of all files and directories in the specified path.

```python
import os

# List all directories in the current directory
directories = [d for d in os.listdir(".") if os.path.isdir(d)]
print(directories)
```

### Deleting a Directory

To delete a directory, use the `os.rmdir()` function for an empty directory, or `shutil.rmtree()` for a directory that may contain files and subdirectories.

```python
import os
import shutil

# Remove an empty directory
os.rmdir("empty_dir")

# Remove a directory with contents
shutil.rmtree("dir_with_contents")
```

## File I/O

### Reading from Files

To read from a file, use the `open()` function with the `r` mode and then use the `read()`, `readline()`, or `readlines()` methods.

#### Example: Reading Entire File

```python
with open("example.txt", "r") as file:
    content = file.read()
    print(content)
```

#### Example: Reading File Line by Line

```python
with open("example.txt", "r") as file:
    for line in file:
        print(line.strip())
```

### Writing to Files

To write to a file, use the `open()` function with the `w` mode and then use the `write()` or `writelines()` methods.

#### Example: Writing to a File

```python
with open("example.txt", "w") as file:
    file.write("Hello, world!")
```

### Appending to Files

To append to a file, use the `open()` function with the `a` mode.

#### Example: Appending to a File

```python
with open("example.txt", "a") as file:
    file.write("\nThis is an appended line.")
```

### Copying File Contents

To copy the contents of one file to another, use the `shutil.copyfile()` function.

#### Example: Copying File Contents

```python
import shutil

shutil.copyfile("source.txt", "destination.txt")
```

### Merging Files

To merge the contents of two files, read both files and write their contents to a new file.

#### Example: Merging Files

```python
with open("file1.txt", "r") as file1, open("file2.txt", "r") as file2, open("merged.txt", "w") as merged_file:
    merged_file.write(file1.read() + "\n" + file2.read())
```

## Reading Input

### Reading a List of Space-Separated Integers

To read a list of space-separated integers, use the `input()` function and then split and convert the input.

#### Example: Reading Space-Separated Integers

```python
input_string = input("Enter space-separated integers: ")
numbers = list(map(int, input_string.split()))
print(numbers)
```

### Reading Multiple Lines of Input

To read multiple lines of input, use a loop that reads each line until a termination condition is met.

#### Example: Reading Multiple Lines

```python
print("Enter lines of text (type 'STOP' to end):")
lines = []
while True:
    line = input()
    if line == "STOP":
        break
    lines.append(line)
print(lines)
```

### Reading Multiple lines of input

In programming, input is often given as multiple lines, where the first line contains an integer `n`, followed by `n` lines of data.

#### Example: Reading multiple lines of input

```python
n = int(input())
data = []
for _ in range(n):
    data.append(input().strip())
print(data)
```

# Exercise Problems

**Problem 1:** Given a file with path `filename` containing a list of integers separated by spaces, write a Python program to read the file and print the sum of the integers.

```python
# Read the file and calculate the sum of integers
def sum_integers(filename):
    pass

```

**Problem 2:** Write a Python program that reads a file `input_file` containing a list of words separated by spaces and writes the unique words to a new file `output_file`, each on a new line in alphabetical order.
    
```python
# Read the file and write unique words to a new file
def unique_words(input_file, output_file):
    pass
```

**Problem 3:** Read a file `input_file` containing a variable number of space-separated strings in each line, in a word-by-word manner. When the word "STOP" is encountered, among these strings, stop reading the file and write each word read in `input_file` before "STOP" along with its frequency. Write the output to a new file `output_file` in the format `word: frequency`.

```python
# Read the file and write word frequencies to a new file
def word_frequencies(input_file, output_file):
    pass

# Example Test case

# input.txt: 
# apple banana apple cherry 
# mango apple banana STOP panda goose
# pumpkin apple cherry 

# output.txt:
# apple: 3
# banana: 2
# cherry: 1
# mango: 1

```

**Problem 4:** Given a list of directories `dirs`, write a Python program to create these directories if they do not exist. If the directories already exist, print a message indicating that the directory already exists. In each directory, create a file named `README.md` with the content "This is a README file for directory `dir_name`", where `dir_name` is the name of the directory.

```python
# Create directories and README files
def create_directories(dirs):
    pass
```

**Problem 5:** Modify line within file `filename` by replacing the line at index `line_number`(startin line is at index 1) with the new line `new_line`. Check if the line number is valid and return `True` if the line was modified successfully, `False` otherwise.


```python
def modify_line(filename, line_number, new_line):
    pass
```

**Problem 6:** Read CSV file. Given a file `filename` in the CSV format, write a Python program to read the file and return a dictionary where each dictionary represents a column with dictionary key as the column header and the value as a list of values in that column. The first row of the CSV file contains the column headers, separated by a comma. The subsequent rows contain the data, also separated by commas. The data in each row corresponds to the column header in the same position.

```python
# Read the CSV file and return a list of dictionaries
def read_csv(filename):
    pass

# Example Test case

# filename: data.csv
# Name,Age,Gender
# Alice,25,F
# Bob,30,M
# Charlie,35,M
# David,40,M

# Output:
# {'Name': ['Alice', 'Bob', 'Charlie', 'David'], 'Age': ['25', '30', '35', '40'], 'Gender': ['F', 'M', 'M', 'M']}

```

**Problem 7:** Write a Python program that reads all files within the current directory and does the following: 
1. It checks the file's extension and categorizes the files into different lists based on the extension. Files having no extensions are also a separate category. An extension is the part of the filename after the last dot.

2. For each category, it creates a new directory(if such a directory already does not exist) with the name of the directories being the extension name. It then moves the files to the corresponding directories.

```python
# Categorize files based on extension and move them to directories
def categorize_files():
    pass
```

**Problem 8:** Directory synchronization: Given two directories `dir1` and `dir2`, write a Python program to synchronize the contents of the two directories. The program should do the following:

1. If a file/folder exists in `dir1` but not in `dir2`, copy the file/folder from `dir1` to `dir2`.
2. If a file/folder exists in `dir2` but not in `dir1`, copy the file/folder from `dir2` to `dir1`.
3. If a file/folder exists in both directories but has different contents, overwrite the file/folder in `dir2` with the file from `dir1`.


```python
# Synchronize directories
def synchronize_directories(dir1, dir2):
    pass
```






