%option noyywrap
%{
#include <stdio.h>
%}

%x STRING

%%
"'" {
  BEGIN(STRING);
  ECHO;
}
<STRING>("')"|"',") {
  ECHO;
  BEGIN(INITIAL);
}
<STRING>"'" {
  printf("''");
}
%%

int main(void){
  yylex();
}
