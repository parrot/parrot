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

using std::cout;
using std::cerr;
using std::ifstream;
using std::string;
using std::hex;
using std::dec;
using std::setw;
using std::setfill;

//**********************************************************************

const char unknown[] = "Unknown";

const char * desc_byte_order(unsigned char c)
{
    switch(c) {
        case 0:  return "Little endian";
        case 1:  return "Big endian";
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

const unsigned long
    SegmentTypeDirectory     = 0x00,
    SegmentTypeDefault       = 0x01,
    SegmentTypeFixup         = 0x02,
    SegmentTypeConstantTable = 0x03,
    SegmentTypeBytecode      = 0x04,
    SegmentTypePIRDebug      = 0x05,
    SegmentTypeAnnotations   = 0x06,
    SegmentTypePICData       = 0x07,
    SegmentTypeDependencies  = 0x08;

const char * desc_segment_type(unsigned long t)
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

const unsigned long
    ConstantTypeNone =   0x00,
    ConstantTypeNumber = 0x6E,
    ConstantTypeString = 0x73,
    ConstantTypePMC    = 0x70,
    ConstantTypeKey    = 0x6B;

const char * desc_constant_type(unsigned long t)
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

const unsigned long
    KeyIntegerRegister = 0x00,
    KeyStringRegister  = 0x01,
    KeyPMCRegister     = 0x02,
    KeyNumberRegister  = 0x03,
    KeyIntegerConstant = 0x10,
    KeyStringConstant  = 0x11,
    KeyPMCConstant     = 0x12,
    KeyNumberConstant  = 0x13;

const char * desc_key_type(unsigned long t)
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

//**********************************************************************

class ReadError : public std::runtime_error
{
public:
    ReadError(const std::string &msg);
};

ReadError::ReadError(const std::string &msg) :
    std::runtime_error("Error reading " + msg)
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
        throw std::runtime_error("Invalid pbc signature");
}

//**********************************************************************

class DirEntry
{
public:
    DirEntry(string name_n, unsigned long type_n,
        unsigned long offset_n, unsigned long length_n);
    string getName() const;
    unsigned long getType() const;
    unsigned long getOffset() const;
    unsigned long getLength() const;
private:
    string name;
    unsigned long type;
    unsigned long offset;
    unsigned long length;
};

DirEntry::DirEntry(string name_n, unsigned long type_n,
        unsigned long offset_n, unsigned long length_n) :
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

unsigned long DirEntry::getType() const
{
    return type;
}

unsigned long DirEntry::getOffset() const
{
    return offset;
}

unsigned long DirEntry::getLength() const
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
        unsigned long offset = directory[i].getOffset();
        unsigned long length = directory[i].getLength();
        unsigned long after = offset + length;
        for (unsigned int j= i + 1; j < entries; ++j) {
            unsigned long offset2 = directory[j].getOffset();
            if (offset2 >= offset && offset2 < after)
                throw std::runtime_error("overlap");
            unsigned long after2 = offset2 + directory[j].getLength();
            if (offset >= offset2 && offset < after2)
                throw std::runtime_error("overlap");
        }
    }
}

//**********************************************************************

class PbcFile
{
public:
    PbcFile();
    void check_directory_format(ifstream &pbcfile);
    void read(const char *filename);
    void read_directory(ifstream &pbcfile);
    void dump_constant_string(ifstream &pbcfile);
    void dump_constant_number(ifstream &pbcfile);
    void dump_constant_key(ifstream &pbcfile);
    void dump_segment_constant(ifstream &pbcfile);
    void dump_segment_bytecode(ifstream &pbcfile);
    void dump_segment_fixup(ifstream &pbcfile);
    void dump_segment_pir_debug(ifstream &pbcfile);
    void dump_segment(const DirEntry & entry, ifstream &pbcfile);
    string read_cstring(ifstream &pbcfile);
    unsigned long read_opcode(ifstream &pbcfile);
private:
    unsigned int opcode_size;
    unsigned int pbc_version;

    unsigned char byte_order;
    static const unsigned char bo_little = 0;
    static const unsigned char bo_big = 1;
    unsigned char fp_encoding;

    std::vector<DirEntry> directory;
};

PbcFile::PbcFile()
{
    opcode_size = 0;
}

void PbcFile::check_directory_format(ifstream &pbcfile)
{
    unsigned char dir_format = pbcfile.get();
    cout << "Directory format: " << (int) dir_format << '\n';
    pbcfile.ignore(3);

    pbcfile.ignore(12);
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);
}

