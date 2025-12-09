%{
#include <stdlib.h>
#include "parser.tab.h"
#include "roman.h"
%}

%option noinput nounput noyywrap

ROMAN ([IVXLCDM]+)
DEC (0|[1-9][0-9]*)

%%

{ROMAN}  		{ yylval.num = romanToInt(yytext); return number; }
{DEC}      		{ yylval.num = atoi(yytext); return number; }
(\ |\n)
.     			{ return *yytext; }
%%

