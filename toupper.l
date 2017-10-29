%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>
%}

letra [a-zA-Z]
%x TOUPPER

%%
\<UP>                BEGIN TOUPPER;
<TOUPPER>.           putchar(toupper(yytext[0]));
<TOUPPER>\<UP>       BEGIN INITIAL;
.                    ECHO;
%%

int main(void){
  yylex();
}
