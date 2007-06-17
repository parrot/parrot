/*
  On Windows there are two ways to access the environment.  Either through the
  Windows environment block, using GetEnvironmentVariable,
  SetEnvironmentVariable and GetEnvironmentStrings, or the C runtime using
  _getenv, _putenv and _environ.

  Changes through the C runtime are reflected in the environment block, but
  changes in the environment block are NOT reflected in the C runtime!

  To keep both in sync we always update environment variables through the C
  runtime.  Getting an environment variable can be done either way,
  whichever is more convenient.
*/

/*
** Parrot_setenv()
*/

void
Parrot_setenv(const char *name, const char *value)
{
    assert(name  != NULL);
    assert(value != NULL);

    {
        const int name_len  = strlen(name );
        const int value_len = strlen(value);

        {
            char * const envstring = malloc(
                    name_len     /* name  */
                    + 1          /* '='   */
                    + value_len  /* value */
                    + 1          /* string terminator */
            );
            if (envstring == NULL) {
                /* TODO: Shouldn't we tell anyone that we failed? */
                return;
            }

            /* Save a bit of time, by using the fact we already have the
            lengths, avoiding strcat */
            strcpy(envstring,                name );
            strcpy(envstring + name_len,     "="  );
            strcpy(envstring + name_len + 1, value);

            if (_putenv(envstring) == 0) {
                /* success */
            }
            else {
                /* TODO: Shouldn't we tell anyone that we failed? */
            }
            free(envstring);
        }
    }
}

char *
Parrot_getenv(const char *name /*NN*/, int *free_it /*NN*/)
{
    const DWORD size = GetEnvironmentVariable(name, NULL, 0);
    char *buffer;

    if (size == 0) {
        *free_it = 0;
        return NULL;
    }
    else
        *free_it = 1;
    buffer = mem_sys_allocate(size);
    GetEnvironmentVariable(name, buffer, size);

    return buffer;
}

void
Parrot_unsetenv(const char *name)
{
/* You can remove a variable from the environment by specifying an empty
   string -- in other words, by specifying only varname=.
       -- _putenv, _wputenv (CRT) documentation
*/
    Parrot_setenv(name, "");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
