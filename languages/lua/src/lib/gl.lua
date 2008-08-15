-- Copyright (C) 2008, The Perl Foundation.
-- $Id$

--[[

lib/gl.lua - OpenGL library

See original on L<http://luagl.wikidot.com/>

]]

local _helpers = require '_helpers'
local gl_binding = require 'gl_binding'

module('gl', package.seeall)

-- Accum (op, value) -> none

-- AlphaFunc (func, ref) -> none

-- AreTexturesResident (texturesArray) -> residences

-- ArrayElement (i) -> none
function ArrayElement (i)
    if not _helpers.lua_isnumber(i) then
        error "incorrect argument to function 'gl.ArrayElement'"
    end
    gl_binding.glArrayElement(i)
end

-- Begin (mode) -> none
function Begin (mode)
    if not _helpers.lua_isstring(mode) then
        error "incorrect argument to function 'gl.Begin'"
    end
    gl_binding.glBegin(
       gl_binding._get_gl_enum(mode, "incorrect string argument to function 'gl.Begin'")
    )
end

-- BindTexture (target, texture) -> none

-- Bitmap (xorig, yorig, ymove, bitmap) -> none

-- BlendFunc (sfactor, dfactor) -> none
function BlendFunc (sfactor, dfactor)
    if not (_helpers.lua_isstring(sfactor)
        and _helpers.lua_isstring(dfactor)) then
        error "incorrect argument to function 'gl.BlendFunc'"
    end
    gl_binding.glBlendFunc(
       gl_binding._get_gl_enum(sfactor, "incorrect string argument to function 'gl.BlendFunc'"),
       gl_binding._get_gl_enum(dfactor, "incorrect string argument to function 'gl.BlendFunc'")
    )
end

-- CallList (list) -> none
function CallList (list)
    if not _helpers.lua_isnumber(list) then
        error "incorrect argument to function 'gl.CallList'"
    end
    gl_binding.glCallList(list)
end

-- CallLists (listArray) -> none
function CallLists (listArray)
    if not _helpers.lua_istable(listArray) then
        error "incorrect argument to function 'gl.CallLists'"
    end
    local n, lists = gl_binding._get_arrayf(listArray)
    gl_binding.glCallLists(n, gl_binding._get_gl_enum('FLOAT'), lists)
end

-- Clear (mask) -> none
function Clear (mask)
    if not _helpers.lua_isstring(mask) then
        error "incorrect argument to function 'gl.Clear'"
    end
    gl_binding.glClear(
       gl_binding._get_gl_enum(mask, "incorrect string argument to function 'gl.Clear'")
    )
end

-- ClearAccum (red, green, blue, alpha) -> none

-- ClearColor (red, green, blue, alpha) -> none
function ClearColor (red, green, blue, alpha)
    if not (_helpers.lua_isnumber(red)
        and _helpers.lua_isnumber(green)
        and _helpers.lua_isnumber(blue)
        and _helpers.lua_isnumber(alpha)) then
        error "incorrect argument to function 'gl.ClearColor'"
    end
    gl_binding.glClearColor(red, green, blue, alpha)
end

-- ClearDepth (depth) -> none

-- ClearIndex (c) -> none

-- ClearStencil (s) -> none

-- ClipPlane (plane, equationArray) -> none

-- Color (red, green, blue [, alpha]) -> none
-- Color (color) -> none
function Color (...)
    local arg = {...}
    local num_args = #arg
    if _helpers.lua_istable(arg[1]) then
        local n, array = gl_binding._get_arrayf(arg[1])
        if n == 3 then
            gl_binding.glColor3dv(array)
        else
            gl_binding.glColor4dv(array)
        end
        return
    end
    if num_args > 4 then num_args = 4 end
    for index = 1, num_args do
        if not _helpers.lua_isnumber(arg[index]) then
            error "incorrect argument to function 'gl.Color'"
        end
    end
    if num_args == 3 then
        gl_binding.glColor3d(arg[1], arg[2], arg[3])
    else
        gl_binding.glColor4d(arg[1], arg[2], arg[3], arg[4])
    end
end

-- ColorMask (red, green, blue, alpha) -> none

-- ColorMaterial (face, mode) -> none

-- ColorPointer (colorArray) -> none

-- CopyPixels (x, y, width, height, type) -> none

-- CopyTexImage (level, internalFormat, border, x, y, width[, height]) -> none

