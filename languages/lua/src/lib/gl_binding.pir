# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/gl_binding.pir - OpenGL library

=head1 DESCRIPTION

This file implements the OpenGL binding for Lua.

This implementation is based on a wrapper over OpenGL,
see F<runtime/parrot/library/OpenGL.pir>.

=over 4

=cut

.HLL 'Lua'
.loadlib 'lua_group'
.namespace [ 'gl_binding' ]

.sub '__onload' :anon :load
#    print '__onload gl_binding\n'
    .const 'Sub' entry = 'luaopen_gl_binding'
    set_hll_global 'luaopen_gl_binding', entry
.end

.sub 'luaopen_gl_binding'
#    print 'luaopen_gl_binding\n'
    load_bytecode 'OpenGL.pir'

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    .local pmc _gl_binding
    new _gl_binding, 'LuaTable'
    new $P1, 'LuaString'
    set $P1, 'gl_binding'
    _lua__GLOBAL[$P1] = _gl_binding

    $P2 = split "\n", <<'LIST'
_get_gl_enum
_get_str_gl_enum
_get_arrayb
_get_arrayf
_get_arrayi
_get_array2f
LIST
    lua_register($P1, _gl_binding, $P2)

    $P0 = _gl_str()
    set_hll_global ['gl_binding'], 'gl_str', $P0

    # Import all OpenGL/GLU/GLUT functions
    $P0 = get_hll_global ['OpenGL'], '_export_all_functions'
    $P0(_gl_binding)

    .return (_gl_binding)
.end


.sub '_get_gl_enum'
    .param string str
    .param pmc err_msg :optional
    .local pmc gl_str
    gl_str = get_hll_global ['gl_binding'], 'gl_str'
    .local int res
    res = 0
    $P0 = split ',', str
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    upcase $S0
    $I0 = exists gl_str[$S0]
    if $I0 goto L3
    lua_error(err_msg)
  L3:
    $I0 = gl_str[$S0]
    res |= $I0
    goto L1
  L2:
    .return (res)
.end

.sub '_get_str_gl_enum'
    .param int enum
    .local pmc gl_str
    gl_str = get_hll_global ['gl_binding'], 'gl_str'
    new $P0, 'Iterator', gl_str
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    $I0 = gl_str[$S0]
    unless enum == $I0 goto L1
    goto L3
  L2:
    $S0 = ''
  L3:
    new $P0, 'LuaString'
    set $P0, $S0
    .return ($P0)
.end

.sub '_get_arrayb'
    .param pmc table
    .local int n
    n = table.'len'()
    .local pmc a
    new a, 'FixedBooleanArray'
    set a, n
    $I0 = 0
    new $P0, 'LuaNumber'
  L1:
    unless $I0 < n goto L2
    set $P0, $I0
    inc $P0
    $P1 = table[$P0]
    $I1 = istrue $P1
    a[$I0] = $I1
    inc $I0
    goto L1
  L2:
    set $P0, n
    .return ($P0, a)
.end

.sub '_get_arrayf'
    .param pmc table
    .local int n
    n = table.'len'()
    .local pmc a
    new a, 'FixedFloatArray'
    set a, n
    $I0 = 0
    new $P0, 'LuaNumber'
  L1:
    unless $I0 < n goto L2
    set $P0, $I0
    inc $P0
    $P1 = table[$P0]
    $N1 = $P1
    a[$I0] = $N1
    inc $I0
    goto L1
  L2:
    set $P0, n
    .return ($P0, a)
.end

.sub '_get_arrayi'
    .param pmc table
    .local int n
    n = table.'len'()
    .local pmc a
    new a, 'FixedIntegerArray'
    set a, n
    $I0 = 0
    new $P0, 'LuaNumber'
  L1:
    unless $I0 < n goto L2
    set $P0, $I0
    inc $P0
    $P1 = table[$P0]
    $I1 = $P1
    a[$I0] = $I1
    inc $I0
    goto L1
  L2:
    set $P0, n
    .return ($P0, a)
.end

.sub '_get_array2f'
    .param pmc table
    .local int n, size
    n = table.'len'()
    new $P0, 'LuaNumber'
    set $P0, 1
    $P1 = table[$P0]
    $I0 = lua_istable($P1)
    if $I0 goto L1
    .return (-1)
  L1:
    size = $P1.'len'()
    .local pmc a
    new a, 'FixedFloatArray'
    $I0 = n * size
    set a, $I0
    $I0 = 0
    $I2 = 0
  L2:
    unless $I0 < n goto L3
    inc $I0
    set $P0, $I0
    $P1 = table[$P0]
    $I0 = lua_istable($P1)
    if $I0 goto L4
    .return (-1)
  L4:
    $I1 = 0
    unless $I1 < size goto L5
    inc $I1
    set $P0, $I1
    $P2 = $P1[$P0]
    $N2 = $P2
    a[$I2] = $N2
    goto L4
  L5:
    goto L2
  L3:
    set $P0, n
    new $P1, 'LuaNumber'
    set $P1, size
    .return ($P0, $P1, a)
.end

