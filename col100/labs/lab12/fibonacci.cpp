#include <iostream>
using namespace std;
int fib(int n)
{
    if(n==1 || n==2) return 1;
    int prev1 = 1, prev2 = 1;
    for(int i = 3; i <= n; i++)
    {
        int fib = prev1 + prev2;
        prev2 = prev1;
        prev1 = fib;
    }
    return prev1;
}
int main()
{
    int n = 1;
    cin>>n;
    cout<<"nth Fibonacci number is "<<fib(n)<<endl;
    return 0;
}
