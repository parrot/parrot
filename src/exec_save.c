/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/exec_save.c - Save object file in native format

=head1 DESCRIPTION

Save the C<Parrot_exec_objfile_t> to the native format.

=head2 Functions

=over 4

=cut

*/

#include <parrot/parrot.h>
#include "parrot/exec.h"
#include "parrot/exec_save.h"

static void save_zero(FILE *fp);
static void save_int(FILE *fp, int i);
static void save_short(FILE *fp, short s);
static void save_struct(FILE *fp, void *sp, size_t size);

#ifdef EXEC_A_OUT

#  include <a.out.h>
#  include <link.h>

/*

=item C<void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)>

Save the C<Parrot_exec_objfile_t> to C<file>.

=cut

*/

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
            case RTYPE_DATA:
                rellocation.r_length = 2;
                rellocation.r_extern = 1;
                break;
            default:
                internal_exception(EXEC_ERROR,
                    "Unknown text rellocation type: %d\n",
                        obj->text_rellocation_table[i].type);
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
                symlst.n_value = obj->symbol_table[i].value;
                break;
            case STYPE_COM:
                symlst.n_type = N_EXT;
                symlst.n_value = obj->symbol_table[i].value;
                break;
            case STYPE_UND:
                symlst.n_type = N_EXT;
                break;
            default:
                internal_exception(EXEC_ERROR, "Unknown symbol type: %d\n",
                    obj->symbol_table[i].type);
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

#endif /* EXEC_A_OUT */

#ifdef EXEC_ELF

# if PARROT_EXEC_OS_OPENBSD
#  define R_386_32 1
#  define R_386_PC32 2
#  include <elf_abi.h>
# else
#  include <elf.h>
# endif

/* Add a section to the file 
 *
 * n = Name
 * t = Type
 * f = Flags
 * s = Size
 * l = Link
 * i = Info
 * a = Align
 * e = Entry size
 */
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

/* Sizeof the section header string table */
#  define SHSTRTABSIZE  0x48
/* Previously defined symbols (zero, text, data, bss) */
#  define PDFS          4
/* Number of sections */
#  define NSECTIONS     8

void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    Elf32_Ehdr header;
    Elf32_Shdr sechdr;
    Elf32_Rel rellocation;
    Elf32_Rela rel_addend;
    Elf32_Sym symlst;
    Elf32_Off current_offset;
    FILE *fp;
    int i;
    char shst[SHSTRTABSIZE], *shste;

    fp = fopen(file, "w");
    
    bzero(&header, sizeof(Elf32_Ehdr));
    header.e_ident[0] = ELFMAG0;
    header.e_ident[1] = ELFMAG1;
    header.e_ident[2] = ELFMAG2;
    header.e_ident[3] = ELFMAG3;
    header.e_ident[4] = ELFCLASS32;
#  if PARROT_BIGENDIAN
    header.e_ident[5] = ELFDATA2MSB;
#  else /* PARROT_BIGENDIAN */
    header.e_ident[5] = ELFDATA2LSB;
#  endif /* PARROT_BIGENDIAN */
    header.e_ident[6] = EV_CURRENT;
#  if PARROT_EXEC_OS_FREEBSD
    header.e_ident[7] = ELFOSABI_FREEBSD;
#  endif
#  if PARROT_EXEC_OS_NETBSD
    header.e_ident[7] = ELFOSABI_NETBSD;
#  endif
#  if PARROT_EXEC_OS_LINUX && defined(ELFOSABI_LINUX) && \
     !defined(PARROT_PPC) && !defined(PARROT_ARM)
    header.e_ident[7] = ELFOSABI_LINUX;
#  endif

    header.e_type = ET_REL;
#  if PARROT_I386
    header.e_machine = EM_386;
#  endif
#  if PARROT_PPC
    header.e_machine = EM_PPC;
#  endif
#  if PARROT_ARM
    header.e_ident[7] = ELFOSABI_ARM;
    header.e_machine = EM_ARM;
