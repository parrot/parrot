#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "parrot/parrot.h"
#include "parrot/packfile.h"

SV* output_bytecode(SV* sv) {
    struct PackFile* pf;
    struct PackFile_ConstTable* pf_const;
    SV* out;
    STRLEN tmp;
    SV* tsv;
    IV i;
    AV* const_av;
    opcode_t* outbyte;

    string_init();

    if (!SvROK(sv) || SvTYPE(SvRV(sv)) != SVt_PVHV) {
        Perl_croak(aTHX_ "Argument to output_bytecode needs to be a hash ref\n");
    }

    pf = malloc(sizeof(struct PackFile));
    
    tsv = *hv_fetch((HV*)SvRV(sv), "bytecode", 8, 1);
    pf->byte_code = (opcode_t*) SvPV(tsv, tmp);
    pf->byte_code_size = tmp;

    tsv = *hv_fetch((HV*)SvRV(sv), "constants", 9, 1);
    if (!SvROK(tsv) || SvTYPE(SvRV(tsv)) != SVt_PVAV) {
        Perl_croak(aTHX_ "Constants table not an array reference\n");
    }

    const_av = (AV*)(SvRV(tsv));
    pf_const = malloc(sizeof(struct PackFile_ConstTable));
    
    pf_const->const_count = 1 + av_len(const_av);
    pf_const->constants = malloc(pf_const->const_count * sizeof(struct PackFile_Constant *));

    for(i = 0; i < pf_const->const_count; i++) {
        SV* tmpsv = *av_fetch(const_av, i, 0);
        SV* typesv;
        char* type;
        SV* val;

        if (!SvROK(tmpsv) || SvTYPE(SvRV(tmpsv)) != SVt_PVAV) {
            Perl_croak(aTHX_ "Index %i of constants table not an array reference\n", i);
        }
        
        /* @constants = (..., [ "S", "Hello World" ], ... ); */
        typesv = *av_fetch((AV*)SvRV(tmpsv), 0, 1);
        val  = *av_fetch((AV*)SvRV(tmpsv), 1, 1);

        type = SvPV_nolen(typesv);
        pf_const->constants[i] = malloc(sizeof(struct PackFile_Constant));

        if (*type == 'S') {
            STRLEN len;
            char * str;
            str = SvPV(val, len);
            pf_const->constants[i]->type = PFC_STRING;
            pf_const->constants[i]->string = 
                string_make(NULL, str, len, NULL, 0, NULL);
        }
        else if (*type == 'N') {
            pf_const->constants[i]->type = PFC_NUMBER;
            pf_const->constants[i]->number = SvNV(val);
        }
        else {
            Perl_croak(aTHX_ "Don't know what to do with type %s\n", type);
        }
    }

    pf->const_table = pf_const;

    tmp = PackFile_pack_size(pf);
    outbyte = malloc(tmp);

    /* AFTER ALL THAT! */
    /* XXX JMG Need to free this block at some point */
    pf->header = malloc(sizeof(struct PackFile_Header));
    PackFile_pack(pf, outbyte);

    /* Now format the output as an SV */
    out = newSVpv((char*)outbyte, tmp);

    return out;
}

MODULE = Parrot::PakFile2		PACKAGE = Parrot::PakFile2		

SV* 
output_bytecode(sv)
    INPUT:
        SV* sv
