%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>
%}

%x TOLOWER

%%
.           putchar(tolower(yytext[0]));
%%

int main(void){
  yylex();
}
