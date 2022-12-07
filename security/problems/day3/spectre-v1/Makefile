#CC = ../day2/afl-2.52b/afl-gcc
CPP = g++ -std=c++17 -O3

TARGETS = spectre

all: $(TARGETS)

$(TARGETS): %: %.o
	$(CPP) $^ -o $@

%.o: %.cpp
	$(CPP) -c $< -o $@

clean::
	rm -rf *.o $(TARGETS)
