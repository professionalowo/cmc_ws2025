%{
#include "parser.tab.h"
%}

%%

[0-9]+      { return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
\n          { return NEWLINE; }
[ \t]       { /* ignore whitespace */ }
.           { /* ignore other characters */ }

%%

int yywrap(void) {
    return 1;
}
