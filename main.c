#include <stdio.h>

extern int yyparse(void);

int main(int argc, char **argv) {
    printf("Enter expressions (e.g., 1+2*3)\n");
    
    return yyparse();
}
