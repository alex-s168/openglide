CXX ?= clang++
CXXFLAGS ?= -O1

CXXFLAGS += -I.
CXXFLAGS += -Iplatform/linux/
CXXFLAGS += -I/usr/X11R7/include/

PLATFORM := platform/linux

%.o: %.cpp
	$(CXX) -c -fPIC -o $@ $< $(CXXFLAGS)

csources := $(wildcard ./*.cpp)
csources += $(wildcard $(PLATFORM)/*.cpp)

openglide.so: $(csources:.cpp=.o)
	$(CXX) -shared -o openglide.so $(csources:.cpp=.o)

.PHONY: install
install: openglide.so
	install -m 644 openglide.so /usr/lib64/

.PHONY: clean
clean: 
	rm -f openglide.so
	rm -f $(csources:.cpp=.o)
