#ifndef BISON_IMCPARSER_H
# define BISON_IMCPARSER_H

#ifndef YYSTYPE
typedef union {
    int t;
    char * s;
    SymReg * sr;
    Instruction *i;
} yystype;
# define YYSTYPE yystype
# define YYSTYPE_IS_TRIVIAL 1
#endif
# define	CALL	257
# define	GOTO	258
# define	ARG	259
# define	PRINT	260
# define	IF	261
# define	UNLESS	262
# define	NEW	263
# define	END	264
# define	SAVEALL	265
# define	RESTOREALL	266
# define	SUB	267
# define	NAMESPACE	268
# define	ENDNAMESPACE	269
# define	CLASS	270
# define	ENDCLASS	271
# define	SYM	272
# define	LOCAL	273
# define	CONST	274
# define	PARAM	275
# define	INC	276
# define	DEC	277
# define	SHIFT_LEFT	278
# define	SHIFT_RIGHT	279
# define	INTV	280
# define	FLOATV	281
# define	STRINGV	282
# define	DEFINED	283
# define	LOG_XOR	284
# define	RELOP_EQ	285
# define	RELOP_NE	286
# define	RELOP_GT	287
# define	RELOP_GTE	288
# define	RELOP_LT	289
# define	RELOP_LTE	290
# define	GLOBAL	291
# define	ADDR	292
# define	CLONE	293
# define	RESULT	294
# define	RETURN	295
# define	POW	296
# define	SHIFT_RIGHT_U	297
# define	LOG_AND	298
# define	LOG_OR	299
# define	COMMA	300
# define	ESUB	301
# define	LABEL	302
# define	EMIT	303
# define	EOM	304
# define	IREG	305
# define	NREG	306
# define	SREG	307
# define	PREG	308
# define	IDENTIFIER	309
# define	STRINGC	310
# define	INTC	311
# define	FLOATC	312
# define	REG	313
# define	MACRO	314
# define	PARROT_OP	315
# define	VAR	316


extern YYSTYPE yylval;

#endif /* not BISON_IMCPARSER_H */
