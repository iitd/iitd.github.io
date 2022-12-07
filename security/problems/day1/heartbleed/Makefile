TARGETS = heartbleed

CPP = g++ -std=c++17

all: $(TARGETS)

$(TARGETS): %: %.o
	$(CPP) $^ -o $@

%.o: %.cpp
	$(CPP) -c $< -o $@

clean::
	rm -rf *.o $(TARGETS)