#  endif
    header.e_version = EV_CURRENT;
    header.e_entry = 0;
    header.e_phoff = 0;
    header.e_shoff = sizeof(Elf32_Ehdr);
    header.e_flags = 0;
    header.e_ehsize = sizeof(Elf32_Ehdr);
    header.e_phentsize = 0;
    header.e_phnum = 0;
    header.e_shentsize = sizeof(Elf32_Shdr);
    header.e_shnum = NSECTIONS;
    header.e_shstrndx = 1;

    save_struct(fp, &header, sizeof(Elf32_Ehdr));

    current_offset = sizeof(Elf32_Ehdr) + NSECTIONS * sizeof(Elf32_Shdr);

    /* Sections */
    bzero(&shst, SHSTRTABSIZE);
    shste = shst + 1;
    /* NULL */
    bzero(&sechdr, sizeof(Elf32_Ehdr));
    save_struct(fp, &sechdr, sizeof(Elf32_Shdr));
    /* Section Header String Table */
    sh_add(".shstrtab", SHT_STRTAB, 0, SHSTRTABSIZE, 0, 0, 1, 0);
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
#  if PARROT_I386 || PARROT_ARM
    sh_add(".rel.text", SHT_REL, 0, obj->text_rellocation_count *
        sizeof(Elf32_Rel), 6, 2, 4, sizeof(Elf32_Rel));
#  endif
    /*
     * PPC requires rellocation structures with addends.
     */
#  if PARROT_PPC
    sh_add(".rela.text", SHT_RELA, 0, obj->text_rellocation_count *
        sizeof(Elf32_Rela), 6, 2, 4, sizeof(Elf32_Rela));
#  endif
    /* 
     * Symbol table.
     * Link is the strtab section header index.
     * Info is the index of the first symbol in the symbol table.
     */
    sh_add(".symtab", SHT_SYMTAB, 0, (obj->symbol_count + PDFS) *
        sizeof(Elf32_Sym), 7, PDFS - 1, 4, sizeof(Elf32_Sym));
    /* String Table */
    obj->symbol_list_size += 1; /* Trailing \0 */
    sh_add(".strtab", SHT_STRTAB, 0, obj->symbol_list_size, 0, 0, 1, 0);

    /* Section header string table */
    save_struct(fp, &shst, SHSTRTABSIZE);
    save_struct(fp, obj->text.code, obj->text.size); /* Text */
    save_struct(fp, obj->data.code, obj->data.size); /* Data */
    /* Text rellocations */
    for (i = 0; i < obj->text_rellocation_count; i++) {
#  if PARROT_I386
        bzero(&rellocation, sizeof(Elf32_Rel));
        rellocation.r_offset = obj->text_rellocation_table[i].offset;
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_386_PC32);
                break;
            case RTYPE_DATA:
            case RTYPE_COM:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_386_32);
                break;
            default:
                internal_exception(EXEC_ERROR,
                    "Unknown text rellocation type: %d\n",
                        obj->text_rellocation_table[i].type);
                break;
        }
        save_struct(fp, &rellocation, sizeof(Elf32_Rel));
#  endif
#  if PARROT_PPC
        bzero(&rel_addend, sizeof(Elf32_Rela));
        rel_addend.r_offset = obj->text_rellocation_table[i].offset;
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                rel_addend.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_PPC_REL24);
                break;
            case RTYPE_DATA:
            case RTYPE_COM:
                rel_addend.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_PPC_ADDR16_HI);
                rel_addend.r_addend = *((short *)
                    (&obj->text.code[obj->text_rellocation_table[i].offset]))
                        << 16;
                rel_addend.r_addend += *((short *)
                    (&obj->text.code[
                        obj->text_rellocation_table[i].offset + 4]));
                break;
            case RTYPE_DATA1:
                rel_addend.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_PPC_ADDR16_LO);
                rel_addend.r_addend = *((short *)
                    (&obj->text.code[obj->text_rellocation_table[i].offset]));
                rel_addend.r_addend += *((short *)
                    (&obj->text.code[
                        obj->text_rellocation_table[i].offset - 4])) << 16;
                break;
            default:
                internal_exception(EXEC_ERROR,
                    "Unknown text rellocation type: %d\n",
                        obj->text_rellocation_table[i].type);
                break;
        }
        save_struct(fp, &rel_addend, sizeof(Elf32_Rela));
