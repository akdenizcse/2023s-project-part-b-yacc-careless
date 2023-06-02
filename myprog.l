%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}

%%
\"[^"]*\"                   { yylval.str = strdup(yytext); return STRING_LITERAL; }
\".*\"                      {return TEXT;}
\'.*\'                      {return CHAR;}
public                      {return PUBLIC;}
private                     {return PRIVATE;}
true|false		            {return BOOLEAN;}
;                 	        {return yytext[0];}
int                         {return INTEGER;}
double                      {return DOUBLE;}
char                        {return CHARACTER;}
string                      {return STRING;}
bool                        {return BOOLEAN;}
if                          {return IF;}
elsif                       {return ELSE_IF;}
else                        {return ELSE;}
for                         {return FOR_LOOP;}
while                       {return WHILE_LOOP;}
return                      {return RETURN;}
throw                       {return THROW;}
exception                   {return EXCEPTION;}
\(                          {return OPEN_PARANTHESES;}
\)                          {return CLOSE_PARANTHESES;}
\<=                         {return LESS_THAN_OR_EQUAL;}
\>=                         {return GREATER_THAN_OR_EQUAL;}
\<                          {return LESS_THAN;}
\>                          {return GREATER_THAN;}
"=="                          {return ISEQUAL;}
=                           {return EQUALS;}
in                          {return IN;}
out                         {return OUT;}
0                           {return ZERO;}
[1-9][0-9]*                 {yylval.num = atoi(yytext); return POSITIVE_NUMBER;}
[-][1-9][0-9]*              {yylval.num = atoi(yytext); return NEGATIVE_NUMBER;}
,                           {return COMMA;}
\.                          {return DOT;}
!                           {return NOT;}
and                         {return AND;}
or                          {return OR;}
xor                         {return XOR;}
func                        {return FUNCTION;}
mahirsays                   {return PRINT;}
mahirsees                   {return SCANNER;}
new                         {return NEW;}
\+                          {return ADD;}
\-                          {return SUBTRACT;}
\*                          {return MULTIPLY;}
\/                          {return DIVIDE;}
\%                          {return MOD;}
[0-9]+\.[0-9]+              {yylval.num = atoi(yytext); return FLOATING_POINT_NUMBER;}
^[-][0-9]+\.[0-9]+          {yylval.num = atoi(yytext); return NEGATIVE_FLOATING_POINT_NUMBER;}
"//".*                      /* Ignore single-line comments */
[a-zA-Z][a-zA-Z0-9_]*       {yylval.id = yytext[0]; return VARIABLE;}
[ \t\n]                                         ;
.			                {ECHO; yyerror ("unexpected character");}
%%
int yywrap (void) {
    return 1;
    }