-- CopyTexSubImage (level, x, y, xoffset, width[, yoffset, height]) -> none

-- CullFace (mode) -> none

-- DeleteLists (list, range) -> none

-- DeleteTextures (texturesArray) -> none

-- DepthFunc (func) -> none

-- DepthMask (flag) -> none

-- DepthRange (zNear, zFar) -> none

-- Disable (cap) -> none
function Disable (cap)
    if not _helpers.lua_isstring(cap) then
        error "incorrect argument to function 'gl.Disable'"
    end
    gl_binding.glDisable(
       gl_binding._get_gl_enum(cap, "incorrect string argument to function 'gl.Disable'")
    )
end

-- DisableClientState (array) -> none
function DisableClientState (array)
    if not _helpers.lua_isstring(array) then
        error "incorrect argument to function 'gl.DisableClientState'"
    end
    gl_binding.glDisableClientState(
       gl_binding._get_gl_enum(array, "incorrect string argument to function 'gl.DisableClientState'")
    )
end

-- DrawArrays (mode, first, count) -> none
function DrawArrays (mode, first, count)
    if not (_helpers.lua_isstring(mode)
        and _helpers.lua_isnumber(first)
        and _helpers.lua_isnumber(count)) then
        error "incorrect argument to function 'gl.DrawArrays'"
    end
    gl_binding.glDrawArrays(
       gl_binding._get_gl_enum(mode, "incorrect string argument to function 'gl.DrawArrays'"),
       first,
       count
    )
end

-- DrawBuffer (mode) -> none

-- DrawElements (mode, indicesArray) -> none
function DrawElements (mode, indicesArray)
    if not (_helpers.lua_isstring(mode)
        and _helpers.lua_istable(indicesArray)) then
        error "incorrect argument to function 'gl.DrawElements'"
    end
    local n, array = gl_binding._get_arrayf(indicesArray)
    gl_binding.glDrawElements(
       gl_binding._get_gl_enum(mode, "incorrect string argument to function 'gl.DrawElements'"),
       n,
       gl_binding._get_gl_enum('INT'),
       array
    )
end

-- DrawPixels (width, height, format, pixels) -> none

-- EdgeFlag (flag) -> none

-- EdgeFlagPointer (flagsArray) -> none

-- Enable (cap) -> none
function Enable (cap)
    if not _helpers.lua_isstring(cap) then
        error "incorrect argument to function 'gl.Enable'"
    end
    gl_binding.glEnable(
       gl_binding._get_gl_enum(cap, "incorrect string argument to function 'gl.Enable'")
    )
end

-- EnableClientState (array) -> none
function EnableClientState (array)
    if not _helpers.lua_isstring(array) then
        error "incorrect argument to function 'gl.EnableClientState'"
    end
    gl_binding.glEnableClientState(
       gl_binding._get_gl_enum(array, "incorrect string argument to function 'gl.EnableClientState'")
    )
end

-- End () -> none
function End ()
    gl_binding.glEnd()
end

-- EndList () -> none
function EndList ()
    gl_binding.glEndList()
end

-- EvalCoord (u[, v]) -> none
-- EvalCoord (coordArray) -> none

-- EvalMesh (mode, i1, i2[,j1, j2]) -> none

-- EvalPoint (i[, j]) -> none

-- FeedbackBuffer (size, type) -> dataArray

-- Finish () -> none

-- Flush () -> none
function Flush ()
   gl_binding.glFlush()
end

-- Fog (pname, param) -> none
-- Fog (pname, paramsArray) -> none

-- FrontFace (mode) -> none

-- Frustum (left, right, bottom, top, zNear, zFar) -> none

-- GenLists (range) -> num

-- GenTextures (n) -> texturesArray

-- Get (pname) -> params

-- GetConst (pname) -> constant string

-- GetArray (pname) -> paramsArray

-- GetClipPlane (plane) -> equationArray

-- GetError () -> error flag
function GetError ()
    local err = gl_binding.glGetError()
    if err == 0 then
        return 'NO_ERROR'
    else
        return gl_binding._get_str_gl_enum(err)
    end
end

-- GetLight (light, pname) -> paramsArray

-- GetMap (target, query) -> vArray

-- GetMaterial (face, pname) -> paramsArray

-- GetPixelMap (map) -> valuesArray

-- GetPointer (pname, n) -> valuesArray

-- GetPolygonStipple () -> maskArray