#  endif
#  if PARROT_ARM
        bzero(&rellocation, sizeof(Elf32_Rel));
        rellocation.r_offset = obj->text_rellocation_table[i].offset;
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_ARM_ABS32);
                break;
            case RTYPE_DATA:
                rellocation.r_info =
                    ELF32_R_INFO(
                        obj->text_rellocation_table[i].symbol_number + PDFS,
                            R_ARM_ABS32);
                break;
            default:
                internal_exception(EXEC_ERROR,
                    "Unknown text rellocation type: %d\n",
                        obj->text_rellocation_table[i].type);
                break;
        }
        save_struct(fp, &rellocation, sizeof(Elf32_Rel));
#  endif
    }
    /* Symbol table */
    /* zero */
    bzero(&symlst, sizeof(Elf32_Sym));
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
                symlst.st_value = obj->symbol_table[i].value;
                symlst.st_size = obj->data_size[i];
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_OBJECT);
                symlst.st_shndx = 3; /* data */
                break;
            case STYPE_COM:
                symlst.st_value = obj->symbol_table[i].value;
                /* symlst.st_size = obj->data_size[i]; XXX daniel why? */
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_OBJECT);
                symlst.st_shndx = SHN_COMMON;
                break;
            case STYPE_UND:
                symlst.st_info = ELF32_ST_INFO(STB_GLOBAL, STT_NOTYPE);
                break;
            default:
                internal_exception(EXEC_ERROR, "Unknown symbol type: %d\n",
                    obj->symbol_table[i].type);
                break;
        }
        save_struct(fp, &symlst, sizeof(Elf32_Sym));
    }
    /* String table */
    save_zero(fp);
    for (i = 0; i < obj->symbol_count; i++) {
        fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    /* PAD */
    for (i = 0; i < (4 - obj->symbol_list_size % 4); i++)
        save_zero(fp);
    fclose(fp);
}

#endif /* EXEC_ELF */

#ifdef EXEC_MACH_O

void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    FILE *fp;
    int i;

    fp = fopen(file, "w");
    
    fprintf(fp, "\xFE\xED\xFA\xCE"); /* Header for Darwin */
    save_int(fp, 0x12);
    save_int(fp, 0);
    save_int(fp, 0x1);
    save_int(fp, 0x3);
    save_int(fp, 0x128);
    save_int(fp, 0);
    save_int(fp, 0x1);
    save_int(fp, 0xC0);
    for (i = 0; i < 5; i++)
        save_int(fp, 0);
    /* Sizeof text + data */
    save_int(fp, obj->text.size + obj->data.size);
    /* Offset of text */
    save_int(fp, 0x144);
    save_int(fp, obj->text.size + obj->data.size);
    save_int(fp, 0x7);
    save_int(fp, 0x7);
    save_int(fp, 0x2);
    save_int(fp, 0);
    fprintf(fp, "__text");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    fprintf(fp, "__TEXT");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    save_int(fp, 0);
    /* Sizeof text */
    save_int(fp, obj->text.size);
    save_int(fp, 0x144);
    save_int(fp, 0x2);
    /* Offset of rellocation table. */
    save_int(fp, 0x144 + obj->text.size + obj->data.size);
    save_int(fp, obj->text_rellocation_count);
    save_int(fp, 0x80000400);
    save_int(fp, 0);
    save_int(fp, 0);
    fprintf(fp, "__data");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    fprintf(fp, "__DATA");
    for (i = 0; i < 10; i++)
        save_zero(fp);
    /* Data VMA */
    save_int(fp, obj->text.size);
    /* Data size */
    save_int(fp, obj->data.size);
    /* Data file offset */
    save_int(fp, 0x144 + obj->text.size);
    save_int(fp, 0x2);
    for (i = 0; i < 5; i++)
        save_int(fp, 0);
    save_int(fp, 0x2);
    /*    save_int(fp, obj->symbol_count * 0xc); */
    save_int(fp, 0x18);
    /* Offset of stabs */
    save_int(fp, 0x144 +
        obj->text.size + obj->data.size + obj->text_rellocation_count * 0x8);
    /* Number of stabs (symbol table) */
    save_int(fp, obj->symbol_count);
    /* Offset of symbol list */
    save_int(fp, 0x144 + obj->text.size + obj->data.size +
        obj->text_rellocation_count * 0x8 + obj->symbol_count * 0xc);
    /* Sizeof symbol list */
    save_int(fp, obj->symbol_list_size);
    save_int(fp, 0xB);
    save_int(fp, 0x50);
    for (i = 0; i < 3; i++)
        save_int(fp, 0);
    save_int(fp, obj->symbol_count);
    save_int(fp, obj->symbol_count);
    for (i = 0; i < 13; i++)
        save_int(fp, 0);
    /* Text */
    for (i = 0; i < obj->text.size; i++)
        fprintf(fp, "%c", obj->text.code[i]);
    /* Data */
    for (i = 0; i < obj->data.size; i++)
        fprintf(fp, "%c", obj->data.code[i]);
    /* Text rellocations */
    for (i = obj->text_rellocation_count - 1; i >= 0; i--) {
        save_int(fp, obj->text_rellocation_table[i].offset);
        save_short(fp, obj->text_rellocation_table[i].symbol_number);
        save_short(fp, obj->text_rellocation_table[i].type);
    }
    /* Symbol table */
    for (i = 0; i < obj->symbol_count; i++) {
        save_int(fp, obj->symbol_table[i].offset_list);
        save_int(fp, obj->symbol_table[i].type);
        save_int(fp, obj->symbol_table[i].value);
    }
    /* Symbol list */
    for (i = 0; i < obj->symbol_count; i++) {
        if (obj->symbol_table[i].type != STYPE_GCC)
            fprintf(fp, "_%s", obj->symbol_table[i].symbol);
        else
            fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    fclose(fp);
}

