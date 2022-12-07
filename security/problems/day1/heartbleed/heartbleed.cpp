#include <iostream>
#include <stdlib.h>
#include <string.h>
#include <string_view>

using namespace std;

constexpr std::string_view text_table[] = {"IIT Delhi", "WSS22", "passw0rd!!"};

int main(int argc, char** argv)
{
  int text_index = 0;
  if (argc > 1) {
    text_index = stoi(argv[1]);
  }
  if (text_index > 1) {
    cerr << "Error: only the first two buffers can be accessed.\n";
    return 1;
  }
  std::string_view text = text_table[text_index];

  int length = text.size();
  if (argc > 2) {
    length = stoi(argv[2]);
  }
  cout << "Length: " << length << endl;
  if (text.size() - length < 0) {
    cerr << "Error: buffer is only " << text.size() << " characters long\n";
    return 1;
  }
  char to_print[length + 1];
  memcpy(to_print, text.begin(), length);
  for (size_t i = 0; i < length; i++) {
    if (to_print[i] == '\0') {
      to_print[i] = '.';
    }
  }
  to_print[length] = '\0';
  cout << to_print << endl;
  return 0;
}
