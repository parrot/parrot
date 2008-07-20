# Copyright (C) 2008, The Perl Foundation.
# $Id: $

=head1 NAME

lib/gl.pir - OpenGL library

=head1 DESCRIPTION

This file implements the OpenGL binding for Lua.

See original on L<http://luagl.wikidot.com/>

=over 4

=cut

.HLL 'Lua', 'lua_group'
.namespace [ 'Lua::gl'; 'Lua' ]

.sub '__onload' :anon :load
#    print "__onload gl\n"
    .const .Sub entry = 'luaopen_gl'
    set_hll_global 'luaopen_gl', entry
.end

.sub 'luaopen_gl'

#    print "luaopen_gl\n"

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

    .return (_gl)
.end


=item C<gl.Accum ()>

=cut

.sub 'Accum' :anon
    .param pmc extra :slurpy
.end


=item C<gl.AlphaFunc ()>

=cut

.sub 'AlphaFunc' :anon
    .param pmc extra :slurpy
.end


=item C<gl.AreTexturesResident ()>

=cut

.sub 'AreTexturesResident' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ArrayElement ()>

=cut

.sub 'ArrayElement' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Begin ()>

=cut

.sub 'Begin' :anon
    .param pmc extra :slurpy
.end


=item C<gl.BindTexture ()>

=cut

.sub 'BindTexture' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Bitmap ()>

=cut

.sub 'Bitmap' :anon
    .param pmc extra :slurpy
.end


=item C<gl.BlendFunc ()>

=cut

.sub 'BlendFunc' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CallList ()>

=cut

.sub 'CallList' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CallLists ()>

=cut

.sub 'CallLists' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Clear ()>

=cut

.sub 'Clear' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClearAccum ()>

=cut

.sub 'ClearAccum' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClearColor ()>

=cut

.sub 'ClearColor' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClearDepth ()>

=cut

.sub 'ClearDepth' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClearIndex ()>

=cut

.sub 'ClearIndex' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClearStencil ()>

=cut

.sub 'ClearStencil' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ClipPlane ()>

=cut

.sub 'ClipPlane' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Color ()>

=cut

.sub 'Color' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ColorMask ()>

=cut

.sub 'ColorMask' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ColorMaterial ()>

=cut

.sub 'ColorMaterial' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ColorPointer ()>

=cut

.sub 'ColorPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CopyPixels ()>

=cut

.sub 'CopyPixels' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CopyTexImage ()>

=cut

.sub 'CopyTexImage' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CopyTexSubImage ()>

=cut

.sub 'CopyTexSubImage' :anon
    .param pmc extra :slurpy
.end


=item C<gl.CullFace ()>

=cut

.sub 'CullFace' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DeleteLists ()>

=cut

.sub 'DeleteLists' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DeleteTextures ()>

=cut

.sub 'DeleteTextures' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DepthFunc ()>

=cut

.sub 'DepthFunc' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DepthMask ()>

=cut

.sub 'DepthMask' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DepthRange ()>

=cut

.sub 'DepthRange' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Disable ()>

=cut

.sub 'Disable' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DisableClientState ()>

=cut

.sub 'DisableClientState' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DrawArrays ()>

=cut

.sub 'DrawArrays' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DrawBuffer ()>

=cut

.sub 'DrawBuffer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DrawElements ()>

=cut

.sub 'DrawElements' :anon
    .param pmc extra :slurpy
.end


=item C<gl.DrawPixels ()>

=cut

.sub 'DrawPixels' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EdgeFlag ()>

=cut

.sub 'EdgeFlag' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EdgeFlagPointer ()>

=cut

.sub 'EdgeFlagPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Enable ()>

=cut

.sub 'Enable' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EnableClientState ()>

=cut

.sub 'EnableClientState' :anon
    .param pmc extra :slurpy
.end


=item C<gl.End ()>

=cut

.sub 'End' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EndList ()>

