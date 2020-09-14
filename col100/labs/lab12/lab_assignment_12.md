# Lab Assignment 12

## Section A : Debugging
### Brief exercise on gdb
* Carefully read this code and download the cpp file ( [fibonacci.cpp](fibonacci.cpp) ). Observe that this a problem from the Minor 1 exam. This is code to find the nth fibonacci number (given n).
 
```cpp
1  #include <iostream>
2  using namespace std;
3  int fib(int n)
4  {
5      if(n==1 || n==2) return 1;
6      int prev1 = 1, prev2 = 1;
7      for(int i = 3; i <= n; i++)
8      {
9          int fib = prev1 + prev2;
10         prev2 = prev1;
11         prev1 = fib;
12     }
13     return prev1;
14 }
15 int main()
16 {
17     int n = 1;
18     cin>>n;
19     cout<<"nth Fibonacci number is "<<fib(n)<<endl;
20     return 0;
21 }
```

* Compile the above code with the `-g flag` as shown below. The flag ensures that the compiled program has required debugging information to work with gdb  
  ```
  g++ fibonacci.cpp -g -o fib
  ```
* Now try executing the above generated executable.
  
  ```
  $ ./fib
  4 
  nth Fibonacci number is 3
  ```
   
* Now we try running the above executable with a debugging tool called gdb.  
  ```
  gdb fib
  ```
* ***Breakpoints***  
  * Breakpoints allow you to stop program execution at a given line number
  * We add a break point at line number 17 in the above code, i.e. `int n = 1;` like this:  
    ```
    b fibonacci.cpp:17
    ```
  * Now that we have added a breakpoint, we start the executable by executing `r` or `run`.  gdb will now start executing the program `fib`.
  * The code should break/stop at the above line.
* ***Printing***
  * Try printing the current value of variable n as follows:  
    ```
    print n
    ``` 
    or  
    ```
    p n
    ```  
    
  * Is the printed value of n = 1 ?  
    > **NO**, because the command `int n = 1` has not yet been executed.  
  * To execute/move forward by a command, enter `step` or `s`.
  * Now try printing n again as described above. The value should change since the command at line 17 is executed.
  * To print the active breakpoints at any time, enter `info break`.  
  * We now delete the breakpoint added at line 17 using `delete 1` or `d 1` to delete the first breakpoint.
  * Add a new breakpoint at line 10 to observe the values of successive fibonacci numbers as they get evaluated.
  * Enter `c` and press enter to continue the program execution, input a value for n ( >= 3 ) and press enter to run the code for nth fibonacci number.
  * You should break at line number 10. Try printing the value of variable `fib` at this point. What do you think it should be? Does it match your expectation?
  
* ***Backtrace***
  * Run the command `bt` and observe the output. This command outputs your location in the code in terms of functions that have been called. For instance, we are currently at line 10 inside the fib() function which in turn was called by the main() function.
  * In what order does backtrace output the functions that are currently being called. ( Innermost first vs Outermost first )?
* To observe the rest of the run, continue (`c`) the code. Do you hit the breakpoint at line 10 again?
  * If yes, try printing fib again and continue.
  * These printed values should be the successive fibonacci numbers.
  * If **NO**, why? How is this related to the value of n input by you?

### Catching errors using gdb
* We try to detect and debug some common kinds of faults that one can run into while programming in C++. Carefully read the code below. ( [faults.cpp](faults.cpp) )

```cpp
   1 #include <iostream>
   2 using namespace std;
   3 int main()
   4 {
   5     int numbers [] = {3, 4, 9, 16};
   6     for(int i = 0; i<4; i++)
   7     {
   8         cout<<numbers[i]<<" divided by i is "<<(numbers[i]/i)<<endl;
   9     }
  10 }  
```
* Compile the above code: `g++ faults.cpp -g -o faults` and open the executable with gdb `gdb faults`.
* Now run the executable ( `r` ) once gdb is loaded.
* What kind of fault do you run into?
* What line number does the fault occur at? Why? (Hint: Try printing the value of `i` at this point.)
* Quit gdb using `q` or `quit`.
* Replace `numbers[i]/i` with `numbers[i]/(i+1)` in the division operation at `line 8` in `faults.cpp`.
* Save this modified file and compile it again. Run the executable using gdb.
* Enter `r` to run the program again, **NOW**:
  * Do you run into a fault again?
  * If NOT, how did the fault get fixed?

