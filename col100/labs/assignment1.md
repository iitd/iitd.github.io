# Lab 1: Introduction to Linux, Python Setup, and Your First Python Program

## Objectives
- Learn basic Linux terminal commands
- Set up Python3 on your local system
- Write and run your first Python program

## Setup (To be done in class)
Before we begin with the lab assignment, make sure you have the following setups done with the help of your TAs:
- Proxy login for internet access
- Getting to know VPL (Virtual Programming Lab) environment

## Part 1: Basic Linux Terminal Commands

1. **Open the Terminal**
   - **Windows**: Use Windows Subsystem for Linux (WSL) or Git Bash.
   - **macOS**: Open Terminal from Applications > Utilities.
   - **Linux**: Open Terminal from your applications menu.

2. **Basic Commands**
   - `pwd`: Print Working Directory
     ```sh
     pwd
     ```
     Outputs the current directory you are in.

   - `ls`: List Directory Contents
     ```sh
     ls
     ```
     Lists files and directories in the current directory.

   - `cd`: Change Directory
     ```sh
     cd /path/to/directory
     ```
     Changes the current directory to the specified path.

   - `mkdir`: Make Directory
     ```sh
     mkdir my_directory
     ```
     Creates a new directory named `my_directory`.

   - `touch`: Create a New File
     ```sh
     touch myfile.txt
     ```
     Creates a new empty file named `myfile.txt`.

   - `rm`: Remove File
     ```sh
     rm myfile.txt
     ```
     Deletes the file named `myfile.txt`.

   - `rmdir`: Remove Directory
     ```sh
     rmdir my_directory
     ```
     Deletes the directory named `my_directory` (must be empty).

   - `cp`: Copy Files or Directories
     ```sh
     cp source_file destination_file
     ```
     Copies `source_file` to `destination_file`.

   - `mv`: Move or Rename Files or Directories
     ```sh
     mv old_name new_name
     ```
     Renames `old_name` to `new_name` or moves `old_name` to `new_name` if it is a path.

3. **Exercise**:
   - Create a directory named `<YourEntryNumber>_COL100` (Eg `2024CS10001_COL100`).
   - Inside `<YourEntryNumber>_COL100`, create a file named `hello.txt`.
   - List the contents of `cs_intro` to verify the file exists.
   - Rename `hello.txt` to `welcome.txt`.
   - Delete `welcome.txt`.

## Part 2: Setting Up Python3

1. **Check if Python is Installed**
   ```sh
   python3 --version
   ```
   If Python is installed, it will display the version number.

2. **Installing Python3**
   - **Windows**:
     - Download the Python installer from [python.org](https://www.python.org/downloads/).
     - Run the installer and follow the instructions (ensure "Add Python to PATH" is checked).
   - **macOS**:
     - Python3 usually comes pre-installed. Use `python3 --version` to check.
     - If not, install it using Homebrew:
       ```sh
       /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
       brew install python3
       ```
   - **Linux**:
     - Install Python3 using your package manager:
       - Debian/Ubuntu:
         ```sh
         sudo apt update
         sudo apt install python3
         ```
       - Fedora:
         ```sh
         sudo dnf install python3
         ```

3. **Verify the Installation**
   ```sh
   python3 --version
   ```
   You should see the version number of Python3.

## Part 3: Writing and Running Your First Python Program

1. **Create a New Python File**
   - Navigate to your `cs_intro` directory:
     ```sh
     cd cs_intro
     ```
   - Create a new file named `hello.py`:
     ```sh
     touch hello.py
     ```

2. **Write Your First Python Program**
   - Open `hello.py` in a text editor (nano, vim, VS Code, etc.):
     ```sh
     nano hello.py
     ```
   - Add the following code to `hello.py`:
     ```python
     print("Hello, world!")
     ```
   - Save and exit the editor (in nano, press `CTRL + X`, then `Y`, then `Enter`).

3. **Run Your Python Program**
   ```sh
   python3 hello.py
   ```
   You should see the output:
   ```
   Hello, world!
   ```

## Additional Resources
- [Linux Command Line Cheat Sheet](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)
- [Python Official Documentation](https://docs.python.org/3/)