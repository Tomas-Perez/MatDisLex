%option noyywrap
%{
#include <stdio.h>
int c_counter = 0;
int lineno = 0;
%}

%%
.           {c_counter++;}
\n          {lineno++;}
%%

int main(void){
  yylex();
  printf("Chars: %d\nLines: %d", c_counter, lineno);
}
