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
# define	LOW_PREC	257
# define	CALL	258
# define	GOTO	259
# define	ARG	260
# define	FLATTEN_ARG	261
# define	IF	262
# define	UNLESS	263
# define	NEW	264
# define	END	265
# define	SAVEALL	266
# define	RESTOREALL	267
# define	SUB	268
# define	NAMESPACE	269
# define	ENDNAMESPACE	270
# define	CLASS	271
# define	ENDCLASS	272
# define	SYM	273
# define	LOCAL	274
# define	CONST	275
# define	PARAM	276
# define	INC	277
# define	DEC	278
# define	GLOBAL_CONST	279
# define	SHIFT_LEFT	280
# define	SHIFT_RIGHT	281
# define	INTV	282
# define	FLOATV	283
# define	STRINGV	284
# define	DEFINED	285
# define	LOG_XOR	286
# define	RELOP_EQ	287
# define	RELOP_NE	288
# define	RELOP_GT	289
# define	RELOP_GTE	290
# define	RELOP_LT	291
# define	RELOP_LTE	292
# define	GLOBAL	293
# define	ADDR	294
# define	CLONE	295
# define	RESULT	296
# define	RETURN	297
# define	POW	298
# define	SHIFT_RIGHT_U	299
# define	LOG_AND	300
# define	LOG_OR	301
# define	COMMA	302
# define	ESUB	303
# define	PCC_BEGIN	304
# define	PCC_END	305
# define	PCC_CALL	306
# define	PCC_SUB	307
# define	PCC_BEGIN_RETURN	308
# define	PCC_END_RETURN	309
# define	PCC_BEGIN_YIELD	310
# define	PCC_END_YIELD	311
# define	PROTOTYPED	312
# define	NON_PROTOTYPED	313
# define	LABEL	314
# define	EMIT	315
# define	EOM	316
# define	IREG	317
# define	NREG	318
# define	SREG	319
# define	PREG	320
# define	IDENTIFIER	321
# define	STRINGC	322
# define	INTC	323
# define	FLOATC	324
# define	REG	325
# define	MACRO	326
# define	ENDM	327
# define	PARROT_OP	328
# define	VAR	329
# define	LINECOMMENT	330
# define	FILECOMMENT	331


#endif /* not BISON_IMCPARSER_H */
