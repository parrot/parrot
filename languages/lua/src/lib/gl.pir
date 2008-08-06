# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

lib/gl.pir - OpenGL library

=head1 DESCRIPTION

This file implements the OpenGL binding for Lua.

See original on L<http://luagl.wikidot.com/>

This implementation is based on a wrapper over OpenGL,
see F<runtime/parrot/library/OpenGL.pir>.

=over 4

=cut

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua'; 'gl' ]

.sub '__onload' :anon :load
#    print "__onload gl\n"
    .const .Sub entry = 'luaopen_gl'
    set_hll_global 'luaopen_gl', entry
.end

.sub 'luaopen_gl'
#    print "luaopen_gl\n"
    load_bytecode 'OpenGL.pir'

    # Import all OpenGL/GLU/GLUT functions
    $P0 = get_hll_global ['OpenGL'], '_export_all_functions'
    $P0()

    .local pmc _lua__GLOBAL
    _lua__GLOBAL = get_hll_global '_G'

    new $P1, 'LuaString'

    .local pmc _gl
    new _gl, 'LuaTable'
    set $P1, 'gl'
    _lua__GLOBAL[$P1] = _gl

    lua_register($P1, _gl)

    .const .Sub _gl_Accum= 'Accum'
    _gl_Accum.'setfenv'(_lua__GLOBAL)
    set $P1, 'Accum'
    _gl[$P1] = _gl_Accum

    .const .Sub _gl_AlphaFunc= 'AlphaFunc'
    _gl_AlphaFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'AlphaFunc'
    _gl[$P1] = _gl_AlphaFunc

    .const .Sub _gl_AreTexturesResident= 'AreTexturesResident'
    _gl_AreTexturesResident.'setfenv'(_lua__GLOBAL)
    set $P1, 'AreTexturesResident'
    _gl[$P1] = _gl_AreTexturesResident

    .const .Sub _gl_ArrayElement= 'ArrayElement'
    _gl_ArrayElement.'setfenv'(_lua__GLOBAL)
    set $P1, 'ArrayElement'
    _gl[$P1] = _gl_ArrayElement

    .const .Sub _gl_Begin= 'Begin'
    _gl_Begin.'setfenv'(_lua__GLOBAL)
    set $P1, 'Begin'
    _gl[$P1] = _gl_Begin

    .const .Sub _gl_BindTexture= 'BindTexture'
    _gl_BindTexture.'setfenv'(_lua__GLOBAL)
    set $P1, 'BindTexture'
    _gl[$P1] = _gl_BindTexture

    .const .Sub _gl_Bitmap= 'Bitmap'
    _gl_Bitmap.'setfenv'(_lua__GLOBAL)
    set $P1, 'Bitmap'
    _gl[$P1] = _gl_Bitmap

    .const .Sub _gl_BlendFunc= 'BlendFunc'
    _gl_BlendFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'BlendFunc'
    _gl[$P1] = _gl_BlendFunc

    .const .Sub _gl_CallList= 'CallList'
    _gl_CallList.'setfenv'(_lua__GLOBAL)
    set $P1, 'CallList'
    _gl[$P1] = _gl_CallList

    .const .Sub _gl_CallLists= 'CallLists'
    _gl_CallLists.'setfenv'(_lua__GLOBAL)
    set $P1, 'CallLists'
    _gl[$P1] = _gl_CallLists

    .const .Sub _gl_Clear= 'Clear'
    _gl_Clear.'setfenv'(_lua__GLOBAL)
    set $P1, 'Clear'
    _gl[$P1] = _gl_Clear

    .const .Sub _gl_ClearAccum= 'ClearAccum'
    _gl_ClearAccum.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClearAccum'
    _gl[$P1] = _gl_ClearAccum

    .const .Sub _gl_ClearColor= 'ClearColor'
    _gl_ClearColor.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClearColor'
    _gl[$P1] = _gl_ClearColor

    .const .Sub _gl_ClearDepth= 'ClearDepth'
    _gl_ClearDepth.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClearDepth'
    _gl[$P1] = _gl_ClearDepth

    .const .Sub _gl_ClearIndex= 'ClearIndex'
    _gl_ClearIndex.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClearIndex'
    _gl[$P1] = _gl_ClearIndex

    .const .Sub _gl_ClearStencil= 'ClearStencil'
    _gl_ClearStencil.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClearStencil'
    _gl[$P1] = _gl_ClearStencil

    .const .Sub _gl_ClipPlane= 'ClipPlane'
    _gl_ClipPlane.'setfenv'(_lua__GLOBAL)
    set $P1, 'ClipPlane'
    _gl[$P1] = _gl_ClipPlane

    .const .Sub _gl_Color= 'Color'
    _gl_Color.'setfenv'(_lua__GLOBAL)
    set $P1, 'Color'
    _gl[$P1] = _gl_Color

    .const .Sub _gl_ColorMask= 'ColorMask'
    _gl_ColorMask.'setfenv'(_lua__GLOBAL)
    set $P1, 'ColorMask'
    _gl[$P1] = _gl_ColorMask

    .const .Sub _gl_ColorMaterial= 'ColorMaterial'
    _gl_ColorMaterial.'setfenv'(_lua__GLOBAL)
    set $P1, 'ColorMaterial'
    _gl[$P1] = _gl_ColorMaterial

    .const .Sub _gl_ColorPointer= 'ColorPointer'
    _gl_ColorPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'ColorPointer'
    _gl[$P1] = _gl_ColorPointer

    .const .Sub _gl_CopyPixels= 'CopyPixels'
    _gl_CopyPixels.'setfenv'(_lua__GLOBAL)
    set $P1, 'CopyPixels'
    _gl[$P1] = _gl_CopyPixels

    .const .Sub _gl_CopyTexImage= 'CopyTexImage'
    _gl_CopyTexImage.'setfenv'(_lua__GLOBAL)
    set $P1, 'CopyTexImage'
    _gl[$P1] = _gl_CopyTexImage

    .const .Sub _gl_CopyTexSubImage= 'CopyTexSubImage'
    _gl_CopyTexSubImage.'setfenv'(_lua__GLOBAL)
    set $P1, 'CopyTexSubImage'
    _gl[$P1] = _gl_CopyTexSubImage

    .const .Sub _gl_CullFace= 'CullFace'
    _gl_CullFace.'setfenv'(_lua__GLOBAL)
    set $P1, 'CullFace'
    _gl[$P1] = _gl_CullFace

    .const .Sub _gl_DeleteLists= 'DeleteLists'
    _gl_DeleteLists.'setfenv'(_lua__GLOBAL)
    set $P1, 'DeleteLists'
    _gl[$P1] = _gl_DeleteLists

    .const .Sub _gl_DeleteTextures= 'DeleteTextures'
    _gl_DeleteTextures.'setfenv'(_lua__GLOBAL)
    set $P1, 'DeleteTextures'
    _gl[$P1] = _gl_DeleteTextures

    .const .Sub _gl_DepthFunc= 'DepthFunc'
    _gl_DepthFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'DepthFunc'
    _gl[$P1] = _gl_DepthFunc

    .const .Sub _gl_DepthMask= 'DepthMask'
    _gl_DepthMask.'setfenv'(_lua__GLOBAL)
    set $P1, 'DepthMask'
    _gl[$P1] = _gl_DepthMask

    .const .Sub _gl_DepthRange= 'DepthRange'
    _gl_DepthRange.'setfenv'(_lua__GLOBAL)
    set $P1, 'DepthRange'
    _gl[$P1] = _gl_DepthRange

    .const .Sub _gl_Disable= 'Disable'
    _gl_Disable.'setfenv'(_lua__GLOBAL)
    set $P1, 'Disable'
    _gl[$P1] = _gl_Disable

    .const .Sub _gl_DisableClientState= 'DisableClientState'
    _gl_DisableClientState.'setfenv'(_lua__GLOBAL)
    set $P1, 'DisableClientState'
    _gl[$P1] = _gl_DisableClientState

    .const .Sub _gl_DrawArrays= 'DrawArrays'
    _gl_DrawArrays.'setfenv'(_lua__GLOBAL)
    set $P1, 'DrawArrays'
    _gl[$P1] = _gl_DrawArrays

    .const .Sub _gl_DrawBuffer= 'DrawBuffer'
    _gl_DrawBuffer.'setfenv'(_lua__GLOBAL)
    set $P1, 'DrawBuffer'
    _gl[$P1] = _gl_DrawBuffer

    .const .Sub _gl_DrawElements= 'DrawElements'
    _gl_DrawElements.'setfenv'(_lua__GLOBAL)
    set $P1, 'DrawElements'
    _gl[$P1] = _gl_DrawElements

    .const .Sub _gl_DrawPixels= 'DrawPixels'
    _gl_DrawPixels.'setfenv'(_lua__GLOBAL)
    set $P1, 'DrawPixels'
    _gl[$P1] = _gl_DrawPixels

    .const .Sub _gl_EdgeFlag= 'EdgeFlag'
    _gl_EdgeFlag.'setfenv'(_lua__GLOBAL)
    set $P1, 'EdgeFlag'
    _gl[$P1] = _gl_EdgeFlag

    .const .Sub _gl_EdgeFlagPointer= 'EdgeFlagPointer'
    _gl_EdgeFlagPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'EdgeFlagPointer'
    _gl[$P1] = _gl_EdgeFlagPointer

    .const .Sub _gl_Enable= 'Enable'
    _gl_Enable.'setfenv'(_lua__GLOBAL)
    set $P1, 'Enable'
    _gl[$P1] = _gl_Enable

    .const .Sub _gl_EnableClientState= 'EnableClientState'
    _gl_EnableClientState.'setfenv'(_lua__GLOBAL)
    set $P1, 'EnableClientState'
    _gl[$P1] = _gl_EnableClientState

    .const .Sub _gl_End= 'End'
    _gl_End.'setfenv'(_lua__GLOBAL)
    set $P1, 'End'
    _gl[$P1] = _gl_End

    .const .Sub _gl_EndList= 'EndList'
    _gl_EndList.'setfenv'(_lua__GLOBAL)
    set $P1, 'EndList'
    _gl[$P1] = _gl_EndList

    .const .Sub _gl_EvalCoord= 'EvalCoord'
    _gl_EvalCoord.'setfenv'(_lua__GLOBAL)
    set $P1, 'EvalCoord'
    _gl[$P1] = _gl_EvalCoord

    .const .Sub _gl_EvalMesh= 'EvalMesh'
    _gl_EvalMesh.'setfenv'(_lua__GLOBAL)
    set $P1, 'EvalMesh'
    _gl[$P1] = _gl_EvalMesh

    .const .Sub _gl_EvalPoint= 'EvalPoint'
    _gl_EvalPoint.'setfenv'(_lua__GLOBAL)
    set $P1, 'EvalPoint'
    _gl[$P1] = _gl_EvalPoint

    .const .Sub _gl_FeedbackBuffer= 'FeedbackBuffer'
    _gl_FeedbackBuffer.'setfenv'(_lua__GLOBAL)
    set $P1, 'FeedbackBuffer'
    _gl[$P1] = _gl_FeedbackBuffer

    .const .Sub _gl_Finish= 'Finish'
    _gl_Finish.'setfenv'(_lua__GLOBAL)
    set $P1, 'Finish'
    _gl[$P1] = _gl_Finish

    .const .Sub _gl_Flush= 'Flush'
    _gl_Flush.'setfenv'(_lua__GLOBAL)
    set $P1, 'Flush'
    _gl[$P1] = _gl_Flush

    .const .Sub _gl_Fog= 'Fog'
    _gl_Fog.'setfenv'(_lua__GLOBAL)
    set $P1, 'Fog'
    _gl[$P1] = _gl_Fog

    .const .Sub _gl_FrontFace= 'FrontFace'
    _gl_FrontFace.'setfenv'(_lua__GLOBAL)
    set $P1, 'FrontFace'
    _gl[$P1] = _gl_FrontFace

    .const .Sub _gl_Frustum= 'Frustum'
    _gl_Frustum.'setfenv'(_lua__GLOBAL)
    set $P1, 'Frustum'
    _gl[$P1] = _gl_Frustum

    .const .Sub _gl_GenLists= 'GenLists'
    _gl_GenLists.'setfenv'(_lua__GLOBAL)
    set $P1, 'GenLists'
    _gl[$P1] = _gl_GenLists

    .const .Sub _gl_GenTextures= 'GenTextures'
    _gl_GenTextures.'setfenv'(_lua__GLOBAL)
    set $P1, 'GenTextures'
    _gl[$P1] = _gl_GenTextures

    .const .Sub _gl_Get= 'Get'
    _gl_Get.'setfenv'(_lua__GLOBAL)
    set $P1, 'Get'
    _gl[$P1] = _gl_Get

    .const .Sub _gl_GetArray= 'GetArray'
    _gl_GetArray.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetArray'
    _gl[$P1] = _gl_GetArray

    .const .Sub _gl_GetConst= 'GetConst'
    _gl_GetConst.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetConst'
    _gl[$P1] = _gl_GetConst

    .const .Sub _gl_GetClipPlane= 'GetClipPlane'
    _gl_GetClipPlane.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetClipPlane'
    _gl[$P1] = _gl_GetClipPlane

    .const .Sub _gl_GetError= 'GetError'
    _gl_GetError.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetError'
    _gl[$P1] = _gl_GetError

    .const .Sub _gl_GetLight= 'GetLight'
    _gl_GetLight.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetLight'
    _gl[$P1] = _gl_GetLight

    .const .Sub _gl_GetMap= 'GetMap'
    _gl_GetMap.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetMap'
    _gl[$P1] = _gl_GetMap

    .const .Sub _gl_GetMaterial= 'GetMaterial'
    _gl_GetMaterial.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetMaterial'
    _gl[$P1] = _gl_GetMaterial

    .const .Sub _gl_GetPixelMap= 'GetPixelMap'
    _gl_GetPixelMap.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetPixelMap'
    _gl[$P1] = _gl_GetPixelMap

    .const .Sub _gl_GetPointer= 'GetPointer'
    _gl_GetPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetPointer'
    _gl[$P1] = _gl_GetPointer

    .const .Sub _gl_GetPolygonStipple= 'GetPolygonStipple'
    _gl_GetPolygonStipple.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetPolygonStipple'
    _gl[$P1] = _gl_GetPolygonStipple

    .const .Sub _gl_GetString= 'GetString'
    _gl_GetString.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetString'
    _gl[$P1] = _gl_GetString

    .const .Sub _gl_GetTexEnv= 'GetTexEnv'
    _gl_GetTexEnv.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetTexEnv'
    _gl[$P1] = _gl_GetTexEnv

    .const .Sub _gl_GetTexGen= 'GetTexGen'
    _gl_GetTexGen.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetTexGen'
    _gl[$P1] = _gl_GetTexGen

    .const .Sub _gl_GetTexImage= 'GetTexImage'
    _gl_GetTexImage.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetTexImage'
    _gl[$P1] = _gl_GetTexImage

    .const .Sub _gl_GetTexLevelParameter= 'GetTexLevelParameter'
    _gl_GetTexLevelParameter.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetTexLevelParameter'
    _gl[$P1] = _gl_GetTexLevelParameter

    .const .Sub _gl_GetTexParameter= 'GetTexParameter'
    _gl_GetTexParameter.'setfenv'(_lua__GLOBAL)
    set $P1, 'GetTexParameter'
    _gl[$P1] = _gl_GetTexParameter

    .const .Sub _gl_Hint= 'Hint'
    _gl_Hint.'setfenv'(_lua__GLOBAL)
    set $P1, 'Hint'
    _gl[$P1] = _gl_Hint

    .const .Sub _gl_Index= 'Index'
    _gl_Index.'setfenv'(_lua__GLOBAL)
    set $P1, 'Index'
    _gl[$P1] = _gl_Index

    .const .Sub _gl_IndexMask= 'IndexMask'
    _gl_IndexMask.'setfenv'(_lua__GLOBAL)
    set $P1, 'IndexMask'
    _gl[$P1] = _gl_IndexMask

    .const .Sub _gl_IndexPointer= 'IndexPointer'
    _gl_IndexPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'IndexPointer'
    _gl[$P1] = _gl_IndexPointer

    .const .Sub _gl_InitNames= 'InitNames'
    _gl_InitNames.'setfenv'(_lua__GLOBAL)
    set $P1, 'InitNames'
    _gl[$P1] = _gl_InitNames

    .const .Sub _gl_IsEnabled= 'IsEnabled'
    _gl_IsEnabled.'setfenv'(_lua__GLOBAL)
    set $P1, 'IsEnabled'
    _gl[$P1] = _gl_IsEnabled

    .const .Sub _gl_IsList= 'IsList'
    _gl_IsList.'setfenv'(_lua__GLOBAL)
    set $P1, 'IsList'
    _gl[$P1] = _gl_IsList

    .const .Sub _gl_IsTexture= 'IsTexture'
    _gl_IsTexture.'setfenv'(_lua__GLOBAL)
    set $P1, 'IsTexture'
    _gl[$P1] = _gl_IsTexture

    .const .Sub _gl_Light= 'Light'
    _gl_Light.'setfenv'(_lua__GLOBAL)
    set $P1, 'Light'
    _gl[$P1] = _gl_Light

    .const .Sub _gl_LightModel= 'LightModel'
    _gl_LightModel.'setfenv'(_lua__GLOBAL)
    set $P1, 'LightModel'
    _gl[$P1] = _gl_LightModel

    .const .Sub _gl_LineStipple= 'LineStipple'
    _gl_LineStipple.'setfenv'(_lua__GLOBAL)
    set $P1, 'LineStipple'
    _gl[$P1] = _gl_LineStipple

    .const .Sub _gl_LineWidth= 'LineWidth'
    _gl_LineWidth.'setfenv'(_lua__GLOBAL)
    set $P1, 'LineWidth'
    _gl[$P1] = _gl_LineWidth

    .const .Sub _gl_ListBase= 'ListBase'
    _gl_ListBase.'setfenv'(_lua__GLOBAL)
    set $P1, 'ListBase'
    _gl[$P1] = _gl_ListBase

    .const .Sub _gl_LoadIdentity= 'LoadIdentity'
    _gl_LoadIdentity.'setfenv'(_lua__GLOBAL)
    set $P1, 'LoadIdentity'
    _gl[$P1] = _gl_LoadIdentity

    .const .Sub _gl_LoadMatrix= 'LoadMatrix'
    _gl_LoadMatrix.'setfenv'(_lua__GLOBAL)
    set $P1, 'LoadMatrix'
    _gl[$P1] = _gl_LoadMatrix

    .const .Sub _gl_LoadName= 'LoadName'
    _gl_LoadName.'setfenv'(_lua__GLOBAL)
    set $P1, 'LoadName'
    _gl[$P1] = _gl_LoadName

    .const .Sub _gl_LogicOp= 'LogicOp'
    _gl_LogicOp.'setfenv'(_lua__GLOBAL)
    set $P1, 'LogicOp'
    _gl[$P1] = _gl_LogicOp

    .const .Sub _gl_Map= 'Map'
    _gl_Map.'setfenv'(_lua__GLOBAL)
    set $P1, 'Map'
    _gl[$P1] = _gl_Map

    .const .Sub _gl_MapGrid= 'MapGrid'
    _gl_MapGrid.'setfenv'(_lua__GLOBAL)
    set $P1, 'MapGrid'
    _gl[$P1] = _gl_MapGrid

    .const .Sub _gl_Material= 'Material'
    _gl_Material.'setfenv'(_lua__GLOBAL)
    set $P1, 'Material'
    _gl[$P1] = _gl_Material

    .const .Sub _gl_MatrixMode= 'MatrixMode'
    _gl_MatrixMode.'setfenv'(_lua__GLOBAL)
    set $P1, 'MatrixMode'
    _gl[$P1] = _gl_MatrixMode

    .const .Sub _gl_MultMatrix= 'MultMatrix'
    _gl_MultMatrix.'setfenv'(_lua__GLOBAL)
    set $P1, 'MultMatrix'
    _gl[$P1] = _gl_MultMatrix

    .const .Sub _gl_NewList= 'NewList'
    _gl_NewList.'setfenv'(_lua__GLOBAL)
    set $P1, 'NewList'
    _gl[$P1] = _gl_NewList

    .const .Sub _gl_Normal= 'Normal'
    _gl_Normal.'setfenv'(_lua__GLOBAL)
    set $P1, 'Normal'
    _gl[$P1] = _gl_Normal

    .const .Sub _gl_NormalPointer= 'NormalPointer'
    _gl_NormalPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'NormalPointer'
    _gl[$P1] = _gl_NormalPointer

    .const .Sub _gl_Ortho= 'Ortho'
    _gl_Ortho.'setfenv'(_lua__GLOBAL)
    set $P1, 'Ortho'
    _gl[$P1] = _gl_Ortho

    .const .Sub _gl_PassThrough= 'PassThrough'
    _gl_PassThrough.'setfenv'(_lua__GLOBAL)
    set $P1, 'PassThrough'
    _gl[$P1] = _gl_PassThrough

    .const .Sub _gl_PixelMap= 'PixelMap'
    _gl_PixelMap.'setfenv'(_lua__GLOBAL)
    set $P1, 'PixelMap'
    _gl[$P1] = _gl_PixelMap

    .const .Sub _gl_PixelStore= 'PixelStore'
    _gl_PixelStore.'setfenv'(_lua__GLOBAL)
    set $P1, 'PixelStore'
    _gl[$P1] = _gl_PixelStore

    .const .Sub _gl_PixelTransfer= 'PixelTransfer'
    _gl_PixelTransfer.'setfenv'(_lua__GLOBAL)
    set $P1, 'PixelTransfer'
    _gl[$P1] = _gl_PixelTransfer

    .const .Sub _gl_PixelZoom= 'PixelZoom'
    _gl_PixelZoom.'setfenv'(_lua__GLOBAL)
    set $P1, 'PixelZoom'
    _gl[$P1] = _gl_PixelZoom

    .const .Sub _gl_PointSize= 'PointSize'
    _gl_PointSize.'setfenv'(_lua__GLOBAL)
    set $P1, 'PointSize'
    _gl[$P1] = _gl_PointSize

    .const .Sub _gl_PolygonMode= 'PolygonMode'
    _gl_PolygonMode.'setfenv'(_lua__GLOBAL)
    set $P1, 'PolygonMode'
    _gl[$P1] = _gl_PolygonMode

    .const .Sub _gl_PolygonOffset= 'PolygonOffset'
    _gl_PolygonOffset.'setfenv'(_lua__GLOBAL)
    set $P1, 'PolygonOffset'
    _gl[$P1] = _gl_PolygonOffset

    .const .Sub _gl_PolygonStipple= 'PolygonStipple'
    _gl_PolygonStipple.'setfenv'(_lua__GLOBAL)
    set $P1, 'PolygonStipple'
    _gl[$P1] = _gl_PolygonStipple

    .const .Sub _gl_PopAttrib= 'PopAttrib'
    _gl_PopAttrib.'setfenv'(_lua__GLOBAL)
    set $P1, 'PopAttrib'
    _gl[$P1] = _gl_PopAttrib

    .const .Sub _gl_PopClientAttrib= 'PopClientAttrib'
    _gl_PopClientAttrib.'setfenv'(_lua__GLOBAL)
    set $P1, 'PopClientAttrib'
    _gl[$P1] = _gl_PopClientAttrib

    .const .Sub _gl_PopMatrix= 'PopMatrix'
    _gl_PopMatrix.'setfenv'(_lua__GLOBAL)
    set $P1, 'PopMatrix'
    _gl[$P1] = _gl_PopMatrix

    .const .Sub _gl_PopName= 'PopName'
    _gl_PopName.'setfenv'(_lua__GLOBAL)
    set $P1, 'PopName'
    _gl[$P1] = _gl_PopName

    .const .Sub _gl_PrioritizeTextures= 'PrioritizeTextures'
    _gl_PrioritizeTextures.'setfenv'(_lua__GLOBAL)
    set $P1, 'PrioritizeTextures'
    _gl[$P1] = _gl_PrioritizeTextures

    .const .Sub _gl_PushAttrib= 'PushAttrib'
    _gl_PushAttrib.'setfenv'(_lua__GLOBAL)
    set $P1, 'PushAttrib'
    _gl[$P1] = _gl_PushAttrib

    .const .Sub _gl_PushClientAttrib= 'PushClientAttrib'
    _gl_PushClientAttrib.'setfenv'(_lua__GLOBAL)
    set $P1, 'PushClientAttrib'
    _gl[$P1] = _gl_PushClientAttrib

    .const .Sub _gl_PushMatrix= 'PushMatrix'
    _gl_PushMatrix.'setfenv'(_lua__GLOBAL)
    set $P1, 'PushMatrix'
    _gl[$P1] = _gl_PushMatrix

    .const .Sub _gl_PushName= 'PushName'
    _gl_PushName.'setfenv'(_lua__GLOBAL)
    set $P1, 'PushName'
    _gl[$P1] = _gl_PushName

    .const .Sub _gl_RasterPos= 'RasterPos'
    _gl_RasterPos.'setfenv'(_lua__GLOBAL)
    set $P1, 'RasterPos'
    _gl[$P1] = _gl_RasterPos

    .const .Sub _gl_ReadBuffer= 'ReadBuffer'
    _gl_ReadBuffer.'setfenv'(_lua__GLOBAL)
    set $P1, 'ReadBuffer'
    _gl[$P1] = _gl_ReadBuffer

    .const .Sub _gl_ReadPixels= 'ReadPixels'
    _gl_ReadPixels.'setfenv'(_lua__GLOBAL)
    set $P1, 'ReadPixels'
    _gl[$P1] = _gl_ReadPixels

    .const .Sub _gl_Rect= 'Rect'
    _gl_Rect.'setfenv'(_lua__GLOBAL)
    set $P1, 'Rect'
    _gl[$P1] = _gl_Rect

    .const .Sub _gl_RenderMode= 'RenderMode'
    _gl_RenderMode.'setfenv'(_lua__GLOBAL)
    set $P1, 'RenderMode'
    _gl[$P1] = _gl_RenderMode

    .const .Sub _gl_Rotate= 'Rotate'
    _gl_Rotate.'setfenv'(_lua__GLOBAL)
    set $P1, 'Rotate'
    _gl[$P1] = _gl_Rotate

    .const .Sub _gl_Scale= 'Scale'
    _gl_Scale.'setfenv'(_lua__GLOBAL)
    set $P1, 'Scale'
    _gl[$P1] = _gl_Scale

    .const .Sub _gl_Scissor= 'Scissor'
    _gl_Scissor.'setfenv'(_lua__GLOBAL)
    set $P1, 'Scissor'
    _gl[$P1] = _gl_Scissor

    .const .Sub _gl_SelectBuffer= 'SelectBuffer'
    _gl_SelectBuffer.'setfenv'(_lua__GLOBAL)
    set $P1, 'SelectBuffer'
    _gl[$P1] = _gl_SelectBuffer

    .const .Sub _gl_ShadeModel= 'ShadeModel'
    _gl_ShadeModel.'setfenv'(_lua__GLOBAL)
    set $P1, 'ShadeModel'
    _gl[$P1] = _gl_ShadeModel

    .const .Sub _gl_StencilFunc= 'StencilFunc'
    _gl_StencilFunc.'setfenv'(_lua__GLOBAL)
    set $P1, 'StencilFunc'
    _gl[$P1] = _gl_StencilFunc

    .const .Sub _gl_StencilMask= 'StencilMask'
    _gl_StencilMask.'setfenv'(_lua__GLOBAL)
    set $P1, 'StencilMask'
    _gl[$P1] = _gl_StencilMask

    .const .Sub _gl_StencilOp= 'StencilOp'
    _gl_StencilOp.'setfenv'(_lua__GLOBAL)
    set $P1, 'StencilOp'
    _gl[$P1] = _gl_StencilOp

    .const .Sub _gl_TexCoord= 'TexCoord'
    _gl_TexCoord.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexCoord'
    _gl[$P1] = _gl_TexCoord

    .const .Sub _gl_TexCoordPointer= 'TexCoordPointer'
    _gl_TexCoordPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexCoordPointer'
    _gl[$P1] = _gl_TexCoordPointer

    .const .Sub _gl_TexEnv= 'TexEnv'
    _gl_TexEnv.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexEnv'
    _gl[$P1] = _gl_TexEnv

    .const .Sub _gl_TexGen= 'TexGen'
    _gl_TexGen.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexGen'
    _gl[$P1] = _gl_TexGen

    .const .Sub _gl_TexImage= 'TexImage'
    _gl_TexImage.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexImage'
    _gl[$P1] = _gl_TexImage

    .const .Sub _gl_TexSubImage= 'TexSubImage'
    _gl_TexSubImage.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexSubImage'
    _gl[$P1] = _gl_TexSubImage

    .const .Sub _gl_TexParameter= 'TexParameter'
    _gl_TexParameter.'setfenv'(_lua__GLOBAL)
    set $P1, 'TexParameter'
    _gl[$P1] = _gl_TexParameter

    .const .Sub _gl_Translate= 'Translate'
    _gl_Translate.'setfenv'(_lua__GLOBAL)
    set $P1, 'Translate'
    _gl[$P1] = _gl_Translate

    .const .Sub _gl_Vertex= 'Vertex'
    _gl_Vertex.'setfenv'(_lua__GLOBAL)
    set $P1, 'Vertex'
    _gl[$P1] = _gl_Vertex

    .const .Sub _gl_VertexPointer= 'VertexPointer'
    _gl_VertexPointer.'setfenv'(_lua__GLOBAL)
    set $P1, 'VertexPointer'
    _gl[$P1] = _gl_VertexPointer

    .const .Sub _gl_Viewport= 'Viewport'
    _gl_Viewport.'setfenv'(_lua__GLOBAL)
    set $P1, 'Viewport'
    _gl[$P1] = _gl_Viewport

    $P0 = _gl_str()
    set_hll_global ['Lua::gl'], 'gl_str', $P0

    .return (_gl)
