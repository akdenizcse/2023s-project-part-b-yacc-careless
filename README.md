[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11277760&assignment_repo_type=AssignmentRepo)
# pl-yacc-starter-kit

This is a logic language which allows only conjunction and printing the result.

\<program\> : \<stmts\>

\<stmts\> : \<stmt\>
	| \<stmt\> ; \<stmts\>

\<stmt\> : print \<expr\>;
	| \<assign\>;

\<assign\> : \<lhs\> = \<rhs\>;

\<lhs\> : \<var\>

\<rhs\> : \<var\>
	| \<expr\>

\<var\> : [a-zA-Z][a-zA-Z0-9_]*

\<expr\> : \<expr\> 
	| \<expr\> and \<expr\>
	| ( \<expr\> and \<expr\> )


## Running instructions:

> make

> ./calc < example.ext

...(some output)...

> make clean
