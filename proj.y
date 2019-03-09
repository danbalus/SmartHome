%{
void yyerror (char *s);
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h> /* C exit function */
//int symbols[52];
//int symbolVal(char symbol);
//void updateSymbolVal(char symbol, int val);
%}


//%union {int num; char id;}         /* not yet */
%token print
%token ACTION 
%token THE
%token FROM
%token LOCATION
%token OBJECT
%token POSSESION
%token POSITION
%token NAME
%token STOP

//%type <num> line exp term   /*not yet*/
//%type <id> assignment       /*not yet*/
%%

prog: prog sentence //{printf("%d", $2);}
    |
    ;

sentence: ACTION THE object_checking{printf("\nAction is: %s \nArticol is %s and Object is: %s\n", new_Action($1),new_Action($2),new_Action($3));}
		;


object_checking: OBJECT stop	          		 {printf("\nObject is: %s", new_Action($1));}
		| OBJECT FROM location stop		 {printf("\nPreposition is: %s", new_Action($2));}
		| OBJECT POSITION object_checking        {printf("\nPosition is: %s ", new_Action($2));}
		;

location: LOCATION {printf("Location is: %s", new_Action($1));}
	;

stop:STOP
	;
			   


%%
void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

int new_Action(int statement) 
{ 

  switch(statement) 
    { 
    case 1: return "open";
    case 2: return "close";
    case 3: return "turn off";
    case 4: return "turn on";
    case 5: return "the";
    case 6: return "light";
    case 7: return "door";
    case 8: return "TV";
    case 9: return "before";
    case 10: return "left";
    case 11: return "right";
    case 12: return "my";
    case 13: return "from";
    case 14: return "living"; 
 
    } 
}

