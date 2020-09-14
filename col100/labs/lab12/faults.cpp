# include <iostream>
using namespace std;
int main()
{
    int numbers [] = {3, 4, 9, 16};
    for(int i = 0; i<4; i++)
    {
        cout<<numbers[i]<<" divided by i is "<<(numbers[i]/i)<<endl;
    }
}
