/* Metadata table information. */

/* Table name => number mappings */
#define Table_Assembly                  0x20
#define Table_AssemblyOS                0x22
#define Table_AssemblyProcessor         0x21
#define Table_AssemblyRef               0x23
#define Table_AssemblyRefOS             0x25
#define Table_AssemblyRefProcessor      0x24
#define Table_ClassLayout               0x0F
#define Table_Constant                  0x0B
#define Table_CustomAttribute           0x0C
#define Table_DeclSecurity              0x0E
#define Table_EventMap                  0x12
#define Table_Event                     0x14
#define Table_ExportedType              0x27
#define Table_Field                     0x04
#define Table_FieldLayout               0x10
#define Table_FieldMarshall             0x0D
#define Table_FieldRVA                  0x1D
#define Table_File                      0x26
#define Table_ImplMap                   0x1C
#define Table_InterfaceImpl             0x09
#define Table_ManifestResource          0x28
#define Table_MemberRef                 0x0A
#define Table_MethodDef                 0x06
#define Table_MethodImpl                0x19
#define Table_MethodSemantics           0x18
#define Table_Module                    0x00
#define Table_ModuleRef                 0x1A
#define Table_NestedClass               0x29
#define Table_Param                     0x08
#define Table_Property                  0x17
#define Table_PropertyMap               0x15
#define Table_StandAloneSig             0x11
#define Table_TypeDef                   0x02
#define Table_TypeRef                   0x01
#define Table_TypeSpec                  0x1B


/* Maximum table ID. */
#define MAX_TABLE                       0x2B


/* Table row length macros. */
#define Table_Assembly_RL(ass)          (16 + (2 * ass->strings_ptr_size) + \
                                        ass->blobs_ptr_size)

#define Table_AssemblyOS_RL(ass)        12

#define Table_AssemblyProcessor_RL(ass) 4

#define Table_AssemblyRef_RL(ass)       (12 + (2 * ass->strings_ptr_size) + \
                                        (2 * ass->blobs_ptr_size))

#define Table_AssemblyRefOS_RL(ass)     (12 + (ass->rows[Table_AssemblyRef] < (2 << 15) \
                                               ? 2 : 4))

#define Table_AssemblyRefProcessor_RL(ass) \
                                        (4 + (ass->rows[Table_AssemblyRef] < (2 << 15) \
                                              ? 2 : 4))

#define Table_ClassLayout_RL(ass)       (6 + (ass->rows[Table_TypeDef] < (2 << 15) \
                                              ? 2 : 4))
 
#define Table_Constant_RL(ass)          (2 + ((ass->rows[Table_Field] < (2 << 13) && \
                                               ass->rows[Table_Param] < (2 << 13) && \
                                               ass->rows[Table_Property] < (2 << 13)) \
                                             ? 2 : 4) + ass->blobs_ptr_size)

#define Table_CustomAttribute_RL(ass)   (((ass->rows[Table_MethodDef] < (2 << 10) && \
                                           ass->rows[Table_Field] < (2 << 10) && \
                                           ass->rows[Table_TypeRef] < (2 << 10) && \
                                           ass->rows[Table_TypeDef] < (2 << 10) && \
                                           ass->rows[Table_Param] < (2 << 10) && \
                                           ass->rows[Table_InterfaceImpl] < (2 << 10) && \
                                           ass->rows[Table_MemberRef] < (2 << 10) && \
                                           ass->rows[Table_Module] < (2 << 10) && \
                                           ass->rows[Table_DeclSecurity] < (2 << 10) && \
                                           ass->rows[Table_Property] < (2 << 10) && \
                                           ass->rows[Table_Event] < (2 << 10) && \
                                           ass->rows[Table_StandAloneSig] < (2 << 10) && \
                                           ass->rows[Table_ModuleRef] < (2 << 10) && \
                                           ass->rows[Table_TypeSpec] < (2 << 10) && \
                                           ass->rows[Table_Assembly] < (2 << 10) && \
                                           ass->rows[Table_AssemblyRef] < (2 << 10) && \
                                           ass->rows[Table_File] < (2 << 10) && \
                                           ass->rows[Table_ExportedType] < (2 << 10) && \
                                           ass->rows[Table_ManifestResource] < (2 << 10)) \
                                          ? 2 : 4) + \
                                         ((ass->rows[Table_MethodDef] < (2 << 12) && \
                                           ass->rows[Table_MemberRef] < (2 << 12)) \
                                          ? 2 : 4) + ass->blobs_ptr_size)

#define Table_DeclSecurity_RL(ass)      (2 + ((ass->rows[Table_TypeDef] < (2 << 13) && \
                                               ass->rows[Table_MethodDef] < (2 << 13) && \
                                               ass->rows[Table_Assembly] < (2 << 13)) \
                                              ? 2 : 4) + ass->blobs_ptr_size)

#define Table_EventMap_RL(ass)          ((ass->rows[Table_TypeDef] < (2 << 15) ? 2 : 4) + \
                                         (ass->rows[Table_Event] < (2 << 15) ? 2 : 4))

#define Table_Event_RL(ass)             (2 + ass->strings_ptr_size + \
                                         ((ass->rows[Table_TypeDef] < (2 << 13) && \
                                           ass->rows[Table_TypeRef] < (2 << 13) && \
                                           ass->rows[Table_TypeSpec] < (2 << 13)) \
                                          ? 2 : 4))

