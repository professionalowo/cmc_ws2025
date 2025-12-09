# Compiler and flags
CC = clang
CFLAGS = -Wall -ggdb -O3
LDFLAGS =

# Flex and Bison
FLEX = flex
BISON = bison

# Target executable
TARGET = calculator

# Source files
LEXER = lexer.l
PARSER = parser.y
MAIN = main.c

# Generated files
LEXER_C = lex.yy.c
PARSER_C = parser.tab.c
PARSER_H = parser.tab.h
ROMAN_C = roman.c
ROMAN_H = roman.h

# Object files
OBJS = lex.yy.o parser.tab.o main.o roman.o

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

# Generate lexer C code
$(LEXER_C): $(LEXER)
	$(FLEX) $(LEXER)

# Generate parser C code and header
$(PARSER_C) $(PARSER_H): $(PARSER)
	$(BISON) -d $(PARSER)

# Compile lexer
lex.yy.o: $(LEXER_C) $(PARSER_H)
	$(CC) $(CFLAGS) -c $(LEXER_C)

# Compile parser
parser.tab.o: $(PARSER_C)
	$(CC) $(CFLAGS) -c $(PARSER_C)

roman.o: $(ROMAN_C) $(ROMAN_H)
	$(CC) $(CFLAGS) -c $(ROMAN_C)

# Compile main
main.o: $(MAIN) $(PARSER_H)
	$(CC) $(CFLAGS) -c $(MAIN)

# Clean target - removes all generated files
clean:
	rm -f $(TARGET) $(OBJS) $(LEXER_C) $(PARSER_C) $(PARSER_H)

# Phony targets
.PHONY: all clean
