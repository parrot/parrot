# xlibtest.rb - A test of Xlib.pir usage from cardinal
# 
# To run this file, execute the following command from the
# current directory:
# 
# ../../parrot ../../languages/cardinal/cardinal.pbc  xlibtest.rb
# 
# (You must have the cardinal pbc already builded).
# 
# Press Esc key to exit the program.
# 
# Parsing is very slow.  Give it a minute to start up.
require 'Xlib'

puts 'Hello'

puts 'Display: ' + Xlib::DisplayName()

display = Xlib::OpenDisplay('')

puts 'Default screen: ' + display.DefaultScreen()

display.hello()

white  = display.WhitePixel(0)
root   = display.RootWindow()
window = display.CreateSimpleWindow(root, 0, 0, 600, 400, 0, 0, white)
window.StoreName("Hello, ruby")
window.SelectInput(163919)
window.Map()

# Get Escape keycode
keysym = Xlib::StringToKeysym('Escape')
code_escape = display.KeysymToKeycode(keysym)

event = Xlib::newEvent()

type = 0

lastx = 0
lasty = 0
pressed = 0
listline = Array.new()
line = Array.new()

while type != 17
    display.NextEvent(event)
    type = event.type()
    if type == 4
        x = event.x()
        y = event.y()
        window.DrawPoint(x, y)
        lastx = x
        lasty = y
        pressed = 1
    end
    if type == 5
        newline = line
        listline.push(newline)
        line = Array.new()
        pressed = 0
    end
    if type == 6 && pressed
        x = event.x()
        y = event.y()
        if x != lastx || y != lasty
            window.DrawLine(lastx, lasty, x, y)
            lastx = x
            lasty = y
            line.push(x, y)
        end
    end
    if type == 12
        #puts 'Exposed. Lines: ', +@listline
        listline.each do |l|
            #puts 'Points ', l.elems
            if l.elems  > 0
                lx = l[0]
                ly = l[1]
                #puts lx, ' ', ly
                window.DrawPoint(lx, ly)

                i = 2
                while i < l.elems
                    x = l[i]
                    y = l[i+1]
                    window.DrawLine(lx, ly, x, y)
                    lx = x
                    ly = y
                    #puts lx, ' ', ly
                    i += 2
                end
            end
        end
    end
    if type == 2
        code = event.keycode()
        if code == code_escape
            window.Unmap()
            window.Destroy()
        end
    end
    if type == 33
        window.Unmap()
        window.Destroy()
    end
end

display.Close()

puts 'Bye'