.end

.sub '_gl_str' :anon
    new $P0, 'Hash'
    $P0["VERSION_1_1"]                     = 1
    $P0["ACCUM"]                           = 0x0100
    $P0["LOAD"]                            = 0x0101
    $P0["RETURN"]                          = 0x0102
    $P0["MULT"]                            = 0x0103
    $P0["ADD"]                             = 0x0104
    $P0["NEVER"]                           = 0x0200
    $P0["LESS"]                            = 0x0201
    $P0["EQUAL"]                           = 0x0202
    $P0["LEQUAL"]                          = 0x0203
    $P0["GREATER"]                         = 0x0204
    $P0["NOTEQUAL"]                        = 0x0205
    $P0["GEQUAL"]                          = 0x0206
    $P0["ALWAYS"]                          = 0x0207
    $P0["POINTS"]                          = 0x0000
    $P0["LINES"]                           = 0x0001
    $P0["LINE_LOOP"]                       = 0x0002
    $P0["LINE_STRIP"]                      = 0x0003
    $P0["TRIANGLES"]                       = 0x0004
    $P0["TRIANGLE_STRIP"]                  = 0x0005
    $P0["TRIANGLE_FAN"]                    = 0x0006
    $P0["QUADS"]                           = 0x0007
    $P0["QUAD_STRIP"]                      = 0x0008
    $P0["POLYGON"]                         = 0x0009
    $P0["ZERO"]                            = 0
    $P0["ONE"]                             = 1
    $P0["SRC_COLOR"]                       = 0x0300
    $P0["ONE_MINUS_SRC_COLOR"]             = 0x0301
    $P0["SRC_ALPHA"]                       = 0x0302
    $P0["ONE_MINUS_SRC_ALPHA"]             = 0x0303
    $P0["DST_ALPHA"]                       = 0x0304
    $P0["ONE_MINUS_DST_ALPHA"]             = 0x0305
    $P0["DST_COLOR"]                       = 0x0306
    $P0["ONE_MINUS_DST_COLOR"]             = 0x0307
    $P0["SRC_ALPHA_SATURATE"]              = 0x0308
    $P0["TRUE"]                            = 1
    $P0["FALSE"]                           = 0
    $P0["CLIP_PLANE0"]                     = 0x3000
    $P0["CLIP_PLANE1"]                     = 0x3001
    $P0["CLIP_PLANE2"]                     = 0x3002
    $P0["CLIP_PLANE3"]                     = 0x3003
    $P0["CLIP_PLANE4"]                     = 0x3004
    $P0["CLIP_PLANE5"]                     = 0x3005
    $P0["BYTE"]                            = 0x1400
    $P0["UNSIGNED_BYTE"]                   = 0x1401
    $P0["SHORT"]                           = 0x1402
    $P0["UNSIGNED_SHORT"]                  = 0x1403
    $P0["INT"]                             = 0x1404
    $P0["UNSIGNED_INT"]                    = 0x1405
    $P0["FLOAT"]                           = 0x1406
    $P0["2_BYTES"]                         = 0x1407
    $P0["3_BYTES"]                         = 0x1408
    $P0["4_BYTES"]                         = 0x1409
    $P0["DOUBLE"]                          = 0x140A
    $P0["NONE"]                            = 0
    $P0["FRONT_LEFT"]                      = 0x0400
    $P0["FRONT_RIGHT"]                     = 0x0401
    $P0["BACK_LEFT"]                       = 0x0402
    $P0["BACK_RIGHT"]                      = 0x0403
    $P0["FRONT"]                           = 0x0404
    $P0["BACK"]                            = 0x0405
    $P0["LEFT"]                            = 0x0406
    $P0["RIGHT"]                           = 0x0407
    $P0["FRONT_AND_BACK"]                  = 0x0408
    $P0["AUX0"]                            = 0x0409
    $P0["AUX1"]                            = 0x040A
    $P0["AUX2"]                            = 0x040B
    $P0["AUX3"]                            = 0x040C
    $P0["NO_ERROR"]                        = 0
    $P0["INVALID_ENUM"]                    = 0x0500
    $P0["INVALID_VALUE"]                   = 0x0501
    $P0["INVALID_OPERATION"]               = 0x0502
    $P0["STACK_OVERFLOW"]                  = 0x0503
    $P0["STACK_UNDERFLOW"]                 = 0x0504
    $P0["OUT_OF_MEMORY"]                   = 0x0505
    $P0["2D"]                              = 0x0600
    $P0["3D"]                              = 0x0601
    $P0["3D_COLOR"]                        = 0x0602
    $P0["3D_COLOR_TEXTURE"]                = 0x0603
    $P0["4D_COLOR_TEXTURE"]                = 0x0604
    $P0["PASS_THROUGH_TOKEN"]              = 0x0700
    $P0["POINT_TOKEN"]                     = 0x0701
    $P0["LINE_TOKEN"]                      = 0x0702
    $P0["POLYGON_TOKEN"]                   = 0x0703
    $P0["BITMAP_TOKEN"]                    = 0x0704
    $P0["DRAW_PIXEL_TOKEN"]                = 0x0705
    $P0["COPY_PIXEL_TOKEN"]                = 0x0706
    $P0["LINE_RESET_TOKEN"]                = 0x0707
    $P0["EXP"]                             = 0x0800
    $P0["EXP2"]                            = 0x0801
    $P0["CW"]                              = 0x0900
    $P0["CCW"]                             = 0x0901
    $P0["COEFF"]                           = 0x0A00
    $P0["ORDER"]                           = 0x0A01
    $P0["DOMAIN"]                          = 0x0A02
    $P0["CURRENT_COLOR"]                   = 0x0B00
    $P0["CURRENT_INDEX"]                   = 0x0B01
    $P0["CURRENT_NORMAL"]                  = 0x0B02
    $P0["CURRENT_TEXTURE_COORDS"]          = 0x0B03
    $P0["CURRENT_RASTER_COLOR"]            = 0x0B04
    $P0["CURRENT_RASTER_INDEX"]            = 0x0B05
    $P0["CURRENT_RASTER_TEXTURE_COORDS"]   = 0x0B06
    $P0["CURRENT_RASTER_POSITION"]         = 0x0B07
    $P0["CURRENT_RASTER_POSITION_VALID"]   = 0x0B08
    $P0["CURRENT_RASTER_DISTANCE"]         = 0x0B09
    $P0["POINT_SMOOTH"]                    = 0x0B10
    $P0["POINT_SIZE"]                      = 0x0B11
    $P0["POINT_SIZE_RANGE"]                = 0x0B12
    $P0["POINT_SIZE_GRANULARITY"]          = 0x0B13
    $P0["LINE_SMOOTH"]                     = 0x0B20
    $P0["LINE_WIDTH"]                      = 0x0B21
    $P0["LINE_WIDTH_RANGE"]                = 0x0B22
    $P0["LINE_WIDTH_GRANULARITY"]          = 0x0B23
    $P0["LINE_STIPPLE"]                    = 0x0B24
    $P0["LINE_STIPPLE_PATTERN"]            = 0x0B25
    $P0["LINE_STIPPLE_REPEAT"]             = 0x0B26
    $P0["LIST_MODE"]                       = 0x0B30
    $P0["MAX_LIST_NESTING"]                = 0x0B31
    $P0["LIST_BASE"]                       = 0x0B32
    $P0["LIST_INDEX"]                      = 0x0B33
    $P0["POLYGON_MODE"]                    = 0x0B40
    $P0["POLYGON_SMOOTH"]                  = 0x0B41
    $P0["POLYGON_STIPPLE"]                 = 0x0B42
    $P0["EDGE_FLAG"]                       = 0x0B43
    $P0["CULL_FACE"]                       = 0x0B44
    $P0["CULL_FACE_MODE"]                  = 0x0B45
    $P0["FRONT_FACE"]                      = 0x0B46
    $P0["LIGHTING"]                        = 0x0B50
    $P0["LIGHT_MODEL_LOCAL_VIEWER"]        = 0x0B51
    $P0["LIGHT_MODEL_TWO_SIDE"]            = 0x0B52
    $P0["LIGHT_MODEL_AMBIENT"]             = 0x0B53
    $P0["SHADE_MODEL"]                     = 0x0B54
    $P0["COLOR_MATERIAL_FACE"]             = 0x0B55
    $P0["COLOR_MATERIAL_PARAMETER"]        = 0x0B56
    $P0["COLOR_MATERIAL"]                  = 0x0B57
    $P0["FOG"]                             = 0x0B60
    $P0["FOG_INDEX"]                       = 0x0B61
    $P0["FOG_DENSITY"]                     = 0x0B62
    $P0["FOG_START"]                       = 0x0B63
    $P0["FOG_END"]                         = 0x0B64
    $P0["FOG_MODE"]                        = 0x0B65
    $P0["FOG_COLOR"]                       = 0x0B66
    $P0["DEPTH_RANGE"]                     = 0x0B70
    $P0["DEPTH_TEST"]                      = 0x0B71
    $P0["DEPTH_WRITEMASK"]                 = 0x0B72
    $P0["DEPTH_CLEAR_VALUE"]               = 0x0B73
    $P0["DEPTH_FUNC"]                      = 0x0B74
    $P0["ACCUM_CLEAR_VALUE"]               = 0x0B80
    $P0["STENCIL_TEST"]                    = 0x0B90
    $P0["STENCIL_CLEAR_VALUE"]             = 0x0B91
    $P0["STENCIL_FUNC"]                    = 0x0B92
    $P0["STENCIL_VALUE_MASK"]              = 0x0B93
    $P0["STENCIL_FAIL"]                    = 0x0B94
    $P0["STENCIL_PASS_DEPTH_FAIL"]         = 0x0B95
    $P0["STENCIL_PASS_DEPTH_PASS"]         = 0x0B96
    $P0["STENCIL_REF"]                     = 0x0B97
    $P0["STENCIL_WRITEMASK"]               = 0x0B98
    $P0["MATRIX_MODE"]                     = 0x0BA0
    $P0["NORMALIZE"]                       = 0x0BA1
    $P0["VIEWPORT"]                        = 0x0BA2
    $P0["MODELVIEW_STACK_DEPTH"]           = 0x0BA3
    $P0["PROJECTION_STACK_DEPTH"]          = 0x0BA4
    $P0["TEXTURE_STACK_DEPTH"]             = 0x0BA5
    $P0["MODELVIEW_MATRIX"]                = 0x0BA6
    $P0["PROJECTION_MATRIX"]               = 0x0BA7
    $P0["TEXTURE_MATRIX"]                  = 0x0BA8
    $P0["ATTRIB_STACK_DEPTH"]              = 0x0BB0
    $P0["CLIENT_ATTRIB_STACK_DEPTH"]       = 0x0BB1
    $P0["ALPHA_TEST"]                      = 0x0BC0
    $P0["ALPHA_TEST_FUNC"]                 = 0x0BC1
    $P0["ALPHA_TEST_REF"]                  = 0x0BC2
    $P0["DITHER"]                          = 0x0BD0
    $P0["BLEND_DST"]                       = 0x0BE0
    $P0["BLEND_SRC"]                       = 0x0BE1
    $P0["BLEND"]                           = 0x0BE2
    $P0["LOGIC_OP_MODE"]                   = 0x0BF0
    $P0["LOGIC_OP"]                        = 0x0BF1
    $P0["INDEX_LOGIC_OP"]                  = 0x0BF1
    $P0["COLOR_LOGIC_OP"]                  = 0x0BF2
    $P0["AUX_BUFFERS"]                     = 0x0C00
    $P0["DRAW_BUFFER"]                     = 0x0C01
    $P0["READ_BUFFER"]                     = 0x0C02
    $P0["SCISSOR_BOX"]                     = 0x0C10
    $P0["SCISSOR_TEST"]                    = 0x0C11
    $P0["INDEX_CLEAR_VALUE"]               = 0x0C20
    $P0["INDEX_WRITEMASK"]                 = 0x0C21
    $P0["COLOR_CLEAR_VALUE"]               = 0x0C22
    $P0["COLOR_WRITEMASK"]                 = 0x0C23
    $P0["INDEX_MODE"]                      = 0x0C30
    $P0["RGBA_MODE"]                       = 0x0C31
    $P0["DOUBLEBUFFER"]                    = 0x0C32
    $P0["STEREO"]                          = 0x0C33
    $P0["RENDER_MODE"]                     = 0x0C40
    $P0["PERSPECTIVE_CORRECTION_HINT"]     = 0x0C50
    $P0["POINT_SMOOTH_HINT"]               = 0x0C51
    $P0["LINE_SMOOTH_HINT"]                = 0x0C52
    $P0["POLYGON_SMOOTH_HINT"]             = 0x0C53
    $P0["FOG_HINT"]                        = 0x0C54
    $P0["TEXTURE_GEN_S"]                   = 0x0C60
    $P0["TEXTURE_GEN_T"]                   = 0x0C61
    $P0["TEXTURE_GEN_R"]                   = 0x0C62
    $P0["TEXTURE_GEN_Q"]                   = 0x0C63
    $P0["PIXEL_MAP_I_TO_I"]                = 0x0C70
    $P0["PIXEL_MAP_S_TO_S"]                = 0x0C71
    $P0["PIXEL_MAP_I_TO_R"]                = 0x0C72
    $P0["PIXEL_MAP_I_TO_G"]                = 0x0C73
    $P0["PIXEL_MAP_I_TO_B"]                = 0x0C74
    $P0["PIXEL_MAP_I_TO_A"]                = 0x0C75
    $P0["PIXEL_MAP_R_TO_R"]                = 0x0C76
    $P0["PIXEL_MAP_G_TO_G"]                = 0x0C77
    $P0["PIXEL_MAP_B_TO_B"]                = 0x0C78
    $P0["PIXEL_MAP_A_TO_A"]                = 0x0C79
    $P0["PIXEL_MAP_I_TO_I_SIZE"]           = 0x0CB0
    $P0["PIXEL_MAP_S_TO_S_SIZE"]           = 0x0CB1
    $P0["PIXEL_MAP_I_TO_R_SIZE"]           = 0x0CB2
    $P0["PIXEL_MAP_I_TO_G_SIZE"]           = 0x0CB3
    $P0["PIXEL_MAP_I_TO_B_SIZE"]           = 0x0CB4
    $P0["PIXEL_MAP_I_TO_A_SIZE"]           = 0x0CB5
    $P0["PIXEL_MAP_R_TO_R_SIZE"]           = 0x0CB6
    $P0["PIXEL_MAP_G_TO_G_SIZE"]           = 0x0CB7
    $P0["PIXEL_MAP_B_TO_B_SIZE"]           = 0x0CB8
    $P0["PIXEL_MAP_A_TO_A_SIZE"]           = 0x0CB9
    $P0["UNPACK_SWAP_BYTES"]               = 0x0CF0
    $P0["UNPACK_LSB_FIRST"]                = 0x0CF1
    $P0["UNPACK_ROW_LENGTH"]               = 0x0CF2
    $P0["UNPACK_SKIP_ROWS"]                = 0x0CF3
    $P0["UNPACK_SKIP_PIXELS"]              = 0x0CF4
    $P0["UNPACK_ALIGNMENT"]                = 0x0CF5
    $P0["PACK_SWAP_BYTES"]                 = 0x0D00
    $P0["PACK_LSB_FIRST"]                  = 0x0D01
    $P0["PACK_ROW_LENGTH"]                 = 0x0D02
    $P0["PACK_SKIP_ROWS"]                  = 0x0D03
    $P0["PACK_SKIP_PIXELS"]                = 0x0D04
    $P0["PACK_ALIGNMENT"]                  = 0x0D05
    $P0["MAP_COLOR"]                       = 0x0D10
    $P0["MAP_STENCIL"]                     = 0x0D11
    $P0["INDEX_SHIFT"]                     = 0x0D12
    $P0["INDEX_OFFSET"]                    = 0x0D13
    $P0["RED_SCALE"]                       = 0x0D14
    $P0["RED_BIAS"]                        = 0x0D15
    $P0["ZOOM_X"]                          = 0x0D16
    $P0["ZOOM_Y"]                          = 0x0D17
    $P0["GREEN_SCALE"]                     = 0x0D18
    $P0["GREEN_BIAS"]                      = 0x0D19
    $P0["BLUE_SCALE"]                      = 0x0D1A
    $P0["BLUE_BIAS"]                       = 0x0D1B
    $P0["ALPHA_SCALE"]                     = 0x0D1C
    $P0["ALPHA_BIAS"]                      = 0x0D1D
    $P0["DEPTH_SCALE"]                     = 0x0D1E
    $P0["DEPTH_BIAS"]                      = 0x0D1F
    $P0["MAX_EVAL_ORDER"]                  = 0x0D30
    $P0["MAX_LIGHTS"]                      = 0x0D31
    $P0["MAX_CLIP_PLANES"]                 = 0x0D32
    $P0["MAX_TEXTURE_SIZE"]                = 0x0D33
    $P0["MAX_PIXEL_MAP_TABLE"]             = 0x0D34
    $P0["MAX_ATTRIB_STACK_DEPTH"]          = 0x0D35
    $P0["MAX_MODELVIEW_STACK_DEPTH"]       = 0x0D36
    $P0["MAX_NAME_STACK_DEPTH"]            = 0x0D37
    $P0["MAX_PROJECTION_STACK_DEPTH"]      = 0x0D38
    $P0["MAX_TEXTURE_STACK_DEPTH"]         = 0x0D39
    $P0["MAX_VIEWPORT_DIMS"]               = 0x0D3A
    $P0["MAX_CLIENT_ATTRIB_STACK_DEPTH"]   = 0x0D3B
    $P0["SUBPIXEL_BITS"]                   = 0x0D50
    $P0["INDEX_BITS"]                      = 0x0D51
    $P0["RED_BITS"]                        = 0x0D52
    $P0["GREEN_BITS"]                      = 0x0D53
    $P0["BLUE_BITS"]                       = 0x0D54
    $P0["ALPHA_BITS"]                      = 0x0D55
    $P0["DEPTH_BITS"]                      = 0x0D56
    $P0["STENCIL_BITS"]                    = 0x0D57
    $P0["ACCUM_RED_BITS"]                  = 0x0D58
    $P0["ACCUM_GREEN_BITS"]                = 0x0D59
    $P0["ACCUM_BLUE_BITS"]                 = 0x0D5A
    $P0["ACCUM_ALPHA_BITS"]                = 0x0D5B
    $P0["NAME_STACK_DEPTH"]                = 0x0D70
    $P0["AUTO_NORMAL"]                     = 0x0D80
    $P0["MAP1_COLOR_4"]                    = 0x0D90
    $P0["MAP1_INDEX"]                      = 0x0D91
    $P0["MAP1_NORMAL"]                     = 0x0D92
    $P0["MAP1_TEXTURE_COORD_1"]            = 0x0D93
    $P0["MAP1_TEXTURE_COORD_2"]            = 0x0D94
    $P0["MAP1_TEXTURE_COORD_3"]            = 0x0D95
    $P0["MAP1_TEXTURE_COORD_4"]            = 0x0D96
    $P0["MAP1_VERTEX_3"]                   = 0x0D97
    $P0["MAP1_VERTEX_4"]                   = 0x0D98
    $P0["MAP2_COLOR_4"]                    = 0x0DB0
    $P0["MAP2_INDEX"]                      = 0x0DB1
    $P0["MAP2_NORMAL"]                     = 0x0DB2
    $P0["MAP2_TEXTURE_COORD_1"]            = 0x0DB3
    $P0["MAP2_TEXTURE_COORD_2"]            = 0x0DB4
    $P0["MAP2_TEXTURE_COORD_3"]            = 0x0DB5
    $P0["MAP2_TEXTURE_COORD_4"]            = 0x0DB6
    $P0["MAP2_VERTEX_3"]                   = 0x0DB7
    $P0["MAP2_VERTEX_4"]                   = 0x0DB8
    $P0["MAP1_GRID_DOMAIN"]                = 0x0DD0
    $P0["MAP1_GRID_SEGMENTS"]              = 0x0DD1
    $P0["MAP2_GRID_DOMAIN"]                = 0x0DD2
    $P0["MAP2_GRID_SEGMENTS"]              = 0x0DD3
    $P0["TEXTURE_1D"]                      = 0x0DE0
    $P0["TEXTURE_2D"]                      = 0x0DE1
    $P0["FEEDBACK_BUFFER_POINTER"]         = 0x0DF0
    $P0["FEEDBACK_BUFFER_SIZE"]            = 0x0DF1
    $P0["FEEDBACK_BUFFER_TYPE"]            = 0x0DF2
    $P0["SELECTION_BUFFER_POINTER"]        = 0x0DF3
    $P0["SELECTION_BUFFER_SIZE"]           = 0x0DF4
    $P0["TEXTURE_WIDTH"]                   = 0x1000
    $P0["TEXTURE_HEIGHT"]                  = 0x1001
    $P0["TEXTURE_COMPONENTS"]              = 0x1003
    $P0["TEXTURE_INTERNAL_FORMAT"]         = 0x1003
    $P0["TEXTURE_BORDER_COLOR"]            = 0x1004
    $P0["TEXTURE_BORDER"]                  = 0x1005
    $P0["DONT_CARE"]                       = 0x1100
    $P0["FASTEST"]                         = 0x1101
    $P0["NICEST"]                          = 0x1102
    $P0["LIGHT0"]                          = 0x4000
    $P0["LIGHT1"]                          = 0x4001
    $P0["LIGHT2"]                          = 0x4002
    $P0["LIGHT3"]                          = 0x4003
    $P0["LIGHT4"]                          = 0x4004
    $P0["LIGHT5"]                          = 0x4005
    $P0["LIGHT6"]                          = 0x4006
    $P0["LIGHT7"]                          = 0x4007
    $P0["AMBIENT"]                         = 0x1200
    $P0["DIFFUSE"]                         = 0x1201
    $P0["SPECULAR"]                        = 0x1202
    $P0["POSITION"]                        = 0x1203
    $P0["SPOT_DIRECTION"]                  = 0x1204
    $P0["SPOT_EXPONENT"]                   = 0x1205
    $P0["SPOT_CUTOFF"]                     = 0x1206
    $P0["CONSTANT_ATTENUATION"]            = 0x1207
    $P0["LINEAR_ATTENUATION"]              = 0x1208
    $P0["QUADRATIC_ATTENUATION"]           = 0x1209
    $P0["COMPILE"]                         = 0x1300
    $P0["COMPILE_AND_EXECUTE"]             = 0x1301
    $P0["CLEAR"]                           = 0x1500
    $P0["AND"]                             = 0x1501
    $P0["AND_REVERSE"]                     = 0x1502
    $P0["COPY"]                            = 0x1503
    $P0["AND_INVERTED"]                    = 0x1504
    $P0["NOOP"]                            = 0x1505
    $P0["XOR"]                             = 0x1506
    $P0["OR"]                              = 0x1507
    $P0["NOR"]                             = 0x1508
    $P0["EQUIV"]                           = 0x1509
    $P0["INVERT"]                          = 0x150A
    $P0["OR_REVERSE"]                      = 0x150B
    $P0["COPY_INVERTED"]                   = 0x150C
    $P0["OR_INVERTED"]                     = 0x150D
    $P0["NAND"]                            = 0x150E
    $P0["SET"]                             = 0x150F
    $P0["EMISSION"]                        = 0x1600
    $P0["SHININESS"]                       = 0x1601
    $P0["AMBIENT_AND_DIFFUSE"]             = 0x1602
    $P0["COLOR_INDEXES"]                   = 0x1603
    $P0["MODELVIEW"]                       = 0x1700
    $P0["PROJECTION"]                      = 0x1701
    $P0["TEXTURE"]                         = 0x1702
    $P0["COLOR"]                           = 0x1800
    $P0["DEPTH"]                           = 0x1801
    $P0["STENCIL"]                         = 0x1802
    $P0["COLOR_INDEX"]                     = 0x1900
    $P0["STENCIL_INDEX"]                   = 0x1901
    $P0["DEPTH_COMPONENT"]                 = 0x1902
    $P0["RED"]                             = 0x1903
    $P0["GREEN"]                           = 0x1904
    $P0["BLUE"]                            = 0x1905
    $P0["ALPHA"]                           = 0x1906
    $P0["RGB"]                             = 0x1907
    $P0["RGBA"]                            = 0x1908
    $P0["LUMINANCE"]                       = 0x1909
    $P0["LUMINANCE_ALPHA"]                 = 0x190A
    $P0["BITMAP"]                          = 0x1A00
    $P0["POINT"]                           = 0x1B00
    $P0["LINE"]                            = 0x1B01
    $P0["FILL"]                            = 0x1B02
    $P0["RENDER"]                          = 0x1C00
    $P0["FEEDBACK"]                        = 0x1C01
    $P0["SELECT"]                          = 0x1C02
    $P0["FLAT"]                            = 0x1D00
    $P0["SMOOTH"]                          = 0x1D01
    $P0["KEEP"]                            = 0x1E00
    $P0["REPLACE"]                         = 0x1E01
    $P0["INCR"]                            = 0x1E02
    $P0["DECR"]                            = 0x1E03
    $P0["VENDOR"]                          = 0x1F00
    $P0["RENDERER"]                        = 0x1F01
    $P0["VERSION"]                         = 0x1F02
    $P0["EXTENSIONS"]                      = 0x1F03
    $P0["S"]                               = 0x2000
    $P0["T"]                               = 0x2001
    $P0["R"]                               = 0x2002
    $P0["Q"]                               = 0x2003
    $P0["MODULATE"]                        = 0x2100
    $P0["DECAL"]                           = 0x2101
    $P0["TEXTURE_ENV_MODE"]                = 0x2200
    $P0["TEXTURE_ENV_COLOR"]               = 0x2201
    $P0["TEXTURE_ENV"]                     = 0x2300
    $P0["EYE_LINEAR"]                      = 0x2400
    $P0["OBJECT_LINEAR"]                   = 0x2401
    $P0["SPHERE_MAP"]                      = 0x2402
    $P0["TEXTURE_GEN_MODE"]                = 0x2500
    $P0["OBJECT_PLANE"]                    = 0x2501
    $P0["EYE_PLANE"]                       = 0x2502
    $P0["NEAREST"]                         = 0x2600
    $P0["LINEAR"]                          = 0x2601
    $P0["NEAREST_MIPMAP_NEAREST"]          = 0x2700
    $P0["LINEAR_MIPMAP_NEAREST"]           = 0x2701
    $P0["NEAREST_MIPMAP_LINEAR"]           = 0x2702
    $P0["LINEAR_MIPMAP_LINEAR"]            = 0x2703
    $P0["TEXTURE_MAG_FILTER"]              = 0x2800
    $P0["TEXTURE_MIN_FILTER"]              = 0x2801
    $P0["TEXTURE_WRAP_S"]                  = 0x2802
    $P0["TEXTURE_WRAP_T"]                  = 0x2803
    $P0["CLAMP"]                           = 0x2900
    $P0["REPEAT"]                          = 0x2901
    $P0["POLYGON_OFFSET_FACTOR"]           = 0x8038
    $P0["POLYGON_OFFSET_UNITS"]            = 0x2A00
    $P0["POLYGON_OFFSET_POINT"]            = 0x2A01
    $P0["POLYGON_OFFSET_LINE"]             = 0x2A02
    $P0["POLYGON_OFFSET_FILL"]             = 0x8037
    $P0["ALPHA4"]                          = 0x803B
    $P0["ALPHA8"]                          = 0x803C
    $P0["ALPHA12"]                         = 0x803D
    $P0["ALPHA16"]                         = 0x803E
    $P0["LUMINANCE4"]                      = 0x803F
    $P0["LUMINANCE8"]                      = 0x8040
    $P0["LUMINANCE12"]                     = 0x8041
    $P0["LUMINANCE16"]                     = 0x8042
    $P0["LUMINANCE4_ALPHA4"]               = 0x8043
    $P0["LUMINANCE6_ALPHA2"]               = 0x8044
    $P0["LUMINANCE8_ALPHA8"]               = 0x8045
    $P0["LUMINANCE12_ALPHA4"]              = 0x8046
    $P0["LUMINANCE12_ALPHA12"]             = 0x8047
    $P0["LUMINANCE16_ALPHA16"]             = 0x8048
    $P0["INTENSITY"]                       = 0x8049
    $P0["INTENSITY4"]                      = 0x804A
    $P0["INTENSITY8"]                      = 0x804B
    $P0["INTENSITY12"]                     = 0x804C
    $P0["INTENSITY16"]                     = 0x804D
    $P0["R3_G3_B2"]                        = 0x2A10
    $P0["RGB4"]                            = 0x804F
    $P0["RGB5"]                            = 0x8050
    $P0["RGB8"]                            = 0x8051
    $P0["RGB10"]                           = 0x8052
    $P0["RGB12"]                           = 0x8053
    $P0["RGB16"]                           = 0x8054
    $P0["RGBA2"]                           = 0x8055
    $P0["RGBA4"]                           = 0x8056
    $P0["RGB5_A1"]                         = 0x8057
    $P0["RGBA8"]                           = 0x8058
    $P0["RGB10_A2"]                        = 0x8059
    $P0["RGBA12"]                          = 0x805A
    $P0["RGBA16"]                          = 0x805B
    $P0["TEXTURE_RED_SIZE"]                = 0x805C
    $P0["TEXTURE_GREEN_SIZE"]              = 0x805D
    $P0["TEXTURE_BLUE_SIZE"]               = 0x805E
    $P0["TEXTURE_ALPHA_SIZE"]              = 0x805F
    $P0["TEXTURE_LUMINANCE_SIZE"]          = 0x8060
    $P0["TEXTURE_INTENSITY_SIZE"]          = 0x8061
    $P0["PROXY_TEXTURE_1D"]                = 0x8063
    $P0["PROXY_TEXTURE_2D"]                = 0x8064
    $P0["TEXTURE_PRIORITY"]                = 0x8066
    $P0["TEXTURE_RESIDENT"]                = 0x8067
    $P0["TEXTURE_BINDING_1D"]              = 0x8068
    $P0["TEXTURE_BINDING_2D"]              = 0x8069
    $P0["VERTEX_ARRAY"]                    = 0x8074
    $P0["NORMAL_ARRAY"]                    = 0x8075
    $P0["COLOR_ARRAY"]                     = 0x8076
    $P0["INDEX_ARRAY"]                     = 0x8077
    $P0["TEXTURE_COORD_ARRAY"]             = 0x8078
    $P0["EDGE_FLAG_ARRAY"]                 = 0x8079
    $P0["VERTEX_ARRAY_SIZE"]               = 0x807A
    $P0["VERTEX_ARRAY_TYPE"]               = 0x807B
    $P0["VERTEX_ARRAY_STRIDE"]             = 0x807C
    $P0["NORMAL_ARRAY_TYPE"]               = 0x807E
    $P0["NORMAL_ARRAY_STRIDE"]             = 0x807F
    $P0["COLOR_ARRAY_SIZE"]                = 0x8081
    $P0["COLOR_ARRAY_TYPE"]                = 0x8082
    $P0["COLOR_ARRAY_STRIDE"]              = 0x8083
    $P0["INDEX_ARRAY_TYPE"]                = 0x8085
    $P0["INDEX_ARRAY_STRIDE"]              = 0x8086
    $P0["TEXTURE_COORD_ARRAY_SIZE"]        = 0x8088
    $P0["TEXTURE_COORD_ARRAY_TYPE"]        = 0x8089
    $P0["TEXTURE_COORD_ARRAY_STRIDE"]      = 0x808A
    $P0["EDGE_FLAG_ARRAY_STRIDE"]          = 0x808C
    $P0["VERTEX_ARRAY_POINTER"]            = 0x808E
    $P0["NORMAL_ARRAY_POINTER"]            = 0x808F
    $P0["COLOR_ARRAY_POINTER"]             = 0x8090
    $P0["INDEX_ARRAY_POINTER"]             = 0x8091
    $P0["TEXTURE_COORD_ARRAY_POINTER"]     = 0x8092
    $P0["EDGE_FLAG_ARRAY_POINTER"]         = 0x8093
    $P0["V2F"]                             = 0x2A20
    $P0["V3F"]                             = 0x2A21
    $P0["C4UB_V2F"]                        = 0x2A22
    $P0["C4UB_V3F"]                        = 0x2A23
    $P0["C3F_V3F"]                         = 0x2A24
    $P0["N3F_V3F"]                         = 0x2A25
    $P0["C4F_N3F_V3F"]                     = 0x2A26
    $P0["T2F_V3F"]                         = 0x2A27
    $P0["T4F_V4F"]                         = 0x2A28
    $P0["T2F_C4UB_V3F"]                    = 0x2A29
    $P0["T2F_C3F_V3F"]                     = 0x2A2A
    $P0["T2F_N3F_V3F"]                     = 0x2A2B
    $P0["T2F_C4F_N3F_V3F"]                 = 0x2A2C
    $P0["T4F_C4F_N3F_V4F"]                 = 0x2A2D
    $P0["EXT_vertex_array"]                = 1
    $P0["EXT_bgra"]                        = 1
    $P0["EXT_paletted_texture"]            = 1
    $P0["WIN_swap_hint"]                   = 1
    $P0["WIN_draw_range_elements"]         = 1
    $P0["VERTEX_ARRAY_EXT"]                = 0x8074
    $P0["NORMAL_ARRAY_EXT"]                = 0x8075
    $P0["COLOR_ARRAY_EXT"]                 = 0x8076
    $P0["INDEX_ARRAY_EXT"]                 = 0x8077
    $P0["TEXTURE_COORD_ARRAY_EXT"]         = 0x8078
    $P0["EDGE_FLAG_ARRAY_EXT"]             = 0x8079
    $P0["VERTEX_ARRAY_SIZE_EXT"]           = 0x807A
    $P0["VERTEX_ARRAY_TYPE_EXT"]           = 0x807B
    $P0["VERTEX_ARRAY_STRIDE_EXT"]         = 0x807C
    $P0["VERTEX_ARRAY_COUNT_EXT"]          = 0x807D
    $P0["NORMAL_ARRAY_TYPE_EXT"]           = 0x807E
    $P0["NORMAL_ARRAY_STRIDE_EXT"]         = 0x807F
    $P0["NORMAL_ARRAY_COUNT_EXT"]          = 0x8080
    $P0["COLOR_ARRAY_SIZE_EXT"]            = 0x8081
    $P0["COLOR_ARRAY_TYPE_EXT"]            = 0x8082
    $P0["COLOR_ARRAY_STRIDE_EXT"]          = 0x8083
    $P0["COLOR_ARRAY_COUNT_EXT"]           = 0x8084
    $P0["INDEX_ARRAY_TYPE_EXT"]            = 0x8085
    $P0["INDEX_ARRAY_STRIDE_EXT"]          = 0x8086
    $P0["INDEX_ARRAY_COUNT_EXT"]           = 0x8087
    $P0["TEXTURE_COORD_ARRAY_SIZE_EXT"]    = 0x8088
    $P0["TEXTURE_COORD_ARRAY_TYPE_EXT"]    = 0x8089
    $P0["TEXTURE_COORD_ARRAY_STRIDE_EXT"]  = 0x808A
    $P0["TEXTURE_COORD_ARRAY_COUNT_EXT"]   = 0x808B
    $P0["EDGE_FLAG_ARRAY_STRIDE_EXT"]      = 0x808C
    $P0["EDGE_FLAG_ARRAY_COUNT_EXT"]       = 0x808D
    $P0["VERTEX_ARRAY_POINTER_EXT"]        = 0x808E
    $P0["NORMAL_ARRAY_POINTER_EXT"]        = 0x808F
    $P0["COLOR_ARRAY_POINTER_EXT"]         = 0x8090
    $P0["INDEX_ARRAY_POINTER_EXT"]         = 0x8091
    $P0["TEXTURE_COORD_ARRAY_POINTER_EXT"] = 0x8092
    $P0["EDGE_FLAG_ARRAY_POINTER_EXT"]     = 0x8093
    $P0["BGR_EXT"]                         = 0x80E0
    $P0["BGRA_EXT"]                        = 0x80E1
    $P0["COLOR_TABLE_FORMAT_EXT"]          = 0x80D8
    $P0["COLOR_TABLE_WIDTH_EXT"]           = 0x80D9
    $P0["COLOR_TABLE_RED_SIZE_EXT"]        = 0x80DA
    $P0["COLOR_TABLE_GREEN_SIZE_EXT"]      = 0x80DB
    $P0["COLOR_TABLE_BLUE_SIZE_EXT"]       = 0x80DC
    $P0["COLOR_TABLE_ALPHA_SIZE_EXT"]      = 0x80DD
    $P0["COLOR_TABLE_LUMINANCE_SIZE_EXT"]  = 0x80DE
    $P0["COLOR_TABLE_INTENSITY_SIZE_EXT"]  = 0x80DF
    $P0["COLOR_INDEX1_EXT"]                = 0x80E2
    $P0["COLOR_INDEX2_EXT"]                = 0x80E3
    $P0["COLOR_INDEX4_EXT"]                = 0x80E4
    $P0["COLOR_INDEX8_EXT"]                = 0x80E5
    $P0["COLOR_INDEX12_EXT"]               = 0x80E6
    $P0["COLOR_INDEX16_EXT"]               = 0x80E7
    $P0["MAX_ELEMENTS_VERTICES_WIN"]       = 0x80E8
    $P0["MAX_ELEMENTS_INDICES_WIN"]        = 0x80E9
    $P0["PHONG_WIN"]                       = 0x80EA
    $P0["PHONG_HINT_WIN"]                  = 0x80EB
    $P0["FOG_SPECULAR_TEXTURE_WIN"]        = 0x80EC
    $P0["CURRENT_BIT"]                     = 0x00000001
    $P0["POINT_BIT"]                       = 0x00000002
    $P0["LINE_BIT"]                        = 0x00000004
    $P0["POLYGON_BIT"]                     = 0x00000008
    $P0["POLYGON_STIPPLE_BIT"]             = 0x00000010
    $P0["PIXEL_MODE_BIT"]                  = 0x00000020
    $P0["LIGHTING_BIT"]                    = 0x00000040
    $P0["FOG_BIT"]                         = 0x00000080
    $P0["DEPTH_BUFFER_BIT"]                = 0x00000100
    $P0["ACCUM_BUFFER_BIT"]                = 0x00000200
    $P0["STENCIL_BUFFER_BIT"]              = 0x00000400
    $P0["VIEWPORT_BIT"]                    = 0x00000800
    $P0["TRANSFORM_BIT"]                   = 0x00001000
    $P0["ENABLE_BIT"]                      = 0x00002000
    $P0["COLOR_BUFFER_BIT"]                = 0x00004000
    $P0["HINT_BIT"]                        = 0x00008000
    $P0["EVAL_BIT"]                        = 0x00010000
    $P0["LIST_BIT"]                        = 0x00020000
    $P0["TEXTURE_BIT"]                     = 0x00040000
    $P0["SCISSOR_BIT"]                     = 0x00080000
    $P0["ALL_ATTRIB_BITS"]                 = 0x000fffff
    $P0["CLIENT_PIXEL_STORE_BIT"]          = 0x00000001
    $P0["CLIENT_VERTEX_ARRAY_BIT"]         = 0x00000002
    $P0["CLIENT_ALL_ATTRIB_BITS"]          = 0xffffffff
    .return ($P0)
