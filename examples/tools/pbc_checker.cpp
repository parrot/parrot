/*
 * Copyright (C) 2009, Parrot Foundation.
 * $Id$
*/

// pbc_checker.cpp
// A multiplatform checker for pbc files

#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <vector>
#include <algorithm>
#include <functional>
#include <stdexcept>

// Get most used symbols from std namespace
using std::cout;
using std::cerr;
using std::ifstream;
using std::string;
using std::hex;
using std::dec;
using std::setw;
using std::setfill;
using std::runtime_error;

//**********************************************************************

// Type used to read parrot opcodes
// You can use unsigned long here if your compiler does not support
// long long, but in that case the results might not be accurate.

typedef unsigned long long opcode;

// Constants used in pbc and his descriptions

const char unknown[] = "Unknown";

const unsigned char
    ByteOrderLE = 0,
    ByteOrderBE = 1;

const char * desc_byte_order(unsigned char c)
{
    switch(c) {
        case ByteOrderLE: return "Little endian";
        case ByteOrderBE: return "Big endian";
        default: return unknown;
    }
}

const unsigned char
    FpEncodingIEEE_754_8 = 0,
    FpEncodingIEEE_i386_12 = 1,
    FpEncodingIEEE_754_16 = 2;

const char * desc_fp_encoding(unsigned char c)
{
    switch(c) {
        case FpEncodingIEEE_754_8:  return "IEEE 754 8 byte double";
        case FpEncodingIEEE_i386_12:  return "i386 little endian 12 byte long double";
        case FpEncodingIEEE_754_16:  return "IEEE 754 16 byte long double";
        default: return unknown;
    }
}

const char * desc_uuid_type(unsigned char c)
{
    switch(c) {
        case 0:  return "none";
        case 1:  return "MD5";
        default: return unknown;
    }
}

const opcode
    SegmentTypeDirectory     = 0x00,
    SegmentTypeDefault       = 0x01,
    SegmentTypeFixup         = 0x02,
    SegmentTypeConstantTable = 0x03,
    SegmentTypeBytecode      = 0x04,
    SegmentTypePIRDebug      = 0x05,
    SegmentTypeAnnotations   = 0x06,
    SegmentTypePICData       = 0x07,
    SegmentTypeDependencies  = 0x08;

const char * desc_segment_type(opcode t)
{
    switch(t) {
        case SegmentTypeDirectory:     return "Directory";
        case SegmentTypeDefault:       return "Default";
        case SegmentTypeFixup:         return "Fixup";
        case SegmentTypeConstantTable: return "Constant table";
        case SegmentTypeBytecode:      return "Bytecode";
        case SegmentTypePIRDebug:      return "PIR Debug";
        case SegmentTypeAnnotations:   return "Annotations";
        case SegmentTypePICData:       return "PIC Data";
        case SegmentTypeDependencies:  return "Dependencies";
        default:                       return unknown;
    }
}

const opcode
    ConstantTypeNone =   0x00,
    ConstantTypeNumber = 0x6E,
    ConstantTypeString = 0x73,
    ConstantTypePMC    = 0x70,
    ConstantTypeKey    = 0x6B;

const char * desc_constant_type(opcode t)
{
    switch(t) {
        case ConstantTypeNone:   return "None";
        case ConstantTypeNumber: return "Number";
        case ConstantTypeString: return "String";
        case ConstantTypePMC:    return "PMC";
        case ConstantTypeKey:    return "Key";
        default:                 return unknown;
    }
}

const opcode
    KeyIntegerRegister = 0x00,
    KeyStringRegister  = 0x01,
    KeyPMCRegister     = 0x02,
    KeyNumberRegister  = 0x03,
    KeyIntegerConstant = 0x10,
    KeyStringConstant  = 0x11,
    KeyPMCConstant     = 0x12,
    KeyNumberConstant  = 0x13;

const char * desc_key_type(opcode t)
{
    switch (t) {
        case KeyIntegerRegister: return "Integer register";
        case KeyStringRegister:  return "String register";
        case KeyPMCRegister:     return "PMC register";
        case KeyNumberRegister:  return "Number register";
        case KeyIntegerConstant: return "Integer constant";
        case KeyStringConstant:  return "String constant";
        case KeyPMCConstant:     return "PMC constant";
        case KeyNumberConstant:  return "Number constant";
        default:                 return unknown;
    }
}

