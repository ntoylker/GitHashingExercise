# Compiler and flags
CC = gcc
CFLAGS = -Wall -g

# Source files
SOURCES = mysigcatch.c mysigcatchmodified.c

# Object files
OBJECTS = mysigcatch mysigcatchmodified

# Default target
all: $(OBJECTS)

# Targets for each file
mysigcatch: mysigcatch.c
	$(CC) $(CFLAGS) -o $@ $<

mysigcatchmodified: mysigcatchmodified.c
	$(CC) $(CFLAGS) -o $@ $<

# Clean target to remove compiled files
clean:
	rm -f $(OBJECTS)