.end

.const int ENUM_ERROR = -2

.sub 'get_gl_enum' :anon
    .param string str
    .local pmc gl_str
    gl_str = get_hll_global ['Lua::gl'], 'gl_str'
    .local int ret
    ret = 0
    $P0 = split ',', str
  L1:
    unless $P0 goto L2
    $S0 = shift $P0
    upcase $S0
    $I0 = exists gl_str[$S0]
    if $I0 goto L3
    .return (ENUM_ERROR)
  L3:
    $I0 = gl_str[$S0]
    ret |= $I0
    goto L1
  L2:
    .return (ret)
.end

.sub 'get_str_gl_enum' :anon
    .param int enum
    .local pmc gl_str
    gl_str = get_hll_global ['Lua::gl'], 'gl_str'
    new $P0, 'Iterator', gl_str
  L1:
    unless $P0 goto L2
    $P1 = shift $P0
    $I0 = gl_str[$P1]
    unless enum == $I0 goto L1
    $S0 = $P1
    .return ($S0)
  L2:
    .return ('')
.end

.sub 'get_arrayb' :anon
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
    .return (n, a)
.end

.sub 'get_arrayf' :anon
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
    .return (n, a)
.end

.sub 'get_arrayi' :anon
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
    .return (n, a)
.end

.sub 'get_array2f' :anon
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
    .return (n, size, a)
