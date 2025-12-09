#include <stdio.h>

extern int yyparse(void);

int main(int argc, char **argv) {
    printf("Simple calculator (Flex + Bison)\n");
    printf("Enter expressions (e.g., 1+2*3)\n");
    printf("Press Ctrl+D to exit\n");
    
    yyparse();
    
    return 0;
}
