# Programming Language careLess

Group Members: Ahmet Can Dericioğlu, Emre Gülbay, Mahir Cem Aşkın

## Syntax

line 		: exp 
				| line PRINT exp 
				| PRINT exp 
				| line exp 
				| comment 
				| conditional 
				| line conditional 
				| boolexp 
				| line boolexp
				| whileStatement 
				| line whileStatement

assignment		: VARIABLE EQUALS term 
comment 		: COMMENT
conditional		: IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp OUT 
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp  OUT 
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp OUT ELSE IN exp OUT 
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp OUT ELSE IN PRINT exp OUT 
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp OUT ELSE IN exp OUT 
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN PRINT exp OUT ELSE IN PRINT exp OUT 			
				| IF OPEN_PARANTHESES boolexp CLOSE_PARANTHESES IN exp OUT conditional
			

whileStatement	:
         WHILE_LOOP term LESS_THAN term RETURN exp
        | WHILE_LOOP term GREATER_THAN term RETURN exp
      	| WHILE_LOOP term LESS_THAN term RETURN PRINT exp  
    	  | WHILE_LOOP term GREATER_THAN term RETURN PRINT exp 

boolexp			: term ISEQUAL term
        		| term GREATER_THAN term
        		| term LESS_THAN term
        		| term GREATER_THAN_OR_EQUAL term
        		| term LESS_THAN_OR_EQUAL term
				    | term AND term
				    | term OR term
				


exp    			: term
       			| exp ADD term
       			| exp SUBTRACT term
				    | boolexp
				    | assignment

term 			: factor      
     			| term MULTIPLY factor
     			| term DIVIDE factor
				  | VARIABLE

factor			: POSITIVE_NUMBER
				    | NEGATIVE_NUMBER
				    | FLOATING_POINT_NUMBER
				    | NEGATIVE_FLOATING_POINT_NUMBER
				    | ZERO
\<keyword> ::= bool | char | double | else | for | if | int |new | private | public | return | throw | while | true | false | string | null | elsif | exception | in | out | and | or | xor | func | mahirsays | mahirsees | new

## Explanations about the language

- Takes a file with extension .crls
- Has if, else, while, logical operators, mathematical operators,  
- Use in and out prompts instead of curly parantheses
- Need to use semicolon to end line
- Use mahiresays for printer
- You can run your program by running the makefile and giving it to myprog as input:

make
./myprog < example.crls
