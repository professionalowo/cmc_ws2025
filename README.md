# cmc_ws2025

A simple calculator project demonstrating the use of Flex (lexer) and Bison (parser).

## Building

To build the project:

```bash
make
```

This will:
1. Generate lexer code from `lexer.l` using flex
2. Generate parser code from `parser.y` using bison
3. Compile all source files
4. Link them into the `calculator` executable

## Cleaning

To remove all generated files:

```bash
make clean
```

This removes:
- Generated source files (lex.yy.c, parser.tab.c, parser.tab.h)
- Object files (*.o)
- The executable (calculator)

## Running

After building, run the calculator:

```bash
./calculator
```

Enter arithmetic expressions like:
- `2+3`
- `5*6`
- `(1+2)*3`

Press Ctrl+D to exit.

## Project Structure

- `lexer.l` - Flex lexer specification
- `parser.y` - Bison parser grammar
- `main.c` - Main program entry point
- `Makefile` - Build system