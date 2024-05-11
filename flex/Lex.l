%{

#include <stdio.h>
#define MSG_MAX_SIZE 15
char tc[MSG_MAX_SIZE] = "Token class:";
char tv[MSG_MAX_SIZE] = "Token Value:";

%}

%%

(?i:if) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:else) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:loop) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:then) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:while) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:not) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:print) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
(?i:println) { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
t[rR][uU][eE] { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }
f[aA][lL][sS][eE] { printf("%s KEYWORD, %s %s\n", tc, tv, yytext); }

"--"[a-zA-Z()0-9\\ * / - + \"]*[\nEOF] { printf("%s COMMENT, %s %s", tc, tv, yytext); }

"+" { printf("%s OP, %s PLUS\n", tc, tv); }
"-" { printf("%s OP, %s MINS\n", tc, tv); }
"*" { printf("%s OP, %s MUL\n", tc, tv); }
"/" { printf("%s OP, %s DIV\n", tc, tv); }
"=" { printf("%s OP, %s ASSIGN\n", tc, tv); }
"(" { printf("%s OP, %s LEFT BRACKET\n", tc, tv); }
")" { printf("%s OP, %s RIGHT BRACKET\n", tc, tv); }

[1-9]+[0-9]*.?[0-9]+ { printf("NUMBER %s\n", yytext); }
[a-z_]+[a-zA-Z_]* { printf("%s VARIABLE, %s %s\n", tc, tv, yytext); }
[A-Z_]+[a-zA-Z_]* { printf("%s TYPE ID, %s %s\n", tc, tv, yytext); }
"\""[a-zA-Z\n]*"\"" { printf("%s STRING, %s %s\n", tc, tv, yytext); }
[ \t]* { ; }
\n { ; }
. { printf("Unknown symbol %s\n", yytext); }

%%