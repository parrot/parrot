/* op.h
 *
 * Opcode header
 *
 */

#if !defined(PARROT_OP_H_GUARD)
#define PARROT_OP_H_GUARD

typedef IV OP;

#define DEFAULT_OPCODE_TABLE NULL
IV *set_i_ic(IV *, struct Perl_Interp *);
IV *add_i(IV *, struct Perl_Interp *);
IV *sub_i(IV *, struct Perl_Interp *);
IV *mul_i(IV *, struct Perl_Interp *);
IV *div_i(IV *, struct Perl_Interp *);
IV *eq_i_ic(IV *, struct Perl_Interp *);
IV *time_i(IV *, struct Perl_Interp *);
IV *print_i(IV *, struct Perl_Interp *);
IV *branch_ic(IV *, struct Perl_Interp *);
IV *end(IV *, struct Perl_Interp *);
IV *if_i_ic(IV *, struct Perl_Interp *);
IV *inc_i(IV *, struct Perl_Interp *);
IV *inc_i_ic(IV *, struct Perl_Interp *);
IV *dec_i(IV *, struct Perl_Interp *);
IV *dec_i_ic(IV *, struct Perl_Interp *);
IV *jump_i(IV *, struct Perl_Interp *);
IV *set_n_nc(IV *, struct Perl_Interp *);
IV *add_n(IV *, struct Perl_Interp *);
IV *sub_n(IV *, struct Perl_Interp *);
IV *mul_n(IV *, struct Perl_Interp *);
IV *div_n(IV *, struct Perl_Interp *);
IV *eq_n_ic(IV *, struct Perl_Interp *);
IV *time_n(IV *, struct Perl_Interp *);
IV *print_n(IV *, struct Perl_Interp *);
IV *if_n_ic(IV *, struct Perl_Interp *);
IV *inc_n(IV *, struct Perl_Interp *);
IV *inc_n_nc(IV *, struct Perl_Interp *);
IV *dec_n(IV *, struct Perl_Interp *);
IV *dec_n_nc(IV *, struct Perl_Interp *);
IV *iton_n_i(IV *, struct Perl_Interp *);
IV *ntoi_i_n(IV *, struct Perl_Interp *);

#endif
