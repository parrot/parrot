/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    return LoadLibrary(filename);
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return NULL;
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    return (void *)(ptrcast_t)GetProcAddress(handle, symbol);
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    return FreeLibrary(handle)? 0: 1;
}