#endif /* EXEC_MACH_O */

#ifdef EXEC_COFF

/* File offsets */
#define TEXT_CODE  0x14 + (3 * 0x28)
#define DATA_CODE  TEXT_CODE + obj->text.size
#define TEXT_RELOC DATA_CODE + obj->data.size
#define DATA_RELOC TEXT_RELOC + (obj->text_rellocation_count * 0xA)
#define SYMTAB     DATA_RELOC + (obj->data_rellocation_count * 0xA)

void
Parrot_exec_save(Parrot_exec_objfile_t *obj, const char *file)
{
    FILE *fp;
    int i;

    fp = fopen(file, "wb");

    save_short(fp, 0x14C); /* i386 */
    save_short(fp, 3);     /* Number of sections */
    save_int(fp, Parrot_intval_time());
    save_int(fp, SYMTAB);
    save_int(fp, obj->symbol_count);
    save_short(fp, 0);
    save_short(fp, 0x104); /* 32 bit LE, no line numbers */

    fwrite(".text\0\0\0", 8, 1, fp);
    save_int(fp, 0);
    save_int(fp, 0);
    save_int(fp, obj->text.size);
    save_int(fp, TEXT_CODE);
    save_int(fp, TEXT_RELOC);
    save_int(fp, 0);
    save_short(fp, obj->text_rellocation_count);
    save_short(fp, 0);
    save_int(fp, 0x20);

    fwrite(".data\0\0\0", 8, 1, fp);
    save_int(fp, 0);
    save_int(fp, 0);
    save_int(fp, obj->data.size);
    save_int(fp, DATA_CODE);
    save_int(fp, DATA_RELOC);
    save_int(fp, 0);
    save_short(fp, obj->data_rellocation_count);
    save_short(fp, 0);
    save_int(fp, 0x40);

    fwrite(".bss\0\0\0\0", 8, 1, fp);
    save_int(fp, 0);
    save_int(fp, 0);
    save_int(fp, obj->bss.size);
    save_int(fp, 0);
    save_int(fp, 0);
    save_int(fp, 0);
    save_short(fp, 0);
    save_short(fp, 0);
    save_int(fp, 0x80);

    /* Text */
    for (i = 0; i < obj->text.size; i++)
        fprintf(fp, "%c", obj->text.code[i]);
    /* Data */
    for (i = 0; i < obj->data.size; i++)
        fprintf(fp, "%c", obj->data.code[i]);
    /* Text rellocations */
    for (i = 0; i < obj->text_rellocation_count; i++) {
        save_int(fp, obj->text_rellocation_table[i].offset);
        save_int(fp, obj->text_rellocation_table[i].symbol_number);
        switch (obj->text_rellocation_table[i].type) {
            case RTYPE_FUNC:
                save_short(fp, 0x14);
                break;
            case RTYPE_COM:
            case RTYPE_DATA:
                save_short(fp, 0x06);
                break;
            default:
                internal_exception(EXEC_ERROR,
                    "Unknown text rellocation type: %d\n",
                        obj->text_rellocation_table[i].type);
                break;
        }
    }
    /* Symbol table */
    for (i = 0; i < obj->symbol_count; i++) {
        save_int(fp, 0);
        save_int(fp, obj->symbol_table[i].offset_list);
        save_int(fp, obj->symbol_table[i].value);
        switch (obj->symbol_table[i].type) {
            case STYPE_FUNC:
                save_short(fp, 1); /* .text */
                save_short(fp, 0x20);
                break;
            case STYPE_GDATA:
                save_short(fp, 2); /* .data */
                save_short(fp, 0);
                break;
            case STYPE_COM:
                save_short(fp, 0);
                save_short(fp, 0);
                break;
            case STYPE_UND:
                save_short(fp, 0);
                save_short(fp, 0x20);
                break;
            default:
                internal_exception(EXEC_ERROR, "Unknown symbol type: %d\n",
                    obj->symbol_table[i].type);
                break;
        }
        putc(2, fp); /* "extern" class */
        putc(0, fp);
    }
    /* Symbol list */
    save_int(fp, obj->symbol_list_size);
    for (i = 0; i < obj->symbol_count; i++) {
        if (obj->symbol_table[i].type != STYPE_GCC)
            fprintf(fp, "_%s", obj->symbol_table[i].symbol);
        else
            fprintf(fp, "%s", obj->symbol_table[i].symbol);
        save_zero(fp);
    }
    fclose(fp);
}

