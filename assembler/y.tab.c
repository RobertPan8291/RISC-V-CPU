/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "sas.y"

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "sas.h"

using namespace std;
    
// lex functions/global variables that are accessed from parser (this file)
extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern int yydebug;
extern int yy_flex_debug;
extern int linenum;
extern int yyerror( const char *s );

extern assembler asmblr_obj; // parser object

#line 91 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 230 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_DOT_ORG = 3,                    /* DOT_ORG  */
  YYSYMBOL_DOT_SECTION = 4,                /* DOT_SECTION  */
  YYSYMBOL_DOT_TEXT = 5,                   /* DOT_TEXT  */
  YYSYMBOL_DOT_DATA = 6,                   /* DOT_DATA  */
  YYSYMBOL_DOT_WORD = 7,                   /* DOT_WORD  */
  YYSYMBOL_DOT_EQU = 8,                    /* DOT_EQU  */
  YYSYMBOL_DOT_GLOBAL = 9,                 /* DOT_GLOBAL  */
  YYSYMBOL_B = 10,                         /* B  */
  YYSYMBOL_BEQ = 11,                       /* BEQ  */
  YYSYMBOL_BNE = 12,                       /* BNE  */
  YYSYMBOL_BLT = 13,                       /* BLT  */
  YYSYMBOL_BLE = 14,                       /* BLE  */
  YYSYMBOL_BL = 15,                        /* BL  */
  YYSYMBOL_BLX = 16,                       /* BLX  */
  YYSYMBOL_BX = 17,                        /* BX  */
  YYSYMBOL_LDR = 18,                       /* LDR  */
  YYSYMBOL_STR = 19,                       /* STR  */
  YYSYMBOL_ADD = 20,                       /* ADD  */
  YYSYMBOL_AND = 21,                       /* AND  */
  YYSYMBOL_CMP = 22,                       /* CMP  */
  YYSYMBOL_MVN = 23,                       /* MVN  */
  YYSYMBOL_MOV = 24,                       /* MOV  */
  YYSYMBOL_LSL = 25,                       /* LSL  */
  YYSYMBOL_LSR = 26,                       /* LSR  */
  YYSYMBOL_ASR = 27,                       /* ASR  */
  YYSYMBOL_NOP = 28,                       /* NOP  */
  YYSYMBOL_HALT = 29,                      /* HALT  */
  YYSYMBOL_DLLR = 30,                      /* DLLR  */
  YYSYMBOL_NUMB = 31,                      /* NUMB  */
  YYSYMBOL_PERC = 32,                      /* PERC  */
  YYSYMBOL_NEW_LINE = 33,                  /* NEW_LINE  */
  YYSYMBOL_REGISTER = 34,                  /* REGISTER  */
  YYSYMBOL_REG_LR = 35,                    /* REG_LR  */
  YYSYMBOL_LABEL = 36,                     /* LABEL  */
  YYSYMBOL_LABEL_DEF = 37,                 /* LABEL_DEF  */
  YYSYMBOL_DEC_NUMBER = 38,                /* DEC_NUMBER  */
  YYSYMBOL_BIN_NUMBER = 39,                /* BIN_NUMBER  */
  YYSYMBOL_HEX_NUMBER = 40,                /* HEX_NUMBER  */
  YYSYMBOL_41_ = 41,                       /* ','  */
  YYSYMBOL_42_ = 42,                       /* '['  */
  YYSYMBOL_43_ = 43,                       /* ']'  */
  YYSYMBOL_44_ = 44,                       /* '#'  */
  YYSYMBOL_45_ = 45,                       /* '='  */
  YYSYMBOL_YYACCEPT = 46,                  /* $accept  */
  YYSYMBOL_assembly_program = 47,          /* assembly_program  */
  YYSYMBOL_directive = 48,                 /* directive  */
  YYSYMBOL_instruction = 49,               /* instruction  */
  YYSYMBOL_assembly_instruction = 50,      /* assembly_instruction  */
  YYSYMBOL_control_flow_inst = 51,         /* control_flow_inst  */
  YYSYMBOL_pcrel_branch = 52,              /* pcrel_branch  */
  YYSYMBOL_indirect_branch = 53,           /* indirect_branch  */
  YYSYMBOL_alu_inst = 54,                  /* alu_inst  */
  YYSYMBOL_55_1 = 55,                      /* $@1  */
  YYSYMBOL_three_operand_opcode = 56,      /* three_operand_opcode  */
  YYSYMBOL_two_operand_opcode = 57,        /* two_operand_opcode  */
  YYSYMBOL_memory_inst = 58,               /* memory_inst  */
  YYSYMBOL_mem_op = 59,                    /* mem_op  */
  YYSYMBOL_shift_op = 60,                  /* shift_op  */
  YYSYMBOL_mov_params = 61,                /* mov_params  */
  YYSYMBOL_immediate = 62,                 /* immediate  */
  YYSYMBOL_number = 63,                    /* number  */
  YYSYMBOL_reg0 = 64,                      /* reg0  */
  YYSYMBOL_reg1 = 65,                      /* reg1  */
  YYSYMBOL_reg2 = 66,                      /* reg2  */
  YYSYMBOL_reg = 67,                       /* reg  */
  YYSYMBOL_label_stmt = 68                 /* label_stmt  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  50
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   88

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  23
/* YYNRULES -- Number of rules.  */
#define YYNRULES  62
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  101

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   295


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,    44,     2,     2,     2,     2,
       2,     2,     2,     2,    41,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    45,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    42,     2,    43,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    41,    41,    42,    43,    44,    47,    48,    49,    50,
      51,    52,    53,    56,    57,    60,    61,    62,    63,    64,
      67,    68,    71,    72,    73,    74,    75,    76,    79,    80,
      83,    84,    85,    86,    87,    87,    90,    91,    94,    95,
      98,    99,   102,   103,   106,   107,   108,   111,   112,   113,
     116,   117,   118,   119,   122,   128,   134,   148,   151,   154,
     157,   158,   161
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "DOT_ORG",
  "DOT_SECTION", "DOT_TEXT", "DOT_DATA", "DOT_WORD", "DOT_EQU",
  "DOT_GLOBAL", "B", "BEQ", "BNE", "BLT", "BLE", "BL", "BLX", "BX", "LDR",
  "STR", "ADD", "AND", "CMP", "MVN", "MOV", "LSL", "LSR", "ASR", "NOP",
  "HALT", "DLLR", "NUMB", "PERC", "NEW_LINE", "REGISTER", "REG_LR",
  "LABEL", "LABEL_DEF", "DEC_NUMBER", "BIN_NUMBER", "HEX_NUMBER", "','",
  "'['", "']'", "'#'", "'='", "$accept", "assembly_program", "directive",
  "instruction", "assembly_instruction", "control_flow_inst",
  "pcrel_branch", "indirect_branch", "alu_inst", "$@1",
  "three_operand_opcode", "two_operand_opcode", "memory_inst", "mem_op",
  "shift_op", "mov_params", "immediate", "number", "reg0", "reg1", "reg2",
  "reg", "label_stmt", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-61)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      -2,    36,    57,   -61,    36,   -32,   -11,   -61,   -61,   -61,
     -61,   -61,   -61,   -61,   -61,   -61,   -61,   -61,   -61,   -61,
     -61,   -61,   -61,   -61,    -2,   -61,    33,    -2,    -2,   -61,
     -61,    -8,    49,   -61,    49,    49,   -61,    49,   -61,   -61,
     -61,   -61,   -61,   -61,   -61,   -61,    -3,   -61,    49,   -61,
     -61,   -61,   -61,   -61,    28,     5,   -61,   -61,   -61,   -61,
     -61,    12,    16,    29,    36,   -61,    30,   -61,   -61,   -61,
      49,    49,     9,   -61,    10,    40,   -61,    44,    49,   -61,
      46,    49,    52,    39,    52,    47,   -61,   -61,   -61,   -61,
      -8,    -8,   -61,    -8,    52,   -61,    43,   -61,    -8,   -61,
     -61
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       5,     0,     0,    10,     0,     0,     0,    27,    22,    23,
      24,    25,    26,    29,    28,    42,    43,    36,    37,    38,
      39,    34,    18,    19,     5,    62,     0,     5,     5,    13,
      15,     0,     0,    16,     0,     0,    17,     0,    14,    54,
      56,    55,     6,     7,     8,     9,     0,    11,     0,     4,
       1,     2,     3,    53,     0,     0,    20,    60,    61,    21,
      57,     0,     0,     0,     0,    35,     0,    51,    50,    52,
       0,     0,     0,    12,     0,     0,    58,    33,     0,    49,
      48,     0,     0,     0,     0,    31,    59,    44,    45,    46,
       0,     0,    40,     0,     0,    32,     0,    47,     0,    41,
      30
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -61,    45,   -61,   -61,   -61,   -61,   -61,   -61,   -61,   -61,
     -61,   -61,   -61,   -61,   -60,   -61,   -51,    -4,    -5,   -13,
     -61,   -22,   -61
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,    26,    27,    28,    29,    30,    31,    32,    33,    48,
      34,    35,    36,    37,    90,    65,    56,    42,    59,    75,
      85,    60,    38
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      45,     1,     2,     3,    46,     4,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    17,    18,
      19,    20,    21,    79,    93,    47,    22,    23,    53,    61,
      62,    24,    63,    50,    98,    25,    54,    55,    64,    95,
      96,    69,    97,    66,    57,    58,    53,   100,    76,    76,
      68,    78,    76,    70,    54,    55,    76,    71,    77,    86,
      73,    80,    43,    44,    67,    83,    39,    40,    41,    49,
      72,    74,    51,    52,    39,    40,    41,    87,    88,    89,
      91,    81,    92,    57,    58,    82,    99,    84,    94
};