const opcode
    AnnotationTypeInteger = 0x00,
    AnnotationTypeString =  0x01,
    AnnotationTypeNumber =  0x02,
    AnnotationTypePMC =     0x03;

const char * desc_annotation_type(opcode t)
{
    switch(t) {
        case AnnotationTypeInteger: return "Integer";
        case AnnotationTypeString:  return "String";
        case AnnotationTypeNumber:  return "Number";
        case AnnotationTypePMC:     return "PMC";
        default:                    return unknown;
    }
}

//**********************************************************************

class ReadError : public runtime_error
{
public:
    ReadError(const string &msg);
};

ReadError::ReadError(const string &msg) :
    runtime_error("Error reading " + msg)
{
}

//**********************************************************************

void signature(ifstream &pbcfile)
{
    static const char pbc_signature [] = {
        0xFE, 0x50, 0x42, 0x43, 0x0D, 0x0A, 0x1A, 0x0A
    };
    char signature [sizeof (pbc_signature)];
    pbcfile.read(signature, sizeof (signature));
    if (pbcfile.gcount() != sizeof (signature))
        throw ReadError("pbc signature");
    if (! std::equal(pbc_signature, pbc_signature + sizeof(pbc_signature),
            signature))
        throw runtime_error("Invalid pbc signature");
}

//**********************************************************************

// Emit a open tag in the constructor
// and his closing in the destructor.

class TagEmit
{
public:
    TagEmit(const string & name_n, std::ostream &os_n);
    ~TagEmit();
private:
    string name;
    std::ostream &os;
};

TagEmit::TagEmit(const string & name_n, std::ostream &os_n) :
    name(name_n), os(os_n)
{
    os << '<' << name << ">\n";
}

TagEmit::~TagEmit()
{
    os << "</" << name << ">\n";
}

//**********************************************************************

class DirEntry
{
public:
    DirEntry(string name_n, opcode type_n,
        opcode offset_n, opcode length_n);
    string getName() const;
    opcode getType() const;
    opcode getOffset() const;
    opcode getLength() const;
private:
    string name;
    opcode type;
    opcode offset;
    opcode length;
};

DirEntry::DirEntry(string name_n, opcode type_n,
        opcode offset_n, opcode length_n) :
    name(name_n),
    type(type_n),
    offset(offset_n),
    length(length_n)
{
}

string DirEntry::getName() const
{
    return name;
}

opcode DirEntry::getType() const
{
    return type;
}

opcode DirEntry::getOffset() const
{
    return offset;
}

opcode DirEntry::getLength() const
{
    return length;
}

bool operator < (const DirEntry & de1, const DirEntry & de2)
{
    return de1.getOffset() < de2.getOffset();
}

//**********************************************************************

// Check that segments does not overlap

void check_overlap(const std::vector<DirEntry> & directory)
{
    unsigned int entries = directory.size();
    for (unsigned int i= 0; i < entries; ++i)
    {
        opcode offset = directory[i].getOffset();
        opcode length = directory[i].getLength();
        opcode after = offset + length;
        for (unsigned int j= i + 1; j < entries; ++j) {
            opcode offset2 = directory[j].getOffset();
            if (offset2 >= offset && offset2 < after)
                throw runtime_error("overlap");
            opcode after2 = offset2 + directory[j].getLength();
            if (offset >= offset2 && offset < after2)
                throw runtime_error("overlap");
        }
    }
}

//**********************************************************************

class PbcFile
{
public:
    PbcFile();
    void read(const char *filename);
    void read_header(ifstream &pbcfile);
    void check_directory_format(ifstream &pbcfile);
    void read_directory(ifstream &pbcfile);
    void dump_segment(const DirEntry & entry, ifstream &pbcfile);
    void dump_segment_default(ifstream &pbcfile);
    void dump_segment_fixup(ifstream &pbcfile);
    void dump_segment_constant(ifstream &pbcfile);
    void dump_segment_bytecode(ifstream &pbcfile);
    void dump_segment_pir_debug(ifstream &pbcfile);
    void dump_segment_annotations(ifstream &pbcfile);
    void dump_segment_pic_data(ifstream &pbcfile);
    void dump_segment_dependencies(ifstream &pbcfile);
    void dump_constant_string(ifstream &pbcfile);
    void dump_constant_number(ifstream &pbcfile);
    void dump_constant_key(ifstream &pbcfile);
    void dump_bytes_hex(ifstream &pbcfile, opcode length);
    string read_cstring(ifstream &pbcfile);
    opcode read_opcode(ifstream &pbcfile);
private:
    unsigned int opcode_size;
    unsigned int pbc_major;
    unsigned int pbc_minor;