-- GetString (name) -> string

-- GetTexEnv (pname) -> paramsArray

-- GetTexGen (coord, pname) -> paramsArray

-- GetTexImage (target, level, format) -> pixelsArray

-- GetTexLevelParameter (target, level, pname) -> param

-- GetTexParameter (target, pname) -> paramsArray

-- Hint (target, mode) -> none

-- Index (c) -> none

-- IndexMask (mask) -> none

-- IndexPointer (indexArray) -> none

-- InitNames () -> none

-- IsEnabled (cap) -> true/false

-- IsList (list) -> true/false

-- IsTexture (texture) -> true/false

-- Light (light, pname, param) -> none
-- Light (light, pname, paramsArray) -> none

-- LightModel (pname, param) -> none
-- LightModel (pname, paramsArray) -> none

-- LineStipple (factor, pattern) -> none

-- LineWidth (width) -> none

-- ListBase (base) -> none

-- LoadIdentity () -> none
function LoadIdentity ()
   gl_binding.glLoadIdentity()
end

-- LoadMatrix (mArray) -> none

-- LoadName (name) -> none

-- LogicOp (opcode) -> none

-- Map (target, u1, u2, ustride, pointsArray) -> none
-- Map (target, u1, u2, ustride, v1, v2, vstride, pointsArray) -> none

-- MapGrid (un, u1, u2[, vn, v1, v2]) -> none

-- Material (face, pname, param) -> none

-- MatrixMode (mode) -> none
function MatrixMode (mode)
    if not _helpers.lua_isstring(mode) then
        error "incorrect argument to function 'gl.MatrixMode'"
    end
    gl_binding.glMatrixMode(
       gl_binding._get_gl_enum(mode, "incorrect string argument to function 'gl.MatrixMode'")
    )
end

-- MultMatrix (mArray) -> none

-- NewList (list, mode) -> none
function NewList (list, mode)
    if not (_helpers.lua_isnumber(list)
        and _helpers.lua_isstring(mode)) then
        error "incorrect argument to function 'gl.NewList'"
    end
    gl_binding.glNewList(
       list,
       gl_binding._get_gl_enum(mode, "incorrect string argument to function 'gl.NewList'")
    )
end

-- Normal (nx, ny, nz) -> none
-- Normal (nArray) -> none

-- NormalPointer (normalArray) -> none

-- Ortho (left, right, bottom, top, zNear, zFar) -> none
function Ortho (left, right, bottom, top, zNear, zFar)
    if not (_helpers.lua_isnumber(left)
        and _helpers.lua_isnumber(right)
        and _helpers.lua_isnumber(bottom)
        and _helpers.lua_isnumber(top)
        and _helpers.lua_isnumber(zNear)
        and _helpers.lua_isnumber(zFar)) then
        error "incorrect argument to function 'gl.Ortho'"
    end
    gl_binding.glOrtho(left, right, bottom, top, zNear, zFar)
end

-- PassThrough (token) -> none

-- PixelMap (map, valuesArray) -> none

-- PixelStore (pname, param) -> none

-- PixelTransfer (pname, param) -> none

-- PixelZoom (xfactor, yfactor) -> none

-- PointSize (size) -> none

-- PolygonMode (face, mode) -> none

-- PolygonOffset (factor, units) -> none

-- PolygonStipple (maskArray) -> none

-- PopAttrib () -> none

-- PopClientAttrib () -> none

-- PopMatrix () -> none
function PopMatrix ()
   gl_binding.glPopMatrix()
end

-- PopName () -> none

-- PrioritizeTextures (texturesArray, prioritiesArray) -> none

-- PushAttrib (mask) -> none

-- PushClientAttrib (mask) -> none

-- PushMatrix () -> none
function PushMatrix ()
    gl_binding.glPushMatrix()
end

-- PushName (GLuint name) -> none

-- RasterPos (x, y[, z, w]) -> none
-- RasterPos (vArray) -> none

-- ReadBuffer (mode) -> none

-- ReadPixels (x, y, width, height, format, pixelsArray) -> none