=cut

.sub 'EndList' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EvalCoord ()>

=cut

.sub 'EvalCoord' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EvalMesh ()>

=cut

.sub 'EvalMesh' :anon
    .param pmc extra :slurpy
.end


=item C<gl.EvalPoint ()>

=cut

.sub 'EvalPoint' :anon
    .param pmc extra :slurpy
.end


=item C<gl.FeedbackBuffer ()>

=cut

.sub 'FeedbackBuffer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Finish ()>

=cut

.sub 'Finish' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Flush ()>

=cut

.sub 'Flush' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Fog ()>

=cut

.sub 'Fog' :anon
    .param pmc extra :slurpy
.end


=item C<gl.FrontFace ()>

=cut

.sub 'FrontFace' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Frustum ()>

=cut

.sub 'Frustum' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GenLists ()>

=cut

.sub 'GenLists' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GenTextures ()>

=cut

.sub 'GenTextures' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Get ()>

=cut

.sub 'Get' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetArray ()>

=cut

.sub 'GetArray' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetConst ()>

=cut

.sub 'GetConst' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetClipPlane ()>

=cut

.sub 'GetClipPlane' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetError ()>

=cut

.sub 'GetError' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetLight ()>

=cut

.sub 'GetLight' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetMap ()>

=cut

.sub 'GetMap' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetMaterial ()>

=cut

.sub 'GetMaterial' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetPixelMap ()>

=cut

.sub 'GetPixelMap' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetPointer ()>

=cut

.sub 'GetPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetPolygonStipple ()>

=cut

.sub 'GetPolygonStipple' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetString ()>

=cut

.sub 'GetString' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetTexEnv ()>

=cut

.sub 'GetTexEnv' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetTexGen ()>

=cut

.sub 'GetTexGen' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetTexImage ()>

=cut

.sub 'GetTexImage' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetTexLevelParameter ()>

=cut

.sub 'GetTexLevelParameter' :anon
    .param pmc extra :slurpy
.end


=item C<gl.GetTexParameter ()>

=cut

.sub 'GetTexParameter' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Hint ()>

=cut

.sub 'Hint' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Index ()>

=cut

.sub 'Index' :anon
    .param pmc extra :slurpy
.end


=item C<gl.IndexMask ()>

=cut

.sub 'IndexMask' :anon
    .param pmc extra :slurpy
.end


=item C<gl.IndexPointer ()>

=cut

.sub 'IndexPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.InitNames ()>

=cut

.sub 'InitNames' :anon
    .param pmc extra :slurpy
.end


=item C<gl.IsEnabled ()>

=cut

.sub 'IsEnabled' :anon
    .param pmc extra :slurpy
.end


=item C<gl.IsList ()>

=cut

.sub 'IsList' :anon
    .param pmc extra :slurpy
.end


=item C<gl.IsTexture ()>

=cut

.sub 'IsTexture' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Light ()>

=cut

.sub 'Light' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LightModel ()>

=cut

.sub 'LightModel' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LineStipple ()>

=cut

.sub 'LineStipple' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LineWidth ()>

=cut

.sub 'LineWidth' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ListBase ()>

=cut

.sub 'ListBase' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LoadIdentity ()>

=cut

.sub 'LoadIdentity' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LoadMatrix ()>

=cut

.sub 'LoadMatrix' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LoadName ()>

=cut

.sub 'LoadName' :anon
    .param pmc extra :slurpy
.end


=item C<gl.LogicOp ()>

=cut

.sub 'LogicOp' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Map ()>

=cut

.sub 'Map' :anon
    .param pmc extra :slurpy
.end


=item C<gl.MapGrid ()>

=cut

.sub 'MapGrid' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Material ()>

=cut

.sub 'Material' :anon
    .param pmc extra :slurpy
.end


=item C<gl.MatrixMode ()>

=cut

.sub 'MatrixMode' :anon
    .param pmc extra :slurpy
