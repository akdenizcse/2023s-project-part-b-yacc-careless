%{
#include <stdio.h>
void yyerror (char* s);
int yylex();
#include <string.h>
char strings[52][256];
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
int i = 0;
%}

%union {int num; char id; char* str;} /* Yacc definitions */
%start line
%type <num> line exp term factor whileStatement
%type <num> boolexp conditional assignment

%token TEXT CHAR PUBLIC PRIVATE SEMICOLON INTEGER DOUBLE CHARACTER STRING IF ELSE ELSE_IF
%token FOR_LOOP WHILE_LOOP RETURN THROW EXCEPTION OPEN_PARANTHESES CLOSE_PARANTHESES LESS_THAN_OR_EQUAL
%token GREATER_THAN_OR_EQUAL LESS_THAN GREATER_THAN ISEQUAL EQUALS IN OUT 
%token COMMA DOT NOT AND OR XOR FUNCTION PRINT SCANNER NEW ADD SUBTRACT MULTIPLY DIVIDE MOD
%token COMMENT 
%token <num> ZERO
%token <num> BOOLEAN
%token <str> STRING_LITERAL
%token <id> VARIABLE
%token <num> POSITIVE_NUMBER
%token <num> NEGATIVE_NUMBER
%token <num> FLOATING_POINT_NUMBER
%token <num> NEGATIVE_FLOATING_POINT_NUMBER




%%

line 			: exp ';' {;}
				| line PRINT exp ';'	{printf("%d\n", $3);}
				| PRINT exp ';'	{printf("%d\n", $2);}
				| line exp ';'
				| comment {;}
				| conditional {;}
				| line conditional {;}
				| boolexp ';' {;}
				| line boolexp ';' {;}
				| whileStatement {;}
				| line whileStatement {;}
				;

assignment		: VARIABLE EQUALS term {updateSymbolVal($1,$3);}
				|
	            ;

comment 		: COMMENT              { /* Do nothing, ignore single-line comments */ }
				;

conditional		: IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp ';' OUT ';' {if($3==1){ printf("%d\n", $6); } }
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp ';' OUT ';' {if($3==1){ printf("%d\n", $7); } }
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp ';' OUT ELSE IN exp ';' OUT { if($3==1){
                                            			printf("%d\n", $6);
                                               			}else {
                                               			printf("%d\n", $11);} }
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp ';' OUT ELSE IN PRINT exp ';' OUT { if($3==1){
                                            			printf("%d\n", $6);
                                               			}else {
                                               			printf("%d\n", $12);} }	
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp ';' OUT ELSE IN exp ';' OUT { if($3==1){
                                            			printf("%d\n", $7);
                                               			}else {
                                               			printf("%d\n", $12);} }	
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp ';' OUT ELSE IN PRINT exp ';' OUT { if($3==1){
                                            			printf("%d\n", $7);
                                               			}else {
                                               			printf("%d\n", $13);} }									
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp ';' OUT conditional
				;

whileStatement	:
         WHILE_LOOP term LESS_THAN term RETURN exp ';'        {printf("%d\n" , $$ = ($4-$2)*$6);}
 
        | WHILE_LOOP term GREATER_THAN term RETURN exp ';'       {printf("%d\n", $$ = ($2-$4)*$6);}
    
    	| WHILE_LOOP term LESS_THAN term RETURN PRINT exp ';' {            while(i<$4-$2) {
                                        			printf("%d\n",$7);
                                        				i +=1;} 
                                        				i == 0;}
 
    	| WHILE_LOOP term GREATER_THAN term RETURN PRINT exp ';' {            while(i<$2-$4) {
                                        printf("%d\n",$7);
                                        i +=1;} i==0; }

boolexp			: term ISEQUAL term            		{ $$ = $1 == $3;}
        		| term GREATER_THAN term            { $$ = $1 > $3;}
        		| term LESS_THAN term             	{ $$ = $1 < $3;}
        		| term GREATER_THAN_OR_EQUAL term   { $$ = $1 >= $3;}
        		| term LESS_THAN_OR_EQUAL term      { $$ = $1 <= $3;}
				| term AND term						{ $$ = $1 && $3;}
				| term OR term						{ $$ = $1 || $3;}
				;


exp    			: term                  {$$ = $1;}
       			| exp ADD term          {$$ = $1 + $3;}
       			| exp SUBTRACT term     {$$ = $1 - $3;}
				| boolexp 				{$$ = $1;}
				| assignment			{$$ = $1;} 
       			;

term 			: factor                { $$ = $1; }
     			| term MULTIPLY factor       { $$ = $1 * $3; }
     			| term DIVIDE factor       { $$ = $1 / $3; }
				| VARIABLE				{$$ = symbolVal($1);}
     			;

factor			: POSITIVE_NUMBER                {$$ = $1;}
				| NEGATIVE_NUMBER                {$$ = $1;}
				| FLOATING_POINT_NUMBER			 {$$ = $1;}
				| NEGATIVE_FLOATING_POINT_NUMBER {$$ = $1;}
				| ZERO							 {$$ = $1;}

        		;

%%

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
	int bucket = computeSymbolIndex(symbol);
	symbols[bucket] = val;
}


int main (void) {
	/* init symbol table */
	int i;
	for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