-- Rect (x1, y1, x2, y2) -> none
-- Rect (v1, v2) -> none
function Rect (...)
    local arg = {...}
    if _helpers.lua_istable(arg[1]) and _helpers.lua_istable(arg[2]) then
        local n1, v1 = gl_binding._get_arrayf(arg[1])
        local n2, v2 = gl_binding._get_arrayf(arg[2])
        gl_binding.glRectdv(v1, v2)
    elseif _helpers.lua_isnumber(arg[1])
       and _helpers.lua_isnumber(arg[2])
       and _helpers.lua_isnumber(arg[3])
       and _helpers.lua_isnumber(arg[4]) then
        gl_binding.glRectd(arg[1], arg[2], arg[3], arg[4])
    else
        error "incorrect argument to function 'gl.Rect'"
    end
end

-- RenderMode (mode) -> none

-- Rotate (angle, x, y, z) -> none
function Rotate (angle, x, y, z)
    if not (_helpers.lua_isnumber(angle)
        and _helpers.lua_isnumber(x)
        and _helpers.lua_isnumber(y)
        and _helpers.lua_isnumber(z)) then
        error "incorrect argument to function 'gl.Rotate'"
    end
    gl_binding.glRotated(angle, x, y, z)
end

-- Scale (x, y, z) -> none
function Scale (x, y, z)
    if not (_helpers.lua_isnumber(x)
        and _helpers.lua_isnumber(y)
        and _helpers.lua_isnumber(z)) then
        error "incorrect argument to function 'gl.Scale'"
    end
    gl_binding.glScaled(x, y, z)
end

-- Scissor (x, y, width, height) -> none

-- SelectBuffer (size) -> SelectArray

-- ShadeModel (mode) -> none

-- StencilFunc (func, ref, mask) -> none

-- StencilMask (mask) -> none

-- StencilOp (fail, zfail, zpass) -> none

-- TexCoord (s[, t, r, q]) -> none
-- TexCoord (vArray) -> none

-- TexCoordPointer(vArray) -> none

-- TexEnv (pname, param) -> none
-- TexEnv (pname, paramsArray) -> none

-- TexGen (coord, pname, param) -> none
-- TexGen (coord, pname, paramsArray) -> none

-- TexImage(level, internalformat, format, pixels) -> none

-- TexSubImage (level, format, pixels, xoffset) -> none
-- TexSubImage (level, format, pixels, xoffset, yoffset) -> none

-- TexParameter (target, pname, param) -> none
-- TexParameter (target, pname, paramsArray) -> none

-- Translate (x, y, z) -> none
function Translate (x, y, z)
    if not (_helpers.lua_isnumber(x)
        and _helpers.lua_isnumber(y)
        and _helpers.lua_isnumber(z)) then
        error "incorrect argument to function 'gl.Translate'"
    end
    gl_binding.glTranslated(x, y, z)
end

-- Vertex (x, y, [z, w]) -> none
-- Vertex (v) -> none
function Vertex (...)
    local arg = {...}
    local num_args = #arg
    local v
    if num_args == 0 then
        error "incorrect argument to function 'gl.Vertex'"
    end
    if _helpers.lua_istable(arg[1]) then
        num_args, v = gl_binding._get_arrayf(arg[1])
    else
        if num_args < 2 then
            error "incorrect argument to function 'gl.Vertex'"
        end
        for index = 1, num_args do
            if not _helpers.lua_isnumber(arg[index]) then
                error "incorrect argument to function 'gl.Vertex'"
            end
        end
        num_args, v = gl_binding._get_arrayf(arg)
    end
    if num_args == 2 then
        gl_binding.glVertex2dv(v)
    elseif num_args == 3 then
        gl_binding.glVertex3dv(v)
    else
        gl_binding.glVertex4dv(v)
    end
end

-- VertexPointer (vertexArray) -> none
function VertexPointer (vertexArray)
    if not _helpers.lua_istable(vertexArray) then
        error "incorrect argument to function 'gl.VertexPointer'"
    end
    local n, size, array = gl_binding._get_array2f(vertexArray)
    if n == -1 then
        error "incorrect argument to function 'gl.VertexPointer'"
    end
    gl_binding.glVertexPointer(size, gl_binding._get_gl_enum('DOUBLE'), 0, array)
end

-- Viewport (x, y, width, height) -> none
function Viewport (x, y, width, height)
    if not (_helpers.lua_isnumber(x)
        and _helpers.lua_isnumber(y)
        and _helpers.lua_isnumber(width)
        and _helpers.lua_isnumber(height)) then
        error "incorrect argument to function 'gl.Viewport'"
    end
    gl_binding.glViewport(x, y, width, height)
end