    unsigned char byte_order;
    unsigned char fp_encoding;

    std::vector<DirEntry> directory;
};

PbcFile::PbcFile()
{
    opcode_size = 0;
}

void PbcFile::read(const char *filename)
{
    ifstream pbcfile(filename);
    if (! pbcfile.is_open())
        throw runtime_error("Can't open file");

    TagEmit filetag("PbcFile", cout);

    read_header(pbcfile);

    check_directory_format(pbcfile);
    read_directory(pbcfile);
    check_overlap(directory);

    std::sort(directory.begin(), directory.end());

    TagEmit tag("Segments", cout);
    for (size_t i= 0; i < directory.size(); ++i)
        dump_segment(directory[i], pbcfile);
}

void PbcFile::read_header(ifstream &pbcfile)
{
    TagEmit tag("Header", cout);

    signature(pbcfile);
    unsigned char opcode_size = pbcfile.get();
    unsigned char byte_order = pbcfile.get();
    unsigned char fp_encoding = pbcfile.get();
    unsigned char major = pbcfile.get();
    unsigned char minor = pbcfile.get();
    unsigned char patch = pbcfile.get();
    unsigned char pbc_major = pbcfile.get();
    unsigned char pbc_minor = pbcfile.get();

    if (!pbcfile)
        throw ReadError("pbc header data");

    cout <<
        "Opcode size            : " << (int) opcode_size << '\n' <<
        "Byte order             : " << desc_byte_order(byte_order) <<
                " (" << (int) byte_order << ")\n" <<
        "Floating point encoding: " << desc_fp_encoding(fp_encoding) <<
                " (" << (int) fp_encoding << ")\n" <<
        "Parrot version         : " <<
        (int) major << '.' << (int) minor << '.' << (int) patch << '\n' <<
        "PBC version            : " <<
        (int) pbc_major << '.' << (int) pbc_minor << '\n'
        ;

    if (opcode_size > sizeof(opcode))
        cerr << "*** Warning: opcode size too big for this program ***\n";

    this->opcode_size = opcode_size;
    this->pbc_major = pbc_major;
    this->pbc_minor = pbc_minor;
    this->byte_order = byte_order;
    this->fp_encoding = fp_encoding;
    if (byte_order != ByteOrderLE && byte_order != ByteOrderBE)
        throw runtime_error("Invalid byte order");

    unsigned char uuid_type = pbcfile.get();
    cout <<
        "UUID type              : " << desc_uuid_type(uuid_type) <<
                " (" << (int) uuid_type << ")\n"
        ;
    unsigned char uuid_length = pbcfile.get();
    cout <<
        "UUID length            : " << (int) uuid_length << '\n'
        ;
    unsigned int curpos = 18 + uuid_length;
    unsigned int endheader = ((curpos + 15) / 16) * 16;
    pbcfile.ignore(endheader - 18);
}

void PbcFile::check_directory_format(ifstream &pbcfile)
{
    TagEmit tag("DirectoryFormat", cout);

    opcode dir_format = read_opcode(pbcfile);
    cout << "Directory format: " << dir_format << '\n';
    if (dir_format != 1)
        throw runtime_error("Unknown directory format");

    opcode unused = read_opcode(pbcfile);
    unused = read_opcode(pbcfile);
    unused = read_opcode(pbcfile);

    for (opcode n = opcode_size * 4; n % 16; ++n)
        pbcfile.ignore(1);
}

void PbcFile::read_directory(ifstream &pbcfile)
{
    TagEmit tag("Directory", cout);

    opcode size = read_opcode(pbcfile);
    cout << "Directory segment size: " << size << '\n';

    // Must be zero:
    opcode in_type = read_opcode(pbcfile);
    opcode in_id   = read_opcode(pbcfile);
    opcode op_size = read_opcode(pbcfile);
    cout << "Internal type: " << in_type << '\n';
    cout << "Internal id:   " << in_id   << '\n';
    cout << "Op table size: " << op_size << '\n';

    opcode entries = read_opcode(pbcfile);
    cout << "Directory entries: " << entries << '\n';

    for (unsigned int n= 0; n < entries; ++n)
    {
        opcode type = read_opcode(pbcfile);
        cout <<
            n << ": Type: '" << desc_segment_type(type) <<
                " (" << type << ") "
            "' Name: '";
        string name = read_cstring(pbcfile);
        cout << name;
        opcode offset = read_opcode(pbcfile);
        opcode length = read_opcode(pbcfile);
        cout <<
            "'\n   Offset: " << offset << " Length: " << length << '\n';
        DirEntry entry(name, type, offset, length);
        directory.push_back(entry);
    }
}