.end

.include 'opengl_defines.pasm'


=item C<gl.Accum (op, value)>

=cut

.sub 'Accum' :anon
    .param pmc op :optional
    .param pmc value :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(op)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.Accum'")
  L1:
    $I1 = get_gl_enum(op)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.Accum'")
  L2:
    $I0 = lua_isnumber(value)
    if $I0 goto L3
    lua_error("incorrect argument to function 'gl.Accum'")
  L3:
    $N2 = value
    glAccum($I1, $N2)
.end


=item C<gl.AlphaFunc (func, ref)>

=cut

.sub 'AlphaFunc' :anon
    .param pmc func :optional
    .param pmc ref :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(func)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.AlphaFunc'")
  L1:
    $I1 = get_gl_enum(func)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.AlphaFunc'")
  L2:
    $I0 = lua_isnumber(ref)
    if $I0 goto L3
    lua_error("incorrect argument to function 'gl.AlphaFunc'")
  L3:
    $N2 = ref
    glAlphaFunc($I1, $N2)
.end


=item C<gl.AreTexturesResident (texturesArray)>

=cut

.sub 'AreTexturesResident' :anon
    .param pmc texturesArray :optional
    .param pmc extra :slurpy
    $I0 = lua_istable(texturesArray)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.AreTexturesResident'")
  L1:
    not_implemented()
