/*
 * exec_dep.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    i386 dependent functions to emit an executable.
 * History:
 *      Initial version by Daniel Grunblatt on 2003.6.9
 * Notes:
 * References:
 */

#ifndef EXEC_DEP_H_GUARD
#  define EXEC_DEP_H_GUARD

static void save_zero(FILE *fp);
static void save_int(FILE *fp, int i);
static void save_short(FILE *fp, short s);
static void save_struct(FILE *fp, void *sp, size_t size);

#  ifdef JIT_CGP

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    Parrot_jit_optimizer_section_ptr cur_section =
        jit_info->optimizer->cur_section;
    int i, j, last_is_branch = 0;
    void ** offset;

    assert(op_jit[*jit_info->cur_op].extcall == 1);
    if (cur_section->done == 1)
        return;
    else if (cur_section->done == -1 && --cur_section->ins_count > 0)
        return;
    /* check, where section ends
     */
    if (interpreter->op_info_table[*cur_section->end].jump)
        last_is_branch = 1;
    else if (cur_section->next && !cur_section->next->isjit)
        last_is_branch = 1;
    /* if more then 1 op, then jump to CGP, branches are never
     * executed in CGP, they are handled below */
    if (cur_section->done >= 0 &&
            (INTVAL)cur_section->op_count >= 2 + last_is_branch) {
        int saved = 0;
        offset = (void **)((int)jit_info->cur_op -
            (int)interpreter->code->byte_code);

        jit_emit_mov_ri_i(jit_info->native_ptr, emit_ESI, offset);
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_COM, "exec_prederef_code", -4);
        emitm_callm(jit_info->native_ptr, emit_ESI, 0, 0, 0);
        /* now patch a B<cpu_ret> opcode after the end of the
         * prederefed (non JIT) section
         */
        if (last_is_branch) {
            offset = (cur_section->end - interpreter->code->byte_code) +
                interpreter->code->cur_cs->prederef_code;
            cur_section->done = -1;
            /* ins to skip */
            cur_section->ins_count = cur_section->op_count - 1;
        }
        else {
            /* There must be a next section: either we have a B<end>
             * or a JITed branch,
             * when the branch is non JIT, we are in the above case
             */
            offset = (cur_section->next->begin - interpreter->code->byte_code) +
                interpreter->code->cur_cs->prederef_code;
            cur_section->done = 1;
        }
        i = (int)(((op_func_t*)interpreter->op_lib->op_func_table)[2]);
        j = (int)cgp_core;
        *offset = (void *)(i - j);
    }
    else {

        /* else call normal funtion */
        emitm_pushl_i(jit_info->native_ptr, 0x0);
        Parrot_exec_add_text_rellocation(jit_info->objfile, 
            jit_info->native_ptr, RTYPE_COM, "interpre", -4);
        emitm_pushl_i(jit_info->native_ptr, jit_info->op_i * sizeof(opcode_t));
        Parrot_exec_add_text_rellocation(jit_info->objfile,
            jit_info->native_ptr, RTYPE_DATA, "program_code", -4);

        Parrot_exec_add_text_rellocation_func(jit_info->objfile,
            jit_info->native_ptr,
                interpreter->op_info_table[*jit_info->cur_op].func_name);
        emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
        emitm_addb_i_r(jit_info->native_ptr, 8, emit_ESP);
        /* when this was a branch, then EAX is now the offset
         * in the byte_code
         */

    }
}

#  else /* JIT_CGP */

void
Parrot_exec_normal_op(Parrot_jit_info_t *jit_info,
                     struct Parrot_Interp * interpreter)
{
    emitm_pushl_i(jit_info->native_ptr, jit_info->op_i * sizeof(opcode_t));
    Parrot_exec_add_text_rellocation(jit_info->objfile, jit_info->native_ptr,
        RTYPE_DATA, "program_code", -4);

    Parrot_exec_add_text_rellocation_func(jit_info->objfile,
        jit_info->native_ptr,
            interpreter->op_info_table[*jit_info->cur_op].func_name);
    emitm_calll(jit_info->native_ptr, EXEC_CALLDISP);
    emitm_addb_i_r(jit_info->native_ptr, 4, emit_ESP);
}

#  endif /* JIT_CGP */

void
Parrot_exec_cpcf_op(Parrot_jit_info_t *jit_info,
                   struct Parrot_Interp * interpreter)
{
    Parrot_exec_normal_op(jit_info, interpreter);
    Parrot_emit_jump_to_eax(jit_info, interpreter);
}

