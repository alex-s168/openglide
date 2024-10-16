.PHONY: clean build

CXX ?= clang++
CXXFLAGS ?= -O1

CXXFLAGS += -I.
CXXFLAGS += -Iplatform/linux/
CXXFLAGS += -I/usr/X11R7/include/

PLATFORM := platform/linux

%.o: %.cpp
	$(CXX) -c -o $@ $< $(CXXFLAGS)

csources := $(wildcard ./*.cpp)
csources += $(wildcard $(PLATFORM)/*.cpp)

build: $(csources:.cpp=.o)
	ar rcs openglide.a $(csources:.cpp=.o)

clean: 
	rm -f openglide.a
	rm -f $(csources:.cpp=.o)