void PbcFile::read(const char *filename)
{
    ifstream pbcfile(filename);
    if (! pbcfile.is_open())
        throw std::runtime_error("Can't open file");

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
        "Byte order             : " << desc_byte_order(byte_order) << '\n' <<
        "Floating point encoding: " << desc_fp_encoding(fp_encoding) << '\n' <<
        "Parrot version         : " <<
        (int) major << '.' << (int) minor << '.' << (int) patch << '\n' <<
        "PBC version            : " <<
        (int) pbc_major << '.' << (int) pbc_minor << '\n'
        ;

    this->opcode_size = opcode_size;
    this->pbc_version = ((unsigned int) pbc_major) * 8 + pbc_minor;
    this->byte_order = byte_order;
    this->fp_encoding = fp_encoding;

    unsigned char uuid_type = pbcfile.get();
    cout <<
        "UUID type              : " << desc_uuid_type(uuid_type) << '\n'
        ;
    unsigned char uuid_length = pbcfile.get();
    cout <<
        "UUID length            : " << (int) uuid_length << '\n'
        ;
    unsigned int curpos = 18 + uuid_length;
    unsigned int endheader = ((curpos + 15) / 16) * 16;
    pbcfile.ignore(endheader - 18);

    check_directory_format(pbcfile);
    read_directory(pbcfile);
    check_overlap(directory);

    std::sort(directory.begin(), directory.end());

    for (size_t i= 0; i < directory.size(); ++i)
        dump_segment(directory[i], pbcfile);
}

void PbcFile::dump_constant_string(ifstream &pbcfile)
{
    unsigned long flags = read_opcode(pbcfile);
    cout << "Flags: 0x" << hex << flags << dec << '\n';
    unsigned long charset = read_opcode(pbcfile);
    cout << "Charset: " << charset << '\n';

    //unsigned long encoding = read_opcode(pbcfile);
    //cout << "Encoding: "<< encoding << '\n';

    unsigned long length = read_opcode(pbcfile);
    cout << "Length: "<< length << '\n';
    cout << '\'';
    for (unsigned long i= 0; i < length; ++i) {
        unsigned char c = pbcfile.get();
        if (c >= 32 && c < 128)
            cout << c;
        else
            cout << "\\x" << hex << setw(2) << setfill('0') <<
                (unsigned int) c << dec;
    }
    cout << "'\n";
    for (unsigned int i= length; i % opcode_size; ++i) {
        pbcfile.ignore(1);
    }
}

void PbcFile::dump_constant_number(ifstream &pbcfile)
{
    cout << "Number constant (not shown)\n";
    switch(fp_encoding) {
        case FpEncodingIEEE_754_8:
            pbcfile.ignore(8);
            break;
        case FpEncodingIEEE_i386_12:
            pbcfile.ignore(12);
            break;
        case FpEncodingIEEE_754_16:
            pbcfile.ignore(16);
            break;
    }
}

void PbcFile::dump_constant_key(ifstream &pbcfile)
{
    unsigned long components = read_opcode(pbcfile);
    cout << "Key components: " << components << '\n';
    for (unsigned long i= 0; i < components; ++i) {
        cout << "  " << i << ' ';
        unsigned long type = read_opcode(pbcfile);
        cout << "Type: " << desc_key_type (type) <<
            " (0x" << hex << type << dec << ") ";
        unsigned long value = read_opcode(pbcfile);
        cout << "Value: " << value << '\n';
    }
}

void PbcFile::dump_segment_constant(ifstream &pbcfile)
{
    cout << "<SegmentConstantTable>\n";

    unsigned long segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize << '\n';
    pbcfile.ignore(16 - opcode_size);
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);

    unsigned long tablelength = read_opcode(pbcfile);
    cout << "Number of constants: " << tablelength << '\n';

    for (unsigned long n= 0; n < tablelength; ++n) {
        cout << "Constant " << n;
        unsigned long type = read_opcode(pbcfile);
        cout << " Type: " << desc_constant_type(type) <<
             " (0x" << hex << type << dec << ")\n";
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
                throw std::runtime_error("Unimplemented");
        }
    }

    cout << "</SegmentConstantTable>\n";
}

void PbcFile::dump_segment_bytecode(ifstream &pbcfile)
{
    cout << "<SegmentBytecode>\n";

    unsigned long segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize << '\n';
    pbcfile.ignore(16 - opcode_size);
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);

    for (unsigned long n= 0; n < segsize; ++n) {
        unsigned long code = read_opcode(pbcfile);
        cout << ' ' << hex << setfill('0') << setw(opcode_size * 2) << code << dec;
    }
    cout << '\n';

    cout << "</SegmentBytecode>\n";
}