void
Parrot_exec_emit_mov_rm(struct Parrot_Interp * interpreter, int reg, char *mem)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;
    if (reg == 1)
        (*nptr++) = 0xa1;
    else {
        (*nptr++) = 0x8b;
        (*nptr++) = ((reg - 1) << 3) + 5;
    }
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr, 
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_mr(struct Parrot_Interp * interpreter, char *mem,int reg)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;
    if (reg == 1)
        (*nptr++) = 0xa3;
    else {
        (*nptr++) = 0x89;
        (*nptr++) = ((reg - 1) << 3) + 5;
    }
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr, 
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_rm_n(struct Parrot_Interp * interpreter, int reg,char *mem)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;

    *(nptr++) = 0xdd;
    *(nptr++) = 0x05;
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr, 
            RTYPE_COM, "interpre", -4);
    emitm_fstp((nptr), (reg+1));
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

void
Parrot_exec_emit_mov_mr_n(struct Parrot_Interp * interpreter, char *mem, int reg)
{
    char *nptr = ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr;

    emitm_fld((nptr), reg);
    *(nptr++) = 0xdd;
    *(nptr++) = 0x1d;
    *(long *)(nptr) = (long)mem;
    nptr += 4;
    Parrot_exec_add_text_rellocation(
        (*(Parrot_jit_info_t *)(interpreter->jit_info)).objfile, nptr, 
            RTYPE_COM, "interpre", -4);
    ((Parrot_jit_info_t *)(interpreter->jit_info))->native_ptr = nptr;
}

/* Assign the offset of the progra_code */
static void
offset_fixup(Parrot_exec_objfile_t *obj)
{
    int i,j;

    for (i = 0; i < obj->data_count; i++) {
#  ifdef EXEC_A_OUT
        obj->symbol_table[i].offset_text = obj->text.size;
#  endif
        for (j = 0; j < i; j++) 
            obj->symbol_table[i].offset_text += obj->data_size[j];
    }
}

#  ifdef EXEC_A_OUT

#   include <a.out.h>
#   include <link.h>

void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    FILE *fp;
    int i;
    struct exec header;
    struct relocation_info rellocation;
    struct nlist symlst;

    fp = fopen(file, "w");
    
    header.a_midmag = 0x07018600;
    header.a_text = obj->text.size;
    header.a_data = obj->data.size;
    header.a_bss = obj->bss.size;
    header.a_syms = obj->symbol_count * sizeof(struct nlist);
    header.a_entry = 0;
    header.a_trsize = obj->text_rellocation_count
        * sizeof(struct relocation_info);
    header.a_drsize = obj->data_rellocation_count
        * sizeof(struct relocation_info);
    save_struct(fp, &header, sizeof(struct exec));
   /* Text */
    for (i = 0; i < obj->text.size; i++)
        fprintf(fp, "%c", obj->text.code[i]);
    /* Data */
    for (i = 0; i < obj->data.size; i++)
        fprintf(fp, "%c", obj->data.code[i]);
    /* Text rellocations */
    for (i = obj->text_rellocation_count - 1; i >= 0; i--) {
        bzero(&rellocation, sizeof(struct relocation_info));
        rellocation.r_address = obj->text_rellocation_table[i].offset;
        rellocation.r_symbolnum = obj->text_rellocation_table[i].symbol_number;
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                rellocation.r_pcrel = 1;
                rellocation.r_length = 2;
                rellocation.r_extern = 1;
                break;
            case RTYPE_COM:
                rellocation.r_length = 2;
                rellocation.r_extern = 1;
                break;
            case RTYPE_DATA:
                rellocation.r_length = 2;
                rellocation.r_extern = 1;
                break;
            default:
                break;
        }
        save_struct(fp, &rellocation, sizeof(struct relocation_info));
   }
    /* Symbol table */
    for (i = 0; i < obj->symbol_count; i++) {
        bzero(&symlst, sizeof(struct nlist));
        symlst.n_un.n_strx = obj->symbol_table[i].offset_list;
        switch (obj->symbol_table[i].type) {
            case STYPE_FUNC:
                symlst.n_type = N_EXT | N_TEXT;
                symlst.n_other = AUX_FUNC;
                break;
            case STYPE_GDATA:
                symlst.n_type = N_EXT | N_DATA;
                symlst.n_other = AUX_OBJECT;
                symlst.n_value = obj->symbol_table[i].offset_text;
                break;
            case STYPE_COM:
                symlst.n_type = N_EXT;
                symlst.n_value = obj->symbol_table[i].offset_text;
                break;
            case STYPE_UND:
                symlst.n_type = N_EXT;
                break;
            default:
                break;
        }
        save_struct(fp, &symlst, sizeof(struct nlist));
   }
    /* String table size */
    save_int(fp, obj->symbol_list_size);
    /* String table */
    for (i = 0; i < obj->symbol_count; i++) {
        if (obj->symbol_table[i].type != STYPE_GCC)
            fprintf(fp, "_%s", obj->symbol_table[i].symbol);
        else
            fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    fclose(fp);
}

