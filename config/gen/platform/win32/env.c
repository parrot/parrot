/*
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
    SetEnvironmentVariable(name, value);
}


char *
Parrot_getenv(const char *name, int *free_it)
{
    DWORD size = GetEnvironmentVariable(name, NULL, 0);
    char *buffer;

    if (size == 0) {
        *free_it = 0;
        return NULL;
    } else
        *free_it = 1;
    buffer = mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);

    return buffer;
}
void
Parrot_unsetenv(const char *name)
{
    SetEnvironmentVariable(name, NULL);
}
