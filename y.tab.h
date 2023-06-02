/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TEXT = 258,                    /* TEXT  */
    CHAR = 259,                    /* CHAR  */
    PUBLIC = 260,                  /* PUBLIC  */
    PRIVATE = 261,                 /* PRIVATE  */
    SEMICOLON = 262,               /* SEMICOLON  */
    INTEGER = 263,                 /* INTEGER  */
    DOUBLE = 264,                  /* DOUBLE  */
    CHARACTER = 265,               /* CHARACTER  */
    STRING = 266,                  /* STRING  */
    IF = 267,                      /* IF  */
    ELSE = 268,                    /* ELSE  */
    ELSE_IF = 269,                 /* ELSE_IF  */
    FOR_LOOP = 270,                /* FOR_LOOP  */
    WHILE_LOOP = 271,              /* WHILE_LOOP  */
    RETURN = 272,                  /* RETURN  */
    THROW = 273,                   /* THROW  */
    EXCEPTION = 274,               /* EXCEPTION  */
    OPEN_PARANTHESES = 275,        /* OPEN_PARANTHESES  */
    CLOSE_PARANTHESES = 276,       /* CLOSE_PARANTHESES  */
    LESS_THAN_OR_EQUAL = 277,      /* LESS_THAN_OR_EQUAL  */
    GREATER_THAN_OR_EQUAL = 278,   /* GREATER_THAN_OR_EQUAL  */
    LESS_THAN = 279,               /* LESS_THAN  */
    GREATER_THAN = 280,            /* GREATER_THAN  */
    ISEQUAL = 281,                 /* ISEQUAL  */
    EQUALS = 282,                  /* EQUALS  */
    IN = 283,                      /* IN  */
    OUT = 284,                     /* OUT  */
    COMMA = 285,                   /* COMMA  */
    DOT = 286,                     /* DOT  */
    NOT = 287,                     /* NOT  */
    AND = 288,                     /* AND  */
    OR = 289,                      /* OR  */
    XOR = 290,                     /* XOR  */
    FUNCTION = 291,                /* FUNCTION  */
    PRINT = 292,                   /* PRINT  */
    SCANNER = 293,                 /* SCANNER  */
    NEW = 294,                     /* NEW  */
    ADD = 295,                     /* ADD  */
    SUBTRACT = 296,                /* SUBTRACT  */
    MULTIPLY = 297,                /* MULTIPLY  */
    DIVIDE = 298,                  /* DIVIDE  */
    MOD = 299,                     /* MOD  */
    COMMENT = 300,                 /* COMMENT  */
    ZERO = 301,                    /* ZERO  */
    BOOLEAN = 302,                 /* BOOLEAN  */
    STRING_LITERAL = 303,          /* STRING_LITERAL  */
    VARIABLE = 304,                /* VARIABLE  */
    POSITIVE_NUMBER = 305,         /* POSITIVE_NUMBER  */
    NEGATIVE_NUMBER = 306,         /* NEGATIVE_NUMBER  */
    FLOATING_POINT_NUMBER = 307,   /* FLOATING_POINT_NUMBER  */
    NEGATIVE_FLOATING_POINT_NUMBER = 308 /* NEGATIVE_FLOATING_POINT_NUMBER  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define TEXT 258
#define CHAR 259
#define PUBLIC 260
#define PRIVATE 261
#define SEMICOLON 262
#define INTEGER 263
#define DOUBLE 264
#define CHARACTER 265
#define STRING 266
#define IF 267
#define ELSE 268
#define ELSE_IF 269
#define FOR_LOOP 270
#define WHILE_LOOP 271
#define RETURN 272
#define THROW 273
#define EXCEPTION 274
#define OPEN_PARANTHESES 275
#define CLOSE_PARANTHESES 276
#define LESS_THAN_OR_EQUAL 277
#define GREATER_THAN_OR_EQUAL 278
#define LESS_THAN 279
#define GREATER_THAN 280
#define ISEQUAL 281
#define EQUALS 282
#define IN 283
#define OUT 284
#define COMMA 285
#define DOT 286
#define NOT 287
#define AND 288
#define OR 289
#define XOR 290
#define FUNCTION 291
#define PRINT 292
#define SCANNER 293
#define NEW 294
#define ADD 295
#define SUBTRACT 296
#define MULTIPLY 297
#define DIVIDE 298
#define MOD 299
#define COMMENT 300
#define ZERO 301
#define BOOLEAN 302
#define STRING_LITERAL 303
#define VARIABLE 304
#define POSITIVE_NUMBER 305
#define NEGATIVE_NUMBER 306
#define FLOATING_POINT_NUMBER 307
#define NEGATIVE_FLOATING_POINT_NUMBER 308

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 16 "myprog.y"
int num; char id; char* str;

#line 176 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
