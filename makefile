myprog: lex.yy.c y.tab.c
	gcc -g lex.yy.c y.tab.c -o myprog

lex.yy.c: y.tab.c myprog.l
	lex myprog.l

y.tab.c: myprog.y
	yacc -d myprog.y

clean: 
	rm -rf lex.yy.c y.tab.c y.tab.h myprog myprog.dSYM