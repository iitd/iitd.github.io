#include <array>
#include <chrono>
#include <algorithm>
#include <numeric>
#include <iostream>
#include <string_view>
#include <x86intrin.h>
#include <tuple>
#include <string.h>
#include <stdlib.h>
using namespace std;
#define NUM_CHARS 256

int step_size = 2048;
int num_runs = 1000;
int cache_warm_iter = 100;

static constexpr std::string_view password = "passw0rd!!";

static void force_read(uint8_t* p) { asm volatile("" : : "r"(*p) : "memory"); }

static int64_t read_tsc()
{
  unsigned int dummy;
  return __rdtscp(&dummy); 
}

int
get_winner(int const* arr, size_t n)
{
  int ret = 0;
  for (int i = 0; i < n; i++) {
    if (arr[i] > arr[ret]) {
      ret = i;
    }
  }
  return ret;
}

char
infer_byte(string_view const& text, int index)
{
  unsigned char timing_array[NUM_CHARS * step_size];
  memset(timing_array, 1, sizeof timing_array);

  char const* data = text.begin();

  int64_t latencies[NUM_CHARS];
  int scores[NUM_CHARS];

  for (int run = 0; run < num_runs; run++) {
    for (int i = 0; i < NUM_CHARS; i++) {
      _mm_clflush(&timing_array[i * step_size]);
    }

    //warm the cache for data[index]
    for (int i = 0; i < cache_warm_iter; i++) {
      force_read(&timing_array[data[index] * step_size]);
    }
    for (int i = 0; i < NUM_CHARS; i++) {
      int r = (97 * i) % NUM_CHARS;
      int64_t start = read_tsc();
      force_read(&timing_array[r*step_size]);
      latencies[r] = read_tsc() - start;
    }
    int64_t sum_latencies = 0;
    for (int i = 0; i < NUM_CHARS; i++) {
      sum_latencies += latencies[i];
    }
    int64_t avg_latency = sum_latencies / NUM_CHARS;
    memset(scores, 0, sizeof scores);
    for (int i = 0; i < NUM_CHARS; i++) {
      if (latencies[i] < (avg_latency * 3/4)) {
        scores[i]++;
      }
    }
  }
  return get_winner(scores, NUM_CHARS);
}

int main(int argc, char** argv)
{
  if (argc > 4) {
    printf("Usage: cache-magic [step_size [num_runs [cache_warm_iter]]]\n");
    return 1;
  }
  if (argc >= 2) {
    step_size = atoi(argv[1]);
  }
  if (argc >= 3) {
    num_runs = atoi(argv[2]);
  }
  if (argc >= 4) {
    cache_warm_iter = atoi(argv[3]);
  }
  srand(17);
  for (int i = 0;; i++) {
    char c = (char)infer_byte(password, i);
    //printf("%c[%hhx]\n", c, c);
    printf("%c", c);
    fflush(stdout);
    if (c == '\0') {
      break;
    }
  }
  return 0;
}