.end


=item C<gl.ArrayElement (i)>

=cut

.sub 'ArrayElement' :anon
    .param pmc i :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(i)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.ArrayElement'")
  L1:
    $I1 = i
    glArrayElement($I1)
.end


=item C<gl.Begin (mode)>

=cut

.sub 'Begin' :anon
    .param pmc mode :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mode)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.Begin'")
  L1:
    $I1 = get_gl_enum(mode)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.Begin'")
  L2:
    glBegin($I1)
.end


=item C<gl.BindTexture ()>

=cut

.sub 'BindTexture' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Bitmap ()>

=cut

.sub 'Bitmap' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.BlendFunc (sfactor, dfactor)>

=cut

.sub 'BlendFunc' :anon
    .param pmc sfactor :optional
    .param pmc dfactor :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(sfactor)
    unless $I0 goto L1
    $I0 = lua_isstring(dfactor)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.BlendFunc'")
  L2:
    $I1 = get_gl_enum(sfactor)
    if $I1 == ENUM_ERROR goto L3
    $I2 = get_gl_enum(dfactor)
    if $I2 == ENUM_ERROR goto L3
    goto L4
  L3:
    lua_error("incorrect string argument to function 'gl.BlendFunc'")
  L4:
    glBlendFunc($I1, $I2)