void PbcFile::dump_segment(const DirEntry &entry, ifstream &pbcfile)
{
    cout << "Segment '" << entry.getName() << "'\n";
    opcode const type = entry.getType();
    cout << "Type: " << desc_segment_type(type) <<
        " (0x" << hex << type << dec << ")\n";

    // Set file read position to segment's start
    size_t start = entry.getOffset() * opcode_size;
    cout << "Start: 0x" << hex << setw(6) << start << dec << '\n';
    pbcfile.seekg(start);

    switch(type)
    {
    case SegmentTypeDirectory:
        cout << "*** Unexpected directory segment ***\n";
        break;
    case SegmentTypeDefault:
        dump_segment_default(pbcfile);
        break;
    case SegmentTypeFixup:
        dump_segment_fixup(pbcfile);
        break;
    case SegmentTypeConstantTable:
        dump_segment_constant(pbcfile);
        break;
    case SegmentTypeBytecode:
        dump_segment_bytecode(pbcfile);
        break;
    case SegmentTypePIRDebug:
        dump_segment_pir_debug(pbcfile);
        break;
    case SegmentTypeAnnotations:
        dump_segment_annotations(pbcfile);
        break;
    case SegmentTypePICData:
        dump_segment_pic_data(pbcfile);
        break;
    case SegmentTypeDependencies:
        dump_segment_dependencies(pbcfile);
        break;
    default:
        cout << "*** Unknown segment type ***\n";
        break;
    }
}

void PbcFile::dump_segment_default(ifstream &/*pbcfile*/)
{
    TagEmit tag("SegmentDefault", cout);
    cout << "*** UNIMPLEMENTED ***\n";
}

void PbcFile::dump_segment_fixup(ifstream &pbcfile)
{
    TagEmit tag("SegmentFixup", cout);

    opcode segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize;

    opcode itype = read_opcode(pbcfile);
    cout << " itype: " << itype;
    opcode id = read_opcode(pbcfile);
    cout << " id: " << id;
    opcode size = read_opcode(pbcfile);
    cout << " size: " << size;

    opcode tablelength = read_opcode(pbcfile);
    cout << " Number of fixups: " << tablelength << '\n';

    for (opcode n= 0; n < tablelength; ++n) {
        cout << "Fixup " << n;
        opcode type = read_opcode(pbcfile);
        cout << " Type: " <<
             " (0x" << hex << type << dec << ')';
        switch (type) {
            case 0x01:
                {
                opcode label = read_opcode(pbcfile);
                cout << " Label: " << label;
                opcode sub = read_opcode(pbcfile);
                cout << " Sub: " << sub;
                }
                break;
            case 0x02:
                {
                string label = read_cstring(pbcfile);
                cout << " Label: '" << label << '\'';
                opcode sub = read_opcode(pbcfile);
                cout << " Sub: " << sub;
                }
                break;
            case 0x00:
                cout << " None";
                break;
            default:
                throw runtime_error("Invalid fixup");
        }
        cout << '\n';
    }
}

void PbcFile::dump_segment_constant(ifstream &pbcfile)
{
    TagEmit tag("SegmentConstantTable", cout);

    opcode segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize;

    opcode itype = read_opcode(pbcfile);
    cout << " itype: " << itype;
    opcode id = read_opcode(pbcfile);
    cout << " id: " << id;
    opcode size = read_opcode(pbcfile);
    cout << " size: " << size;

    opcode tablelength = read_opcode(pbcfile);
    cout << " Number of constants: " << tablelength << '\n';

    for (opcode n= 0; n < tablelength; ++n) {
        cout << "Constant " << n;
        opcode type = read_opcode(pbcfile);
        cout << " Type: " << desc_constant_type(type) <<
             " (0x" << hex << type << dec << ") ";
        switch(type) {
            case ConstantTypeString:
            case ConstantTypePMC:
                dump_constant_string(pbcfile);
                break;
            case ConstantTypeNumber:
                dump_constant_number(pbcfile);
                break;
            case ConstantTypeKey:
                dump_constant_key(pbcfile);
                break;
            default:
                throw runtime_error("Unknown constant type");
        }
    }
}