static const yytype_int8 yycheck[] =
{
       4,     3,     4,     5,    36,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    17,    18,    19,    20,    21,
      22,    23,    24,    74,    84,    36,    28,    29,    36,    34,
      35,    33,    37,     0,    94,    37,    44,    45,    41,    90,
      91,    36,    93,    48,    34,    35,    36,    98,    70,    71,
      54,    42,    74,    41,    44,    45,    78,    41,    71,    81,
      64,    74,     5,     6,    36,    78,    38,    39,    40,    24,
      41,    41,    27,    28,    38,    39,    40,    25,    26,    27,
      41,    41,    43,    34,    35,    41,    43,    41,    41
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     3,     4,     5,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    21,    22,
      23,    24,    28,    29,    33,    37,    47,    48,    49,    50,
      51,    52,    53,    54,    56,    57,    58,    59,    68,    38,
      39,    40,    63,     5,     6,    63,    36,    36,    55,    47,
       0,    47,    47,    36,    44,    45,    62,    34,    35,    64,
      67,    64,    64,    64,    41,    61,    64,    36,    63,    36,
      41,    41,    41,    63,    41,    65,    67,    65,    42,    62,
      65,    41,    41,    65,    41,    66,    67,    25,    26,    27,
      60,    41,    43,    60,    41,    62,    62,    62,    60,    43,
      62
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    46,    47,    47,    47,    47,    48,    48,    48,    48,
      48,    48,    48,    49,    49,    50,    50,    50,    50,    50,
      51,    51,    52,    52,    52,    52,    52,    52,    53,    53,
      54,    54,    54,    54,    55,    54,    56,    56,    57,    57,
      58,    58,    59,    59,    60,    60,    60,    61,    61,    61,
      62,    62,    62,    62,    63,    63,    63,    64,    65,    66,
      67,    67,    68
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     2,     2,     2,     0,     2,     2,     2,     2,
       1,     2,     4,     1,     1,     1,     1,     1,     1,     1,
       2,     2,     1,     1,     1,     1,     1,     1,     1,     1,
       9,     6,     7,     4,     0,     3,     1,     1,     1,     1,
       6,     8,     1,     1,     1,     1,     1,     6,     3,     3,
       2,     2,     2,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 6: /* directive: DOT_ORG number  */
#line 47 "sas.y"
                                               { asmblr_obj.set_addr((yyvsp[0].integer_value)); }
#line 1345 "y.tab.c"
    break;

  case 7: /* directive: DOT_SECTION DOT_TEXT  */
#line 48 "sas.y"
                                               { asmblr_obj.set_section(".text"); }
#line 1351 "y.tab.c"
    break;

  case 8: /* directive: DOT_SECTION DOT_DATA  */
#line 49 "sas.y"
                                               { asmblr_obj.set_section(".data"); }
#line 1357 "y.tab.c"
    break;

  case 9: /* directive: DOT_WORD number  */
#line 50 "sas.y"
                                               { asmblr_obj.set_word((yyvsp[0].integer_value)); }
#line 1363 "y.tab.c"
    break;

  case 10: /* directive: DOT_TEXT  */
#line 51 "sas.y"
                                               { asmblr_obj.set_section(".text"); }
#line 1369 "y.tab.c"
    break;

  case 11: /* directive: DOT_GLOBAL LABEL  */
#line 52 "sas.y"
                                               { asmblr_obj.set_entry((yyvsp[0].string_value)); }
#line 1375 "y.tab.c"
    break;

  case 12: /* directive: DOT_EQU LABEL ',' number  */
#line 53 "sas.y"
                                               { asmblr_obj.add_constant((yyvsp[-2].string_value),(yyvsp[0].integer_value)); }
#line 1381 "y.tab.c"
    break;

  case 13: /* instruction: assembly_instruction  */
#line 56 "sas.y"
                                           {asmblr_obj.end_inst();}
#line 1387 "y.tab.c"
    break;

  case 18: /* assembly_instruction: NOP  */
#line 63 "sas.y"
                           {asmblr_obj.set_inst("NOP");}
#line 1393 "y.tab.c"
    break;

  case 19: /* assembly_instruction: HALT  */
#line 64 "sas.y"
                           {asmblr_obj.set_inst("HALT");}
#line 1399 "y.tab.c"
    break;

  case 22: /* pcrel_branch: BEQ  */
#line 71 "sas.y"
                          {asmblr_obj.set_inst("BEQ");}
#line 1405 "y.tab.c"
    break;

  case 23: /* pcrel_branch: BNE  */
#line 72 "sas.y"
                          {asmblr_obj.set_inst("BNE");}
#line 1411 "y.tab.c"
    break;

  case 24: /* pcrel_branch: BLT  */
#line 73 "sas.y"
                          {asmblr_obj.set_inst("BLT");}
#line 1417 "y.tab.c"
    break;

  case 25: /* pcrel_branch: BLE  */
#line 74 "sas.y"
                          {asmblr_obj.set_inst("BLE");}
#line 1423 "y.tab.c"
    break;

  case 26: /* pcrel_branch: BL  */
#line 75 "sas.y"
                          {asmblr_obj.set_inst("BL");}
#line 1429 "y.tab.c"
    break;

  case 27: /* pcrel_branch: B  */
#line 76 "sas.y"
                          {asmblr_obj.set_inst("B");}
#line 1435 "y.tab.c"
    break;

  case 28: /* indirect_branch: BX  */
#line 79 "sas.y"
                          {asmblr_obj.set_inst("BX");}
#line 1441 "y.tab.c"
    break;

  case 29: /* indirect_branch: BLX  */
#line 80 "sas.y"
                          {asmblr_obj.set_inst("BLX");}
#line 1447 "y.tab.c"
    break;

  case 34: /* $@1: %empty  */
#line 87 "sas.y"
                          {asmblr_obj.set_inst("MOV");}
#line 1453 "y.tab.c"
    break;

  case 36: /* three_operand_opcode: ADD  */
#line 90 "sas.y"
                          {asmblr_obj.set_inst("ADD");}
#line 1459 "y.tab.c"
    break;

  case 37: /* three_operand_opcode: AND  */
#line 91 "sas.y"
                          {asmblr_obj.set_inst("AND");}
#line 1465 "y.tab.c"
    break;

  case 38: /* two_operand_opcode: CMP  */
#line 94 "sas.y"
                          {asmblr_obj.set_inst("CMP");}
#line 1471 "y.tab.c"
    break;

  case 39: /* two_operand_opcode: MVN  */
#line 95 "sas.y"
                          {asmblr_obj.set_inst("MVN");}
#line 1477 "y.tab.c"
    break;

  case 42: /* mem_op: LDR  */
#line 102 "sas.y"
                          {asmblr_obj.set_inst("LDR");}
#line 1483 "y.tab.c"
    break;

  case 43: /* mem_op: STR  */
#line 103 "sas.y"
                          {asmblr_obj.set_inst("STR");}
#line 1489 "y.tab.c"
    break;

  case 44: /* shift_op: LSL  */
#line 106 "sas.y"
                          {asmblr_obj.set_shift("LSL"); }
#line 1495 "y.tab.c"
    break;

  case 45: /* shift_op: LSR  */
#line 107 "sas.y"
                          {asmblr_obj.set_shift("LSR"); }
#line 1501 "y.tab.c"
    break;

  case 46: /* shift_op: ASR  */
#line 108 "sas.y"
                          {asmblr_obj.set_shift("ASR"); }
#line 1507 "y.tab.c"
    break;

  case 49: /* mov_params: reg0 ',' immediate  */
#line 113 "sas.y"
                                         {asmblr_obj.reset_inst("MOVI");}
#line 1513 "y.tab.c"
    break;

  case 51: /* immediate: '#' LABEL  */
#line 117 "sas.y"
                                {asmblr_obj.set_label((yyvsp[0].string_value));}
#line 1519 "y.tab.c"
    break;

  case 52: /* immediate: '=' LABEL  */
#line 118 "sas.y"
                                {asmblr_obj.set_label((yyvsp[0].string_value));}
#line 1525 "y.tab.c"
    break;

  case 53: /* immediate: LABEL  */
#line 119 "sas.y"
                            {asmblr_obj.set_label((yyvsp[0].string_value));}
#line 1531 "y.tab.c"
    break;

  case 54: /* number: DEC_NUMBER  */
#line 122 "sas.y"
                                 { 
  int result;
  asmblr_obj.set_dec((yyvsp[0].string_value));
  sscanf((yyvsp[0].string_value),"%d", &result); 
  (yyval.integer_value) = result;
}
#line 1542 "y.tab.c"
    break;

  case 55: /* number: HEX_NUMBER  */
#line 128 "sas.y"
                                 {
  unsigned result;
  asmblr_obj.set_hex((yyvsp[0].string_value)); 
  sscanf((yyvsp[0].string_value),"%x", &result);
  (yyval.integer_value) = result;
}
#line 1553 "y.tab.c"
    break;

  case 56: /* number: BIN_NUMBER  */
#line 134 "sas.y"
                                 { 
  int mask = 1;
  unsigned length = strlen((yyvsp[0].string_value));
  int result=0;
  asmblr_obj.set_bin((yyvsp[0].string_value)); 
  for( int i=0; i < length-2; i++) {
    if( (yyvsp[0].string_value)[length-1-i] == '1' ) 
      result += mask;
    mask <<= 1;
  }
  (yyval.integer_value) = result;
}
#line 1570 "y.tab.c"
    break;

  case 57: /* reg0: reg  */
#line 148 "sas.y"
                          {asmblr_obj.set_reg(0);}
#line 1576 "y.tab.c"
    break;

  case 58: /* reg1: reg  */
#line 151 "sas.y"
                          {asmblr_obj.set_reg(1);}
#line 1582 "y.tab.c"
    break;

  case 59: /* reg2: reg  */
#line 154 "sas.y"
                          {asmblr_obj.set_reg(2);}
#line 1588 "y.tab.c"
    break;

  case 60: /* reg: REGISTER  */
#line 157 "sas.y"
                               {asmblr_obj.set_reg((yyvsp[0].string_value));}
#line 1594 "y.tab.c"
    break;

  case 61: /* reg: REG_LR  */
#line 158 "sas.y"
                               {asmblr_obj.set_reg("R7");}
#line 1600 "y.tab.c"
    break;

  case 62: /* label_stmt: LABEL_DEF  */
#line 161 "sas.y"
                                {asmblr_obj.define_label((yyvsp[0].string_value));}
#line 1606 "y.tab.c"
    break;


#line 1610 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 163 "sas.y"


void handle_arg(string arg, string value)
{
  if(arg=="-v"){
    asmblr_obj.set_file_name(value);
  } else {
    cerr<<"Invalid command argument: "<<arg<<endl;
    exit(-1);
  }
}

char *g_filename;

int main(int argc, char *argv[]) 
{
  yydebug = 0;
  yy_flex_debug = 1;
  if(argc<2){
            printf("USAGE: %s <.s file>\n",argv[0]);
            exit(1);
  }
  g_filename = strdup(argv[1]);
  printf("Input file: %s\n",argv[1]);
  FILE *myfile = fopen(argv[1], "r");
  char *tmp = strdup(argv[1]);
  char *base = strtok(tmp,".");
  asmblr_obj.set_file_name(base);
  asmblr_obj.set_addr_width(8);
  
  if(!myfile) {
    printf("Error: cannot open file %s \n",argv[1]);
    exit(1);
  }
  
  // set lex to read from file 
  yyin = myfile;

  if(argc==3 or argc>4){
    cerr<<"Invalid number of arguments \n"<<endl;
    exit(-1);
    }
    
  if(argc==4)
    handle_arg(argv[2],argv[3]);
  
  
  do {
    yyparse();
  } while (!feof(yyin));
  
  asmblr_obj.end_of_file();
  
  fclose(myfile);
}