.end


=item C<gl.CallList (list)>

=cut

.sub 'CallList' :anon
    .param pmc list :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(list)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.CallList'")
  L1:
    $I1 = list
    glCallList($I1)
.end


=item C<gl.CallLists (listArray)>

=cut

.sub 'CallLists' :anon
    .param pmc listArray :optional
    .param pmc extra :slurpy
    $I0 = lua_istable(listArray)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.CallLists'")
  L1:
    ($I0, $P0) = get_arrayf(listArray)
    glCallLists($I0, .GL_DOUBLE, $P0)
.end


=item C<gl.Clear (mask)>

=cut

.sub 'Clear' :anon
    .param pmc mask :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mask)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.Clear'")
  L1:
    $I1 = get_gl_enum(mask)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.Clear'")
  L2:
    glClear($I1)
.end


=item C<gl.ClearAccum ()>

=cut

.sub 'ClearAccum' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ClearColor (red, green, blue, alpha)>

=cut

.sub 'ClearColor' :anon
    .param pmc red :optional
    .param pmc green :optional
    .param pmc blue :optional
    .param pmc alpha :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(red)
    unless $I0 goto L1
    $I0 = lua_isnumber(green)
    unless $I0 goto L1
    $I0 = lua_isnumber(blue)
    unless $I0 goto L1
    $I0 = lua_isnumber(alpha)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.ClearColor'")
  L2:
    $I1 = red
    $I2 = green
    $I3 = blue
    $I4 = alpha
    glClearColor($I1, $I2, $I3, $I4)
