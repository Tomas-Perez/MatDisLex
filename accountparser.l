%option noyywrap
%{
#include <stdio.h>
#include <ctype.h>
char number_buffer[9];

void parse(char code[], char buffer[]){
  int j = 0;
  for(int i = 0; i < 12; i++){
    if(code[i] != '.'){
      buffer[j++] = code[i];
    }
  }
  buffer[j] = '\0';
}

void printSQL(char number[], char name[]){
  printf("INSERT INTO planDeCuentas values (%s, '%s');\n", number, name);
}

char* rtrim(char* str, int len){
  while(len > 0 && isspace(str[len-1])){
    len--;
  };
  str[len] = '\0';
  return str;
}

%}

letter [a-zA-Z]
number [0-9]

integer {number}+
word {letter}({number}|{letter})*

account_number ({number}"."){3,3}{number}{2,2}"."{number}{3,3}
space [ \t]

%x ACCOUNT_NUMBER
%x ACCOUNT_NAME

%%
{account_number} {
  parse(yytext, number_buffer);
  BEGIN(ACCOUNT_NUMBER);
}
<ACCOUNT_NUMBER>{space}+ {
  BEGIN(ACCOUNT_NAME);
}
<ACCOUNT_NAME>.* {
  printSQL(number_buffer, rtrim(yytext, yyleng));
}
<ACCOUNT_NAME>\n {
  BEGIN(INITIAL);
}
.|\n ;
%%

int main(void){
  yylex();
}
