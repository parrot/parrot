# Copyright (C) 2004-2009, Parrot Foundation.

.sub _main :main
    _init()
    _MAIN()
    end
.end

.include "library/sdl_types.pir"
.include "datatypes.pasm"

.sub _init
    .include "library/sdl.pasm"
    _init_SDL_types()
    .begin_return
    .end_return
.end

.sub _MAIN
    .local pmc SDL_Init
    .local pmc SetVideoMode
    .local pmc SDL_Quit
    .local pmc SDL_UpdateRect
    .local pmc SDL_FillRect
    .local pmc new_SDL_Rect
    .local object screen

    SDL_Init       = global ['SDL'; 'SDL_Init']
    SetVideoMode   = global ['SDL'; 'SDL_SetVideoMode']
    SDL_Quit       = global ['SDL'; 'SDL_Quit']
    SDL_UpdateRect = global ['SDL'; 'SDL_UpdateRect']
    SDL_FillRect   = global ['SDL'; 'SDL_FillRect']
    new_SDL_Rect   = global "new_SDL_Rect"

    SDL_Init(65535)

    screen = SetVideoMode(640, 480, 0, 0)

    .local object blue_rect
    #.local object blue_color

    blue_rect = _new_SDL_Rect()
    # blue_color = _new_SDL_Color( 255, 255, 255 )
    .local int blue
    .local int red
    .local int green
    blue = 255 << 0
    red = 255 << 16
    green = 255 << 8
    print "blue = "
    print blue
    print "\n"

    set blue_rect['w'], 100
    set blue_rect['h'], 100
    set blue_rect['x'], 270
    set blue_rect['y'], 190

    .local int ok
    ok = SDL_FillRect(screen, blue_rect, blue)

    # update full screen (all 0 arguments)
    SDL_UpdateRect(screen, 0, 0, 0, 0)

    sleep 2

    SDL_Quit()

    .begin_return
    .end_return
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