.end


=item C<gl.ClearDepth ()>

=cut

.sub 'ClearDepth' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ClearIndex ()>

=cut

.sub 'ClearIndex' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ClearStencil ()>

=cut

.sub 'ClearStencil' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ClipPlane ()>

=cut

.sub 'ClipPlane' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Color (red, green, blue [, alpha])>
=item C<gl.Color (color)>

=cut

.sub 'Color' :anon
    .param pmc vararg :slurpy
    .local int num_args
    num_args = elements vararg
    unless num_args goto L1
    $P1 = vararg[0]
    $I0 = lua_istable($P1)
    unless $I0 goto L1
    (num_args, $P0) = get_arrayf($P1)
    unless num_args > 4 goto L2
    num_args = 4
  L2:
    unless num_args == 3 goto L3
    glColor3dv($P0)
    .return ()
  L3:
    unless num_args == 4 goto L4
    glColor4dv($P0)
  L4:
    .return()
  L1:
    unless num_args > 4 goto L5
    num_args = 4
  L5:
    $I0 = 0
    new $P0, 'ResizableFloatArray'
  L6:
    unless $I0 < num_args goto L7
    $P1 = shift vararg
    $I1 = lua_isnumber($P1)
    if $I1 goto L8
    lua_error("incorrect argument to function 'gl.Color'")
  L8:
    $N1 = $P1
    $P0[$I0] = $N1
    inc $I0
    goto L6
  L7:
    unless num_args == 3 goto L9
    glColor3dv($P0)
    .return ()
  L9:
    unless num_args == 4 goto L10
    glColor4dv($P0)
  L10:
    .return()
.end


=item C<gl.ColorMask ()>

=cut

.sub 'ColorMask' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ColorMaterial ()>

=cut

.sub 'ColorMaterial' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ColorPointer ()>

=cut

.sub 'ColorPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.CopyPixels ()>

=cut

.sub 'CopyPixels' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.CopyTexImage ()>

=cut

.sub 'CopyTexImage' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.CopyTexSubImage ()>

=cut

.sub 'CopyTexSubImage' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.CullFace ()>

=cut

.sub 'CullFace' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DeleteLists ()>

=cut

.sub 'DeleteLists' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DeleteTextures ()>

=cut

.sub 'DeleteTextures' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DepthFunc ()>

=cut

.sub 'DepthFunc' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DepthMask ()>

=cut

.sub 'DepthMask' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DepthRange ()>

=cut

.sub 'DepthRange' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Disable (cap)>

=cut

.sub 'Disable' :anon
    .param pmc cap :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(cap)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.Disable'")
  L1:
    $I1 = get_gl_enum(cap)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.Disable'")
  L2:
    glDisable($I1)
.end


=item C<gl.DisableClientState (array)>

=cut

.sub 'DisableClientState' :anon
    .param pmc array :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(array)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.DisableClientState'")
  L1:
    $I1 = get_gl_enum(array)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.DisableClientState'")
  L2:
    glDisableClientState($I1)
.end


=item C<gl.DrawArrays (mode, first, count)>

=cut

.sub 'DrawArrays' :anon
    .param pmc mode :optional
    .param pmc first :optional
    .param pmc count :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mode)
    unless $I0 goto L1
    $I0 = lua_isnumber(first)
    unless $I0 goto L1
    $I0 = lua_isnumber(count)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.DrawArrays'")
  L2:
    $I1 = get_gl_enum(mode)
    unless $I1 == ENUM_ERROR goto L3
    lua_error("incorrect string argument to function 'gl.DrawArrays'")
  L3:
    $I2 = first
    $I3 = count
    glDrawArrays($I1, $I2, $I3)
.end


=item C<gl.DrawBuffer ()>

=cut

.sub 'DrawBuffer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.DrawElements (mode, indicesArray)>

=cut

.sub 'DrawElements' :anon
    .param pmc mode :optional
    .param pmc indicesArray :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mode)
    unless $I0 goto L1
    $I0 = lua_istable(indicesArray)
    unless $I0 goto L1
    goto L2
  L1:
    luaL_error("incorrect argument to function 'gl.DrawElements'")
  L2:
    $I1 = get_gl_enum(mode)
    unless $I1 == ENUM_ERROR goto L3
    lua_error("incorrect string argument to function 'gl.DrawElements'")
  L3:
    ($I2, $P2) = get_arrayi(indicesArray)
    glDrawElements($I1, $I2, .GL_INT, $P2)
.end


=item C<gl.DrawPixels ()>

=cut

.sub 'DrawPixels' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.EdgeFlag ()>

=cut

.sub 'EdgeFlag' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.EdgeFlagPointer ()>

=cut

.sub 'EdgeFlagPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Enable (cap)>

=cut

.sub 'Enable' :anon
    .param pmc cap :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(cap)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.Enable'")
  L1:
    $I1 = get_gl_enum(cap)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.Enable'")
  L2:
    glEnable($I1)
.end


=item C<gl.EnableClientState (array)>

=cut

.sub 'EnableClientState' :anon
    .param pmc mode :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mode)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.EnableClientState'")
  L1:
    $I1 = get_gl_enum(mode)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.EnableClientState'")
  L2:
    glEnableClientState($I1)
.end


=item C<gl.End ()>

=cut

.sub 'End' :anon
    .param pmc extra :slurpy
    glEnd()
.end


=item C<gl.EndList ()>

=cut

.sub 'EndList' :anon
    .param pmc extra :slurpy
    glEndList()
.end


=item C<gl.EvalCoord ()>

=cut

.sub 'EvalCoord' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.EvalMesh ()>

=cut

.sub 'EvalMesh' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.EvalPoint ()>

=cut

.sub 'EvalPoint' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.FeedbackBuffer ()>

=cut

.sub 'FeedbackBuffer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Finish ()>

=cut

.sub 'Finish' :anon
    .param pmc extra :slurpy
    glFinish()
.end


=item C<gl.Flush ()>

=cut

.sub 'Flush' :anon
    .param pmc extra :slurpy
    glFlush()
.end


=item C<gl.Fog ()>

=cut

.sub 'Fog' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.FrontFace ()>

=cut

.sub 'FrontFace' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Frustum ()>

=cut

.sub 'Frustum' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GenLists ()>

=cut

.sub 'GenLists' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GenTextures ()>

=cut

.sub 'GenTextures' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Get ()>

=cut

.sub 'Get' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetArray ()>

=cut

.sub 'GetArray' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetConst ()>

=cut

.sub 'GetConst' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetClipPlane ()>

=cut

.sub 'GetClipPlane' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetError ()>

=cut

.sub 'GetError' :anon
    .param pmc extra :slurpy
    $I0 = glGetError()
    if $I0 goto L1
    $S0 = 'NO_ERROR'
    goto L2
  L1:
    $S0 = get_str_gl_enum($I0)
  L2:
    new $P0, 'LuaString'
    set $P0, $S0
    .return ($P0)
.end


=item C<gl.GetLight ()>

=cut

.sub 'GetLight' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetMap ()>

=cut

.sub 'GetMap' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetMaterial ()>

=cut

.sub 'GetMaterial' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetPixelMap ()>

=cut

.sub 'GetPixelMap' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetPointer ()>

=cut

.sub 'GetPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetPolygonStipple ()>

=cut

.sub 'GetPolygonStipple' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetString ()>

=cut

.sub 'GetString' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetTexEnv ()>

=cut

.sub 'GetTexEnv' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetTexGen ()>

