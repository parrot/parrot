
--[[

  triangle.lua - Initialize GLUT and render a simple OpenGL animation

  $ ./parrot --no-gc languages/lua/lua.pbc languages/lua/demo/triangle.lua

]]

require 'glut'
require 'gl'

function Draw ()
    gl.Clear('COLOR_BUFFER_BIT,DEPTH_BUFFER_BIT')
    gl.Begin('TRIANGLES')
    gl.Color( {1, 0, 0} )
    gl.Vertex( {-0.5, -0.5, 0} )
    gl.Color( {0, 1, 0} )
    gl.Vertex( {0.5, -0.5, 0} )
    gl.Color( {0, 0, 1} )
    gl.Vertex( {0, 0.5, 0} )
    gl.End()
    glut.SwapBuffers()
end

function Idle ()
    now = os.time() -- unit is second
    dt = now - prev_time
    prev_time = now
    if rotating and dt ~= 0 then
        gl.Rotate(360*dt, 0, 1, 0)
        glut.PostRedisplay()
    end
end

function Keyboard (key)
    if key == 27 or key == 81 or key == 113 then
        glut.DestroyWindow(glut_window)
    end
    rotating = not rotating
end

rotating = true
prev_time = os.time()
glut.Init()
glut.InitDisplayMode()
glut_window = glut.CreateWindow('Test')
glut.DisplayFunc('Draw')
glut.IdleFunc('Idle')
glut.KeyboardFunc('Keyboard')

glut.MainLoop()