#define Table_ExportedType_RL(ass)      (8 + (2 * ass->strings_ptr_size) + \
                                         ((ass->rows[Table_File] < (2 << 13) && \
                                           ass->rows[Table_AssemblyRef] < (2 << 13) && \
                                           ass->rows[Table_ExportedType] < (2 << 13)) \
                                          ? 2 : 4))

#define Table_Field_RL(ass)             (2 + ass->strings_ptr_size + \
                                         ass->blobs_ptr_size)

#define Table_FieldLayout_RL(ass)       (4 + (ass->rows[Table_Field] < (2 << 15) ? 2 : 4))

#define Table_FieldMarshall_RL(ass)     (ass->blobs_ptr_size + \
                                         ((ass->rows[Table_Field] < (2 << 14) && \
                                           ass->rows[Table_Param] < (2 << 14)) \
                                          ? 2 : 4))

#define Table_FieldRVA_RL(ass)          (4 + (ass->rows[Table_Field] < (2 << 15) ? 2 : 4))

#define Table_File_RL(ass)              (4 + ass->strings_ptr_size + \
                                         ass->blobs_ptr_size)

#define Table_ImplMap_RL(ass)           (2 + ((ass->rows[Table_Field] < (2 << 14) && \
                                               ass->rows[Table_MethodDef] < (2 << 14)) \
                                              ? 2 : 4) + ass->strings_ptr_size + \
                                         (ass->rows[Table_ModuleRef] < (2 << 15) ? 2 : 4)) 

#define Table_InterfaceImpl_RL(ass)     ((ass->rows[Table_TypeDef] < (2 << 15) ? 2 : 4) + \
                                         ((ass->rows[Table_TypeDef] < (2 << 13) && \
                                           ass->rows[Table_TypeRef] < (2 << 13) && \
                                           ass->rows[Table_TypeSpec] < (2 << 13)) \
                                          ? 2 : 4))

#define Table_ManifestResource_RL(ass)  (8 + ass->strings_ptr_size + \
                                         ((ass->rows[Table_File] < (2 << 13) && \
                                           ass->rows[Table_AssemblyRef] < (2 << 13) && \
                                           ass->rows[Table_ExportedType] < (2 << 13)) \
                                          ? 2 : 4))

#define Table_MemberRef_RL(ass)         (((ass->rows[Table_TypeRef] < (2 << 12) && \
                                           ass->rows[Table_ModuleRef] < (2 << 12) && \
                                           ass->rows[Table_MethodDef] < (2 << 12) && \
                                           ass->rows[Table_TypeSpec] < (2 << 12) && \
                                           ass->rows[Table_TypeDef] < (2 << 12)) \
                                          ? 2 : 4) + ass->strings_ptr_size + \
                                         ass->blobs_ptr_size)

#define Table_MethodDef_RL(ass)         (8 + ass->strings_ptr_size + \
                                         ass->blobs_ptr_size + \
                                         (ass->rows[Table_Param] < (2 << 15) ? 2 : 4))

#define Table_MethodImpl_RL(ass)        ((ass->rows[Table_TypeDef] < (2 << 15) ? 2 : 4) + \
                                         2 * ((ass->rows[Table_MethodDef] < (2 << 14) && \
                                               ass->rows[Table_MemberRef] < (2 << 14)) \
                                              ? 2 : 4))

#define Table_MethodSemantics_RL(ass)   (2 + (ass->rows[Table_MethodDef] < (2 << 15) ? 2 : 4) + \
                                         ((ass->rows[Table_Event] < (2 << 14) && \
                                           ass->rows[Table_Property] < (2 << 14)) \
                                          ? 2 : 4))

#define Table_Module_RL(ass)            (2 + ass->strings_ptr_size + \
                                         (3 * ass->guid_ptr_size))

#define Table_ModuleRef_RL(ass)         (ass->strings_ptr_size)

#define Table_NestedClass_RL(ass)       (2 * (ass->rows[Table_TypeDef] < (2 << 15) ? 2 : 4))

#define Table_Param_RL(ass)             (4 + ass->strings_ptr_size)

#define Table_Property_RL(ass)          (2 + ass->strings_ptr_size + \
                                         ass->blobs_ptr_size)

#define Table_PropertyMap_RL(ass)       ((ass->rows[Table_TypeDef] < (2 << 15) ? 2 : 4) + \
                                         (ass->rows[Table_Property] < (2 << 15) ? 2 : 4))

#define Table_StandAloneSig_RL(ass)     (ass->blobs_ptr_size)

#define Table_TypeDef_RL(ass)           (4 + (2 * ass->strings_ptr_size) + \
                                         ((ass->rows[Table_TypeDef] < (2 << 13) && \
                                           ass->rows[Table_TypeRef] < (2 << 13) && \
                                           ass->rows[Table_TypeSpec] < (2 << 13)) \
                                          ? 2 : 4) + \
                                         (ass->rows[Table_Field] < (2 << 15) ? 2 : 4) + \
                                         (ass->rows[Table_MethodDef] < (2 << 15) ? 2 : 4))

#define Table_TypeRef_RL(ass)           ((2 * ass->strings_ptr_size) + \
                                         ((ass->rows[Table_Module] < (2 << 13) && \
                                           ass->rows[Table_ModuleRef] < (2 << 13) && \
                                           ass->rows[Table_AssemblyRef] < (2 << 13) && \
                                           ass->rows[Table_TypeRef] < (2 << 13)) \
                                          ? 2 : 4))

#define Table_TypeSpec_RL(ass)          (ass->blobs_ptr_size)

