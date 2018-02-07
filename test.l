%option noyywrap
%{
#include <stdio.h>
%}

letter [a-zA-Z]
boundary [^a-zA-Z]

%x WORD

%%
[Pp]"q"/{boundary}   	{
						printf("%corque", yytext[0]);
					}
[Mm]"b"/{boundary}   	{
						printf("%cuy bien", yytext[0]);
					}
[Pp]"q?"/{boundary}   	{
						printf("%cor qué?", yytext[0]);
					}					
[Tt]"q"/{boundary}   	{
						printf("%cal que", yytext[0]);
					}					
{letter}			{
						ECHO;
						BEGIN(WORD);
					}
<WORD>{boundary}	{
						ECHO;
						BEGIN(INITIAL);
					}
%%

int main(void){
  yylex();
}