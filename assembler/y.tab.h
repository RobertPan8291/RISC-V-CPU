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
# define YYDEBUG 1
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
    DOT_ORG = 258,                 /* DOT_ORG  */
    DOT_SECTION = 259,             /* DOT_SECTION  */
    DOT_TEXT = 260,                /* DOT_TEXT  */
    DOT_DATA = 261,                /* DOT_DATA  */
    DOT_WORD = 262,                /* DOT_WORD  */
    DOT_EQU = 263,                 /* DOT_EQU  */
    DOT_GLOBAL = 264,              /* DOT_GLOBAL  */
    B = 265,                       /* B  */
    BEQ = 266,                     /* BEQ  */
    BNE = 267,                     /* BNE  */
    BLT = 268,                     /* BLT  */
    BLE = 269,                     /* BLE  */
    BL = 270,                      /* BL  */
    BLX = 271,                     /* BLX  */
    BX = 272,                      /* BX  */
    LDR = 273,                     /* LDR  */
    STR = 274,                     /* STR  */
    ADD = 275,                     /* ADD  */
    AND = 276,                     /* AND  */
    CMP = 277,                     /* CMP  */
    MVN = 278,                     /* MVN  */
    MOV = 279,                     /* MOV  */
    LSL = 280,                     /* LSL  */
    LSR = 281,                     /* LSR  */
    ASR = 282,                     /* ASR  */
    NOP = 283,                     /* NOP  */
    HALT = 284,                    /* HALT  */
    DLLR = 285,                    /* DLLR  */
    NUMB = 286,                    /* NUMB  */
    PERC = 287,                    /* PERC  */
    NEW_LINE = 288,                /* NEW_LINE  */
    REGISTER = 289,                /* REGISTER  */
    REG_LR = 290,                  /* REG_LR  */
    LABEL = 291,                   /* LABEL  */
    LABEL_DEF = 292,               /* LABEL_DEF  */
    DEC_NUMBER = 293,              /* DEC_NUMBER  */
    BIN_NUMBER = 294,              /* BIN_NUMBER  */
    HEX_NUMBER = 295               /* HEX_NUMBER  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define DOT_ORG 258
#define DOT_SECTION 259
#define DOT_TEXT 260
#define DOT_DATA 261
#define DOT_WORD 262
#define DOT_EQU 263
#define DOT_GLOBAL 264
#define B 265
#define BEQ 266
#define BNE 267
#define BLT 268
#define BLE 269
#define BL 270
#define BLX 271
#define BX 272
#define LDR 273
#define STR 274
#define ADD 275
#define AND 276
#define CMP 277
#define MVN 278
#define MOV 279
#define LSL 280
#define LSR 281
#define ASR 282
#define NOP 283
#define HALT 284
#define DLLR 285
#define NUMB 286
#define PERC 287
#define NEW_LINE 288
#define REGISTER 289
#define REG_LR 290
#define LABEL 291
#define LABEL_DEF 292
#define DEC_NUMBER 293
#define BIN_NUMBER 294
#define HEX_NUMBER 295

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 21 "sas.y"

  int   integer_value;
  float float_value;
  char *string_value;

#line 153 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
