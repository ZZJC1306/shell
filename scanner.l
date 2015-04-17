%{
	#include "global.h"
	enum yytokentype{
		STRING = 258
	};
	int i = -1;
%}

%%
"<"	{inputBuff[i++] = ' ';inputBuff[i++] = '<';return '<';}
">"	{inputBuff[i++] = ' ';inputBuff[i++] = '>';return '>';}
"&"	{inputBuff[i++] = ' ';inputBuff[i++] = '&';return '&';}
"|"	{inputBuff[i++] = ' ';inputBuff[i++] = '|';return '|';}
[ \t]	{}
\n	{inputBuff[i] = '\0';i = -1;return '\n';}
[^ \t\n><&|]+	{inputBuff[i++] = ' ';strcpy(inputBuff,yytext);return STRING;}
%%
