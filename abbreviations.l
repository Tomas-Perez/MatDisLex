/**
* pq -> porque
* pq? -> por qué?
* mb -> muy bien
* tq -> tal que
*
* Pq a él tambien le fue mb. pq mB no se que significa.
* Porque a él tambien le fue muy bien. porque mB no se que significa
**/


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