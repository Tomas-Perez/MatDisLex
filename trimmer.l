%option noyywrap
%{
#include <stdio.h>
%}

space [\t| ]
%x SPACE

%%
{space}             BEGIN SPACE;
<SPACE>{space}      ;
<SPACE>.            {
                      printf(" %s", yytext);
                      BEGIN INITIAL;
                    }
<SPACE>\n           {
                      BEGIN INITIAL;
                      ECHO;
                    }
%%

int main(void){
  yylex();
}
