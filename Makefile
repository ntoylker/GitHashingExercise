# Compiler and flags
CC = gcc
CFLAGS = -Wall -g

# Source files
SOURCES = mysigcatch.c

# Object files
OBJECTS = mysigcatch

# Default target
all: $(OBJECTS)

# Targets for each file
mysigcatch: mysigcatch.c
	$(CC) $(CFLAGS) -o $@ $<

# Clean target to remove compiled files
clean:
	rm -f $(OBJECTS)
