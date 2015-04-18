%{
	#include "global.h"
	enum yytokentype{
		STRING	=258,
		INPUT	=259,
		OUTPUT	=260,
		AND	=261,
		LF	=262,
		PIPE	=263
	};
	int i=0;
	void copy(char a[],char b[]){
	  int l=strlen(b),j=0;
	  while(j<l){
	    a[i++]=b[j++];
	  }
	}
%}

%%
"<"	{inputBuff[i++]='<';return INPUT;}
">"	{inputBuff[i++]='>';return OUTPUT;}
"&"	{inputBuff[i++]='&';return AND;}
"|"	{inputBuff[i++]='|';return PIPE;}
[ \t]	{}
\n	{inputBuff[i]='\0';i=0;return LF;}
[^ \t\n&><|]+	{inputBuff[i++]=' ';copy(inputBuff,yytext);return STRING;}
%%
