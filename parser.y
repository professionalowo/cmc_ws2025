%{
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;

int yylex(void);
void yyerror(const char *s);
%}


%define parse.error verbose

%union {
	int num;
}

%token <num> number

%type <num> EXPR START

%left '+' '-'
%left '/' '*'

%start START
%%

START: EXPR ';'		{ printf("Result: %d\n",$1); }

EXPR:
    number            { $$ = $1; }
    | EXPR '+' EXPR   { $$ = $1 + $3; }
    | EXPR '-' EXPR   { $$ = $1 - $3; }
    | EXPR '*' EXPR   { $$ = $1 * $3; }
    | EXPR '/' EXPR   { $$ = $1 / $3; }
    | '(' EXPR ')' { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error in %d: %s\n",yylineno, s);
}
