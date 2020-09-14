# Lab Assignment 13

## Problem 1: Get val soon! (15 Marks)

In this problem, we will model a very simple machine. This machine operates on integers. The operation of this machine is described in the next paragraph.

This machine has a `storage` and operates on an `input`. The input consists of space separated `integers` or `operators`. The operators belong to `+`, `-`, `*`.

Whenever the machine gets an `integer` as input, is puts the integer into the storage. Whenever the machine gets an operator as input, it removes the last `two` integers put into the storage, performs the relevant operation with these integers as input and store the result back into the storage.

While performing the operation, the number which was stored `later`, in the storage, goes on the `RHS` of the operator, and the other number goes to the `LHS`.

Your task is to implement and efficient method to compute the result of a given input sequence. The input sequence could contain any number of space separated entities (integers or operators). 

You have to implement the following function:

```cpp
void compute_result(string infilename, string outfilename) {
    // Complete the  function. DO NOT WRITE A MAIN
    // DO NOT CHANGE THE FUNCTION NAME
    // Write your code below
}
```

Here, `infilename` and `outfilename` are the input and output filenames respectively.

**EXAMPLE** 

Consider the input sequence as follows, read from the `inputefilename`:

```
20 32 + 11 6 * -
```


Here, `20` goes into the storage first, followed by `32`. Once `+` is received as input, the last two numbers stored were `32` and `20`. You remove `32` and `20`. At this stage the storage is empty. Now, you perform the operation.

Here, the number `32` went into the storage, later than `20`. Hence, `32` goes on the `RHS`. Thus, `20 + 32 = 52`. The result  `52` is stored back into the storage. 

Now, `11` goes into the storage, followed by `6`. At this stage, storage contains `52 11 6`.

Once `+` is received as input, the last two numbers stored were `11` and `6`. You remove `11` and `6`. Now, you perform the operation.

Here, the number `6` went into the storage, later than `11`. Hence, `6` goes on the `RHS`. Thus, `11 * 6 = 66`. The result  `66` is stored back into the storage. 

At this stage, storage contains `52 66`.

Once `-` is received as input, the last two numbers stored are `52` and `66`. You remove `52` and `66`. Now, you perform the operation.

Here, the number `66` went into the storage, later than `52`. Hence, `66` goes on the `RHS`. Thus, `52 - 66 = -14`. The result  `-14` is stored back into the storage. 

Since, no further elements are in the input, the final result is `-14`.

The final output stored in the file `outfilename`, is:

```
-14
```

**CONSTRAINTS**

* The size of the input sequence varies from `15` to `255`.
* Time limit: `2s`

## Problem 2: Goods for nothing! (15 Marks)

You have to deliver goods to a group of houses which lie along a circle. At every house, you collect some amount of money in exchange for the goods. The next house is some distance apart and you have to spend `1` unit of money to travel `1` unit of distance towards the next house. 

You and your friend begin the delivery process at one of the houses, with no money in your pocket. Your friend decides to wait at the starting point while you have to visit all the houses, in the order they appear along the circle and meet your friend back at the starting position.

If after delivering the good at a house, the net amount of money in your pocket goes less than the amount required to travel to the next house, you won't be able to go any further and hence won't be able to complete the delivery process.

You will be given a list containing the payment to be collected at every house and the distance to the next house, in order, along the circle. Your task is to output the `first` such index of a house in the list, from which you should start, so that you can successfully complete the delivery process and reach back at the starting point.

You have to implement the following function:

```cpp
void compute_first_index(string infilename, string outfilename) {
    // Complete the  function. DO NOT WRITE A MAIN
    // DO NOT CHANGE THE FUNCTION NAME
    // Write your code below
}
```

**EXAMPLE** 

Consider the following list of houses, as read from file `infilename`:

```
4 6
6 5
7 3
4 5
```

Here, The every line corresponds to a house. Thus, the `4` lines correspond to house numbers `0` to `3`. 

In each line, the first number corresponds to the `payment` to be collected from that house and the second number corresponds to the `distance` for the next house from this house.

Let us see what is the first such index, starting from `0` from where we can successfully complete the tour.

* Starting from index `0`
    - Right at the first house, you collect `4` units of money and require `6` units for money to reach the next house. Hence the delivery process can't continue
* Starting from index `1`
    - At the first house (index `1`), you collect `6` units and have to spend `5` units to reach the next house.
    - At the next house (index `1`), you have `1` unit of money remaining. Here, you collect `7` units of money and have to spend `3` units to reach the next house.
    - At the next house (index `2`), you have `5` unit of money remaining. Here, you collect `4` units of money and have to spend `5` units to reach the next house.
    - At the next house (index `0`), you have `4` unit of money remaining. Here, you collect `4` units of money and have to spend `6` units to reach the next house.
    - Finally you reach house `1` again.
* Hence, the output for the given input will be `1`

The final output written in file `outfilename`, will be:

```
1
```

**CONSTRAINTS**

* The size of the list varies from `1` to `40000`.
* The time limit will be `2s`.
* You can assume that there will `always` exist an index starting at which, you can complete the circle.

**HINTS**

* There exist a solution where you can start from all the indices and check if the tour can be completed. What is the complexity of such a solution?
* If we start from an index and then at some point realise that we can't successfully complete the delivery process, we would have already computed the net amount required to reach the current point from the starting point. How can we avoid recomputing this value when we try out the next index? Can we reuse this value in some way to compute the net amount when we start from the next index?
* Finally, at any point of time, we are only concerned with the starting index and the index we are currently at.

## Problem 3: Copy with Karan! (20 Marks)

Your friend Karan has been assigned the task to a implement a very simple plagiarism checker. He has asked for your help.

We say 2 students have copied off each other if -
    * The number of unique words their answers have in common in greater than a given threshold X.
    * Out of the words that are common, at least Y percentage have the same number of occurrences in both the answers.

Given 2 strings corresponding to the students' answers and 2 integers corresponding to the above thresholds, you have to implement the following function.

```cpp
bool plagiarism_checker(string s1, string s2, int X, int Y) {
  // Return true if the answers are have been copied, 
  // false otherwise.
}
```

**EXAMPLE**

Consider `X = 8, Y=80`, and the 2 strings:
```
s1 = "A set can be used to count the number of unique words in some text."
s1 = "Sets, which are a part of the STL library of collections, are used to count the number of words in texts."
```

There are 9 common words - `a, used, to, count, the, number, of, words, in`, and hence the 1st condition is satisfied.

Out of these, 7 words: `a, used, to, count, number, words, in` have the same number of occurrences in both `s1` and `s2`. Since 7/9 is less than 80%, the second condition is not satisfied and hence the answer is false.