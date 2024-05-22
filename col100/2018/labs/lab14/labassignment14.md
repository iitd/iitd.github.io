# Lab Assignment 14
---

## Not Alike

* You are given a vector array of integers. You can delete any number of elements from this array.
* You have to make all elements in the array ***equal***. Find the ***minimum*** number of elements that must be deleted to achieve the same.
* You are NOT supposed to modify given array, just calculate the minimum number of required deletes.

> ***Example***
> Array : {1, 34, 42, 34, 42, 34}
> If we delete all 1s and 42s from the above array  : 3 deletes
> If we delete all 1s and 34s from the above array  : 4 deletes
> If we delete all 34s and 42s from the above array : 5 deletes
> In each of the above cases we end up with equal numbers in the array. Therefore, ***minimum required deletes = 3***.

```cpp
int getMinimumDeletes( vector<int> &elements )
{
    // Implement this
}
```

* What data structure did you choose to solve the above. Why?

---

## Expanding obscure vocabulary

* You are given: 
  * collection of characters as a vector array,
  * an integer length k
* The objective is to print to stdout (output), all possible strings of length k that can be generated using the array of characters.

> ***Example***
> Array : { 'a', 'b' }, k = 3
> ***Output***
> aaa
> aab
> aba
> abb
> baa
> bab
> bba
> bbb

* You can output the strings/words in any order.
* Implement the following function interface:

```cpp
void printAllStrings( vector<char> &letters, int k )
{
    // Print all possible strings
}
```
---

## Subset Problem

* Given a array of integers, you have to print ***all the subsets*** of the set of integers in the array.
* Your implementation should ideally be a recursive one.

> Example:
> If S = {1,2,3}
> 
> Then the output should be:
> []
> [1]
> [1,2]
> [1,2,3]
> [1,3]
> [2]
> [2,3]
> [3]

* Note that you can print the subsets in any order.

```cpp
void printAllSubsets( vector<int> &elements )
{
	// Print all the subsets of the given array
}
```

---
## Tower of Hanoi

### Description
* We have been given 3 rods:
  * from_rod
  * to_rod
  * aux_rod
* N disks numbered from 1 to N.
* All the disks are of different sizes.
* If i < j, then size of disk i is less than the size of disk j.
* Initially, all the disks have been placed on from_rod in the ascending order of their sizes  
  > i.e. disk 1 on the top and disk N at the bottom.

### Constraints
* Your one move will consist of picking the upper disk from one of the rods and placing it on top of another rod. i.e.
  > Disk i: From Rod1 to Rod2
  * Which means disk i has been moved from Rod1 to Rod2.

* A disk can only be moved if it is the uppermost disk on a rod.
* Also, you cannot place a larger disk on the top of a smaller disk.

* You have to print a series of such moves to transfer all the disks from from_rod to to_rod. You may use aux_rod for intermediate steps.


You can also see the animation of the puzzle:
![Fibonacci solve](https://upload.wikimedia.org/wikipedia/commons/6/60/Tower_of_Hanoi_4.gif)
[Source: Wikipedia](https://www.wikipedia.org/)

***Example***:
 
Let us suppose there are 2 disks and the rods are:
* from_rod: A
* to_rod: B
* aux_rod: C
* If we call the function : towerOfHanoi(2, “A”, “B”, “C”), the output can be:
> Disk 1: From A to C
> Disk 2: From A to B
> Disk 3: From C to B

* Note: There can be multiple correct answers. You can print any of them.

```cpp
void towerOfHanoi(int num_of_disks, string from_rod, string to_rod, string aux_rod){
// Print required series of moves to solve the puzzle
}
```