#endif /* EXEC_COFF */

/*

=item C<static void save_struct(FILE *fp, void *sp, size_t size)>

Writes the C<struct> C<sp> to the file.

=cut

*/

static void
save_struct(FILE *fp, void *sp, size_t size)
{
    unsigned int i;

    for (i = 0; i < size; i++)
        fprintf(fp, "%c", ((char *)sp)[i]);
}

/*

=item C<static void save_zero(FILE *fp)>

Writes 0 to the file.

=cut

*/

static void
save_zero(FILE *fp)
{
    fprintf(fp, "%c", 0);
}

#if PARROT_BIGENDIAN

/*

=item C<static void save_int(FILE *fp, int i)>

Writes C<i> to the file.

=cut

*/

static void
save_int(FILE *fp, int i)
{
    fprintf(fp, "%c%c%c%c", (char)(i >> 24), (char)(i >> 16),
                            (char)(i >> 8), (char)i);
}

/*

=item C<static void save_short(FILE *fp, short s)>

Writes C<s> to the file.

=cut

*/

static void
save_short(FILE *fp, short s)
{
    fprintf(fp, "%c%c", (char)(s >> 8), (char)s);
}

#else /* PARROT_BIGENDIAN */

static void
save_short(FILE *fp, short s)
{
    fprintf(fp, "%c%c", (char)s, (char)(s >> 8));
}

static void
save_int(FILE *fp, int i)
{
    fprintf(fp, "%c%c%c%c", (char)i, (char)(i >> 8),
                            (char)(i >> 16), (char)(i >> 24));
}

#endif /* PARROT_BIGENDIAN */

/*

=back

=head1 SEE ALSO

F<include/parrot/exec.h>, F<include/parrot/exec_save.h>, F<src/exec.c>
and F<src/exec_start.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2003.6.9.

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
