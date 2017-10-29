%option noyywrap
%{
#include <stdio.h>
%}

%%
\t           printf(" ");
%%

int main(void){
  yylex();
}
