%option noyywrap
%{
// C CODE HERE, INCLUDE AND STUFF
%}

regex_var aRegex
another_var moreRegex

%x STATE
%x ANOTHER_STATE

%%
REGEX{regex_var}        {
                          //MORE C CODE
                          BEGIN(STATE);
                        }
AND ANOTHER ONE         {
                          yytext //Text captured by regex
                          yyleng //Length of yytext
                        }
%%

int main(void){
  yylex();
}