---

## Clone the Queue

* You are provided a queue of strings.
* Your job is to write code that clones all the strings in the queue and adds them at the back **IN ORDER**

> **Example**  
> Original Queue :  **FRONT** -> "alpha" | "beta" | "gamma"  <- **BACK**  
> Required Queue :  **FRONT** -> "alpha" | "beta" | "gamma" | "alpha" | "beta" | "gamma"  <- **BACK**  

* You can **only use additional queues/stacks** to achieve the same.
* Complete the code that can be downloaded here: [clone.cpp](clone.cpp)

```cpp
queue<string> clone(queue<string> input_queue)
{
    // Modify and return the input_queue after cloning
    return input_queue;
}
```

---

## Balanced Parentheses

* Mr. Thanos likes perfect balance in life, universe and everything and is very particular about it.
* One day, he comes across a string consisting of parentheses, both `(` and `)`
* He wants to find if the parentheses are balanced, that is every `)` has a corresponding matching `(`.

#### Example: 
Consider the following string:
```
(()())
```
Here, every `)` has a corresponding matching `(`. Hence this is balanced.

However, consider the following string:
```
()())
```
Here, the `)` at the last position, does not have a matching `(`. Hence this is not balanced.


* He does not need infinity stones, but he might need to use a stack to accomplish this.
* Can we match a `)` with the **LAST** encountered unmatched `(` as we read the string from left to right?
* How can a stack help with maintaining the last encountered unmatched `(`?
* Implement the following function:

```cpp
bool isBalanced ( string input_string )
{
  // Return true if parentheses in input_string are balanced, false otherwise
} 
```

---

## One more minute please!

* There are `n` people of your COL100 class, sitting in a circle, appearing for the minor exam. You, being in the class, are also a part of this group.
* In the previous examinations, you had to ask the invigilator for an extra minute, to scribble some last minute answers on your sheet, when he or she comes to you for paper collection.
* In COL100, your instructors have instructed the invigilators to follow a particular strategy to collect the papers, which is outlined below.
* The collection begins at a given fixed point in the circle and proceeds around the circle in a fixed direction. 
* In each step, a certain number of people are skipped and the next person's paper is collected. This person is then asked to leave the exam hall. 
* The collection proceeds around the circle (which is becoming smaller and smaller as the people submit their papers and leave), until only the last person remains, whose paper is collected and the collection process completes. 
* Given the total number of students `n` and a number `k` which indicates that `k-1` persons are skipped and `k-th` person's paper is collected. 
* The task is to choose the place in the initial circle so that you are the last one to submit the paper and hence get your extra one minute.

#### Example:
Consider `n = 5` and `k = 2`. Here, the last person to submit is at position 3. 

Initially, the circle can be represented in a linear fashion as follows:
```
.1 2 3 4 5
```
Here, the `.` is put before the element from where we begin counting for `k`.

The first person to submit is `2`. The state changes as follows:
```
1 .3 4 5
```

The next person to submit will be `4`. The state changes as follows:
```
1 3 .5
```

The next person to submit will be `1`. The state changes as follows:
```
.3 5
```

The next person to submit will be `5`. The state changes as follows: 
```
.3
```

Since `3` is the last person to remain, he submits at the end. Hence, the solution is `3`.

* It appears in the above example as if the students are standing in a queue.
* What should we do if we wish to collect the paper from the person at the front of the queue?
* What should we do if we wish to skip the person at the front of the queue?
* When do we stop collection the papers from the people in the queue?
* You must implement the solution as a function that takes parameters n and k and outputs the last position:

```cpp
int getLastPosition( int n, int k )
{
  // Your code goes here
}
```
