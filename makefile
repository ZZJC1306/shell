user-sh : bison.tab.o execute.o bison.y flex.l
	flex -o lex.yy.c flex.l
	cc -o user-sh bison.tab.o execute.o lex.yy.c -lfl
bison.tab.o : bison.tab.c global.h
	cc -c bison.tab.c
execute.o : execute.c global.h
	cc -c execute.c
bison.tab.c:
	bison bison.y 
clean :
	rm user-sh bison.tab.o execute.o bison.tab.c
