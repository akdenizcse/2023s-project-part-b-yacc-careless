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

%}

%union {int num; char id; char* str;} /* Yacc definitions */
%start line
%type <num> line exp term factor
%type <num> boolexp

%token TEXT CHAR PUBLIC PRIVATE SEMICOLON INTEGER DOUBLE CHARACTER STRING IF ELSE ELSE_IF
%token FOR_LOOP WHILE_LOOP RETURN THROW EXCEPTION OPEN_PARANTHESES CLOSE_PARANTHESES LESS_THAN_OR_EQUAL
%token GREATER_THAN_OR_EQUAL LESS_THAN GREATER_THAN ISEQUAL EQUALS IN OUT ZERO
%token COMMA DOT NOT AND OR XOR FUNCTION PRINT SCANNER NEW ADD SUBTRACT MULTIPLY DIVIDE MOD
%token COMMENT 
%token <num> BOOLEAN
%token <str> STRING_LITERAL
%token <id> VARIABLE
%token <num> POSITIVE_NUMBER
%token <num> NEGATIVE_NUMBER
%token <num> FLOATING_POINT_NUMBER
%token <num> NEGATIVE_FLOATING_POINT_NUMBER



%%

line 			: assignment ';' {;}
				| PRINT exp ';'{printf("%d\n", $2);}
				| comment {;}
				| conditional ';' {;}
				| boolexp ';' {;}
				;

assignment		: VARIABLE EQUALS exp {updateSymbolVal($1,$3);}
	            ;

comment 		: COMMENT              { /* Do nothing, ignore single-line comments */ }
				;

conditional		: IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp OUT
				;

boolexp			: POSITIVE_NUMBER ISEQUAL POSITIVE_NUMBER    	{ $$ = $1 == $3 ;
									if($$==1){
                                	printf("TRUE\n");
                                	}else{
                                	printf("FALSE\n");
                                	}
                					}
				;

exp    			: term                  {$$ = $1;}
       			| exp ADD term          {$$ = $1 + $3;}
       			| exp SUBTRACT term     {$$ = $1 - $3;}
       			;

term 			: factor                { $$ = $1; }
     			| term MULTIPLY factor       { $$ = $1 * $3; }
     			| term DIVIDE factor       { $$ = $1 / $3; }
     			;

factor			: POSITIVE_NUMBER                {$$ = $1;}
				| NEGATIVE_NUMBER                {$$ = $1;}
				| FLOATING_POINT_NUMBER			 {$$ = $1;}
				| NEGATIVE_FLOATING_POINT_NUMBER {$$ = $1;}

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
		strings[i][0] = '\0';
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
