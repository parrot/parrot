/*
 * Spawn a subprocess
 *
 */
INTVAL
Parrot_Run_OS_Command(Parrot_Interp interpreter, STRING *command) {
    DWORD status = 0;
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    int free_it = 0;
    char* cmd = mem_sys_allocate( command->strlen + 4 );
    char* shell = Parrot_getenv( "ComSpec", &free_it );
    char* cmdin = string_to_cstring(interpreter, command);

    strcpy( cmd, "/c " );
    strcat( cmd, cmdin );
    string_cstring_free( cmdin );

    memset( &si, 0, sizeof(si) );
    si.cb = sizeof(si);
    memset( &pi, 0, sizeof(pi) );

    /* Start the child process. */
    if(
        !CreateProcess( shell, cmd,
        NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi )
    ) {
        internal_exception(NOSPAWN, "Can't spawn child process");
    }

    WaitForSingleObject( pi.hProcess, INFINITE );

    if( !GetExitCodeProcess( pi.hProcess, &status ) ) {
        /* XXX njs Should call GetLastError for failure message? */
        Parrot_warn( interpreter, PARROT_WARNINGS_PLATFORM_FLAG,
            "Process completed: Failed to get exit code.");
    }
    CloseHandle( pi.hProcess );
    CloseHandle( pi.hThread );
    if( free_it ) free( shell );
    mem_sys_free( cmd );

    return status;
}

