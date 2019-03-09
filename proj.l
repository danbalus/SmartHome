%{
#include "y.tab.h"
%}
%%
"open"     {yylval = 1; return ACTION;}
"close"    {yylval = 2; return ACTION;}
"turn off" {yylval = 3; return ACTION;}
"turn on"  {yylval = 4; return ACTION;}
"the"      {yylval = 5; return THE;}
"light"    {yylval = 6; return OBJECT;}
"door"     {yylval = 7; return OBJECT;}
"TV"       {yylval = 8; return OBJECT;}
"before"   {yylval = 9; return POSITION;}
"left"     {yylval = 10; return POSITION;}
"right"    {yylval = 11; return POSITION;}
"my"       {yylval = 12; return POSSESION;}
"from"	   {yylval = 13; return FROM;}
"living"   {yylval = 14; return LOCATION;}
[a-zA-Z]+  {return NAME;}
";"	   {return STOP;}
[ \n\t]+   ;//{return *yytext;}
.	   {ECHO; yyerror("unexpected character");}
%%
int yywrap (void) {return 1;}
