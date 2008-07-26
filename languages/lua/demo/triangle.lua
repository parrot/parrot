
--[[

  triangle.lua - Initialize GLUT and render a simple OpenGL animation

]]

require 'glut'
require 'gl'

rotating = true
prev_time = os.time()

function Draw ()
    gl.Clear('COLOR_BUFFER_BIT,DEPTH_BUFFER_BIT')
    gl.Begin('TRIANGLE')
    gl.Color( {1, 0, 0} )
    gl.Vertex( {-0.5, -0.5, 0} )
    gl.Color( {0, 1, 0} )
    gl.Vertex( {0.5, -0.5, 0} )
    gl.Color( {0, 0, 1} )
    gl.Vertex( {0, 0.5, 0} )
    gl.End()
    glut.SwapBuffer()
end

function Idle ()
    now = os.time()
    dt = (now - prev_time) * 360
    prev_time = now
    if rotating then
        gl.Rotate(dt, 0, 1, 0)
	glut.PostRedisplay()
    end
end

function Keyboard (key)
    print(key)
    if key == 27 or key == 81 or key == 113 then
	os.exit()
    end
    rotating = not rotating
end

glut.Init()
glut.InitDisplayMode()
glut.CreateWindow('Test')
glut.DisplayFunc('Draw')
glut.IdleFunc('Idle')
glut.KeyboardFunc('Keyboard')

glut.MainLoop()