#  endif /* EXEC_A_OUT */

#  ifdef EXEC_ELF

#  include <elf.h>

#  define sh_add(n,t,f,s,l,i,a,e) { \
    bzero(&sechdr, sizeof(Elf32_Ehdr)); \
    sechdr.sh_name = shste - shst; \
    shste += sprintf(shste, "%s", n); \
    shste++; \
    sechdr.sh_type = t; \
    sechdr.sh_flags = f; \
    sechdr.sh_addr = 0; \
    sechdr.sh_offset = current_offset; \
    sechdr.sh_size = s; \
    sechdr.sh_link = l; \
    sechdr.sh_info = i; \
    sechdr.sh_addralign = a; \
    sechdr.sh_entsize = e; \
    save_struct(fp, &sechdr, sizeof(Elf32_Shdr)); \
    current_offset += s; \
    if (s % 4) \
      current_offset += (4 - s % 4); \
   }

void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    Elf32_Ehdr header;
    Elf32_Shdr sechdr;
    Elf32_Rel rellocation;
    Elf32_Sym symlst;
    Elf32_Off current_offset;
    FILE *fp;
    int i;
    char shst[72], *shste;

    fp = fopen(file, "w");
    
    bzero(&header, sizeof(Elf32_Ehdr));
    header.e_ident[0] = ELFMAG0;
    header.e_ident[1] = ELFMAG1;
    header.e_ident[2] = ELFMAG2;
    header.e_ident[3] = ELFMAG3;
    header.e_ident[4] = ELFCLASS32;
    header.e_ident[5] = ELFDATA2LSB;
    header.e_ident[6] = EV_CURRENT;
#   if EXEC_OS == FREEBSD
    header.e_ident[7] = ELFOSABI_FREEBSD;
#   endif
#   if EXEC_OS == NETBSD
    header.e_ident[7] = ELFOSABI_NETBSD;
#   endif
#   if EXEC_OS == LINUX && defined(ELFOSABI_LINUX)
    header.e_ident[7] = ELFOSABI_LINUX;
