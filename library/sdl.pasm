save P1
save P2
loadlib P1, 'libSDL.so'
dlfunc P2, P1, 'SDL_Init', 'ii'
store_global 'SDL::SDL_Init', P2
dlfunc P2, P1, 'SDL_SetVideoMode', 'piiil'
store_global 'SDL::SDL_SetVideoMode', P2
dlfunc P2, P1, 'SDL_Quit', 'v'
store_global 'SDL::SDL_Quit', P2
dlfunc P2, P1, 'SDL_FillRect', 'ippi'
store_global 'SDL::SDL_FillRect', P2
dlfunc P2, P1, 'SDL_UpdateRect', 'vpiiii'
store_global 'SDL::SDL_UpdateRect', P2
restore P2
restore P1
