%{
#include <stdlib.h>
#include "parser.tab.h"
%}

%option noinput nounput noyywrap

DEC (0|[1-9][0-9]*)

%%

{DEC}      		{ yylval.num = atoi(yytext); return number; }
(\ |\n)
.     			{ return *yytext; }
%%

