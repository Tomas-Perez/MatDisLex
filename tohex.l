%option noyywrap
%{
#include <stdio.h>
%}

letter [a-zA-Z]
number [0-9]

%%
{number}* {printf("%X", atoi(yytext));}
({letter}|{number})* {printf("%s", yytext);}
%%

int main(void){
  yylex();
}