.sub '_gl_str' :anon
    new $P0, 'Hash'
    $P0['VERSION_1_1']                     = 1
    $P0['ACCUM']                           = 0x0100
    $P0['LOAD']                            = 0x0101
    $P0['RETURN']                          = 0x0102
    $P0['MULT']                            = 0x0103
    $P0['ADD']                             = 0x0104
    $P0['NEVER']                           = 0x0200
    $P0['LESS']                            = 0x0201
    $P0['EQUAL']                           = 0x0202
    $P0['LEQUAL']                          = 0x0203
    $P0['GREATER']                         = 0x0204
    $P0['NOTEQUAL']                        = 0x0205
    $P0['GEQUAL']                          = 0x0206
    $P0['ALWAYS']                          = 0x0207
    $P0['POINTS']                          = 0x0000
    $P0['LINES']                           = 0x0001
    $P0['LINE_LOOP']                       = 0x0002
    $P0['LINE_STRIP']                      = 0x0003
    $P0['TRIANGLES']                       = 0x0004
    $P0['TRIANGLE_STRIP']                  = 0x0005
    $P0['TRIANGLE_FAN']                    = 0x0006
    $P0['QUADS']                           = 0x0007
    $P0['QUAD_STRIP']                      = 0x0008
    $P0['POLYGON']                         = 0x0009
    $P0['ZERO']                            = 0
    $P0['ONE']                             = 1
    $P0['SRC_COLOR']                       = 0x0300
    $P0['ONE_MINUS_SRC_COLOR']             = 0x0301
    $P0['SRC_ALPHA']                       = 0x0302
    $P0['ONE_MINUS_SRC_ALPHA']             = 0x0303
    $P0['DST_ALPHA']                       = 0x0304
    $P0['ONE_MINUS_DST_ALPHA']             = 0x0305
    $P0['DST_COLOR']                       = 0x0306
    $P0['ONE_MINUS_DST_COLOR']             = 0x0307
    $P0['SRC_ALPHA_SATURATE']              = 0x0308
    $P0['TRUE']                            = 1
    $P0['FALSE']                           = 0
    $P0['CLIP_PLANE0']                     = 0x3000
    $P0['CLIP_PLANE1']                     = 0x3001
    $P0['CLIP_PLANE2']                     = 0x3002
    $P0['CLIP_PLANE3']                     = 0x3003
    $P0['CLIP_PLANE4']                     = 0x3004
    $P0['CLIP_PLANE5']                     = 0x3005
    $P0['BYTE']                            = 0x1400
    $P0['UNSIGNED_BYTE']                   = 0x1401
    $P0['SHORT']                           = 0x1402
    $P0['UNSIGNED_SHORT']                  = 0x1403
    $P0['INT']                             = 0x1404
    $P0['UNSIGNED_INT']                    = 0x1405
    $P0['FLOAT']                           = 0x1406
    $P0['2_BYTES']                         = 0x1407
    $P0['3_BYTES']                         = 0x1408
    $P0['4_BYTES']                         = 0x1409
    $P0['DOUBLE']                          = 0x140A
    $P0['NONE']                            = 0
    $P0['FRONT_LEFT']                      = 0x0400
    $P0['FRONT_RIGHT']                     = 0x0401
    $P0['BACK_LEFT']                       = 0x0402
    $P0['BACK_RIGHT']                      = 0x0403
    $P0['FRONT']                           = 0x0404
    $P0['BACK']                            = 0x0405
    $P0['LEFT']                            = 0x0406
    $P0['RIGHT']                           = 0x0407
    $P0['FRONT_AND_BACK']                  = 0x0408
    $P0['AUX0']                            = 0x0409
    $P0['AUX1']                            = 0x040A
    $P0['AUX2']                            = 0x040B
    $P0['AUX3']                            = 0x040C
    $P0['NO_ERROR']                        = 0
    $P0['INVALID_ENUM']                    = 0x0500
    $P0['INVALID_VALUE']                   = 0x0501
    $P0['INVALID_OPERATION']               = 0x0502
    $P0['STACK_OVERFLOW']                  = 0x0503
    $P0['STACK_UNDERFLOW']                 = 0x0504
    $P0['OUT_OF_MEMORY']                   = 0x0505
    $P0['2D']                              = 0x0600
    $P0['3D']                              = 0x0601
    $P0['3D_COLOR']                        = 0x0602
    $P0['3D_COLOR_TEXTURE']                = 0x0603
    $P0['4D_COLOR_TEXTURE']                = 0x0604
    $P0['PASS_THROUGH_TOKEN']              = 0x0700
    $P0['POINT_TOKEN']                     = 0x0701
    $P0['LINE_TOKEN']                      = 0x0702
    $P0['POLYGON_TOKEN']                   = 0x0703
    $P0['BITMAP_TOKEN']                    = 0x0704
    $P0['DRAW_PIXEL_TOKEN']                = 0x0705
    $P0['COPY_PIXEL_TOKEN']                = 0x0706
    $P0['LINE_RESET_TOKEN']                = 0x0707
    $P0['EXP']                             = 0x0800
    $P0['EXP2']                            = 0x0801
    $P0['CW']                              = 0x0900
    $P0['CCW']                             = 0x0901
    $P0['COEFF']                           = 0x0A00
    $P0['ORDER']                           = 0x0A01
    $P0['DOMAIN']                          = 0x0A02
    $P0['CURRENT_COLOR']                   = 0x0B00
    $P0['CURRENT_INDEX']                   = 0x0B01
    $P0['CURRENT_NORMAL']                  = 0x0B02
    $P0['CURRENT_TEXTURE_COORDS']          = 0x0B03
    $P0['CURRENT_RASTER_COLOR']            = 0x0B04
    $P0['CURRENT_RASTER_INDEX']            = 0x0B05
    $P0['CURRENT_RASTER_TEXTURE_COORDS']   = 0x0B06
    $P0['CURRENT_RASTER_POSITION']         = 0x0B07
    $P0['CURRENT_RASTER_POSITION_VALID']   = 0x0B08
    $P0['CURRENT_RASTER_DISTANCE']         = 0x0B09
    $P0['POINT_SMOOTH']                    = 0x0B10
    $P0['POINT_SIZE']                      = 0x0B11
    $P0['POINT_SIZE_RANGE']                = 0x0B12
    $P0['POINT_SIZE_GRANULARITY']          = 0x0B13
    $P0['LINE_SMOOTH']                     = 0x0B20
    $P0['LINE_WIDTH']                      = 0x0B21
    $P0['LINE_WIDTH_RANGE']                = 0x0B22
    $P0['LINE_WIDTH_GRANULARITY']          = 0x0B23
    $P0['LINE_STIPPLE']                    = 0x0B24
    $P0['LINE_STIPPLE_PATTERN']            = 0x0B25
    $P0['LINE_STIPPLE_REPEAT']             = 0x0B26
    $P0['LIST_MODE']                       = 0x0B30
    $P0['MAX_LIST_NESTING']                = 0x0B31
    $P0['LIST_BASE']                       = 0x0B32
    $P0['LIST_INDEX']                      = 0x0B33
    $P0['POLYGON_MODE']                    = 0x0B40
    $P0['POLYGON_SMOOTH']                  = 0x0B41
    $P0['POLYGON_STIPPLE']                 = 0x0B42
    $P0['EDGE_FLAG']                       = 0x0B43
    $P0['CULL_FACE']                       = 0x0B44
    $P0['CULL_FACE_MODE']                  = 0x0B45
    $P0['FRONT_FACE']                      = 0x0B46
    $P0['LIGHTING']                        = 0x0B50
    $P0['LIGHT_MODEL_LOCAL_VIEWER']        = 0x0B51
    $P0['LIGHT_MODEL_TWO_SIDE']            = 0x0B52
    $P0['LIGHT_MODEL_AMBIENT']             = 0x0B53
    $P0['SHADE_MODEL']                     = 0x0B54
    $P0['COLOR_MATERIAL_FACE']             = 0x0B55
    $P0['COLOR_MATERIAL_PARAMETER']        = 0x0B56
    $P0['COLOR_MATERIAL']                  = 0x0B57
    $P0['FOG']                             = 0x0B60
    $P0['FOG_INDEX']                       = 0x0B61
    $P0['FOG_DENSITY']                     = 0x0B62
    $P0['FOG_START']                       = 0x0B63
    $P0['FOG_END']                         = 0x0B64
    $P0['FOG_MODE']                        = 0x0B65
    $P0['FOG_COLOR']                       = 0x0B66
    $P0['DEPTH_RANGE']                     = 0x0B70
    $P0['DEPTH_TEST']                      = 0x0B71
    $P0['DEPTH_WRITEMASK']                 = 0x0B72
    $P0['DEPTH_CLEAR_VALUE']               = 0x0B73
    $P0['DEPTH_FUNC']                      = 0x0B74
    $P0['ACCUM_CLEAR_VALUE']               = 0x0B80
    $P0['STENCIL_TEST']                    = 0x0B90
    $P0['STENCIL_CLEAR_VALUE']             = 0x0B91
    $P0['STENCIL_FUNC']                    = 0x0B92
    $P0['STENCIL_VALUE_MASK']              = 0x0B93
    $P0['STENCIL_FAIL']                    = 0x0B94
    $P0['STENCIL_PASS_DEPTH_FAIL']         = 0x0B95
    $P0['STENCIL_PASS_DEPTH_PASS']         = 0x0B96
    $P0['STENCIL_REF']                     = 0x0B97
    $P0['STENCIL_WRITEMASK']               = 0x0B98
    $P0['MATRIX_MODE']                     = 0x0BA0
    $P0['NORMALIZE']                       = 0x0BA1
    $P0['VIEWPORT']                        = 0x0BA2
    $P0['MODELVIEW_STACK_DEPTH']           = 0x0BA3
    $P0['PROJECTION_STACK_DEPTH']          = 0x0BA4
    $P0['TEXTURE_STACK_DEPTH']             = 0x0BA5
    $P0['MODELVIEW_MATRIX']                = 0x0BA6
    $P0['PROJECTION_MATRIX']               = 0x0BA7
    $P0['TEXTURE_MATRIX']                  = 0x0BA8
    $P0['ATTRIB_STACK_DEPTH']              = 0x0BB0
    $P0['CLIENT_ATTRIB_STACK_DEPTH']       = 0x0BB1
    $P0['ALPHA_TEST']                      = 0x0BC0
    $P0['ALPHA_TEST_FUNC']                 = 0x0BC1
    $P0['ALPHA_TEST_REF']                  = 0x0BC2
    $P0['DITHER']                          = 0x0BD0
    $P0['BLEND_DST']                       = 0x0BE0
    $P0['BLEND_SRC']                       = 0x0BE1
    $P0['BLEND']                           = 0x0BE2
    $P0['LOGIC_OP_MODE']                   = 0x0BF0
    $P0['LOGIC_OP']                        = 0x0BF1
    $P0['INDEX_LOGIC_OP']                  = 0x0BF1
    $P0['COLOR_LOGIC_OP']                  = 0x0BF2
    $P0['AUX_BUFFERS']                     = 0x0C00
    $P0['DRAW_BUFFER']                     = 0x0C01
    $P0['READ_BUFFER']                     = 0x0C02
    $P0['SCISSOR_BOX']                     = 0x0C10
    $P0['SCISSOR_TEST']                    = 0x0C11
    $P0['INDEX_CLEAR_VALUE']               = 0x0C20
    $P0['INDEX_WRITEMASK']                 = 0x0C21
    $P0['COLOR_CLEAR_VALUE']               = 0x0C22
    $P0['COLOR_WRITEMASK']                 = 0x0C23
    $P0['INDEX_MODE']                      = 0x0C30
    $P0['RGBA_MODE']                       = 0x0C31
    $P0['DOUBLEBUFFER']                    = 0x0C32
    $P0['STEREO']                          = 0x0C33
    $P0['RENDER_MODE']                     = 0x0C40
    $P0['PERSPECTIVE_CORRECTION_HINT']     = 0x0C50
    $P0['POINT_SMOOTH_HINT']               = 0x0C51
    $P0['LINE_SMOOTH_HINT']                = 0x0C52
    $P0['POLYGON_SMOOTH_HINT']             = 0x0C53
    $P0['FOG_HINT']                        = 0x0C54
    $P0['TEXTURE_GEN_S']                   = 0x0C60
    $P0['TEXTURE_GEN_T']                   = 0x0C61
    $P0['TEXTURE_GEN_R']                   = 0x0C62
    $P0['TEXTURE_GEN_Q']                   = 0x0C63
    $P0['PIXEL_MAP_I_TO_I']                = 0x0C70
    $P0['PIXEL_MAP_S_TO_S']                = 0x0C71
    $P0['PIXEL_MAP_I_TO_R']                = 0x0C72
    $P0['PIXEL_MAP_I_TO_G']                = 0x0C73
    $P0['PIXEL_MAP_I_TO_B']                = 0x0C74
    $P0['PIXEL_MAP_I_TO_A']                = 0x0C75
    $P0['PIXEL_MAP_R_TO_R']                = 0x0C76
    $P0['PIXEL_MAP_G_TO_G']                = 0x0C77
    $P0['PIXEL_MAP_B_TO_B']                = 0x0C78
    $P0['PIXEL_MAP_A_TO_A']                = 0x0C79
    $P0['PIXEL_MAP_I_TO_I_SIZE']           = 0x0CB0
    $P0['PIXEL_MAP_S_TO_S_SIZE']           = 0x0CB1
    $P0['PIXEL_MAP_I_TO_R_SIZE']           = 0x0CB2
    $P0['PIXEL_MAP_I_TO_G_SIZE']           = 0x0CB3
    $P0['PIXEL_MAP_I_TO_B_SIZE']           = 0x0CB4
    $P0['PIXEL_MAP_I_TO_A_SIZE']           = 0x0CB5
    $P0['PIXEL_MAP_R_TO_R_SIZE']           = 0x0CB6
    $P0['PIXEL_MAP_G_TO_G_SIZE']           = 0x0CB7
    $P0['PIXEL_MAP_B_TO_B_SIZE']           = 0x0CB8
    $P0['PIXEL_MAP_A_TO_A_SIZE']           = 0x0CB9
    $P0['UNPACK_SWAP_BYTES']               = 0x0CF0
    $P0['UNPACK_LSB_FIRST']                = 0x0CF1
    $P0['UNPACK_ROW_LENGTH']               = 0x0CF2
    $P0['UNPACK_SKIP_ROWS']                = 0x0CF3
    $P0['UNPACK_SKIP_PIXELS']              = 0x0CF4
    $P0['UNPACK_ALIGNMENT']                = 0x0CF5
    $P0['PACK_SWAP_BYTES']                 = 0x0D00
    $P0['PACK_LSB_FIRST']                  = 0x0D01
    $P0['PACK_ROW_LENGTH']                 = 0x0D02
    $P0['PACK_SKIP_ROWS']                  = 0x0D03
    $P0['PACK_SKIP_PIXELS']                = 0x0D04
    $P0['PACK_ALIGNMENT']                  = 0x0D05
    $P0['MAP_COLOR']                       = 0x0D10
    $P0['MAP_STENCIL']                     = 0x0D11
    $P0['INDEX_SHIFT']                     = 0x0D12
    $P0['INDEX_OFFSET']                    = 0x0D13
    $P0['RED_SCALE']                       = 0x0D14
    $P0['RED_BIAS']                        = 0x0D15
    $P0['ZOOM_X']                          = 0x0D16
    $P0['ZOOM_Y']                          = 0x0D17
    $P0['GREEN_SCALE']                     = 0x0D18
    $P0['GREEN_BIAS']                      = 0x0D19
    $P0['BLUE_SCALE']                      = 0x0D1A
    $P0['BLUE_BIAS']                       = 0x0D1B
    $P0['ALPHA_SCALE']                     = 0x0D1C
    $P0['ALPHA_BIAS']                      = 0x0D1D
    $P0['DEPTH_SCALE']                     = 0x0D1E
    $P0['DEPTH_BIAS']                      = 0x0D1F
    $P0['MAX_EVAL_ORDER']                  = 0x0D30
    $P0['MAX_LIGHTS']                      = 0x0D31
    $P0['MAX_CLIP_PLANES']                 = 0x0D32
    $P0['MAX_TEXTURE_SIZE']                = 0x0D33
    $P0['MAX_PIXEL_MAP_TABLE']             = 0x0D34
    $P0['MAX_ATTRIB_STACK_DEPTH']          = 0x0D35
    $P0['MAX_MODELVIEW_STACK_DEPTH']       = 0x0D36
    $P0['MAX_NAME_STACK_DEPTH']            = 0x0D37
    $P0['MAX_PROJECTION_STACK_DEPTH']      = 0x0D38
    $P0['MAX_TEXTURE_STACK_DEPTH']         = 0x0D39
    $P0['MAX_VIEWPORT_DIMS']               = 0x0D3A
    $P0['MAX_CLIENT_ATTRIB_STACK_DEPTH']   = 0x0D3B
    $P0['SUBPIXEL_BITS']                   = 0x0D50
    $P0['INDEX_BITS']                      = 0x0D51
    $P0['RED_BITS']                        = 0x0D52
    $P0['GREEN_BITS']                      = 0x0D53
    $P0['BLUE_BITS']                       = 0x0D54
    $P0['ALPHA_BITS']                      = 0x0D55
    $P0['DEPTH_BITS']                      = 0x0D56
    $P0['STENCIL_BITS']                    = 0x0D57
    $P0['ACCUM_RED_BITS']                  = 0x0D58
    $P0['ACCUM_GREEN_BITS']                = 0x0D59
    $P0['ACCUM_BLUE_BITS']                 = 0x0D5A
    $P0['ACCUM_ALPHA_BITS']                = 0x0D5B
    $P0['NAME_STACK_DEPTH']                = 0x0D70
    $P0['AUTO_NORMAL']                     = 0x0D80
    $P0['MAP1_COLOR_4']                    = 0x0D90
    $P0['MAP1_INDEX']                      = 0x0D91
    $P0['MAP1_NORMAL']                     = 0x0D92
    $P0['MAP1_TEXTURE_COORD_1']            = 0x0D93
    $P0['MAP1_TEXTURE_COORD_2']            = 0x0D94
    $P0['MAP1_TEXTURE_COORD_3']            = 0x0D95
    $P0['MAP1_TEXTURE_COORD_4']            = 0x0D96
    $P0['MAP1_VERTEX_3']                   = 0x0D97
    $P0['MAP1_VERTEX_4']                   = 0x0D98
    $P0['MAP2_COLOR_4']                    = 0x0DB0
    $P0['MAP2_INDEX']                      = 0x0DB1
    $P0['MAP2_NORMAL']                     = 0x0DB2
    $P0['MAP2_TEXTURE_COORD_1']            = 0x0DB3
    $P0['MAP2_TEXTURE_COORD_2']            = 0x0DB4
    $P0['MAP2_TEXTURE_COORD_3']            = 0x0DB5
    $P0['MAP2_TEXTURE_COORD_4']            = 0x0DB6
    $P0['MAP2_VERTEX_3']                   = 0x0DB7
    $P0['MAP2_VERTEX_4']                   = 0x0DB8
    $P0['MAP1_GRID_DOMAIN']                = 0x0DD0
    $P0['MAP1_GRID_SEGMENTS']              = 0x0DD1
    $P0['MAP2_GRID_DOMAIN']                = 0x0DD2
    $P0['MAP2_GRID_SEGMENTS']              = 0x0DD3
    $P0['TEXTURE_1D']                      = 0x0DE0
    $P0['TEXTURE_2D']                      = 0x0DE1
    $P0['FEEDBACK_BUFFER_POINTER']         = 0x0DF0
    $P0['FEEDBACK_BUFFER_SIZE']            = 0x0DF1
    $P0['FEEDBACK_BUFFER_TYPE']            = 0x0DF2
    $P0['SELECTION_BUFFER_POINTER']        = 0x0DF3
    $P0['SELECTION_BUFFER_SIZE']           = 0x0DF4
    $P0['TEXTURE_WIDTH']                   = 0x1000
    $P0['TEXTURE_HEIGHT']                  = 0x1001
    $P0['TEXTURE_COMPONENTS']              = 0x1003
    $P0['TEXTURE_INTERNAL_FORMAT']         = 0x1003
    $P0['TEXTURE_BORDER_COLOR']            = 0x1004
    $P0['TEXTURE_BORDER']                  = 0x1005
    $P0['DONT_CARE']                       = 0x1100
    $P0['FASTEST']                         = 0x1101
    $P0['NICEST']                          = 0x1102
    $P0['LIGHT0']                          = 0x4000
    $P0['LIGHT1']                          = 0x4001
    $P0['LIGHT2']                          = 0x4002
    $P0['LIGHT3']                          = 0x4003
    $P0['LIGHT4']                          = 0x4004
    $P0['LIGHT5']                          = 0x4005
    $P0['LIGHT6']                          = 0x4006
    $P0['LIGHT7']                          = 0x4007
    $P0['AMBIENT']                         = 0x1200
    $P0['DIFFUSE']                         = 0x1201
    $P0['SPECULAR']                        = 0x1202
    $P0['POSITION']                        = 0x1203
    $P0['SPOT_DIRECTION']                  = 0x1204
    $P0['SPOT_EXPONENT']                   = 0x1205
    $P0['SPOT_CUTOFF']                     = 0x1206
    $P0['CONSTANT_ATTENUATION']            = 0x1207
    $P0['LINEAR_ATTENUATION']              = 0x1208
    $P0['QUADRATIC_ATTENUATION']           = 0x1209
    $P0['COMPILE']                         = 0x1300
    $P0['COMPILE_AND_EXECUTE']             = 0x1301
    $P0['CLEAR']                           = 0x1500
    $P0['AND']                             = 0x1501
    $P0['AND_REVERSE']                     = 0x1502
    $P0['COPY']                            = 0x1503
    $P0['AND_INVERTED']                    = 0x1504
    $P0['NOOP']                            = 0x1505
    $P0['XOR']                             = 0x1506
    $P0['OR']                              = 0x1507
    $P0['NOR']                             = 0x1508
    $P0['EQUIV']                           = 0x1509
    $P0['INVERT']                          = 0x150A
    $P0['OR_REVERSE']                      = 0x150B
    $P0['COPY_INVERTED']                   = 0x150C
    $P0['OR_INVERTED']                     = 0x150D
    $P0['NAND']                            = 0x150E
    $P0['SET']                             = 0x150F
    $P0['EMISSION']                        = 0x1600
    $P0['SHININESS']                       = 0x1601
    $P0['AMBIENT_AND_DIFFUSE']             = 0x1602
    $P0['COLOR_INDEXES']                   = 0x1603
    $P0['MODELVIEW']                       = 0x1700
    $P0['PROJECTION']                      = 0x1701
    $P0['TEXTURE']                         = 0x1702
    $P0['COLOR']                           = 0x1800
    $P0['DEPTH']                           = 0x1801
    $P0['STENCIL']                         = 0x1802
    $P0['COLOR_INDEX']                     = 0x1900
    $P0['STENCIL_INDEX']                   = 0x1901
    $P0['DEPTH_COMPONENT']                 = 0x1902
    $P0['RED']                             = 0x1903
    $P0['GREEN']                           = 0x1904
    $P0['BLUE']                            = 0x1905
    $P0['ALPHA']                           = 0x1906
    $P0['RGB']                             = 0x1907
    $P0['RGBA']                            = 0x1908
    $P0['LUMINANCE']                       = 0x1909
    $P0['LUMINANCE_ALPHA']                 = 0x190A
    $P0['BITMAP']                          = 0x1A00
    $P0['POINT']                           = 0x1B00
    $P0['LINE']                            = 0x1B01
    $P0['FILL']                            = 0x1B02
    $P0['RENDER']                          = 0x1C00
    $P0['FEEDBACK']                        = 0x1C01
    $P0['SELECT']                          = 0x1C02
    $P0['FLAT']                            = 0x1D00
    $P0['SMOOTH']                          = 0x1D01
    $P0['KEEP']                            = 0x1E00
    $P0['REPLACE']                         = 0x1E01
    $P0['INCR']                            = 0x1E02
    $P0['DECR']                            = 0x1E03
    $P0['VENDOR']                          = 0x1F00
    $P0['RENDERER']                        = 0x1F01
    $P0['VERSION']                         = 0x1F02
    $P0['EXTENSIONS']                      = 0x1F03
    $P0['S']                               = 0x2000
    $P0['T']                               = 0x2001
    $P0['R']                               = 0x2002
    $P0['Q']                               = 0x2003
    $P0['MODULATE']                        = 0x2100
    $P0['DECAL']                           = 0x2101
    $P0['TEXTURE_ENV_MODE']                = 0x2200
    $P0['TEXTURE_ENV_COLOR']               = 0x2201
    $P0['TEXTURE_ENV']                     = 0x2300
    $P0['EYE_LINEAR']                      = 0x2400
    $P0['OBJECT_LINEAR']                   = 0x2401
    $P0['SPHERE_MAP']                      = 0x2402
    $P0['TEXTURE_GEN_MODE']                = 0x2500
    $P0['OBJECT_PLANE']                    = 0x2501
    $P0['EYE_PLANE']                       = 0x2502
    $P0['NEAREST']                         = 0x2600
    $P0['LINEAR']                          = 0x2601
    $P0['NEAREST_MIPMAP_NEAREST']          = 0x2700
    $P0['LINEAR_MIPMAP_NEAREST']           = 0x2701
    $P0['NEAREST_MIPMAP_LINEAR']           = 0x2702
    $P0['LINEAR_MIPMAP_LINEAR']            = 0x2703
    $P0['TEXTURE_MAG_FILTER']              = 0x2800
    $P0['TEXTURE_MIN_FILTER']              = 0x2801
    $P0['TEXTURE_WRAP_S']                  = 0x2802
    $P0['TEXTURE_WRAP_T']                  = 0x2803
    $P0['CLAMP']                           = 0x2900
    $P0['REPEAT']                          = 0x2901
    $P0['POLYGON_OFFSET_FACTOR']           = 0x8038
    $P0['POLYGON_OFFSET_UNITS']            = 0x2A00
    $P0['POLYGON_OFFSET_POINT']            = 0x2A01
    $P0['POLYGON_OFFSET_LINE']             = 0x2A02
    $P0['POLYGON_OFFSET_FILL']             = 0x8037
    $P0['ALPHA4']                          = 0x803B
    $P0['ALPHA8']                          = 0x803C
    $P0['ALPHA12']                         = 0x803D
    $P0['ALPHA16']                         = 0x803E
    $P0['LUMINANCE4']                      = 0x803F
    $P0['LUMINANCE8']                      = 0x8040
    $P0['LUMINANCE12']                     = 0x8041
    $P0['LUMINANCE16']                     = 0x8042
    $P0['LUMINANCE4_ALPHA4']               = 0x8043
    $P0['LUMINANCE6_ALPHA2']               = 0x8044
    $P0['LUMINANCE8_ALPHA8']               = 0x8045
    $P0['LUMINANCE12_ALPHA4']              = 0x8046
    $P0['LUMINANCE12_ALPHA12']             = 0x8047
    $P0['LUMINANCE16_ALPHA16']             = 0x8048
    $P0['INTENSITY']                       = 0x8049
    $P0['INTENSITY4']                      = 0x804A
    $P0['INTENSITY8']                      = 0x804B
    $P0['INTENSITY12']                     = 0x804C
    $P0['INTENSITY16']                     = 0x804D
    $P0['R3_G3_B2']                        = 0x2A10
    $P0['RGB4']                            = 0x804F
    $P0['RGB5']                            = 0x8050
    $P0['RGB8']                            = 0x8051
    $P0['RGB10']                           = 0x8052
    $P0['RGB12']                           = 0x8053
    $P0['RGB16']                           = 0x8054
    $P0['RGBA2']                           = 0x8055
    $P0['RGBA4']                           = 0x8056
    $P0['RGB5_A1']                         = 0x8057
    $P0['RGBA8']                           = 0x8058
    $P0['RGB10_A2']                        = 0x8059
    $P0['RGBA12']                          = 0x805A
    $P0['RGBA16']                          = 0x805B
    $P0['TEXTURE_RED_SIZE']                = 0x805C
    $P0['TEXTURE_GREEN_SIZE']              = 0x805D
    $P0['TEXTURE_BLUE_SIZE']               = 0x805E
    $P0['TEXTURE_ALPHA_SIZE']              = 0x805F
    $P0['TEXTURE_LUMINANCE_SIZE']          = 0x8060
    $P0['TEXTURE_INTENSITY_SIZE']          = 0x8061
    $P0['PROXY_TEXTURE_1D']                = 0x8063
    $P0['PROXY_TEXTURE_2D']                = 0x8064
    $P0['TEXTURE_PRIORITY']                = 0x8066
    $P0['TEXTURE_RESIDENT']                = 0x8067
    $P0['TEXTURE_BINDING_1D']              = 0x8068
    $P0['TEXTURE_BINDING_2D']              = 0x8069
    $P0['VERTEX_ARRAY']                    = 0x8074
    $P0['NORMAL_ARRAY']                    = 0x8075
    $P0['COLOR_ARRAY']                     = 0x8076
    $P0['INDEX_ARRAY']                     = 0x8077
    $P0['TEXTURE_COORD_ARRAY']             = 0x8078
    $P0['EDGE_FLAG_ARRAY']                 = 0x8079
    $P0['VERTEX_ARRAY_SIZE']               = 0x807A
    $P0['VERTEX_ARRAY_TYPE']               = 0x807B
    $P0['VERTEX_ARRAY_STRIDE']             = 0x807C
    $P0['NORMAL_ARRAY_TYPE']               = 0x807E
    $P0['NORMAL_ARRAY_STRIDE']             = 0x807F
    $P0['COLOR_ARRAY_SIZE']                = 0x8081
    $P0['COLOR_ARRAY_TYPE']                = 0x8082
    $P0['COLOR_ARRAY_STRIDE']              = 0x8083
    $P0['INDEX_ARRAY_TYPE']                = 0x8085
    $P0['INDEX_ARRAY_STRIDE']              = 0x8086
    $P0['TEXTURE_COORD_ARRAY_SIZE']        = 0x8088
    $P0['TEXTURE_COORD_ARRAY_TYPE']        = 0x8089
    $P0['TEXTURE_COORD_ARRAY_STRIDE']      = 0x808A
    $P0['EDGE_FLAG_ARRAY_STRIDE']          = 0x808C
    $P0['VERTEX_ARRAY_POINTER']            = 0x808E
    $P0['NORMAL_ARRAY_POINTER']            = 0x808F
    $P0['COLOR_ARRAY_POINTER']             = 0x8090
    $P0['INDEX_ARRAY_POINTER']             = 0x8091
    $P0['TEXTURE_COORD_ARRAY_POINTER']     = 0x8092
    $P0['EDGE_FLAG_ARRAY_POINTER']         = 0x8093
    $P0['V2F']                             = 0x2A20
    $P0['V3F']                             = 0x2A21
    $P0['C4UB_V2F']                        = 0x2A22
    $P0['C4UB_V3F']                        = 0x2A23
    $P0['C3F_V3F']                         = 0x2A24
    $P0['N3F_V3F']                         = 0x2A25
    $P0['C4F_N3F_V3F']                     = 0x2A26
    $P0['T2F_V3F']                         = 0x2A27
    $P0['T4F_V4F']                         = 0x2A28
    $P0['T2F_C4UB_V3F']                    = 0x2A29
    $P0['T2F_C3F_V3F']                     = 0x2A2A
    $P0['T2F_N3F_V3F']                     = 0x2A2B
    $P0['T2F_C4F_N3F_V3F']                 = 0x2A2C
    $P0['T4F_C4F_N3F_V4F']                 = 0x2A2D
    $P0['EXT_vertex_array']                = 1
    $P0['EXT_bgra']                        = 1
    $P0['EXT_paletted_texture']            = 1
    $P0['WIN_swap_hint']                   = 1
    $P0['WIN_draw_range_elements']         = 1
    $P0['VERTEX_ARRAY_EXT']                = 0x8074
    $P0['NORMAL_ARRAY_EXT']                = 0x8075
    $P0['COLOR_ARRAY_EXT']                 = 0x8076
    $P0['INDEX_ARRAY_EXT']                 = 0x8077
    $P0['TEXTURE_COORD_ARRAY_EXT']         = 0x8078
    $P0['EDGE_FLAG_ARRAY_EXT']             = 0x8079
    $P0['VERTEX_ARRAY_SIZE_EXT']           = 0x807A
    $P0['VERTEX_ARRAY_TYPE_EXT']           = 0x807B
    $P0['VERTEX_ARRAY_STRIDE_EXT']         = 0x807C
    $P0['VERTEX_ARRAY_COUNT_EXT']          = 0x807D
    $P0['NORMAL_ARRAY_TYPE_EXT']           = 0x807E
    $P0['NORMAL_ARRAY_STRIDE_EXT']         = 0x807F
    $P0['NORMAL_ARRAY_COUNT_EXT']          = 0x8080
    $P0['COLOR_ARRAY_SIZE_EXT']            = 0x8081
    $P0['COLOR_ARRAY_TYPE_EXT']            = 0x8082
    $P0['COLOR_ARRAY_STRIDE_EXT']          = 0x8083
    $P0['COLOR_ARRAY_COUNT_EXT']           = 0x8084
    $P0['INDEX_ARRAY_TYPE_EXT']            = 0x8085
    $P0['INDEX_ARRAY_STRIDE_EXT']          = 0x8086
    $P0['INDEX_ARRAY_COUNT_EXT']           = 0x8087
    $P0['TEXTURE_COORD_ARRAY_SIZE_EXT']    = 0x8088
    $P0['TEXTURE_COORD_ARRAY_TYPE_EXT']    = 0x8089
    $P0['TEXTURE_COORD_ARRAY_STRIDE_EXT']  = 0x808A
    $P0['TEXTURE_COORD_ARRAY_COUNT_EXT']   = 0x808B
    $P0['EDGE_FLAG_ARRAY_STRIDE_EXT']      = 0x808C
    $P0['EDGE_FLAG_ARRAY_COUNT_EXT']       = 0x808D
    $P0['VERTEX_ARRAY_POINTER_EXT']        = 0x808E
    $P0['NORMAL_ARRAY_POINTER_EXT']        = 0x808F
    $P0['COLOR_ARRAY_POINTER_EXT']         = 0x8090
    $P0['INDEX_ARRAY_POINTER_EXT']         = 0x8091
    $P0['TEXTURE_COORD_ARRAY_POINTER_EXT'] = 0x8092
    $P0['EDGE_FLAG_ARRAY_POINTER_EXT']     = 0x8093
    $P0['BGR_EXT']                         = 0x80E0
    $P0['BGRA_EXT']                        = 0x80E1
    $P0['COLOR_TABLE_FORMAT_EXT']          = 0x80D8
    $P0['COLOR_TABLE_WIDTH_EXT']           = 0x80D9
    $P0['COLOR_TABLE_RED_SIZE_EXT']        = 0x80DA
    $P0['COLOR_TABLE_GREEN_SIZE_EXT']      = 0x80DB
    $P0['COLOR_TABLE_BLUE_SIZE_EXT']       = 0x80DC
    $P0['COLOR_TABLE_ALPHA_SIZE_EXT']      = 0x80DD
    $P0['COLOR_TABLE_LUMINANCE_SIZE_EXT']  = 0x80DE
    $P0['COLOR_TABLE_INTENSITY_SIZE_EXT']  = 0x80DF
    $P0['COLOR_INDEX1_EXT']                = 0x80E2
    $P0['COLOR_INDEX2_EXT']                = 0x80E3
    $P0['COLOR_INDEX4_EXT']                = 0x80E4
    $P0['COLOR_INDEX8_EXT']                = 0x80E5
    $P0['COLOR_INDEX12_EXT']               = 0x80E6
    $P0['COLOR_INDEX16_EXT']               = 0x80E7
    $P0['MAX_ELEMENTS_VERTICES_WIN']       = 0x80E8
    $P0['MAX_ELEMENTS_INDICES_WIN']        = 0x80E9
    $P0['PHONG_WIN']                       = 0x80EA
    $P0['PHONG_HINT_WIN']                  = 0x80EB
    $P0['FOG_SPECULAR_TEXTURE_WIN']        = 0x80EC
    $P0['CURRENT_BIT']                     = 0x00000001
    $P0['POINT_BIT']                       = 0x00000002
    $P0['LINE_BIT']                        = 0x00000004
    $P0['POLYGON_BIT']                     = 0x00000008
    $P0['POLYGON_STIPPLE_BIT']             = 0x00000010
    $P0['PIXEL_MODE_BIT']                  = 0x00000020
    $P0['LIGHTING_BIT']                    = 0x00000040
    $P0['FOG_BIT']                         = 0x00000080
    $P0['DEPTH_BUFFER_BIT']                = 0x00000100
    $P0['ACCUM_BUFFER_BIT']                = 0x00000200
    $P0['STENCIL_BUFFER_BIT']              = 0x00000400
    $P0['VIEWPORT_BIT']                    = 0x00000800
    $P0['TRANSFORM_BIT']                   = 0x00001000
    $P0['ENABLE_BIT']                      = 0x00002000
    $P0['COLOR_BUFFER_BIT']                = 0x00004000
    $P0['HINT_BIT']                        = 0x00008000
    $P0['EVAL_BIT']                        = 0x00010000
    $P0['LIST_BIT']                        = 0x00020000
    $P0['TEXTURE_BIT']                     = 0x00040000
    $P0['SCISSOR_BIT']                     = 0x00080000
    $P0['ALL_ATTRIB_BITS']                 = 0x000fffff
    $P0['CLIENT_PIXEL_STORE_BIT']          = 0x00000001
    $P0['CLIENT_VERTEX_ARRAY_BIT']         = 0x00000002
    $P0['CLIENT_ALL_ATTRIB_BITS']          = 0xffffffff
    .return ($P0)
.end

=back

=head1 AUTHORS

Francois Perrad

=cut


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
