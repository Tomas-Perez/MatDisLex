%option noyywrap

%%
\"[^\n"]*["\n]      ECHO;
"/*".*"*/"          ;
%%

int main(void){
  yylex();
}