void PbcFile::dump_segment_fixup(ifstream &pbcfile)
{
    cout << "<SegmentFixup>\n";

    unsigned long segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize << '\n';
    pbcfile.ignore(16 - opcode_size);
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);

    unsigned long tablelength = read_opcode(pbcfile);
    cout << "Number of fixups: " << tablelength << '\n';

    for (unsigned long n= 0; n < tablelength; ++n) {
        cout << "Fixup " << n;
        unsigned long type = read_opcode(pbcfile);
        cout << " Type: " <<
             " (0x" << hex << type << dec << ')';
        switch (type) {
            case 0x01:
                {
                unsigned long label = read_opcode(pbcfile);
                cout << " Label: " << label;
                unsigned long sub = read_opcode(pbcfile);
                cout << " Sub: " << sub;
                }
                break;
            case 0x02:
                {
                string label = read_cstring(pbcfile);
                cout << " Label: '" << label << '\'';
                unsigned long sub = read_opcode(pbcfile);
                cout << " Sub: " << sub;
                }
                break;
            default:
                throw std::runtime_error("Invalid fixup");
        }
        cout << '\n';
    }

    cout << "</SegmentFixup>\n";
}

void PbcFile::dump_segment_pir_debug(ifstream &pbcfile)
{
    cout << "<SegmentPIRDebug>\n";

    unsigned long segsize = read_opcode(pbcfile);
    cout << "Segment size: " << segsize << '\n';

    // Alignment bug?
    pbcfile.ignore(8);
/*
    pbcfile.ignore(16 - opcode_size);
*/
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);

    unsigned long tablelength = read_opcode(pbcfile);
    cout << "Number of mappings: " << tablelength << '\n';

    for (unsigned long n= 0; n < tablelength; ++n) {
        unsigned long linenum = read_opcode(pbcfile);
        cout << " Line: " << linenum;
    }
    cout << '\n';

    unsigned long mappings = read_opcode(pbcfile);
    cout << "Mappings: " << mappings << '\n';
    for (unsigned long n= 0; n < mappings; ++n) {
        cout << "  " << n;
        unsigned long offset = read_opcode(pbcfile);
        cout << " Offset: " << offset;
        unsigned long filename = read_opcode(pbcfile);
        cout << " File: " << filename;
        cout << '\n';
    }

    cout << "</SegmentPIRDebug>\n";
}

void PbcFile::dump_segment(const DirEntry &entry, ifstream &pbcfile)
{
    cout << "Segment '" << entry.getName() << "'\n";
    unsigned long const type = entry.getType();
    cout << "Type: " << desc_segment_type(type) <<
        " (0x" << hex << type << dec << ")\n";
    pbcfile.seekg(entry.getOffset() * opcode_size);
    switch(type)
    {
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
    default:
        cout << "(unimplemented)\n";
    }
}

void PbcFile::read_directory(ifstream &pbcfile)
{
    unsigned long size = read_opcode(pbcfile);
    cout << "Directory segment size: " << size << '\n';

    pbcfile.ignore(16 - opcode_size);
    if (pbc_version <= 0x0325 && opcode_size == 8)
        pbcfile.ignore(16);

    unsigned long entries = read_opcode(pbcfile);
    cout << "Directory entries: " << entries << '\n';

    for (unsigned int n= 0; n < entries; ++n)
    {
        unsigned long type = read_opcode(pbcfile);
        cout << n << ": Type: '" << desc_segment_type(type) << "' Name: '";
        string name;
        char c;
        unsigned int namelen= 0;
        while ((c = pbcfile.get()))
        {
            cout << c;
            name+= c;
            ++namelen;
        }
        ++namelen;
        while(namelen % opcode_size)
        {
            c= pbcfile.get();
            ++namelen;
        }
        unsigned long offset = read_opcode(pbcfile);
        unsigned long length = read_opcode(pbcfile);
        cout << "'\n   Offset: " << offset << " Length: " << length << '\n';
        DirEntry entry(name, type, offset, length);
        directory.push_back(entry);
    }
}

string PbcFile::read_cstring(ifstream &pbcfile)
{
    string r;
    char c;
    while ((c= pbcfile.get())) {
        r+= c;
    }
    for (unsigned long l = r.size() + 1; l % opcode_size; ++l)
        pbcfile.ignore(1);
    return r;
}

unsigned long PbcFile::read_opcode(ifstream &pbcfile)
{
    unsigned char buffer [32]; // Allow 256 bits opcode size
    pbcfile.read((char *)buffer, opcode_size);
    if (static_cast<unsigned int>(pbcfile.gcount()) != opcode_size)
        throw ReadError("opcode");

    unsigned long result = 0;
    switch(byte_order)
    {
    case bo_little:
        for (unsigned int i= 0; i < opcode_size; ++i) {
            result <<= 8;
            result += buffer [opcode_size - 1 - i];
        }
        break;
    case bo_big:
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
        throw std::runtime_error("Bad args");

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
    catch(std::exception &e)
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