#   endif

    header.e_type = ET_REL;
    header.e_machine = EM_386;
    header.e_version = EV_CURRENT;
    header.e_entry = 0;
    header.e_phoff = 0;
    header.e_shoff = sizeof(Elf32_Ehdr);
    header.e_flags = 0;
    header.e_ehsize = sizeof(Elf32_Ehdr);
    header.e_phentsize = 0;
    header.e_phnum = 0;
    header.e_shentsize = sizeof(Elf32_Shdr);
    header.e_shnum = 10;
    header.e_shstrndx = 1;

    save_struct(fp, &header, sizeof(Elf32_Ehdr));

    current_offset = sizeof(Elf32_Ehdr) + 10 * sizeof(Elf32_Shdr);

    /* Sections */
    bzero(&shst, 72);
    shste = shst + 1;
    /* NULL */
    bzero(&sechdr, sizeof(Elf32_Ehdr));
    save_struct(fp, &sechdr, sizeof(Elf32_Shdr));
    /* Section Header String Table */
    sh_add(".shstrtab", SHT_STRTAB, 0, 0x48, 0, 0, 1, 0);
    /* Text */
    sh_add(".text", SHT_PROGBITS, SHF_ALLOC | SHF_EXECINSTR, obj->text.size,
        0, 0, 4, 0);
    /* Data */
    sh_add(".data", SHT_PROGBITS, SHF_WRITE | SHF_ALLOC, obj->data.size,
        0, 0, 4, 0);
    /* Bss */
    sh_add(".bss", SHT_NOBITS, SHF_WRITE | SHF_ALLOC, obj->bss.size,
        0, 0, 4, 0);
    /* 
     * Text rellocation records.
     * Link must be the symtab section header index.
     * Info is the text section header index.
     */
    sh_add(".rel.text", SHT_REL, 0, obj->text_rellocation_count *
        sizeof(Elf32_Rel), 6, 2, 4, sizeof(Elf32_Rel));
    /* 
     * Symbol table.
     * Link is the strtab section header index.
     * Info is self section header index.
     */
    sh_add(".symtab", SHT_SYMTAB, 0, (obj->symbol_count + 7) *
        sizeof(Elf32_Sym), 7, 6, 4, sizeof(Elf32_Sym));
    /* String Table */
    obj->symbol_list_size += 1; /* Trailing \0 */
    sh_add(".strtab", SHT_STRTAB, 0, obj->symbol_list_size, 0, 0, 1, 0);
    /* Read Only data */
    sh_add(".rodata", SHT_PROGBITS, SHF_ALLOC, 0, 0, 0, 1, 0);
    /* Comment */
    sh_add(".comment", SHT_PROGBITS, 0, 0x28, 0, 0, 1, 0);

    /* Section header string table */
    save_struct(fp, &shst, 72);
    save_struct(fp, obj->text.code, obj->text.size); /* Text */
    save_struct(fp, obj->data.code, obj->data.size); /* Data */
    /* Text rellocations */
    for (i = 0; i < obj->text_rellocation_count; i++) {
        bzero(&rellocation, sizeof(Elf32_Rel));
        rellocation.r_offset = obj->text_rellocation_table[i].offset;
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + 7, 2);
                break;
            case RTYPE_DATA:
            case RTYPE_COM:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + 7, 1);
                break;
                /* 3 == data section */
            //    rellocation.r_info = ELF32_R_INFO(3, 1);
             //   break;
            default:
                break;
        }
        save_struct(fp, &rellocation, sizeof(Elf32_Rel));
   }
    /* Symbol table */
    /* zero */
    bzero(&symlst, sizeof(Elf32_Sym));
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* File */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_name = 1;
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_FILE);
    symlst.st_shndx = SHN_ABS;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* Text */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_SECTION);
    symlst.st_shndx = 2;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* Data */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_SECTION);
    symlst.st_shndx = 3;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* Bss */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_SECTION);
    symlst.st_shndx = 4;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* rodata */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_SECTION);
    symlst.st_shndx = 8;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));
    /* Comment */
    bzero(&symlst, sizeof(Elf32_Sym));
    symlst.st_info = ELF32_ST_INFO(STB_LOCAL, STT_SECTION);
    symlst.st_shndx = 9;
    save_struct(fp, &symlst, sizeof(Elf32_Sym));

    for (i = 0; i < obj->symbol_count; i++) {
        bzero(&symlst, sizeof(Elf32_Sym));
        symlst.st_name = obj->symbol_table[i].offset_list + 1;
        switch (obj->symbol_table[i].type) {
            case STYPE_FUNC:
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_FUNC);
                symlst.st_size = obj->text.size;
                symlst.st_shndx = 2; /* text */
                break;
            case STYPE_GDATA:
                symlst.st_value = obj->symbol_table[i].offset_text;
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_OBJECT);
                symlst.st_shndx = 3; /* data */
                break;
            case STYPE_COM:
                symlst.st_value = obj->symbol_table[i].offset_text;
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_OBJECT);
                symlst.st_shndx = SHN_COMMON;
                break;
            case STYPE_UND:
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_NOTYPE);
                break;
            default:
                break;
        }
        save_struct(fp, &symlst, sizeof(Elf32_Sym));
   }
    /* String table */
    save_zero(fp);
    fprintf(fp, "t.pbc");
    save_zero(fp);
    for (i = 0; i < obj->symbol_count; i++) {
        fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    /* PAD */
    for (i = 0; i < (4 - (obj->symbol_list_size + 1) % 4); i++)
        save_zero(fp);
    save_zero(fp);
    fprintf(fp,"GCC: (GNU) c 2.95.4 20020320 [FreeBSD]");
    save_zero(fp);
    fclose(fp);
}

#  endif /* EXEC_ELF */

static void
save_struct(FILE *fp, void *sp, size_t size)
{
    unsigned int i;

    for (i = 0; i < size; i++)
        fprintf(fp, "%c", ((char *)sp)[i]);
}

static void
save_zero(FILE *fp)
{
    fprintf(fp, "%c", 0);
}

static void
save_int(FILE *fp, int i)
{
    fprintf(fp, "%c%c%c%c", (char)i, (char)(i >> 8),
                            (char)(i >> 16), (char)(i >> 24));
}

static void
save_short(FILE *fp, short s)
{
    fprintf(fp, "%c%c", (char)s, (char)(s >> 8));
}

#endif

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