void PbcFile::dump_segment_bytecode(ifstream &pbcfile)
{
    TagEmit tag("SegmentBytecode", cout);

    opcode segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize;

    opcode itype = read_opcode(pbcfile);
    cout << " itype: " << itype;
    opcode id = read_opcode(pbcfile);
    cout << " id: " << id;
    opcode size = read_opcode(pbcfile);
    cout << " size: " << size;
    cout << hex;

    for (opcode n= 0; n < size; ++n) {
        opcode code = read_opcode(pbcfile);
        if ((n % 8) == 0)
            cout << '\n' << setfill('0') << setw (7) << n << ':';
        else
            cout << ' ';
        cout << setfill('0') << setw(opcode_size * 2) << code;
    }
    cout << dec << '\n';
}

void PbcFile::dump_segment_pir_debug(ifstream &pbcfile)
{
    TagEmit tag("SegmentPIRDebug", cout);

    opcode segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize;

    opcode itype = read_opcode(pbcfile);
    cout << " itype: " << itype;
    opcode id = read_opcode(pbcfile);
    cout << " id: " << id;
    opcode size = read_opcode(pbcfile);
    cout << " size: " << size;
    cout << '\n';

    opcode tablelength = size;
    for (opcode n= 0; n < tablelength; ++n) {
        opcode linenum = read_opcode(pbcfile);
        cout << " Line: " << linenum;
    }
    cout << '\n';

    opcode mappings = read_opcode(pbcfile);
    cout << "Mappings: " << mappings << '\n';
    for (opcode n= 0; n < mappings; ++n) {
        cout << "  " << n;
        opcode offset = read_opcode(pbcfile);
        cout << " Offset: " << offset;
        opcode filename = read_opcode(pbcfile);
        cout << " File: " << filename;
        cout << '\n';
    }
}

void PbcFile::dump_segment_annotations(ifstream &pbcfile)
{
    TagEmit tag("SegmentAnnotations", cout);

    opcode segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize;

    opcode itype = read_opcode(pbcfile);
    cout << " itype: " << itype;
    opcode id = read_opcode(pbcfile);
    cout << " id: " << id;
    opcode size = read_opcode(pbcfile);
    cout << " size: " << size;
    cout << '\n';

    opcode tablelength = read_opcode(pbcfile);
    cout << "Number of annotations: " << tablelength << '\n';

    for (opcode i= 0; i < tablelength; ++i) {
        cout << i;
        opcode name = read_opcode(pbcfile);
        cout << " Name: " << name;
        opcode type = read_opcode(pbcfile);
        cout << " Type: " << desc_annotation_type(type) << '\n';
    }

    opcode grouplength = read_opcode(pbcfile);
    cout << "Number of annotation groups: " << grouplength << '\n';
    for (opcode i= 0; i < grouplength; ++i) {
        cout << i;
        opcode bcpos = read_opcode(pbcfile);
        cout << " Bytecode offset: " << bcpos;
        opcode value = read_opcode(pbcfile);
        cout << " Value: " << value << '\n';
    }

    opcode mappings = read_opcode(pbcfile);
    cout << "Number of mappings: " << mappings << '\n';
    for (opcode i= 0; i < mappings; ++i) {
        cout << i;
        opcode bcpos = read_opcode(pbcfile);
        cout << " Bytecode offset: " << bcpos;
        opcode annotation = read_opcode(pbcfile);
        cout << " Annotation key: " << annotation;
        opcode value = read_opcode(pbcfile);
        cout << " Value: " << value << '\n';
    }
}

void PbcFile::dump_segment_pic_data(ifstream &/*pbcfile*/)
{
    TagEmit tag("SegmentPICData", cout);
    cout << "*** UNIMPLEMENTED ***\n";
}

void PbcFile::dump_segment_dependencies(ifstream &/*pbcfile*/)
{
    TagEmit tag("SegmentDependencies", cout);
    cout << "*** UNIMPLEMENTED ***\n";
}

