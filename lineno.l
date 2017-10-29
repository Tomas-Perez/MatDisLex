%option noyywrap
%{
#include <stdio.h>
int lineno = 1;
%}

letra [a-zA-Z]

%%
.*   {printf("%d %s", lineno++, yytext);}
^\n    {printf("%d %s", lineno++, yytext);}
%%

int main(void){
  yylex();
}
