save P1
save P2
loadlib P1, 'libSDL'
dlfunc P2, P1, 'SDL_Init', 'ii'
store_global 'SDL::Init', P2
dlfunc P2, P1, 'SDL_SetVideoMode', 'piiil'
store_global 'SDL::SetVideoMode', P2
dlfunc P2, P1, 'SDL_Quit', 'v'
store_global 'SDL::Quit', P2
dlfunc P2, P1, 'SDL_FillRect', 'ippi'
store_global 'SDL::FillRect', P2
dlfunc P2, P1, 'SDL_UpdateRect', 'vpiiii'
store_global 'SDL::UpdateRect', P2
dlfunc P2, P1, 'SDL_Flip', 'ip'
store_global 'SDL::Flip', P2
dlfunc P2, P1, 'SDL_FreeSurface', 'vp'
store_global 'SDL::FreeSurface', P2
dlfunc P2, P1, 'SDL_LoadBMP_RW', 'ppi'
store_global 'SDL::LoadBMP_RW', P2
dlfunc P2, P1, 'SDL_DisplayFormat', 'pp'
store_global 'SDL::DisplayFormat', P2
dlfunc P2, P1, 'SDL_UpperBlit', 'ipppp'
store_global 'SDL::BlitSurface', P2
dlfunc P2, P1, 'SDL_WaitEvent', 'ip'
store_global 'SDL::WaitEvent', P2
dlfunc P2, P1, 'SDL_GetKeyName', 'ti'
store_global 'SDL::GetKeyName', P2

# now load the SDL_image library
# should be broken out into library/sdl/image.pasm or somesuch
loadlib P1, 'libSDL_image'
dlfunc P2, P1, 'IMG_Load', 'pt'
store_global 'SDL::IMG_Load', P2
restore P2
restore P1
