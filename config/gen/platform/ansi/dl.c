/*
** Parrot_dlopen()
*/

void *
Parrot_dlopen(const char *filename)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlopen not implemented");
    return NULL;
}


/*
** Parrot_dlerror()
*/

const char *
Parrot_dlerror(void)
{
    return "Parrot_dlerror not implemented";
}


/*
** Parrot_dlsym()
*/

void *
Parrot_dlsym(void *handle, const char *symbol)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlsym not implemented");
    return NULL;
}


/*
** Parrot_dlclose()
*/

int
Parrot_dlclose(void *handle)
{
    Parrot_warn(NULL, PARROT_WARNINGS_PLATFORM_FLAG, "Parrot_dlclose not implemented");
    return 0;
}
