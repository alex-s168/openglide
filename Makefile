CXX ?= clang++
CXXFLAGS ?= -O1

CXXFLAGS += -Iplatform/linux/
CXXFLAGS += -I/usr/X11R7/include/

PLATFORM := platform/linux

%.o: %.cpp
	$(CXX) -c -fPIC -o $@ $< $(CXXFLAGS)

csources := $(wildcard ./*.cpp)
csources += $(wildcard $(PLATFORM)/*.cpp)

openglide.so: $(csources:.cpp=.o)
	$(CXX) -lm -shared -o openglide.so $(csources:.cpp=.o)

.PHONY: install
install: openglide.so
	install -d /usr/include/glide2/
	install -m 644 sdk2/3dfx.h /usr/include/glide2/
	install -m 644 sdk2/glide.h /usr/include/glide2/
	install -m 644 sdk2/glidesys.h /usr/include/glide2/
	install -m 644 sdk2/glideutl.h /usr/include/glide2/
	install -m 644 sdk2/sst1vid.h /usr/include/glide2/
	install -m 644 -T openglide.so /usr/lib64/libglide.so.2 
	ln -f /usr/lib64/libglide.so.2 /usr/lib64/libglide2x.so 

.PHONY: clean
clean: 
	rm -f openglide.so
	rm -f $(csources:.cpp=.o)
