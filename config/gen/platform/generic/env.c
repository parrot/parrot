/*
 * Environment manipulation stuff
 */

/*
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
#ifdef PARROT_HAS_SETENV
    setenv(name, value, 1);
#else
    int name_len = strlen(name);
    int val_len = strlen(value);

    char *envs = malloc(name_len + 1 + val_len + 1);
    if (envs == NULL)
        return;

    /* Save a bit of time, by using the fact we already have the
       lengths, avoiding strcat */
    strcpy(envs, name);
    strcpy(envs + name_len, "=");
    strcpy(envs + name_len + 1, value);

    putenv(envs);

    /* The buffer is intentionally not freed! */
#endif
}

void
Parrot_unsetenv(const char *name)
{
#ifdef PARROT_HAS_UNSETENV
    unsetenv(name);
#else
    Parrot_setenv(name, "");
#endif
}

char *
Parrot_getenv(const char *name, int *free_it)
{
    *free_it = 0;
    return getenv(name);
}
