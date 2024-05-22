#include <iostream>
#include <queue>
#include <string>
using namespace std;
// Implement this function
queue<string> clone(queue<string> input_queue)
{
    // Modify and return the input_queue after cloning
    return input_queue;
}
void printQueue(queue<string> qu)
{
    while(!qu.empty())
    {
        cout<<qu.front()<<" ";
        qu.pop();
    }
    cout<<endl<<endl;
}
int main()
{
    queue<string> original_queue;
    original_queue.push("alpha");
    original_queue.push("beta");
    original_queue.push("gamma");
    cout<<"Original Queue:\n";
    printQueue(original_queue);
    queue<string> cloned_queue = clone(original_queue);
    cout<<"Output Queue:\n";
    printQueue(cloned_queue);
    return 0;
}
