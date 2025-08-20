CC := zig cc
CFLAGS := -O2 -Wall -Wextra -Wpedantic -Wno-unused-parameter -Wno-gnu -Wno-fixed-enum-extension -isystem /usr/local/include/SDL2 -Iinclude -I/opt/homebrew/include -L/opt/homebrew/lib -lSDL2 -lraylib
SRCS := $(wildcard *.c)
TARGETS := $(addprefix bin/, $(basename $(SRCS)))
DEST = out.o

.PHONY: all clean

all: bin $(TARGETS)

bin/%: %.c
	$(CC) $(CFLAGS) $< -o $@

bin:
	mkdir -p bin

clean:
	rm -rf bin