=cut

.sub 'GetTexGen' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetTexImage ()>

=cut

.sub 'GetTexImage' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetTexLevelParameter ()>

=cut

.sub 'GetTexLevelParameter' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.GetTexParameter ()>

=cut

.sub 'GetTexParameter' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Hint ()>

=cut

.sub 'Hint' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Index ()>

=cut

.sub 'Index' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.IndexMask ()>

=cut

.sub 'IndexMask' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.IndexPointer ()>

=cut

.sub 'IndexPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.InitNames ()>

=cut

.sub 'InitNames' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.IsEnabled ()>

=cut

.sub 'IsEnabled' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.IsList ()>

=cut

.sub 'IsList' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.IsTexture ()>

=cut

.sub 'IsTexture' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Light ()>

=cut

.sub 'Light' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LightModel ()>

=cut

.sub 'LightModel' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LineStipple ()>

=cut

.sub 'LineStipple' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LineWidth ()>

=cut

.sub 'LineWidth' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ListBase ()>

=cut

.sub 'ListBase' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LoadIdentity ()>

=cut

.sub 'LoadIdentity' :anon
    .param pmc extra :slurpy
    glLoadIdentity()
.end


=item C<gl.LoadMatrix ()>

=cut

.sub 'LoadMatrix' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LoadName ()>

=cut

.sub 'LoadName' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.LogicOp ()>

=cut

.sub 'LogicOp' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Map ()>

=cut

.sub 'Map' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.MapGrid ()>

=cut

.sub 'MapGrid' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Material ()>

=cut

.sub 'Material' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.MatrixMode (mode)>

=cut

.sub 'MatrixMode' :anon
    .param pmc mode :optional
    .param pmc extra :slurpy
    $I0 = lua_isstring(mode)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.MatrixMode'")
  L1:
    $I1 = get_gl_enum(mode)
    unless $I1 == ENUM_ERROR goto L2
    lua_error("incorrect string argument to function 'gl.MatrixMode'")
  L2:
    glMatrixMode($I1)
.end


=item C<gl.MultMatrix ()>

=cut

.sub 'MultMatrix' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.NewList (list, mode)>

=cut

.sub 'NewList' :anon
    .param pmc list :optional
    .param pmc mode :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(list)
    unless $I0 goto L1
    $I0 = lua_isstring(mode)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.NewList'")
  L2:
    $I1 = list
    $I2 = get_gl_enum(mode)
    unless $I2 == ENUM_ERROR goto L3
    lua_error("incorrect string argument to function 'gl.NewList'")
  L3:
    glNewList($I1, $I2)
.end


=item C<gl.Normal ()>

=cut

.sub 'Normal' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.NormalPointer ()>

=cut

.sub 'NormalPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Ortho (left, right, bottom, top, zNear, zFar)>

=cut

.sub 'Ortho' :anon
    .param pmc left :optional
    .param pmc right :optional
    .param pmc bottom :optional
    .param pmc top :optional
    .param pmc zNear :optional
    .param pmc zFar :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(left)
    unless $I0 goto L1
    $I0 = lua_isnumber(right)
    unless $I0 goto L1
    $I0 = lua_isnumber(bottom)
    unless $I0 goto L1
    $I0 = lua_isnumber(top)
    unless $I0 goto L1
    $I0 = lua_isnumber(zNear)
    unless $I0 goto L1
    $I0 = lua_isnumber(zFar)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.Ortho'")
  L2:
    $I1 = left
    $I2 = right
    $I3 = bottom
    $I4 = top
    $I5 = zNear
    $I6 = zFar
    glOrtho($I1, $I2, $I3, $I4, $I5, $I6)
.end


=item C<gl.PassThrough ()>

=cut

.sub 'PassThrough' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PixelMap ()>

=cut

.sub 'PixelMap' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PixelStore ()>

=cut

.sub 'PixelStore' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PixelTransfer ()>

=cut

.sub 'PixelTransfer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PixelZoom ()>

=cut

.sub 'PixelZoom' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PointSize ()>

=cut

.sub 'PointSize' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PolygonMode ()>

=cut

.sub 'PolygonMode' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PolygonOffset ()>

=cut

.sub 'PolygonOffset' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PolygonStipple ()>

=cut

.sub 'PolygonStipple' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PopAttrib ()>

=cut

.sub 'PopAttrib' :anon
    .param pmc extra :slurpy
    glPopAttrib()
.end


=item C<gl.PopClientAttrib ()>

=cut

.sub 'PopClientAttrib' :anon
    .param pmc extra :slurpy
    glPopClientAttrib()
.end


=item C<gl.PopMatrix ()>

=cut

.sub 'PopMatrix' :anon
    .param pmc extra :slurpy
    glPopMatrix()
.end


=item C<gl.PopName ()>

=cut

.sub 'PopName' :anon
    .param pmc extra :slurpy
    glPopName()
.end


=item C<gl.PrioritizeTextures ()>

=cut

.sub 'PrioritizeTextures' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PushAttrib ()>

=cut

.sub 'PushAttrib' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PushClientAttrib ()>

=cut

.sub 'PushClientAttrib' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.PushMatrix ()>

=cut

.sub 'PushMatrix' :anon
    .param pmc extra :slurpy
    glPushMatrix()
.end


=item C<gl.PushName ()>

=cut

.sub 'PushName' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.RasterPos ()>

=cut

.sub 'RasterPos' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ReadBuffer ()>

=cut

.sub 'ReadBuffer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ReadPixels ()>

=cut

.sub 'ReadPixels' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Rect (x1, y1, x2, y2)>
=item C<gl.Rect (v1, v2)>

=cut

.sub 'Rect' :anon
    .param pmc vararg :slurpy
    .local int num_args
    num_args = elements vararg
    if num_args < 2 goto L1
    $P1 = vararg[0]
    $P2 = vararg[1]
    $I0 = lua_istable($P1)
    unless $I0 goto L1
    $I0 = lua_istable($P2)
    unless $I0 goto L1
    ($I0, $P1) = get_arrayf($P1)
    ($I0, $P2) = get_arrayf($P2)
    glRectdv($P1, $P2)
    .return ()
  L1:
    if num_args < 4 goto L2
    $I0 = lua_isnumber($P1)
    unless $I0 goto L2
    $I0 = lua_isnumber($P2)
    unless $I0 goto L2
    $P3 = vararg[2]
    $I0 = lua_isnumber($P3)
    unless $I0 goto L2
    $P4 = vararg[3]
    $I0 = lua_isnumber($P4)
    unless $I0 goto L2
    $N1 = $P1
    $N2 = $P2
    $N3 = $P3
    $N4 = $P4
    glRectd($N1, $N2, $N3, $N4)
    .return ()
  L2:
    lua_error("incorrect argument to function 'gl.Rect'")
.end


=item C<gl.RenderMode ()>

=cut

.sub 'RenderMode' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Rotate (angle, x, y, z))>

=cut

.sub 'Rotate' :anon
    .param pmc angle :optional
    .param pmc x :optional
    .param pmc y :optional
    .param pmc z :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(angle)
    unless $I0 goto L1
    $I0 = lua_isnumber(x)
    unless $I0 goto L1
    $I0 = lua_isnumber(y)
    unless $I0 goto L1
    $I0 = lua_isnumber(z)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.Rotate'")
  L2:
    $N1 = angle
    $N2 = x
    $N3 = y
    $N4 = z
    glRotated($N1, $N2, $N3, $N4)
.end


=item C<gl.Scale (x, y, z)>

=cut

.sub 'Scale' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc z :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(x)
    unless $I0 goto L1
    $I0 = lua_isnumber(y)
    unless $I0 goto L1
    $I0 = lua_isnumber(z)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.Scale'")
  L2:
    $N1 = x
    $N2 = y
    $N3 = z
    glScaled($N1, $N2, $N3)
.end


=item C<gl.Scissor ()>

=cut

.sub 'Scissor' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.SelectBuffer ()>

=cut

.sub 'SelectBuffer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.ShadeModel ()>

=cut

.sub 'ShadeModel' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.StencilFunc ()>

=cut

.sub 'StencilFunc' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.StencilMask ()>

=cut

.sub 'StencilMask' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.StencilOp ()>

=cut

.sub 'StencilOp' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexCoord ()>

=cut

.sub 'TexCoord' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexCoordPointer ()>

=cut

.sub 'TexCoordPointer' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexEnv ()>

=cut

.sub 'TexEnv' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexGen ()>

=cut

.sub 'TexGen' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexImage ()>

=cut

.sub 'TexImage' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexSubImage ()>

=cut

.sub 'TexSubImage' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.TexParameter ()>

=cut

.sub 'TexParameter' :anon
    .param pmc extra :slurpy
    not_implemented()
.end


=item C<gl.Translate (x, y, z)>

=cut

.sub 'Translate' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc z :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(x)
    unless $I0 goto L1
    $I0 = lua_isnumber(y)
    unless $I0 goto L1
    $I0 = lua_isnumber(z)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.Translate'")
  L2:
    $N1 = x
    $N2 = y
    $N3 = z
    glTranslated($N1, $N2, $N3)
.end


=item C<gl.Vertex (x, y, [z, w])>
=item C<gl.Vertex (v)>

=cut

.sub 'Vertex' :anon
    .param pmc vararg :slurpy
    .local int num_args
    num_args = elements vararg
    unless num_args == 0 goto L1
    lua_error("incorrect argument to function 'gl.Vertex'")
  L1:
    $P1 = vararg[0]
    $I0 = lua_istable($P1)
    unless $I0 goto L2
    (num_args, $P0) = get_arrayf($P1)
    goto L3
  L2:
    unless num_args < 2 goto L4
    lua_error("incorrect argument to function 'gl.Vertex'")
  L4:
    new $P0, 'ResizableFloatArray'
    $I0 = 0
  L5:
    unless $I0 < num_args goto L3
    $P1 = shift vararg
    $I1 = lua_isnumber($P1)
    if $I1 goto L6
    lua_error("incorrect argument to function 'gl.Vertex'")
  L6:
    $N1 = $P1
    $P0[$I0] = $N1
    inc $I0
    goto L5
  L3:
    unless num_args > 4 goto L7
    num_args = 4
  L7:
    unless num_args == 2 goto L8
    glVertex2dv($P0)
    .return()
  L8:
    unless num_args == 3 goto L9
    glVertex3dv($P0)
    .return()
  L9:
    unless num_args == 4 goto L10
    glVertex4dv($P0)
  L10:
    .return()
.end


=item C<gl.VertexPointer (vertexArray)>

STILL INCOMPLETE

=cut

.sub 'VertexPointer' :anon
    .param pmc vertexArray :optional
    .param pmc extra :slurpy
    $I0 = lua_istable(vertexArray)
    if $I0 goto L1
    lua_error("incorrect argument to function 'gl.VertexPointer'")
  L1:
    ($I1, $I2, $P3) = get_array2f(vertexArray)
    unless $I1 == -1 goto L2
    lua_error("incorrect argument to function 'gl.VertexPointer'")
  L2:
    glVertexPointer($I2, .GL_DOUBLE, 0, $P3)
.end


=item C<gl.Viewport (x, y, width, height)>

=cut

.sub 'Viewport' :anon
    .param pmc x :optional
    .param pmc y :optional
    .param pmc width :optional
    .param pmc height :optional
    .param pmc extra :slurpy
    $I0 = lua_isnumber(x)
    unless $I0 goto L1
    $I0 = lua_isnumber(y)
    unless $I0 goto L1
    $I0 = lua_isnumber(width)
    unless $I0 goto L1
    $I0 = lua_isnumber(height)
    unless $I0 goto L1
    goto L2
  L1:
    lua_error("incorrect argument to function 'gl.Viewport'")
  L2:
    $I1 = x
    $I2 = y
    $I3 = width
    $I4 = height
    glViewport($I1, $I2, $I3, $I4)
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