void PbcFile::dump_constant_string(ifstream &pbcfile)
{
    opcode flags;
    opcode charset;
    const opcode encoding_none = 0xFFFF;
    opcode encoding = encoding_none;
    if (pbc_major > 5 && pbc_minor > 11) {
        opcode flags_charset = read_opcode(pbcfile);
        flags = flags_charset & 0xFF;
        charset = flags_charset >> 8;
        if (pbc_major > 6 || pbc_minor >= 17) {
            encoding = charset >> 8;
            charset &= 0xFF;
        }
    }
    else {
        flags = read_opcode(pbcfile);
        charset = read_opcode(pbcfile);
    }

    cout << "Flags: 0x" << hex << setw(6) << flags << dec;
    cout << " Charset: " << charset;
    if (encoding != encoding_none)
        cout << " Encoding: " << encoding;

    // Encoding not saved, see TT #468
    //opcode encoding = read_opcode(pbcfile);
    //cout << " Encoding: "<< encoding;

    opcode length = read_opcode(pbcfile);
    cout << " Length: "<< length;

    // Don't dump very long strings at full length.
    opcode full = length;
    length = std::min(length, (opcode)512);

    cout << " \'";
    for (opcode i= 0; i < length; ++i) {
        unsigned char c = pbcfile.get();
        if (! pbcfile)
            throw ReadError("string constant");
        if (c >= 32 && c < 128)
            cout << c;
        else
            cout << "\\x" << hex << setw(2) << setfill('0') <<
                (unsigned int) c << dec;
    }
    cout << '\'';
    if (full > length) {
        cout << "(...)";
        pbcfile.ignore(full - length);
    }
    cout << '\n';

    for (unsigned int i= full; i % opcode_size; ++i) {
        pbcfile.ignore(1);
    }
}

void PbcFile::dump_constant_number(ifstream &pbcfile)
{
    cout << "Number constant: ";
    switch(fp_encoding) {
        case FpEncodingIEEE_754_8:
            dump_bytes_hex(pbcfile, 8);
            break;
        case FpEncodingIEEE_i386_12:
            dump_bytes_hex(pbcfile, 12);
            break;
        case FpEncodingIEEE_754_16:
            dump_bytes_hex(pbcfile, 16);
            break;
        default:
            // This must have been catched before reaching this point
            throw std::logic_error("Bad number type");
    }
}

void PbcFile::dump_constant_key(ifstream &pbcfile)
{
    opcode components = read_opcode(pbcfile);
    cout << "Key components: " << components << '\n';
    for (opcode i= 0; i < components; ++i) {
        cout << "  " << i << ' ';
        opcode type = read_opcode(pbcfile);
        cout << "Type: " << desc_key_type (type) <<
            " (0x" << hex << type << dec << ") ";
        opcode value = read_opcode(pbcfile);
        cout << "Value: " << value << '\n';
    }
}

void PbcFile::dump_bytes_hex(ifstream &pbcfile, opcode length)
{
    cout << "0x" << hex;
    for (opcode i= 0; i < length; ++i) {
        unsigned char c = pbcfile.get();
        cout << setw(2) << setfill('0') << (unsigned int) c;
    }
    cout << dec << '\n';
}

string PbcFile::read_cstring(ifstream &pbcfile)
{
    string r;
    char c;
    while ((c= pbcfile.get())) {
        r+= c;
    }

    // cstrings are padded with trailing zeroes to opcode size
    for (opcode l = r.size() + 1; l % opcode_size; ++l)
        pbcfile.ignore(1);

    if(! pbcfile)
        throw ReadError("cstring");
    return r;
}

opcode PbcFile::read_opcode(ifstream &pbcfile)
{
    unsigned char buffer [32]; // Allow 256 bits opcode size
    pbcfile.read((char *)buffer, opcode_size);
    if (static_cast<unsigned int>(pbcfile.gcount()) != opcode_size)
        throw ReadError("opcode");

    opcode result = 0;
    switch(byte_order)
    {
    case ByteOrderLE:
        for (unsigned int i= 0; i < opcode_size; ++i) {
            result <<= 8;
            result += buffer [opcode_size - 1 - i];
        }
        break;
    case ByteOrderBE:
        for (unsigned int i= 0; i < opcode_size; ++i) {
            result <<= 8;
            result += buffer [i];
        }
        break;
    default:
        // This must have been catched before reaching this point
        throw std::logic_error("Bad byte order");
    }
    return result;
}

//**********************************************************************

void pbc_checker_main(int argc, char **argv)
{
    if (argc < 2)
        throw runtime_error("Bad args");

    PbcFile pbcfile;
    pbcfile.read(argv[1]);
}

//**********************************************************************

int main(int argc, char **argv)
{
    try
    {
        pbc_checker_main(argc, argv);
        return 0;
    }
    catch(std::
    exception &e)
    {
        cerr << "FAILED: " << e.what() << '\n';
    }
    return 1;
}

// End of pbc_checker.cpp
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