.end


=item C<gl.MultMatrix ()>

=cut

.sub 'MultMatrix' :anon
    .param pmc extra :slurpy
.end


=item C<gl.NewList ()>

=cut

.sub 'NewList' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Normal ()>

=cut

.sub 'Normal' :anon
    .param pmc extra :slurpy
.end


=item C<gl.NormalPointer ()>

=cut

.sub 'NormalPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Ortho ()>

=cut

.sub 'Ortho' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PassThrough ()>

=cut

.sub 'PassThrough' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PixelMap ()>

=cut

.sub 'PixelMap' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PixelStore ()>

=cut

.sub 'PixelStore' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PixelTransfer ()>

=cut

.sub 'PixelTransfer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PixelZoom ()>

=cut

.sub 'PixelZoom' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PointSize ()>

=cut

.sub 'PointSize' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PolygonMode ()>

=cut

.sub 'PolygonMode' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PolygonOffset ()>

=cut

.sub 'PolygonOffset' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PolygonStipple ()>

=cut

.sub 'PolygonStipple' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PopAttrib ()>

=cut

.sub 'PopAttrib' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PopClientAttrib ()>

=cut

.sub 'PopClientAttrib' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PopMatrix ()>

=cut

.sub 'PopMatrix' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PopName ()>

=cut

.sub 'PopName' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PrioritizeTextures ()>

=cut

.sub 'PrioritizeTextures' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PushAttrib ()>

=cut

.sub 'PushAttrib' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PushClientAttrib ()>

=cut

.sub 'PushClientAttrib' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PushMatrix ()>

=cut

.sub 'PushMatrix' :anon
    .param pmc extra :slurpy
.end


=item C<gl.PushName ()>

=cut

.sub 'PushName' :anon
    .param pmc extra :slurpy
.end


=item C<gl.RasterPos ()>

=cut

.sub 'RasterPos' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ReadBuffer ()>

=cut

.sub 'ReadBuffer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ReadPixels ()>

=cut

.sub 'ReadPixels' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Rect ()>

=cut

.sub 'Rect' :anon
    .param pmc extra :slurpy
.end


=item C<gl.RenderMode ()>

=cut

.sub 'RenderMode' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Rotate ()>

=cut

.sub 'Rotate' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Scale ()>

=cut

.sub 'Scale' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Scissor ()>

=cut

.sub 'Scissor' :anon
    .param pmc extra :slurpy
.end


=item C<gl.SelectBuffer ()>

=cut

.sub 'SelectBuffer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.ShadeModel ()>

=cut

.sub 'ShadeModel' :anon
    .param pmc extra :slurpy
.end


=item C<gl.StencilFunc ()>

=cut

.sub 'StencilFunc' :anon
    .param pmc extra :slurpy
.end


=item C<gl.StencilMask ()>

=cut

.sub 'StencilMask' :anon
    .param pmc extra :slurpy
.end


=item C<gl.StencilOp ()>

=cut

.sub 'StencilOp' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexCoord ()>

=cut

.sub 'TexCoord' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexCoordPointer ()>

=cut

.sub 'TexCoordPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexEnv ()>

=cut

.sub 'TexEnv' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexGen ()>

=cut

.sub 'TexGen' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexImage ()>

=cut

.sub 'TexImage' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexSubImage ()>

=cut

.sub 'TexSubImage' :anon
    .param pmc extra :slurpy
.end


=item C<gl.TexParameter ()>

=cut

.sub 'TexParameter' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Translate ()>

=cut

.sub 'Translate' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Vertex ()>

=cut

.sub 'Vertex' :anon
    .param pmc extra :slurpy
.end


=item C<gl.VertexPointer ()>

=cut

.sub 'VertexPointer' :anon
    .param pmc extra :slurpy
.end


=item C<gl.Viewport ()>

=cut

.sub 'Viewport' :anon
    .param pmc extra :slurpy
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
