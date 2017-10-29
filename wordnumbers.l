%option noyywrap
%{
#include <stdio.h>
%}

letter [a-zA-Z]
number [0-9]

integer {number}+
word {letter}({number}|{letter})*

%%
{integer}               printf("NUMBER");
{word}                  printf("WORD");
%%

int main(void){
  yylex();
}
